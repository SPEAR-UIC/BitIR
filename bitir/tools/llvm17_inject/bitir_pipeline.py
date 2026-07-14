#!/usr/bin/env python3

import argparse
import os
import shlex
import subprocess
from copy import deepcopy
from datetime import datetime, timezone
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


def shell_join(command):
    return " ".join(shlex.quote(str(part)) for part in command)


def export_mapping(lines, prefix, value):
    if isinstance(value, dict):
        for key, subvalue in value.items():
            export_mapping(lines, f"{prefix}_{str(key).upper()}", subvalue)
        return
    line = export_line(prefix, value)
    if line:
        lines.append(line)


def suffixed_path(path, suffix):
    if not path or not suffix:
        return path
    name = Path(path)
    if "." in name.name:
        return f"{name.with_suffix('')}_{suffix}{name.suffix}"
    return f"{path}_{suffix}"


def script_header(machine_name, task, job):
    task_name = task.replace("-", "_")
    values = {
        "machine": machine_name,
        "task": task_name,
        "bench": str(job.get("bench", "all")).strip() or "all",
        "stamp": str(job.get("stamp", "")).strip(),
        "index": str(job.get("index", "00")).strip() or "00",
    }
    header = ["#!/bin/bash"]
    for line in job.get("header", []):
        rendered = str(line)
        for key, value in values.items():
            rendered = rendered.replace("{" + key + "}", value)
        header.append(rendered)
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

RUN_ARGS_BLOCK = dedent(
    """
    bench_args=()
    if [[ -n "${BITIR_RUN_ARGS:-}" ]]; then
      read -r -a bench_args <<< "${BITIR_RUN_ARGS}"
    fi
    """
).strip()


def build_body():
    return dedent(
        f"""
        need() {{
          local name="$1"
          if [[ -z "${{!name:-}}" ]]; then
            echo "missing required setting: ${{name}}" >&2
            exit 1
          fi
        }}

        run_env_bin() {{
          local env_line="$1"
          shift
          if [[ -z "${{env_line}}" ]]; then
            "$@"
            return
          fi
          local env_parts=()
          read -r -a env_parts <<< "${{env_line}}"
          env "${{env_parts[@]}}" "$@"
        }}

        REPO_DIR="${{PWD}}"
        BUILD_DIR="${{REPO_DIR}}/${{BITIR_MACHINE_BUILD_DIR:?BITIR_MACHINE_BUILD_DIR is required}}"
        OUTPUT_ROOT="${{REPO_DIR}}/${{BITIR_MACHINE_GOLDEN_ROOT:?BITIR_MACHINE_GOLDEN_ROOT is required}}"
        DEVICE_BIN_SUBDIR="${{BITIR_MACHINE_BINARY_SUBDIR:?BITIR_MACHINE_BINARY_SUBDIR is required}}"
        need BITIR_MACHINE_BUILD_CONFIGURE
        mkdir -p "${{OUTPUT_ROOT}}"

        {BENCH_LIST_BLOCK}

        targets=()
        for bench in "${{BENCH_LIST[@]}}"; do
          targets+=("${{bench}}-${{DEVICE_BIN_SUBDIR}}")
        done
        benchmarks_cmake="$(IFS=';'; echo "${{BENCH_LIST[*]}}")"
        BITIR_GOLDEN_KEY="${{REPO_DIR}}/bitir/build/golden_keys/${{BITIR_BENCHMARK_SET}}/${{DEVICE_BIN_SUBDIR}}/golden_outputs.yml"
        python3 "${{BITIR_ROOT}}/tools/benchmark_sets/profile_golden_outputs.py" \
          --benchmark-set "${{BITIR_BENCHMARK_SET}}" \
          --benchmark-root "${{BITIR_BENCHMARK_ROOT}}" \
          --source-root "${{BITIR_BENCHMARK_SOURCE_ROOT#${{BITIR_BENCHMARK_ROOT}}/}}" \
          --benchmarks "${{benchmarks_cmake}}" \
          --models "${{DEVICE_BIN_SUBDIR}}" \
          --text-benchmarks "${{BITIR_TEXT_BENCHMARKS:-}}" \
          --output-key "${{BITIR_GOLDEN_KEY}}"
        export BITIR_GOLDEN_KEY
        apply_golden_key_config() {{
          local key_mode
          key_mode="$(python3 "${{BITIR_ROOT}}/tools/benchmark_sets/golden_key_query.py" \
            --key "${{BITIR_GOLDEN_KEY}}" \
            --benchmark "${{BENCH}}" \
            --model "${{DEVICE_BIN_SUBDIR}}" \
            --field compare_mode)"
          if [[ "${{key_mode}}" == "text" ]]; then
            BITIR_COMPARE_MODE="text"
            if [[ -z "${{BITIR_GOLDEN_FILE:-}}" || "${{BITIR_GOLDEN_FILE}}" == "${{BENCH}}.bin" ]]; then
              BITIR_GOLDEN_FILE="${{BENCH}}.txt"
            fi
          fi
          export BITIR_COMPARE_MODE BITIR_GOLDEN_FILE
        }}
        BITIR_CMAKE_SOURCE_ROOT="${{REPO_DIR}}/bitir/build/benchmark_sets/${{BITIR_BENCHMARK_SET}}/${{DEVICE_BIN_SUBDIR}}"
        python3 "${{BITIR_ROOT}}/tools/benchmark_sets/prepare_benchmark_set.py" \
          --benchmark-set "${{BITIR_BENCHMARK_SET}}" \
          --benchmark-root "${{BITIR_BENCHMARK_ROOT}}" \
          --source-root "${{BITIR_BENCHMARK_SOURCE_ROOT#${{BITIR_BENCHMARK_ROOT}}/}}" \
          --output-root "${{BITIR_CMAKE_SOURCE_ROOT}}" \
          --benchmarks "${{benchmarks_cmake}}" \
          --models "${{DEVICE_BIN_SUBDIR}}"
        export BITIR_CMAKE_SOURCE_ROOT

        if [[ -n "${{BITIR_MACHINE_BUILD_PREPARE:-}}" ]]; then
          eval "${{BITIR_MACHINE_BUILD_PREPARE}}"
        fi
        eval "${{BITIR_MACHINE_BUILD_CONFIGURE}}"
        cmake --build "${{BUILD_DIR}}" --target "${{targets[@]}}"

        for bench in "${{BENCH_LIST[@]}}"; do
          set_benchmark_config "${{bench}}"
          apply_golden_key_config
          bin="${{BUILD_DIR}}/bin/${{DEVICE_BIN_SUBDIR}}/${{bench}}"
          dump="${{OUTPUT_ROOT}}/${{BITIR_GOLDEN_FILE:-${{bench}}.bin}}"
          text_out="${{OUTPUT_ROOT}}/${{BITIR_GOLDEN_FILE:-${{bench}}.txt}}"
          {RUN_ARGS_BLOCK}
          if [[ "${{BITIR_COMPARE_MODE:-exact}}" == "text" ]]; then
            rm -f "${{text_out}}"
            "${{bin}}" "${{bench_args[@]}}" > "${{text_out}}" 2> "${{OUTPUT_ROOT}}/${{bench}}.err"
          else
            rm -f "${{dump}}"
            BITIR_DUMP_PATH="${{dump}}" run_env_bin "${{BITIR_MACHINE_BUILD_RUN_DUMP_ENV:-}}" "${{bin}}" "${{bench_args[@]}}" "${{dump}}" > "${{OUTPUT_ROOT}}/${{bench}}.log" 2> "${{OUTPUT_ROOT}}/${{bench}}.err"
          fi
        done
        """
    ).strip()


