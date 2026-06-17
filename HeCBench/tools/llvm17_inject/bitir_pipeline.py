#!/usr/bin/env python3

import argparse
import os
import shlex
import subprocess
from copy import deepcopy
from datetime import datetime
from pathlib import Path
from textwrap import dedent

import yaml


def parse_args():
    parser = argparse.ArgumentParser(description="BitIR pipeline launcher")
    parser.add_argument("task", choices=["build", "deploy", "golden", "baseline", "inject-one"])
    parser.add_argument("config")
    parser.add_argument("--repo-root")
    parser.add_argument("--machine")
    parser.add_argument("--campaign")
    parser.add_argument("--bench")
    parser.add_argument("--benches-file")
    parser.add_argument("--site-id", type=int)
    parser.add_argument("--bit-index", type=int)
    parser.add_argument("--fault-model")
    parser.add_argument("--execution-mode")
    parser.add_argument("--submit", action="store_true")
    parser.add_argument("--local", action="store_true")
    parser.add_argument("--print-script", action="store_true")
    return parser.parse_args()


def merge_dicts(base, override):
    # Merge nested YAML blocks from extends
    if not isinstance(base, dict) or not isinstance(override, dict):
        return deepcopy(override)
    merged = deepcopy(base)
    for key, value in override.items():
        if isinstance(merged.get(key), dict) and isinstance(value, dict):
            merged[key] = merge_dicts(merged[key], value)
        else:
            merged[key] = deepcopy(value)
    return merged


def load_config(path):
    # Track visited files so extends cannot loop
    seen = set()

    def read_one(config_path):
        config_path = Path(config_path).resolve()
        if config_path in seen:
            raise SystemExit(f"cyclic config extends detected at {config_path}")
        seen.add(config_path)
        with config_path.open("r", encoding="utf-8") as handle:
            config = yaml.safe_load(handle) or {}
        extends = config.pop("extends", None)
        if not extends:
            return config
        base = {}
        for item in extends if isinstance(extends, list) else [extends]:
            base_path = Path(item)
            # Relative extends live next to the current YAML
            if not base_path.is_absolute():
                base_path = config_path.parent / base_path
            base = merge_dicts(base, read_one(base_path))
        return merge_dicts(base, config)

    return read_one(path)


def read_benches(path):
    benches = []
    for raw in Path(path).read_text(encoding="utf-8").splitlines():
        line = raw.strip()
        if line and not line.startswith("#"):
            benches.append(line)
    return benches


def export_line(name, value):
    if value is None or value == "":
        return ""
    if isinstance(value, list):
        value = " ".join(str(item) for item in value)
    return f"export {name}={shlex.quote(str(value))}"


def export_mapping(lines, prefix, value):
    if isinstance(value, dict):
        for key, subvalue in value.items():
            export_mapping(lines, f"{prefix}_{str(key).upper()}", subvalue)
        return
    line = export_line(prefix, value)
    if line:
        lines.append(line)


def machine_exports(task, machine):
    backend = str(machine.get("backend", "")).strip()
    if task in {"build", "golden"}:
        if backend == "nvidia":
            keys = [
                "backend",
                "build_dir",
                "binary_subdir",
                "golden_root",
                "runtime_home",
                "device_order_env",
                "device_order_value",
                "device_visible_env",
                "device_visible_value",
                "cuda_arch",
                "c_compiler_driver",
                "cxx_compiler_driver",
            ]
        else:
            keys = [
                "backend",
                "build_dir",
                "binary_subdir",
                "golden_root",
                "device_visible_env",
                "device_visible_value",
                "sycl_target",
                "c_compiler_driver",
                "compiler_driver",
            ]
    elif task == "baseline":
        keys = [
            "backend",
            "build_dir",
            "binary_subdir",
            "golden_root",
            "runtime_home",
            "device_order_env",
            "device_order_value",
            "device_visible_env",
            "device_visible_value",
        ]
    else:
        keys = [key for key in machine.keys() if key not in {"jobs", "task_scripts"}]
    return {key: machine[key] for key in keys if key in machine}


