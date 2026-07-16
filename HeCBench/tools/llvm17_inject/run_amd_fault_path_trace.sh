#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="${REPO_ROOT:-$(pwd)}"
MANIFEST="${MANIFEST:-${REPO_ROOT}/HeCBench/config/sites/divergence_trace_fault_path_amd_colorwheel.csv}"
RESULTS_ROOT="${RESULTS_ROOT:-${REPO_ROOT}/HeCBench/results/divergence_trace_fault_path_frontier_v1/amd}"
RUNNER="${RUNNER:-${REPO_ROOT}/HeCBench/tools/llvm17_inject/run_benchmark_injection.sh}"
TRIALS="${TRIALS:-2}"
if [[ "${RESULTS_ROOT}" == "${REPO_ROOT}/"* ]]; then
  RESULTS_ROOT_REL="${RESULTS_ROOT#${REPO_ROOT}/}"
else
  RESULTS_ROOT_REL="${RESULTS_ROOT}"
fi

export BITIR_MACHINE_BACKEND=amd
export BITIR_MACHINE_RUNTIME_HOME="${BITIR_MACHINE_RUNTIME_HOME:-/opt/rocm-6.4.2}"
export BITIR_MACHINE_HIP_ARCH="${BITIR_MACHINE_HIP_ARCH:-gfx90a}"
export BITIR_MACHINE_GOLDEN_ROOT="${BITIR_MACHINE_GOLDEN_ROOT:-Frontier_HIP_Golden_Outputs}"
export BITIR_MACHINE_RESULTS_ROOT="${BITIR_MACHINE_RESULTS_ROOT:-${RESULTS_ROOT_REL}}"
export BITIR_MACHINE_DEVICE_VISIBLE_ENV="${BITIR_MACHINE_DEVICE_VISIBLE_ENV:-ROCR_VISIBLE_DEVICES}"
export BITIR_MACHINE_DEVICE_VISIBLE_VALUE="${BITIR_MACHINE_DEVICE_VISIBLE_VALUE:-0}"
export BITIR_MACHINE_GPU_QUERY_TOOL="${BITIR_MACHINE_GPU_QUERY_TOOL:-rocm-smi}"
export TRACE_LEVEL="${TRACE_LEVEL:-full}"
export TRACE_SOURCE_WINDOW="${TRACE_SOURCE_WINDOW:-16}"
export BITIR_RUN_TIMEOUT="${BITIR_RUN_TIMEOUT:-300s}"
export RUN_TIMEOUT_KILL_AFTER="${RUN_TIMEOUT_KILL_AFTER:-20s}"
export SKIP_EXISTING=0
export KEEP_DUMPS=0
export HIP_TRACE_API="${HIP_TRACE_API:-1}"
export HSA_ENABLE_DEBUG="${HSA_ENABLE_DEBUG:-1}"
export AMD_LOG_LEVEL="${AMD_LOG_LEVEL:-3}"
export ROCR_DEBUG_ENABLE="${ROCR_DEBUG_ENABLE:-1}"
export BITIR_AMD_EXECUTION_MODE=injected_ir

bench_source_dir() {
  case "$1" in
    colorwheel) printf '%s\n' "HeCBench/src/colorwheel-hip" ;;
    dense-embedding) printf '%s\n' "HeCBench/src/dense-embedding-hip" ;;
    entropy) printf '%s\n' "HeCBench/src/entropy-hip" ;;
    randomAccess) printf '%s\n' "HeCBench/src/randomAccess-hip" ;;
    *) return 1 ;;
  esac
}

bench_run_args() {
  case "$1" in
    colorwheel) printf '%s\n' "10000 8 1" ;;
    dense-embedding) printf '%s\n' "10000 8 1" ;;
    entropy) printf '%s\n' "10000 1024 1" ;;
    randomAccess) printf '%s\n' "1" ;;
    *) return 1 ;;
  esac
}

bench_extra_includes() {
  case "$1" in
    entropy) printf '%s\n' "HeCBench/src/entropy-cuda" ;;
    *) printf '%s\n' "" ;;
  esac
}

mkdir -p "${RESULTS_ROOT}"
cp -f "${MANIFEST}" "${RESULTS_ROOT}/selected_manifest.csv"