BASELINE_BODY = dedent(
    """
    REPO_DIR="${PWD}"
    RUNNER="${BITIR_ROOT}/tools/llvm17_inject/run_benchmark_injection.sh"
    if [[ ! -f "${RUNNER}" ]]; then
      echo "missing runner: ${RUNNER}" >&2
      exit 1
    fi

    RESULTS_RUN_DIR="${REPO_DIR}/results/$(date -u +%Y%m%d_%H%M%S)"
    mkdir -p "${RESULTS_RUN_DIR}"
    echo "[baseline] run_results=${RESULTS_RUN_DIR}"

    """ + BENCH_LIST_BLOCK + """

    for bench in "${BENCH_LIST[@]}"; do
      set_benchmark_config "${bench}"
      BASELINE=1 BENCH="${bench}" SITE_ID=-1 BIT_INDEX=0 RESULTS_DIR="${RESULTS_RUN_DIR}" RESULT_TAG="${bench}_baseline" bash "${RUNNER}"
    done
    """
).strip()


DEPLOY_BODY = dedent(
    """
    need() {
      local name="$1"
      if [[ -z "${!name:-}" ]]; then
        echo "missing required setting: ${name}" >&2
        exit 1
      fi
    }

    worklist_suffix() {
      case "${INJECT_TARGET}" in
        operand) printf '%s\\n' "_operand" ;;
        pointer) printf '%s\\n' "_pointer" ;;
        *) printf '%s\\n' "" ;;
      esac
    }

    apply_worklist_mode() {
      case "${WORKLIST_MODE:-}" in
        ""|instruction_result|instruction_results|result)
          INJECT_TARGET=result
          ;;
        all|all_bits|all_sites)
          INJECT_TARGET=all
          INT_FLOAT_ONLY=0
          ;;
        random)
          INJECT_TARGET=all
          INT_FLOAT_ONLY=0
          WORKLIST_RANDOM_SAMPLE="${WORKLIST_RANDOM_SAMPLE:-${MAX_RUNS}}"
          ;;
        pointer|pointer_only|instruction_pointer|instruction_pointers)
          INJECT_TARGET=pointer
          ;;
        int|int_only)
          INJECT_TARGET=all
          WORKLIST_TYPE_KIND="${WORKLIST_TYPE_KIND:-int}"
          ;;
        float|float_only)
          INJECT_TARGET=all
          WORKLIST_TYPE_KIND="${WORKLIST_TYPE_KIND:-float}"
          ;;
        operand|operand_only|instruction_operand|instruction_operands)
          INJECT_TARGET=operand
          ;;
        add|add_instructions)
          INJECT_TARGET=all
          WORKLIST_OPCODES="${WORKLIST_OPCODES:-add,fadd}"
          ;;
        sub|sub_instructions)
          INJECT_TARGET=all
          WORKLIST_OPCODES="${WORKLIST_OPCODES:-sub,fsub}"
          ;;
        mul|mul_instructions)
          INJECT_TARGET=all
          WORKLIST_OPCODES="${WORKLIST_OPCODES:-mul,fmul}"
          ;;
        div|div_instructions)
          INJECT_TARGET=all
          WORKLIST_OPCODES="${WORKLIST_OPCODES:-udiv,sdiv,fdiv}"
          ;;
        rem|remainder_instructions)
          INJECT_TARGET=all
          WORKLIST_OPCODES="${WORKLIST_OPCODES:-urem,srem,frem}"
          ;;
        shift|shift_instructions)
          INJECT_TARGET=all
          WORKLIST_OPCODES="${WORKLIST_OPCODES:-shl,lshr,ashr}"
          ;;
        bitwise|bitwise_instructions)
          INJECT_TARGET=all
          WORKLIST_OPCODES="${WORKLIST_OPCODES:-and,or,xor}"
          ;;
        compare|compare_instructions)
          INJECT_TARGET=all
          WORKLIST_OPCODES="${WORKLIST_OPCODES:-icmp,fcmp}"
          ;;
        cast|cast_instructions)
          INJECT_TARGET=all
          WORKLIST_OPCODES="${WORKLIST_OPCODES:-trunc,zext,sext,fptrunc,fpext,fptoui,fptosi,uitofp,sitofp,ptrtoint,inttoptr,bitcast,addrspacecast}"
          ;;
        zext|sext|trunc|bitcast|select|load|store|getelementptr|gep|call|phi)
          INJECT_TARGET=all
          if [[ "${WORKLIST_MODE}" == "gep" ]]; then
            WORKLIST_OPCODES="${WORKLIST_OPCODES:-getelementptr}"
          else
            WORKLIST_OPCODES="${WORKLIST_OPCODES:-${WORKLIST_MODE}}"
          fi
          ;;
        *_instruction|*_instructions)
          INJECT_TARGET=all
          opcode_mode="${WORKLIST_MODE%_instructions}"
          opcode_mode="${opcode_mode%_instruction}"
          [[ "${opcode_mode}" == "gep" ]] && opcode_mode="getelementptr"
          WORKLIST_OPCODES="${WORKLIST_OPCODES:-${opcode_mode}}"
          ;;
        *)
          if [[ "${WORKLIST_MODE}" =~ ^[A-Za-z][A-Za-z0-9_.-]*$ ]]; then
            INJECT_TARGET=all
            WORKLIST_OPCODES="${WORKLIST_OPCODES:-${WORKLIST_MODE}}"
          else
            echo "unknown worklist selection mode: ${WORKLIST_MODE}" >&2
            exit 1
          fi
          ;;
      esac
    }

    need BITIR_WORKDIR
    need BITIR_MACHINE_RESULTS_ROOT

    REPO_ROOT="${BITIR_WORKDIR}"
    RUNNER="${BITIR_ROOT}/tools/llvm17_inject/run_benchmark_injection.sh"
    PLUGIN_BUILD="${BITIR_ROOT}/tools/llvm17_inject/build.sh"
    WORKLIST_TOOL="${BITIR_ROOT}/tools/llvm17_inject/build_bench_worklist.py"

    INJECT_TARGET="${INJECT_TARGET:-${BITIR_FAULT_MODEL_INJECT_TARGET:-result}}"
    INT_FLOAT_ONLY="${INT_FLOAT_ONLY:-${BITIR_FAULT_MODEL_INT_FLOAT_ONLY:-1}}"
    INCLUDE_CONSTANTS="${INCLUDE_CONSTANTS:-${BITIR_FAULT_MODEL_INCLUDE_CONSTANTS:-0}}"
    PHASE="${PHASE:-${BITIR_FAULT_MODEL_PHASE:-float}}"
    RUN_BASELINE="${RUN_BASELINE:-0}"
    SKIP_EXISTING="${SKIP_EXISTING:-1}"
    MAX_RUNS="${MAX_INJECTIONS:-${MAX_PAIRS:-0}}"
    WORKLIST_MODE="${WORKLIST_MODE:-${BITIR_FAULT_MODEL_SELECTION_MODE:-}}"
    WORKLIST_TYPE_KIND="${WORKLIST_TYPE_KIND:-${BITIR_FAULT_MODEL_TYPE_KIND:-}}"
    WORKLIST_OPCODES="${WORKLIST_OPCODES:-${BITIR_FAULT_MODEL_OPCODES:-}}"
    WORKLIST_RANDOM_SAMPLE="${WORKLIST_RANDOM_SAMPLE:-${BITIR_FAULT_MODEL_RANDOM_SAMPLE:-}}"
    WORKLIST_RANDOM_SEED="${WORKLIST_RANDOM_SEED:-${BITIR_FAULT_MODEL_RANDOM_SEED:-1}}"
    apply_worklist_mode
    cd "${REPO_ROOT}"

    [[ -f "${RUNNER}" ]] || { echo "missing runner: ${RUNNER}" >&2; exit 1; }
    [[ -f "${WORKLIST_TOOL}" ]] || { echo "missing worklist tool: ${WORKLIST_TOOL}" >&2; exit 1; }

    """ + BENCH_LIST_BLOCK + """

    benchmarks_cmake="$(IFS=';'; echo "${BENCH_LIST[*]}")"
    BITIR_GOLDEN_KEY="${REPO_ROOT}/bitir/build/golden_keys/${BITIR_BENCHMARK_SET}/${BITIR_MACHINE_BINARY_SUBDIR}/golden_outputs.yml"
    python3 "${BITIR_ROOT}/tools/benchmark_sets/profile_golden_outputs.py" \
      --benchmark-set "${BITIR_BENCHMARK_SET}" \
      --benchmark-root "${BITIR_BENCHMARK_ROOT}" \
      --source-root "${BITIR_BENCHMARK_SOURCE_ROOT#${BITIR_BENCHMARK_ROOT}/}" \
      --benchmarks "${benchmarks_cmake}" \
      --models "${BITIR_MACHINE_BINARY_SUBDIR}" \
      --text-benchmarks "${BITIR_TEXT_BENCHMARKS:-}" \
      --output-key "${BITIR_GOLDEN_KEY}"
    export BITIR_GOLDEN_KEY
    apply_golden_key_config() {
      local key_mode
      key_mode="$(python3 "${BITIR_ROOT}/tools/benchmark_sets/golden_key_query.py" \
        --key "${BITIR_GOLDEN_KEY}" \
        --benchmark "${BENCH}" \
        --model "${BITIR_MACHINE_BINARY_SUBDIR}" \
        --field compare_mode)"
      if [[ "${key_mode}" == "text" ]]; then
        BITIR_COMPARE_MODE="text"
        if [[ -z "${BITIR_GOLDEN_FILE:-}" || "${BITIR_GOLDEN_FILE}" == "${BENCH}.bin" ]]; then
          BITIR_GOLDEN_FILE="${BENCH}.txt"
        fi
      fi
      export BITIR_COMPARE_MODE BITIR_GOLDEN_FILE
    }

    BITIR_DEPLOY_SOURCE_ROOT="${REPO_ROOT}/bitir/build/benchmark_sets/${BITIR_BENCHMARK_SET}/${BITIR_MACHINE_BINARY_SUBDIR}"
    BITIR_DEPLOY_VARIANTS="${BITIR_DEPLOY_SOURCE_ROOT}/benchmark_variants.csv"
    python3 "${BITIR_ROOT}/tools/benchmark_sets/prepare_benchmark_set.py" \
      --benchmark-set "${BITIR_BENCHMARK_SET}" \
      --benchmark-root "${BITIR_BENCHMARK_ROOT}" \
      --source-root "${BITIR_BENCHMARK_SOURCE_ROOT#${BITIR_BENCHMARK_ROOT}/}" \
      --output-root "${BITIR_DEPLOY_SOURCE_ROOT}" \
      --benchmarks "${benchmarks_cmake}" \
      --models "${BITIR_MACHINE_BINARY_SUBDIR}"
    prepared_source_dir() {
      awk -F, -v bench="$1" -v model="${BITIR_MACHINE_BINARY_SUBDIR}" \
        'NR > 1 && $1 == bench && $2 == model { print $3; found = 1; exit } END { if (!found) exit 1 }' \
        "${BITIR_DEPLOY_VARIANTS}"
    }

    bash "${PLUGIN_BUILD}"

    RESULTS_RUN_DIR="${REPO_ROOT}/results/$(date -u +%Y%m%d_%H%M%S)"
    mkdir -p "${RESULTS_RUN_DIR}"
    echo "[deploy] run_results=${RESULTS_RUN_DIR}"

    total_count=0
    for bench in "${BENCH_LIST[@]}"; do
      set_benchmark_config "${bench}"
      BITIR_SOURCE_DIR="$(prepared_source_dir "${BENCH}")" || { echo "missing prepared source for ${BENCH}-${BITIR_MACHINE_BINARY_SUBDIR}" >&2; exit 1; }
      export BITIR_SOURCE_DIR
      apply_golden_key_config
      need BENCH
      need BITIR_SOURCE_DIR

      SITE_LIST="${SITE_LIST:-${BITIR_SITE_LIST:-${BITIR_FAULT_MODEL_SITE_LIST:-}}}"
      RESULTS_DIR="${RESULTS_RUN_DIR}"
      RESULT_TAG="${BENCH}_${PHASE:-default}"
      WORKLIST="${RESULTS_DIR}/${RESULT_TAG}_worklist.csv"
      if [[ -n "${SITE_LIST}" && "${SITE_LIST}" != /* ]]; then
        SITE_LIST="${REPO_ROOT}/${SITE_LIST}"
      fi

      mkdir -p "${RESULTS_DIR}"
      echo "[deploy] bench=${BENCH}"
      echo "[deploy] results=${RESULTS_DIR}"
      echo "[deploy] result_tag=${RESULT_TAG}"
      echo "[deploy] target=${INJECT_TARGET}"

      python3 "${WORKLIST_TOOL}" \
        --bench "${BENCH}" \
        --source-dir "${BITIR_SOURCE_DIR}" \
        --target "${INJECT_TARGET}" \
        --int-float-only "${INT_FLOAT_ONLY}" \
        --include-constants "${INCLUDE_CONSTANTS}" \
        --type-kind "${WORKLIST_TYPE_KIND}" \
        --opcode "${WORKLIST_OPCODES}" \
        --random-sample "${WORKLIST_RANDOM_SAMPLE:-0}" \
        --random-seed "${WORKLIST_RANDOM_SEED}" \
        --sites "${RESULTS_DIR}/${RESULT_TAG}_sites.csv" \
        --sites-rich "${RESULTS_DIR}/${RESULT_TAG}_sites_metadata.csv" \
        --worklist "${WORKLIST}"

      [[ -s "${WORKLIST}" ]] || { echo "empty worklist: ${WORKLIST}" >&2; exit 1; }
      worklist_rows="$(awk 'NR > 1 { count++ } END { print count + 0 }' "${WORKLIST}")"
      if [[ "${MAX_RUNS}" == "0" ]]; then
        echo "[deploy] worklist candidates=${worklist_rows} run_limit=all"
      else
        echo "[deploy] worklist candidates=${worklist_rows} run_limit=${MAX_RUNS}"
      fi

      if [[ "${RUN_BASELINE}" == "1" ]]; then
        echo "[deploy] baseline no-flip site=-1 bit=0"
        BASELINE=1 SITE_ID=-1 BIT_INDEX=0 RESULTS_DIR="${RESULTS_DIR}" RESULT_TAG="${RESULT_TAG}" \
          BITIR_TRACE_METADATA_DIR="${RESULTS_DIR}" BITIR_TRACE_WORKLIST_NAME="$(basename "${WORKLIST}")" \
          BITIR_TRACE_METADATA_CSV="${RESULTS_DIR}/${RESULT_TAG}_sites_metadata.csv" \
          bash "${RUNNER}"
      fi

      INPUT_LIST="${WORKLIST}"
      if [[ -n "${SITE_LIST}" ]]; then
        [[ -f "${SITE_LIST}" ]] || { echo "missing site list: ${SITE_LIST}" >&2; exit 1; }
        INPUT_LIST="${SITE_LIST}"
      fi

      count=0
      while IFS=, read -r a b c _; do
        site_id="${a}"
        bit_index="${b}"
        if [[ "${a}" =~ ^[0-9]+$ && "${b}" =~ ^[0-9]+$ && "${c:-}" =~ ^[0-9]+$ ]]; then
          site_id="${b}"
          bit_index="${c}"
        fi
        [[ "${site_id}" == "site_id" || "${site_id}" == "index" || "${site_id}" == "x_index" ]] && continue
        [[ -n "${site_id}" && -n "${bit_index}" ]] || continue
        if [[ "${MAX_RUNS}" != "0" && "${count}" -ge "${MAX_RUNS}" ]]; then
          break
        fi
        echo "[deploy] site=${site_id} bit=${bit_index}"
        BASELINE=0 SITE_ID="${site_id}" BIT_INDEX="${bit_index}" RESULTS_DIR="${RESULTS_DIR}" RESULT_TAG="${RESULT_TAG}" \
          BITIR_TRACE_METADATA_DIR="${RESULTS_DIR}" BITIR_TRACE_WORKLIST_NAME="$(basename "${WORKLIST}")" \
          BITIR_TRACE_METADATA_CSV="${RESULTS_DIR}/${RESULT_TAG}_sites_metadata.csv" \
          SKIP_EXISTING="${SKIP_EXISTING}" bash "${RUNNER}"
        count=$((count + 1))
      done < "${INPUT_LIST}"

      total_count=$((total_count + count))
      echo "[deploy] completed ${count} injection sites for ${BENCH}"
    done

    echo "[deploy] completed ${total_count} injection sites total"
    """
).strip()


