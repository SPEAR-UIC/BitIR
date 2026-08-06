#!/usr/bin/env python3
from __future__ import annotations

import argparse
import os
import subprocess
from datetime import datetime, timezone
from pathlib import Path
from typing import Any

from pipeline_config import load_config, read_benches, resolve_mode, validate_machine
from pipeline_shell import export_line, export_mapping, local_script, shell_join, wrapper_script
from task_bodies import task_body

TASKS = ["build", "deploy", "golden", "baseline", "inject-one"]


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="BitIR pipeline controller")
    parser.add_argument("task", choices=TASKS)
    parser.add_argument("config")
    parser.add_argument("--repo-root")
    parser.add_argument("--machine")
    parser.add_argument("--campaign")
    parser.add_argument("--bench")
    parser.add_argument("--benches-file")
    parser.add_argument("--site-id", type=int)
    parser.add_argument("--bit-index", type=int)
    parser.add_argument("--fault-model")
    parser.add_argument("--account")
    parser.add_argument("--execution-mode")
    parser.add_argument("--submit", action="store_true")
    parser.add_argument("--local", action="store_true")
    parser.add_argument("--print-script", action="store_true")
    return parser.parse_args()


def clean(value: Any) -> str:
    return str(value or "").strip()


def machine_env(machine: dict[str, Any]) -> dict[str, Any]:
    return {key: value for key, value in machine.items() if key not in {"jobs", "modules", "module_use", "submit_command"}}


def benchmark_set_paths(cfg: dict[str, Any], run_cfg: dict[str, Any], repo_root: Path) -> tuple[str, Path, Path]:
    name = clean(run_cfg.get("benchmark_set")) or clean(cfg.get("benchmark_set")) or "hecbench"
    entry = dict(cfg.get("benchmark_sets", {}).get(name, {}))
    if not entry:
        raise SystemExit(f"unknown benchmark_set={name!r} in YAML")
    root = Path(clean(entry.get("root")))
    if not str(root):
        raise SystemExit(f"benchmark_sets.{name}.root is required")
    if not root.is_absolute():
        root = repo_root / root
    source_root = root / clean(entry.get("source_root") or "src")
    return name, root, source_root


def selected_benches(task: str, cfg: dict[str, Any], campaign: str, bench: str, benches_file: str) -> list[str]:
    if bench:
        return [bench]
    if benches_file:
        return read_benches(benches_file)
    if task == "inject-one":
        return []
    benches = list(cfg.get("campaigns", {}).get(campaign, {}).get("benchmarks", []))
    if not benches:
        raise SystemExit(f"{task} needs at least one benchmark")
    return benches


def text_compare_benches(cfg: dict[str, Any], benches: list[str]) -> list[str]:
    return [
        str(bench)
        for bench in benches
        if clean(dict(cfg.get("benchmarks", {}).get(bench, {})).get("compare_mode") or "exact") == "text"
    ]


def bench_exports(cfg: dict[str, Any], machine: dict[str, Any], bench: str, include_bench_only: bool) -> list[str]:
    bench_cfg = dict(cfg.get("benchmarks", {}).get(bench, {}))
    bench_env = {str(key): str(value) for key, value in bench_cfg.get("env", {}).items()}
    source_key = clean(machine.get("source_key")) or clean(machine.get("binary_subdir"))
    source_dir = clean(bench_cfg.get("source_dirs", {}).get(source_key)) or f"src/{bench}-{clean(machine.get('binary_subdir')) or source_key}"
    exports = [
        export_line("BENCH", bench),
        export_line("BITIR_BENCH", bench),
        export_line("BITIR_SOURCE_DIR", source_dir),
        export_line("BITIR_EXTRA_INCLUDES", [str(v) for v in bench_cfg.get("extra_includes", {}).get(source_key, [])]),
        export_line("BITIR_GOLDEN_FILE", str(bench_cfg.get("golden_file", f"{bench}.bin")).format(**bench_env)),
        export_line("BITIR_RUN_ARGS", [str(v).format(**bench_env) for v in bench_cfg.get("args", [])]),
        export_line("BITIR_COMPARE_MODE", clean(bench_cfg.get("compare_mode") or "exact")),
    ]
    if include_bench_only:
        exports.insert(2, export_line("BENCH_ONLY", bench))
    export_mapping(exports, "BITIR_STATUS", dict(bench_cfg.get("status", {})))
    for key, value in bench_env.items():
        exports.append(export_line(key, value))
    return exports