def append_fault_model_compat_exports(exports, fault_model_cfg):
    compat = {
        "inject_target": "INJECT_TARGET",
        "phase": "PHASE",
        "int_float_only": "INT_FLOAT_ONLY",
        "include_constants": "INCLUDE_CONSTANTS",
        "keep_dumps": "KEEP_DUMPS",
        "max_pairs": "MAX_PAIRS",
        "max_injections": "MAX_INJECTIONS",
        "run_baseline": "RUN_BASELINE",
        "skip_existing": "SKIP_EXISTING",
        "missing_only": "MISSING_ONLY",
        "trace_level": "TRACE_LEVEL",
        "trace_source_window": "TRACE_SOURCE_WINDOW",
        "trace_metadata_dir": "BITIR_TRACE_METADATA_DIR",
        "worklist_queue": "WORKLIST_QUEUE",
        "results_subdir_base": "RESULTS_SUBDIR_BASE",
    }
    for key, env_name in compat.items():
        if key in fault_model_cfg:
            line = export_line(env_name, fault_model_cfg[key])
            if line:
                exports.append(line)
    # Let fault models turn on runtime tracing without shell edits
    for key, value in dict(fault_model_cfg.get("runtime_env", {})).items():
        line = export_line(str(key), value)
        if line:
            exports.append(line)


def suffixed_path(path, suffix):
    if not path or not suffix:
        return path
    name = Path(path)
    if "." in name.name:
        return f"{name.with_suffix('')}_{suffix}{name.suffix}"
    return f"{path}_{suffix}"


def scheduler_header(scheduler, machine_name, task, job):
    task_name = task.replace("-", "_")
    if scheduler == "pbs":
        header = ["#!/bin/bash", f"#PBS -N bitir_{machine_name}_{task_name}"]
        fields = [
            ("account", "#PBS -A {}"),
            ("queue", "#PBS -q {}"),
            ("select", "#PBS -l select={}"),
            ("filesystems", "#PBS -l filesystems={}"),
            ("walltime", "#PBS -l walltime={}"),
            ("stdout", "#PBS -o {}"),
            ("stderr", "#PBS -e {}"),
        ]
    else:
        header = ["#!/bin/bash", f"#SBATCH -J bitir_{machine_name}_{task_name}"]
        fields = [
            ("account", "#SBATCH -A {}"),
            ("partition", "#SBATCH -p {}"),
            ("nodes", "#SBATCH --nodes={}"),
            ("ntasks_per_node", "#SBATCH --ntasks-per-node={}"),
            ("gpus_per_node", "#SBATCH --gpus-per-node={}"),
            ("cpus_per_task", "#SBATCH --cpus-per-task={}"),
            ("mem", "#SBATCH --mem={}"),
            ("walltime", "#SBATCH --time={}"),
            ("stdout", "#SBATCH --output={}"),
            ("stderr", "#SBATCH --error={}"),
        ]
    for key, template in fields:
        if job.get(key):
            header.append(template.format(job[key]))
    return header


def module_block(module_use, modules):
    lines = [
        'if ! command -v module >/dev/null 2>&1 && [[ -f /etc/profile.d/modules.sh ]]; then',
        '  source /etc/profile.d/modules.sh',
        "fi",
        'if command -v module >/dev/null 2>&1; then',
        "  module purge || true",
    ]
    for path in module_use:
        lines.append(f"  module use {shlex.quote(str(path))} 2>/dev/null || true")
    for mod in modules:
        lines.append(f"  module load {shlex.quote(str(mod))} 2>/dev/null || true")
    lines.append("fi")
    return lines


BENCH_LIST_BLOCK = dedent(
    """
    if [[ -n "${BENCH_ONLY_FILE:-}" && -f "${BENCH_ONLY_FILE}" ]]; then
      mapfile -t BENCH_LIST < "${BENCH_ONLY_FILE}"
    elif [[ -n "${BENCH_ONLY:-}" ]]; then
      BENCH_ONLY_NORM="${BENCH_ONLY//,/ }"
      read -r -a BENCH_LIST <<< "${BENCH_ONLY_NORM}"
    else
      read -r -a BENCH_LIST <<< "${BITIR_BENCHMARKS:-}"
    fi
    """
).strip()