def task_body(task, machine):
    if task in {"build", "golden"}:
        return build_body()
    if task == "baseline":
        return BASELINE_BODY
    if task == "deploy":
        return DEPLOY_BODY
    if task == "inject-one":
        return 'bash "${BITIR_ROOT}/tools/llvm17_inject/run_benchmark_injection.sh"'
    raise SystemExit(f"unsupported task={task!r}")


def build_script(machine_name, task, job, exports, module_use, modules, body):
    header = script_header(machine_name, task, job)
    lines = [
        "set -euo pipefail",
        'echo "[trace] start $(date -u +%Y-%m-%dT%H:%M:%SZ)"',
        'echo "[trace] host $(hostname)"',
        *exports,
        *module_block(module_use, modules),
        'cd "${BITIR_WORKDIR}"',
        body,
    ]
    return "\n".join(header + ["", *lines, ""])


def simple_module_block(module_use, modules):
    lines = []
    if module_use or modules:
        lines.append("module purge")
    for path in module_use:
        lines.append(f"module use {shlex.quote(str(path))}")
    for mod in modules:
        lines.append(f"module load {shlex.quote(str(mod))}")
    return lines


def compact_invocation(args, config_path, repo_root, machine_name, campaign, bench, benches_file, site_id, bit_index, fault_model):
    command = [
        "python3",
        str(Path(__file__).resolve()),
        args.task,
        str(config_path),
        "--repo-root",
        str(repo_root),
        "--machine",
        machine_name,
        "--local",
    ]
    if campaign:
        command.extend(["--campaign", campaign])
    if bench:
        command.extend(["--bench", bench])
    if benches_file:
        command.extend(["--benches-file", str(Path(benches_file).resolve())])
    if site_id is not None:
        command.extend(["--site-id", str(site_id)])
    if bit_index is not None:
        command.extend(["--bit-index", str(bit_index)])
    if fault_model:
        command.extend(["--fault-model", fault_model])
    return command