def benchmark_switch(cfg: dict[str, Any], machine: dict[str, Any], benches: list[str]) -> str:
    if not benches:
        return ""
    unset_names = {
        "BENCH", "BITIR_BENCH", "BENCH_ONLY", "BITIR_SOURCE_DIR", "BITIR_EXTRA_INCLUDES",
        "BITIR_GOLDEN_FILE", "BITIR_RUN_ARGS", "BITIR_COMPARE_MODE",
    }
    for bench in benches:
        bench_cfg = dict(cfg.get("benchmarks", {}).get(bench, {}))
        unset_names.update(str(key) for key in bench_cfg.get("env", {}))
        unset_names.update(f"BITIR_STATUS_{str(key).upper()}" for key in dict(bench_cfg.get("status", {})))

    lines = ["set_benchmark_config() {", '  case "$1" in']
    for bench in benches:
        lines.append(f"    {bench})")
        lines.append(f"      unset {' '.join(sorted(unset_names))}")
        for line in bench_exports(cfg, machine, str(bench), include_bench_only=False):
            if line:
                lines.append(f"      {line}")
        lines.append("      ;;")
    lines.extend(["    *)", '      echo "unknown benchmark: $1" >&2', "      exit 1", "      ;;", "  esac", "}"])
    return "\n".join(lines)


def fault_model_exports(fault_model_cfg: dict[str, Any]) -> list[str]:
    exports: list[str] = []
    export_mapping(exports, "BITIR_FAULT_MODEL", fault_model_cfg)
    names = {
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
        "trace_repeats": "TRACE_REPEATS",
        "trace_source_window": "TRACE_SOURCE_WINDOW",
        "trace_metadata_dir": "BITIR_TRACE_METADATA_DIR",
        "worklist_queue": "WORKLIST_QUEUE",
        "results_subdir_base": "RESULTS_SUBDIR_BASE",
        "site_list": "SITE_LIST",
        "selection_mode": "WORKLIST_MODE",
        "type_kind": "WORKLIST_TYPE_KIND",
        "opcodes": "WORKLIST_OPCODES",
        "random_sample": "WORKLIST_RANDOM_SAMPLE",
        "random_seed": "WORKLIST_RANDOM_SEED",
    }
    for key, env_name in names.items():
        if key in fault_model_cfg:
            exports.append(export_line(env_name, fault_model_cfg[key]))
    for key, value in dict(fault_model_cfg.get("runtime_env", {})).items():
        exports.append(export_line(str(key), value))
    return exports


def wrapper_command(args: argparse.Namespace, config_path: Path, repo_root: Path, machine: str, campaign: str, bench: str, benches_file: str, site_id: Any, bit_index: Any, fault_model: str, account: str) -> list[str]:
    command: list[Any] = [
        "python3", str(Path(__file__).resolve()), args.task, str(config_path),
        "--repo-root", str(repo_root), "--machine", machine, "--local",
    ]
    for flag, value in [
        ("--campaign", campaign), ("--bench", bench), ("--benches-file", str(Path(benches_file).resolve()) if benches_file else ""),
        ("--site-id", site_id), ("--bit-index", bit_index), ("--fault-model", fault_model), ("--account", account),
    ]:
        if value is not None and value != "":
            command.extend([flag, str(value)])
    return command