READ_ARGS_BLOCK = dedent(
    """
    bench_args=()
    if [[ -n "${BITIR_RUN_ARGS:-}" ]]; then
      read -r -a bench_args <<< "${BITIR_RUN_ARGS}"
    fi
    """
).strip()

NVIDIA_BUILD_ENV_BLOCK = dedent(
    """
    export CUDA_HOME="${BITIR_MACHINE_RUNTIME_HOME:?BITIR_MACHINE_RUNTIME_HOME is required}"
    export PATH="${CUDA_HOME}/bin:${PATH:-}"
    export LD_LIBRARY_PATH="${CUDA_HOME}/lib64:${LD_LIBRARY_PATH:-}"
    export "${BITIR_MACHINE_DEVICE_ORDER_ENV}=${BITIR_MACHINE_DEVICE_ORDER_VALUE}"
    export "${BITIR_MACHINE_DEVICE_VISIBLE_ENV}=${BITIR_MACHINE_DEVICE_VISIBLE_VALUE}"
    """
).strip()

INTEL_ENV_BLOCK = dedent(
    """
    export SYCL_DEVICE_FILTER="${BITIR_MACHINE_DEVICE_VISIBLE_VALUE}"
    export "${BITIR_MACHINE_DEVICE_VISIBLE_ENV}=${BITIR_MACHINE_DEVICE_VISIBLE_VALUE}"
    """
).strip()

NVIDIA_BASELINE_ENV_BLOCK = dedent(
    """
    export CUDA_HOME="${BITIR_MACHINE_RUNTIME_HOME:-}"
    if [[ -n "${CUDA_HOME}" ]]; then
      export PATH="${CUDA_HOME}/bin:${PATH:-}"
      export LD_LIBRARY_PATH="${CUDA_HOME}/lib64:${LD_LIBRARY_PATH:-}"
    fi
    export "${BITIR_MACHINE_DEVICE_ORDER_ENV:-CUDA_DEVICE_ORDER}=${BITIR_MACHINE_DEVICE_ORDER_VALUE:-PCI_BUS_ID}"
    export "${BITIR_MACHINE_DEVICE_VISIBLE_ENV:-CUDA_VISIBLE_DEVICES}=${BITIR_MACHINE_DEVICE_VISIBLE_VALUE:-0}"
    """
).strip()