def build_compact_script(machine_name, task, job, command, repo_root, module_use, modules):
    header = script_header(machine_name, task, job)
    lines = [
        "set -euo pipefail",
        'echo "[trace] start $(date -u +%Y-%m-%dT%H:%M:%SZ)"',
        'echo "[trace] host $(hostname)"',
        *simple_module_block(module_use, modules),
        f"cd {shlex.quote(str(repo_root))}",
        shell_join(command),
    ]
    return "\n".join(header + ["", *lines, ""])


def machine_env(machine):
    keep = {}
    for key, value in machine.items():
        if key in {"jobs", "modules", "module_use", "submit_command"}:
            continue
        keep[key] = value
    return keep


def require_fields(scope, mapping, keys):
    missing = [key for key in keys if str(mapping.get(key, "")).strip() == ""]
    if missing:
        raise SystemExit(f"missing {scope} field(s) in YAML: {', '.join(missing)}")


def validate_machine(task, machine_name, machine, mode):
    require_fields(f"machines.{machine_name}", machine, ["script_extension"])
    if mode == "submit":
        require_fields(f"machines.{machine_name}", machine, ["submit_command"])
    if task in {"build", "golden"}:
        require_fields(
            f"machines.{machine_name}",
            machine,
            ["build_dir", "binary_subdir", "golden_root", "build_configure"],
        )
    if task in {"deploy", "baseline", "inject-one"}:
        require_fields(f"machines.{machine_name}", machine, ["results_root", "golden_root", "source_file", "binary_subdir"])
        if not str(machine.get("inject_build", "")).strip():
            require_fields(
                f"machines.{machine_name}",
                machine,
                ["inject_build_baseline", "inject_build_injected"],
            )
    if task == "deploy":
        require_fields(f"machines.{machine_name}", machine, ["worklist_build_ir"])