def local_exports(
    args: argparse.Namespace,
    cfg: dict[str, Any],
    method_cfg: dict[str, Any],
    machine: dict[str, Any],
    machine_name: str,
    benchmark_set_name: str,
    benchmark_root: Path,
    benchmark_source_root: Path,
    repo_root: Path,
    benches: list[str],
    benches_file: str,
    bench: str,
    fault_model: str,
    fault_model_cfg: dict[str, Any],
    site_id: Any,
    bit_index: Any,
) -> list[str]:
    exports = [
        export_line("BITIR_WORKDIR", str(repo_root)),
        export_line("BITIR_ROOT", str(Path(__file__).resolve().parents[2])),
        export_line("BITIR_BENCHMARK_SET", benchmark_set_name),
        export_line("BITIR_BENCHMARK_ROOT", str(benchmark_root)),
        export_line("BITIR_BENCHMARK_SOURCE_ROOT", str(benchmark_source_root)),
        export_line("BITIR_MACHINE", machine_name),
        export_line("ABS_TOL", method_cfg.get("float_abs_tol")),
        export_line("REL_TOL", method_cfg.get("float_rel_tol")),
        export_line("BITIR_BENCHMARKS", benches),
        export_line("BITIR_TEXT_BENCHMARKS", text_compare_benches(cfg, benches)),
    ]
    if benches_file and args.task != "inject-one":
        exports.append(export_line("BENCH_ONLY_FILE", str(Path(benches_file).resolve())))
    if args.task == "inject-one":
        exports.extend(bench_exports(cfg, machine, bench, include_bench_only=True))
        exports.extend([export_line("SITE_ID", site_id), export_line("BIT_INDEX", bit_index)])
    else:
        exports.append(benchmark_switch(cfg, machine, benches))
    if fault_model:
        exports.append(export_line("BITIR_FAULT_MODEL_NAME", fault_model))
        exports.extend(fault_model_exports(fault_model_cfg))
    export_mapping(exports, "BITIR_MACHINE", machine_env(machine))
    return exports