def task_body(task, machine):
    backend = str(machine.get("backend", "")).strip()
    if task in {"build", "golden"}:
        runtime_block = NVIDIA_BUILD_ENV_BLOCK if backend == "nvidia" else INTEL_ENV_BLOCK
        configure_block = dedent(
            """
            cmake -S "${REPO_DIR}/HeCBench" -B "${BUILD_DIR}" \
              -DHECBENCH_BENCHMARKS="${benchmarks_cmake}" \
              -DHECBENCH_BUILD_ALL_BENCHMARKS=OFF \
              -DHECBENCH_ENABLE_CUDA=ON \
              -DHECBENCH_ENABLE_HIP=OFF \
              -DHECBENCH_ENABLE_SYCL=OFF \
              -DHECBENCH_ENABLE_OPENMP=OFF \
              -DHECBENCH_CUDA_ARCH="${BITIR_MACHINE_CUDA_ARCH:?BITIR_MACHINE_CUDA_ARCH is required}" \
              -DCMAKE_C_COMPILER="${BITIR_MACHINE_C_COMPILER_DRIVER:-cc}" \
              -DCMAKE_CXX_COMPILER="${BITIR_MACHINE_CXX_COMPILER_DRIVER:-CC}" \
              -DCMAKE_CUDA_FLAGS="${CUDA_CMAKE_FLAGS:---allow-unsupported-compiler}"
            """
        ).strip()
        if backend != "nvidia":
            configure_block = dedent(
                """
                cmake -S "${REPO_DIR}/HeCBench" -B "${BUILD_DIR}" -G Ninja \
                  -DHECBENCH_BENCHMARKS="${benchmarks_cmake}" \
                  -DHECBENCH_BUILD_ALL_BENCHMARKS=OFF \
                  -DHECBENCH_ENABLE_SYCL=ON \
                  -DHECBENCH_ENABLE_CUDA=OFF \
                  -DHECBENCH_ENABLE_HIP=OFF \
                  -DHECBENCH_ENABLE_OPENMP=OFF \
                  -DHECBENCH_SYCL_TARGET="${BITIR_MACHINE_SYCL_TARGET:?BITIR_MACHINE_SYCL_TARGET is required}" \
                  -DCMAKE_C_COMPILER="${BITIR_MACHINE_C_COMPILER_DRIVER:?BITIR_MACHINE_C_COMPILER_DRIVER is required}" \
                  -DCMAKE_CXX_COMPILER="${BITIR_MACHINE_COMPILER_DRIVER:?BITIR_MACHINE_COMPILER_DRIVER is required}" \
                  -DCMAKE_CXX_FLAGS="${GOLDEN_CXX_FLAGS:--DUSE_GPU -O0 -g0}"
                """
            ).strip()
        run_prefix = 'HECBENCH_LLFI_FORCE_DUMP=1 ' if backend == "intel" else ""
        return dedent(
            f"""
REPO_DIR="${{PWD}}"
BUILD_DIR="${{REPO_DIR}}/${{BITIR_MACHINE_BUILD_DIR:?BITIR_MACHINE_BUILD_DIR is required}}"
OUTPUT_ROOT="${{REPO_DIR}}/${{BITIR_MACHINE_GOLDEN_ROOT:?BITIR_MACHINE_GOLDEN_ROOT is required}}"
DEVICE_BIN_SUBDIR="${{BITIR_MACHINE_BINARY_SUBDIR:?BITIR_MACHINE_BINARY_SUBDIR is required}}"
mkdir -p "${{OUTPUT_ROOT}}"

{BENCH_LIST_BLOCK}

targets=()
for bench in "${{BENCH_LIST[@]}}"; do
  targets+=("${{bench}}-${{DEVICE_BIN_SUBDIR}}")
done
benchmarks_cmake="$(IFS=';'; echo "${{BENCH_LIST[*]}}")"

{runtime_block}

{configure_block}

cmake --build "${{BUILD_DIR}}" --target "${{targets[@]}}"

for bench in "${{BENCH_LIST[@]}}"; do
  bin="${{BUILD_DIR}}/bin/${{DEVICE_BIN_SUBDIR}}/${{bench}}"
  dump="${{OUTPUT_ROOT}}/${{BITIR_GOLDEN_FILE:-${{bench}}.bin}}"
  text_out="${{OUTPUT_ROOT}}/${{BITIR_GOLDEN_FILE:-${{bench}}.txt}}"
  {READ_ARGS_BLOCK}
  if [[ "${{BITIR_COMPARE_MODE:-exact}}" == "text" ]]; then
    rm -f "${{text_out}}"
    "${{bin}}" "${{bench_args[@]}}" > "${{text_out}}" 2> "${{OUTPUT_ROOT}}/${{bench}}.err"
  else
    rm -f "${{dump}}"
    {run_prefix}"${{bin}}" "${{bench_args[@]}}" "${{dump}}" > "${{OUTPUT_ROOT}}/${{bench}}.log" 2> "${{OUTPUT_ROOT}}/${{bench}}.err"
  fi
done
            """
        ).strip()
    if task == "baseline":
        runtime_block = NVIDIA_BASELINE_ENV_BLOCK if backend == "nvidia" else INTEL_ENV_BLOCK
        return dedent(
            f"""
REPO_DIR="${{PWD}}"
BUILD_DIR="${{REPO_DIR}}/${{BITIR_MACHINE_BUILD_DIR:?BITIR_MACHINE_BUILD_DIR is required}}"
BIN_ROOT="${{BUILD_DIR}}/bin/${{BITIR_MACHINE_BINARY_SUBDIR:?BITIR_MACHINE_BINARY_SUBDIR is required}}"
GOLDEN_ROOT="${{REPO_DIR}}/${{BITIR_MACHINE_GOLDEN_ROOT:?BITIR_MACHINE_GOLDEN_ROOT is required}}"
OUT_ROOT="${{REPO_DIR}}/HeCBench/results/baseline_checks"
mkdir -p "${{OUT_ROOT}}"

{BENCH_LIST_BLOCK}

{runtime_block}

for bench in "${{BENCH_LIST[@]}}"; do
  outdir="${{OUT_ROOT}}/${{bench}}"
  dump="${{outdir}}/baseline_${{bench}}.bin"
  out="${{outdir}}/baseline_${{bench}}.out"
  err="${{outdir}}/baseline_${{bench}}.err"
  cmp="${{outdir}}/baseline_${{bench}}.cmp"
  golden_text="${{GOLDEN_ROOT}}/${{BITIR_GOLDEN_FILE:-${{bench}}.txt}}"
  mkdir -p "${{outdir}}"
  {READ_ARGS_BLOCK}
  if [[ "${{BITIR_COMPARE_MODE:-exact}}" == "text" ]]; then
    "${{BIN_ROOT}}/${{bench}}" "${{bench_args[@]}}" > "${{out}}" 2> "${{err}}" || true
    python3 "${{REPO_DIR}}/HeCBench/tools/llvm17_inject/compare_text_signature.py" --bench "${{bench}}" --baseline "${{golden_text}}" --candidate "${{out}}" > "${{cmp}}" 2>&1 || true
  else
    rm -f "${{dump}}"
    HECBENCH_LLFI_FORCE_DUMP=1 "${{BIN_ROOT}}/${{bench}}" "${{bench_args[@]}}" "${{dump}}" > "${{out}}" 2> "${{err}}" || true
    if [[ "${{BITIR_COMPARE_MODE:-exact}}" == "float" ]]; then
      python3 "${{REPO_DIR}}/HeCBench/tools/llvm17_inject/compare_matrix_dump.py" "${{GOLDEN_ROOT}}/${{BITIR_GOLDEN_FILE:-${{bench}}.bin}}" "${{dump}}" --abs-tol "${{ABS_TOL}}" --rel-tol "${{REL_TOL}}" > "${{cmp}}" 2>&1 || true
    else
      python3 "${{REPO_DIR}}/HeCBench/tools/llvm17_inject/compare_binary_exact.py" "${{GOLDEN_ROOT}}/${{BITIR_GOLDEN_FILE:-${{bench}}.bin}}" "${{dump}}" > "${{cmp}}" 2>&1 || true
    fi
  fi
done
            """
        ).strip()
    task_script = str(machine.get("task_scripts", {}).get(task.replace("-", "_"), "")).strip()
    if not task_script:
        raise SystemExit(f"missing machine.task_scripts.{task.replace('-', '_')} in YAML")
    return f"bash {shlex.quote(task_script)}"