def bench_exports(cfg, machine, bench_name, include_bench_only=True):
    if not bench_name:
        return []
    bench_cfg = dict(cfg.get("benchmarks", {}).get(bench_name, {}))
    bench_env = {str(key): str(value) for key, value in bench_cfg.get("env", {}).items()}
    machine_key = str(machine.get("source_key", "")).strip() or str(machine.get("binary_subdir", "")).strip()
    source_dir = str(bench_cfg.get("source_dirs", {}).get(machine_key, "")).strip()
    if not source_dir:
        source_dir = f"src/{bench_name}-{machine.get('binary_subdir', machine_key)}"
    extra_includes = [str(v) for v in bench_cfg.get("extra_includes", {}).get(machine_key, [])]
    exports = [
        export_line("BENCH", bench_name),
        export_line("BITIR_BENCH", bench_name),
        export_line("BITIR_SOURCE_DIR", source_dir),
        export_line("BITIR_EXTRA_INCLUDES", extra_includes),
        export_line("BITIR_GOLDEN_FILE", str(bench_cfg.get("golden_file", f"{bench_name}.bin")).format(**bench_env)),
        export_line("BITIR_RUN_ARGS", [str(v).format(**bench_env) for v in bench_cfg.get("args", [])]),
        export_line("BITIR_COMPARE_MODE", str(bench_cfg.get("compare_mode", "exact")).strip()),
    ]
    if include_bench_only:
        exports.insert(2, export_line("BENCH_ONLY", bench_name))
    export_mapping(exports, "BITIR_STATUS", dict(bench_cfg.get("status", {})))
    for key, value in bench_env.items():
        line = export_line(key, value)
        if line:
            exports.append(line)
    return exports