def run_generated(mode: str, generated: list[tuple[str, Path, str]], submit_command: str, repo_root: Path) -> None:
    if mode == "print-script":
        for index, (bench, _, script) in enumerate(generated):
            if index:
                print()
            if bench:
                print(f"# --- bench: {bench} ---")
            print(script)
        return
    if mode == "local":
        for _, _, script in generated:
            result = subprocess.run(["bash"], input=script, text=True, cwd=repo_root)
            if result.returncode:
                raise SystemExit(result.returncode)
        return
    if mode == "submit":
        failures = 0
        for bench, path, _ in generated:
            result = subprocess.run([submit_command, str(path)], text=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            prefix = f"{bench}: " if bench else ""
            if result.stdout.strip():
                print(f"{prefix}{result.stdout.strip()}")
            if result.stderr.strip():
                print(f"{prefix}{result.stderr.strip()}")
            failures += int(result.returncode != 0)
        if failures:
            raise SystemExit(f"{failures} job submissions failed")
        return
    for _, path, _ in generated:
        print(path)
        print(f"{submit_command} {path}" if submit_command else f"bash {path}")


def main() -> None:
    args = parse_args()
    bitir_root = Path(__file__).resolve().parents[2]
    repo_root = Path(args.repo_root).resolve() if args.repo_root else bitir_root.parent
    config_path = Path(args.config).resolve()
    cfg = load_config(config_path)
    run_cfg = dict(cfg.get("run", {}))
    method_cfg = dict(cfg.get("methodology", {}))

    machine_name = args.machine or clean(run_cfg.get("machine"))
    campaign = args.campaign or clean(run_cfg.get("campaign")) or clean(method_cfg.get("default_campaign"))
    bench = args.bench or clean(run_cfg.get("bench"))
    benches_file = args.benches_file or clean(run_cfg.get("benches_file"))
    site_id = args.site_id if args.site_id is not None else run_cfg.get("site_id")
    bit_index = args.bit_index if args.bit_index is not None else run_cfg.get("bit_index")
    fault_model = args.fault_model or clean(run_cfg.get("fault_model"))
    account = args.account or clean(run_cfg.get("account"))
    mode = resolve_mode(args, run_cfg)

    if not machine_name:
        raise SystemExit("machine is required")
    if args.task == "deploy" and not fault_model:
        raise SystemExit("deploy requires --fault-model <name>")
    if args.task == "inject-one" and not bench:
        raise SystemExit("inject-one requires a benchmark")
    if args.task == "inject-one" and site_id is None:
        raise SystemExit("inject-one requires site_id")
    if args.task == "inject-one" and bit_index is None:
        raise SystemExit("inject-one requires bit_index")

    benchmark_set_name, benchmark_root, benchmark_source_root = benchmark_set_paths(cfg, run_cfg, repo_root)
    machine = dict(cfg.get("machines", {}).get(machine_name, {}))
    if not machine:
        raise SystemExit(f"unknown machine={machine_name!r}")
    validate_machine(args.task, machine_name, machine, mode)

    fault_model_cfg = dict(cfg.get("fault_models", {}).get(fault_model, {})) if fault_model else {}
    if fault_model and not fault_model_cfg:
        raise SystemExit(f"unknown fault_model={fault_model!r} in YAML")
    benches = selected_benches(args.task, cfg, campaign, bench, benches_file)

    job_key = args.task.replace("-", "_")
    job = dict(machine.get("jobs", {}).get(job_key, {}))
    if not job:
        raise SystemExit(f"missing machine.jobs.{job_key} in YAML")
    if not isinstance(job.get("header", []), list):
        raise SystemExit(f"machine.jobs.{job_key}.header must be a YAML list")

    jobs_dir = repo_root / ".bitir_jobs"
    jobs_dir.mkdir(parents=True, exist_ok=True)
    stamp = datetime.now(timezone.utc).strftime("%Y%m%d_%H%M%S")
    modules = [str(v) for v in machine.get("modules", [])]
    module_use = [str(v) for v in machine.get("module_use", [])]
    script_units = [(bench, [bench])] if args.task == "inject-one" else [("", benches)]
    generated: list[tuple[str, Path, str]] = []

    command = wrapper_command(args, config_path, repo_root, machine_name, campaign, bench, benches_file, site_id, bit_index, fault_model, account)

    for index, (bench_name, unit_benches) in enumerate(script_units):
        job_values = dict(job, bench=bench_name.replace("/", "_").replace(" ", "_") or "all", stamp=stamp, index=f"{index:02d}")
        job_values["account"] = account or clean(job_values.get("account")) or "{ADD ACCOUNT HERE}"
        ext = clean(machine.get("script_extension") or ".sh")
        ext = ext if ext.startswith(".") else f".{ext}"
        suffix = f"_{bench_name}" if bench_name else ""
        path = jobs_dir / f"{machine_name}_{job_key}{suffix}_{stamp}_{index:02d}{ext}"

        if mode == "local":
            exports = local_exports(
                args, cfg, method_cfg, machine, machine_name, benchmark_set_name, benchmark_root,
                benchmark_source_root, repo_root, unit_benches, benches_file, bench_name or bench,
                fault_model, fault_model_cfg, site_id, bit_index,
            )
            script = local_script(machine_name, args.task, job_values, exports, task_body(args.task), module_use, modules)
        else:
            script = wrapper_script(machine_name, args.task, job_values, command, repo_root, module_use, modules)
            path.write_text(script, encoding="utf-8")
            os.chmod(path, 0o755)
        generated.append((bench_name, path, script))

    run_generated(mode, generated, clean(machine.get("submit_command")), repo_root)


if __name__ == "__main__":
    main()