def build_script(scheduler, machine_name, task, job, exports, module_use, modules, body):
    header = scheduler_header(scheduler, machine_name, task, job)
    lines = [
        "set -euo pipefail",
        'echo "[trace] start $(date -u +%Y-%m-%dT%H:%M:%SZ)"',
        'echo "[trace] host $(hostname)"',
        'echo "[trace] pwd $(pwd)"',
        *exports,
        *module_block(module_use, modules),
        'echo "[trace] after modules $(date -u +%Y-%m-%dT%H:%M:%SZ)"',
        'command -v cmake >/dev/null 2>&1 && echo "[trace] cmake $(command -v cmake)" || echo "[trace] cmake missing"',
        'command -v python3 >/dev/null 2>&1 && echo "[trace] python3 $(command -v python3)" || echo "[trace] python3 missing"',
        'cd "${BITIR_WORKDIR}"',
        'echo "[trace] workdir ${BITIR_WORKDIR}"',
        body,
    ]
    return "\n".join(header + ["", *lines, ""])


def main():
    args = parse_args()
    repo_root = Path(args.repo_root).resolve() if args.repo_root else Path(__file__).resolve().parents[2]
    cfg = load_config(args.config)
    run = cfg.get("run", {})
    methods = cfg.get("methodology", {})
    machine_name = args.machine or str(run.get("machine", "")).strip()
    campaign = args.campaign or str(run.get("campaign", "")).strip() or str(methods.get("default_campaign", "default")).strip()
    bench = args.bench or str(run.get("bench", "")).strip()
    benches_file = args.benches_file or str(run.get("benches_file", "")).strip()
    site_id = args.site_id if args.site_id is not None else int(run.get("site_id", 1))
    bit_index = args.bit_index if args.bit_index is not None else int(run.get("bit_index", 0))
    fault_model = args.fault_model or str(run.get("fault_model", "")).strip()

    if not machine_name:
        raise SystemExit("machine is required")
    if args.task == "deploy" and not fault_model:
        raise SystemExit("deploy requires --fault-model <name>")
    if args.task == "inject-one" and not bench:
        raise SystemExit("inject-one requires a benchmark")
    if fault_model and fault_model not in cfg.get("fault_models", {}):
        raise SystemExit(f"unknown fault_model={fault_model!r} in YAML")

    if args.submit:
        mode = "submit"
    elif args.local:
        mode = "local"
    elif args.print_script:
        mode = "print-script"
    else:
        mode = (args.execution_mode or str(run.get("execution_mode", "write-script")).strip() or "write-script").lower()
        if mode in {"render", "print", "stdout"}:
            mode = "print-script"
        if mode == "write":
            mode = "write-script"
    if mode not in {"submit", "local", "print-script", "write-script"}:
        raise SystemExit(f"unsupported execution_mode={mode!r}")

    machine = dict(cfg.get("machines", {}).get(machine_name, {}))
    scheduler = str(machine.get("scheduler", "")).strip().lower()
    if scheduler not in {"pbs", "slurm"}:
        raise SystemExit(f"unsupported scheduler={scheduler!r}")

    if bench:
        benches = [bench]
    elif benches_file:
        benches = read_benches(benches_file)
    elif args.task != "inject-one":
        benches = list(cfg.get("campaigns", {}).get(campaign, {}).get("benchmarks", []))
    else:
        benches = [""]
    if args.task != "inject-one" and not benches:
        raise SystemExit(f"{args.task} needs at least one benchmark")

    job_key = args.task.replace("-", "_")
    job = dict(machine.get("jobs", {}).get(job_key, {}))
    if not job:
        raise SystemExit(f"missing machine.jobs.{job_key} in YAML")

    jobs_dir = repo_root.parent / ".bitir_jobs"
    jobs_dir.mkdir(parents=True, exist_ok=True)
    stamp = datetime.utcnow().strftime("%Y%m%d_%H%M%S")
    module_use = [str(value) for value in machine.get("module_use", [])]
    modules = [str(value) for value in machine.get("modules", [])]
    body = task_body(args.task, machine)
    generated = []

    for index, target_bench in enumerate(benches):
        bench_name = target_bench or ""
        bench_cfg = dict(cfg.get("benchmarks", {}).get(bench_name, {})) if bench_name else {}
        bench_env = {str(key): str(value) for key, value in bench_cfg.get("env", {}).items()}
        exports = [
            export_line("BITIR_WORKDIR", str(repo_root.parent)),
            export_line("BITIR_MACHINE", machine_name),
            export_line("BITIR_TIMEOUT_SEC", methods.get("timeout_sec", 200)),
            export_line("ABS_TOL", methods.get("float_abs_tol", "1e-5")),
            export_line("REL_TOL", methods.get("float_rel_tol", "0.0")),
            export_line("BITIR_BENCHMARKS", benches),
        ]
        if bench_name:
            backend = str(machine.get("backend", "")).strip()
            source_dir = str(bench_cfg.get("source_dirs", {}).get(backend, "")).strip()
            if not source_dir:
                source_dir = f"HeCBench/src/{bench_name}-{machine.get('binary_subdir', backend)}"
            exports.extend(
                [
                    export_line("BENCH", bench_name),
                    export_line("BITIR_BENCH", bench_name),
                    export_line("BENCH_ONLY", bench_name),
                    export_line("BITIR_SOURCE_DIR", source_dir),
                    export_line("BITIR_EXTRA_INCLUDES", [str(v) for v in bench_cfg.get("extra_includes", {}).get(backend, [])]),
                    export_line("BITIR_GOLDEN_FILE", str(bench_cfg.get("golden_file", f"{bench_name}.bin")).format(**bench_env)),
                    export_line("BITIR_RUN_ARGS", [str(v).format(**bench_env) for v in bench_cfg.get("args", [])]),
                    export_line("BITIR_COMPARE_MODE", str(bench_cfg.get("compare_mode", "exact")).strip()),
                ]
            )
            export_mapping(exports, "BITIR_STATUS", dict(bench_cfg.get("status", {})))
            for key, value in bench_env.items():
                line = export_line(key, value)
                if line:
                    exports.append(line)
        if args.task == "inject-one":
            exports.append(export_line("SITE_ID", site_id))
            exports.append(export_line("BIT_INDEX", bit_index))
        if fault_model:
            fault_model_cfg = dict(cfg.get("fault_models", {}).get(fault_model, {}))
            exports.append(export_line("BITIR_FAULT_MODEL_NAME", fault_model))
            export_mapping(exports, "BITIR_FAULT_MODEL", fault_model_cfg)
            append_fault_model_compat_exports(exports, fault_model_cfg)
        export_mapping(exports, "BITIR_MACHINE", machine_exports(args.task, machine))

        bench_suffix = bench_name.replace("/", "_").replace(" ", "_")
        job_values = dict(job)
        if bench_suffix:
            if job_values.get("stdout"):
                job_values["stdout"] = suffixed_path(job_values["stdout"], bench_suffix)
            if job_values.get("stderr"):
                job_values["stderr"] = suffixed_path(job_values["stderr"], bench_suffix)

        script = build_script(
            scheduler,
            machine_name,
            args.task,
            job_values,
            [line for line in exports if line],
            module_use,
            modules,
            body,
        )
        suffix = f"_{bench_name}" if bench_name else ""
        file_ext = ".pbs" if scheduler == "pbs" else ".sbatch"
        path = jobs_dir / f"{machine_name}_{job_key}{suffix}_{stamp}_{index:02d}{file_ext}"
        path.write_text(script, encoding="utf-8")
        os.chmod(path, 0o755)
        generated.append((bench_name, path, script))

    if mode == "print-script":
        for index, (bench_name, _, script) in enumerate(generated):
            if index:
                print()
            if bench_name:
                print(f"# --- bench: {bench_name} ---")
            print(script)
        return

    if mode == "local":
        for _, path, _ in generated:
            subprocess.run(["bash", str(path)], check=True, cwd=repo_root.parent)
        return

    if mode == "submit":
        submit_command = str(machine.get("submit_command", "")).strip()
        if not submit_command:
            raise SystemExit(f"missing submit_command for machine={machine_name}")
        failed = 0
        for bench_name, path, _ in generated:
            result = subprocess.run(
                [submit_command, str(path)],
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                universal_newlines=True,
            )
            prefix = f"{bench_name}: " if bench_name else ""
            if result.stdout.strip():
                print(f"{prefix}{result.stdout.strip()}")
            if result.stderr.strip():
                print(f"{prefix}{result.stderr.strip()}")
            if result.returncode != 0:
                failed += 1
        if failed:
            raise SystemExit(f"{failed} job submissions failed")
        return

    for _, path, _ in generated:
        print(path)
        if scheduler == "pbs":
            print(f"qsub {path}")
        else:
            print(f"sbatch {path}")


if __name__ == "__main__":
    main()