def benchmark_config_block(cfg, machine, benches):
    if not benches:
        return ""
    env_keys = set()
    status_keys = set()
    for bench_name in benches:
        bench_cfg = dict(cfg.get("benchmarks", {}).get(bench_name, {}))
        env_keys.update(str(key) for key in bench_cfg.get("env", {}))
        status_keys.update(str(key).upper() for key in dict(bench_cfg.get("status", {})))

    unset_names = [
        "BENCH",
        "BITIR_BENCH",
        "BENCH_ONLY",
        "BITIR_SOURCE_DIR",
        "BITIR_EXTRA_INCLUDES",
        "BITIR_GOLDEN_FILE",
        "BITIR_RUN_ARGS",
        "BITIR_COMPARE_MODE",
        *sorted(env_keys),
        *[f"BITIR_STATUS_{key}" for key in sorted(status_keys)],
    ]
    lines = ["set_benchmark_config() {", '  case "$1" in']
    for bench_name in benches:
        lines.append(f"    {shlex.quote(str(bench_name))})")
        lines.append(f"      unset {' '.join(unset_names)}")
        for export in bench_exports(cfg, machine, bench_name, include_bench_only=False):
            if export:
                lines.append(f"      {export}")
        lines.append("      ;;")
    lines.extend(
        [
            "    *)",
            '      echo "unknown benchmark: $1" >&2',
            "      exit 1",
            "      ;;",
            "  esac",
            "}",
        ]
    )
    return "\n".join(lines)