{
  echo "start_utc=$(date -u +%Y-%m-%dT%H:%M:%SZ)"
  echo "host=$(hostname)"
  echo "repo=${REPO_ROOT}"
  echo "manifest=${MANIFEST}"
  echo "results_root=${RESULTS_ROOT}"
  echo "trials=${TRIALS}"
  echo "rocm=${BITIR_MACHINE_RUNTIME_HOME}"
  echo "hip_arch=${BITIR_MACHINE_HIP_ARCH}"
  echo "execution_mode=${BITIR_AMD_EXECUTION_MODE}"
  echo "inject_target=all"
} > "${RESULTS_ROOT}/fault_path_provenance.txt"

tail -n +2 "${MANIFEST}" | while IFS=, read -r bench site_id bit_index site_class opcode type_kind bitwidth function source_line source_column signature_ordinal compare_mode; do
  export BENCH="${bench}"
  export BITIR_SOURCE_DIR="$(bench_source_dir "${bench}")"
  export BITIR_COMPARE_MODE="${compare_mode}"
  export BITIR_GOLDEN_FILE="${bench}.bin"
  export BITIR_RUN_ARGS="$(bench_run_args "${bench}")"
  export BITIR_EXTRA_INCLUDES="$(bench_extra_includes "${bench}")"
  export BITIR_TRACE_METADATA_DIR="${REPO_ROOT}/HeCBench/results/divergence_trace_exploratory_frontier_v4/amd/metadata/${bench}"
  export BITIR_SITE_LIST="${MANIFEST}"
  export INJECT_TARGET=all
  export PHASE=float
  export ABS_TOL=1e-5
  export REL_TOL=0.0
  export RESULTS_DIR="${RESULTS_ROOT}/${bench}/float"
  mkdir -p "${RESULTS_DIR}"

  {
    echo "bench=${bench}"
    echo "site_id=${site_id}"
    echo "bit_index=${bit_index}"
    echo "site_class=${site_class}"
    echo "opcode=${opcode}"
    echo "type_kind=${type_kind}"
    echo "bitwidth=${bitwidth}"
    echo "function=${function}"
    echo "source_line=${source_line}"
    echo "source_column=${source_column}"
    echo "signature_ordinal=${signature_ordinal}"
    echo "compare_mode=${compare_mode}"
    echo "inject_target=all"
  } > "${RESULTS_DIR}/case_site${site_id}_bit${bit_index}.provenance"

  trial=1
  while [[ "${trial}" -le "${TRIALS}" ]]; do
    echo "[fault-path] bench=${bench} site=${site_id} bit=${bit_index} trial=${trial}"
    OUT_DIR="${TMPDIR:-/tmp}/bitir_fault_path_${bench}_site${site_id}_bit${bit_index}_trial${trial}" \
      SITE_ID="${site_id}" BIT_INDEX="${bit_index}" TRIAL_INDEX="${trial}" \
      bash "${RUNNER}"
    trial=$((trial + 1))
  done
done

python3 - "${RESULTS_ROOT}" <<'PY'
import csv
import json
import sys
from pathlib import Path

root = Path(sys.argv[1])
rows = []
for trace in sorted(root.glob("*/*/trace_site*_bit*")):
    raw = {}
    raw_path = trace / "raw_outcome.txt"
    if raw_path.exists():
        for line in raw_path.read_text(encoding="utf-8", errors="replace").splitlines():
            if "=" in line:
                key, value = line.split("=", 1)
                raw[key] = value
    diag = {}
    diag_path = trace / "diag.json"
    if diag_path.exists():
        diag = json.loads(diag_path.read_text(encoding="utf-8"))
    rows.append({
        "bench": raw.get("bench", diag.get("benchmark", "")),
        "site_id": raw.get("site_id", diag.get("site_id", "")),
        "bit_index": raw.get("bit_index", diag.get("bit_index", "")),
        "trial": raw.get("trial", ""),
        "result": raw.get("result", diag.get("final_observed_outcome", "")),
        "process_exit": raw.get("process_exit", ""),
        "consumer_class": diag.get("consumer_class", ""),
        "mutated_value": diag.get("mutated_value", ""),
        "first_direct_consumer": diag.get("first_direct_consumer", ""),
        "trace_dir": str(trace),
    })

with (root / "fault_path_summary.csv").open("w", encoding="utf-8", newline="") as handle:
    fieldnames = ["bench", "site_id", "bit_index", "trial", "result", "process_exit", "consumer_class", "mutated_value", "first_direct_consumer", "trace_dir"]
    writer = csv.DictWriter(handle, fieldnames=fieldnames)
    writer.writeheader()
    writer.writerows(rows)
PY