def text_compare_benches(cfg, benches):
    names = []
    for bench_name in benches:
        bench_cfg = dict(cfg.get("benchmarks", {}).get(bench_name, {}))
        if str(bench_cfg.get("compare_mode", "exact")).strip() == "text":
            names.append(str(bench_name))
    return names


def append_fault_model_exports(exports, fault_model_cfg):
    export_mapping(exports, "BITIR_FAULT_MODEL", fault_model_cfg)
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
    for key, env_name in compat.items():
        if key in fault_model_cfg:
            line = export_line(env_name, fault_model_cfg[key])
            if line:
                exports.append(line)
    for key, value in dict(fault_model_cfg.get("runtime_env", {})).items():
        line = export_line(str(key), value)
        if line:
            exports.append(line)


def resolve_mode(args, run_cfg):
    if args.submit:
        return "submit"
    if args.local:
        return "local"
    if args.print_script:
        return "print-script"
    mode = (args.execution_mode or str(run_cfg.get("execution_mode", "write-script")).strip() or "write-script").lower()
    if mode in {"render", "print", "stdout"}:
        return "print-script"
    if mode == "write":
        return "write-script"
    if mode not in {"submit", "local", "print-script", "write-script"}:
        raise SystemExit(f"unsupported execution_mode={mode!r}")
    return mode


def main():
    args = parse_args()
    bitir_root = Path(__file__).resolve().parents[2]
    repo_root = Path(args.repo_root).resolve() if args.repo_root else bitir_root.parent
    config_path = Path(args.config).resolve()
    cfg = load_config(config_path)
    run_cfg = cfg.get("run", {})
    method_cfg = cfg.get("methodology", {})

    machine_name = args.machine or str(run_cfg.get("machine", "")).strip()
    campaign = args.campaign or str(run_cfg.get("campaign", "")).strip() or str(method_cfg.get("default_campaign", "")).strip()
    bench = args.bench or str(run_cfg.get("bench", "")).strip()
    benches_file = args.benches_file or str(run_cfg.get("benches_file", "")).strip()
    site_id = args.site_id if args.site_id is not None else run_cfg.get("site_id")
    bit_index = args.bit_index if args.bit_index is not None else run_cfg.get("bit_index")
    fault_model = args.fault_model or str(run_cfg.get("fault_model", "")).strip()
    mode = resolve_mode(args, run_cfg)
    benchmark_set_name = (
        str(run_cfg.get("benchmark_set", "")).strip()
        or str(cfg.get("benchmark_set", "")).strip()
        or "hecbench"
    )
    benchmark_sets = cfg.get("benchmark_sets", {})
    benchmark_set = dict(benchmark_sets.get(benchmark_set_name, {}))
    if not benchmark_set:
        raise SystemExit(f"unknown benchmark_set={benchmark_set_name!r} in YAML")
    benchmark_root = Path(str(benchmark_set.get("root", "")).strip())
    if not str(benchmark_root):
        raise SystemExit(f"benchmark_sets.{benchmark_set_name}.root is required")
    if not benchmark_root.is_absolute():
        benchmark_root = repo_root / benchmark_root
    benchmark_source_root = benchmark_root / str(benchmark_set.get("source_root", "src")).strip()

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

    machine = dict(cfg.get("machines", {}).get(machine_name, {}))
    if not machine:
        raise SystemExit(f"unknown machine={machine_name!r}")
    validate_machine(args.task, machine_name, machine, mode)

    if fault_model:
        fault_model_cfg = dict(cfg.get("fault_models", {}).get(fault_model, {}))
        if not fault_model_cfg:
            raise SystemExit(f"unknown fault_model={fault_model!r} in YAML")
    else:
        fault_model_cfg = {}

    if bench:
        benches = [bench]
    elif benches_file:
        benches = read_benches(benches_file)
    elif args.task != "inject-one":
        benches = list(cfg.get("campaigns", {}).get(campaign, {}).get("benchmarks", []))
    else:
        benches = []
    if args.task != "inject-one" and not benches:
        raise SystemExit(f"{args.task} needs at least one benchmark")

    job_key = args.task.replace("-", "_")
    job = dict(machine.get("jobs", {}).get(job_key, {}))
    if not job:
        raise SystemExit(f"missing machine.jobs.{job_key} in YAML")
    if not isinstance(job.get("header", []), list):
        raise SystemExit(f"machine.jobs.{job_key}.header must be a YAML list")

    jobs_dir = repo_root / ".bitir_jobs"
    jobs_dir.mkdir(parents=True, exist_ok=True)
    stamp = datetime.now(timezone.utc).strftime("%Y%m%d_%H%M%S")
    module_use = [str(value) for value in machine.get("module_use", [])]
    modules = [str(value) for value in machine.get("modules", [])]
    body = task_body(args.task, machine)
    compact_scripts = mode in {"write-script", "submit", "print-script"}
    compact_command = compact_invocation(
        args,
        config_path,
        repo_root,
        machine_name,
        campaign,
        bench,
        benches_file,
        site_id,
        bit_index,
        fault_model,
    )
    generated = []

    script_benches = benches if args.task != "inject-one" else [bench]
    script_units = [(bench, [bench])] if args.task == "inject-one" else [("", script_benches)]

    for index, (bench_name, unit_benches) in enumerate(script_units):
        exports = [
            export_line("BITIR_WORKDIR", str(repo_root)),
            export_line("BITIR_ROOT", str(bitir_root)),
            export_line("BITIR_BENCHMARK_SET", benchmark_set_name),
            export_line("BITIR_BENCHMARK_ROOT", str(benchmark_root)),
            export_line("BITIR_BENCHMARK_SOURCE_ROOT", str(benchmark_source_root)),
            export_line("BITIR_MACHINE", machine_name),
            export_line("ABS_TOL", method_cfg.get("float_abs_tol")),
            export_line("REL_TOL", method_cfg.get("float_rel_tol")),
            export_line("BITIR_BENCHMARKS", unit_benches),
            export_line("BITIR_TEXT_BENCHMARKS", text_compare_benches(cfg, unit_benches)),
        ]
        if benches_file and args.task != "inject-one":
            exports.append(export_line("BENCH_ONLY_FILE", str(Path(benches_file).resolve())))
        if args.task == "inject-one":
            exports.extend(bench_exports(cfg, machine, bench_name))
            exports.append(export_line("SITE_ID", site_id))
            exports.append(export_line("BIT_INDEX", bit_index))
        else:
            config_block = benchmark_config_block(cfg, machine, unit_benches)
            if config_block:
                exports.append(config_block)
        if fault_model:
            exports.append(export_line("BITIR_FAULT_MODEL_NAME", fault_model))
            append_fault_model_exports(exports, fault_model_cfg)
        export_mapping(exports, "BITIR_MACHINE", machine_env(machine))

        bench_suffix = bench_name.replace("/", "_").replace(" ", "_")
        job_values = dict(job)
        job_values["bench"] = bench_suffix or "all"
        job_values["stamp"] = stamp
        job_values["index"] = f"{index:02d}"

        if compact_scripts:
            script = build_compact_script(machine_name, args.task, job_values, compact_command, repo_root, module_use, modules)
        else:
            script = build_script(
                machine_name,
                args.task,
                job_values,
                [line for line in exports if line],
                module_use,
                modules,
                body,
            )
        suffix = f"_{bench_name}" if bench_name else ""
        file_ext = str(machine.get("script_extension", ".sh")).strip() or ".sh"
        if not file_ext.startswith("."):
            file_ext = f".{file_ext}"
        path = jobs_dir / f"{machine_name}_{job_key}{suffix}_{stamp}_{index:02d}{file_ext}"
        if mode != "local":
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
        for _, _, script in generated:
            subprocess.run(["bash"], input=script, universal_newlines=True, check=True, cwd=repo_root)
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

    submit_command = str(machine.get("submit_command", "")).strip()
    for _, path, _ in generated:
        print(path)
        if submit_command:
            print(f"{submit_command} {path}")
        else:
            print(f"bash {path}")


if __name__ == "__main__":
    main()
