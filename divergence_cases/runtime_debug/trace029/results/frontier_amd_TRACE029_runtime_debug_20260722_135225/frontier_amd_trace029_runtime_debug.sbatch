#!/bin/bash
#SBATCH -J frontier_amd_trace029_rtdebug
#SBATCH -A csc707
#SBATCH -p batch
#SBATCH -q debug
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --gpus-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=32G
#SBATCH --time=00:10:00
#SBATCH --output=divergence_cases/slurm_frontier_amd_trace029_rtdebug_%j.out
#SBATCH --error=divergence_cases/slurm_frontier_amd_trace029_rtdebug_%j.err

set -euo pipefail

SCRIPT_PATH="$(realpath "$0")"
REPO_ROOT="${REPO_ROOT:-$HOME/GPU_FI}"
TRACE_ID="${TRACE_ID:-TRACE029}"
BENCH="${BENCH:-pathfinder}"
BIT_INDEX="${BIT_INDEX:-31}"
EXPECTED_PREVIOUS_RESULT="${EXPECTED_PREVIOUS_RESULT:-MASKED}"
ORIGINAL_SITE_ID="${ORIGINAL_SITE_ID:-123}"
CORRECTED_SITE_ID="${CORRECTED_SITE_ID:-57}"
RESULTS_ROOT="${RESULTS_ROOT:-$REPO_ROOT/divergence_cases/runtime_debug/trace029/results/frontier_amd_${TRACE_ID}_runtime_debug_$(date -u +%Y%m%d_%H%M%S)}"
BENCH_RESULTS_DIR="${RESULTS_ROOT}/${BENCH}"
TMP_ROOT="${RESULTS_ROOT}/tmp"
BASELINE_TMP_DIR="${TMP_ROOT}/${BENCH}_baseline"
INJECT_TMP_DIR="${TMP_ROOT}/${BENCH}_injected"
SCRATCH_SOURCE_DIR="${SCRATCH_SOURCE_DIR:-divergence_cases/runtime_debug/trace029/pathfinder-hip_runtime_debug}"
SCRATCH_MAIN="${REPO_ROOT}/${SCRATCH_SOURCE_DIR}/main.cu"
SCHEMA_CSV="${REPO_ROOT}/divergence_cases/runtime_debug/trace029/runtime_record_schema.csv"
SELECT_SITE_SCRIPT="${REPO_ROOT}/divergence_cases/runtime_debug/trace029/select_runtime_trace029_site.py"
COMPARE_SCRIPT="${REPO_ROOT}/divergence_cases/runtime_debug/trace029/write_exact_compare_report.py"
RUNNER="${REPO_ROOT}/HeCBench/tools/llvm17_inject/run_benchmark_injection.sh"
PLUGIN_BUILD="${REPO_ROOT}/HeCBench/tools/llvm17_inject/build.sh"
PLUGIN="${REPO_ROOT}/HeCBench/tools/llvm17_inject/libfi_inject.so"
PROBE_DIR="${RESULTS_ROOT}/metadata_probe"
GENERATED_METADATA_CSV="${PROBE_DIR}/sites_metadata.csv"
GENERATED_SITES_CSV="${PROBE_DIR}/sites.csv"
SELECTED_METADATA_CSV="${RESULTS_ROOT}/selected_site_metadata.csv"
SELECTED_SITES_CSV="${RESULTS_ROOT}/selected_sites.csv"
VALIDATION_SITE_LIST="${RESULTS_ROOT}/selected_site_validation.csv"
SELECTED_SUMMARY_JSON="${RESULTS_ROOT}/selected_site_summary.json"
BASELINE_RUNTIME_CSV="${BENCH_RESULTS_DIR}/baseline_runtime.csv"
INJECTED_RUNTIME_CSV="${BENCH_RESULTS_DIR}/injected_runtime.csv"
BASELINE_SUMMARY_CSV="${BENCH_RESULTS_DIR}/baseline_summary.csv"
INJECTED_SUMMARY_CSV="${BENCH_RESULTS_DIR}/summary.csv"
BASELINE_DUMP="${BENCH_RESULTS_DIR}/${BENCH}_baseline.bin"
INJECTED_DUMP="${BENCH_RESULTS_DIR}/${BENCH}_site_selected_bit${BIT_INDEX}.bin"
BASELINE_COMPARE_JSON="${RESULTS_ROOT}/baseline_dump_compare.json"
INJECTED_COMPARE_JSON="${RESULTS_ROOT}/injected_dump_compare.json"
SUMMARY_JSON="${RESULTS_ROOT}/runtime_debug_summary.json"
SUMMARY_TXT="${RESULTS_ROOT}/runtime_debug_summary.txt"
SBATCH_STDOUT_SRC="${REPO_ROOT}/divergence_cases/slurm_frontier_amd_trace029_rtdebug_${SLURM_JOB_ID:-manual}.out"
SBATCH_STDERR_SRC="${REPO_ROOT}/divergence_cases/slurm_frontier_amd_trace029_rtdebug_${SLURM_JOB_ID:-manual}.err"
CORRECTED_GOLDEN="${REPO_ROOT}/divergence_cases/full_trace_results/frontier_amd_TRACE029_20260722_010653/pathfinder/pathfinder_golden.bin"
LEGACY_GOLDEN="${REPO_ROOT}/Frontier_HIP_Golden_Outputs/pathfinder.bin"
GOLDEN_FILE="${GOLDEN_FILE:-$CORRECTED_GOLDEN}"

PATHFINDER_COLS="${PATHFINDER_COLS:-10000}"
PATHFINDER_ROWS="${PATHFINDER_ROWS:-1000}"
PATHFINDER_PYRAMID="${PATHFINDER_PYRAMID:-1000}"
HIP_HOME="${HIP_HOME:-/opt/rocm-6.4.2}"
HIP_ARCH="${HIP_ARCH:-gfx90a}"

need_cmd() {
  if command -v "$1" >/dev/null 2>&1; then
    command -v "$1"
    return
  fi
  shift
  local candidate
  for candidate in "$@"; do
    if [[ -x "$candidate" ]]; then
      printf '%s\n' "$candidate"
      return
    fi
  done
  echo "missing required command: $1" >&2
  exit 1
}

record_cmd() {
  local out="$1"
  shift
  printf '%q ' "$@" > "$out"
  printf '\n' >> "$out"
}

copy_baseline_dump() {
  local src="${BASELINE_TMP_DIR}/${BENCH}_baseline.bin"
  if [[ -f "$src" ]]; then
    cp -f "$src" "$BASELINE_DUMP"
  fi
}

finalize_bundle() {
  local rc="$1"
  set +e
  copy_baseline_dump
  if [[ -f "$SBATCH_STDOUT_SRC" ]]; then
    cp -f "$SBATCH_STDOUT_SRC" "$RESULTS_ROOT/slurm.stdout" || true
  fi
  if [[ -f "$SBATCH_STDERR_SRC" ]]; then
    cp -f "$SBATCH_STDERR_SRC" "$RESULTS_ROOT/slurm.stderr" || true
  fi
  if command -v rocm-smi >/dev/null 2>&1; then
    rocm-smi > "$RESULTS_ROOT/rocm_smi_after.txt" 2>&1 || true
  fi
  if [[ -n "${SLURM_JOB_ID:-}" ]] && command -v scontrol >/dev/null 2>&1; then
    scontrol show job "$SLURM_JOB_ID" > "$RESULTS_ROOT/slurm_job_details.txt" 2>&1 || true
  fi
  find "$RESULTS_ROOT" -type f | LC_ALL=C sort > "$RESULTS_ROOT/result_files.txt" || true
  echo "$rc" > "$RESULTS_ROOT/job_exit_code.txt"
}
trap 'rc=$?; finalize_bundle "$rc"; exit "$rc"' EXIT

mkdir -p "$RESULTS_ROOT" "$BENCH_RESULTS_DIR" "$TMP_ROOT" "$PROBE_DIR"
cp -f "$SCRIPT_PATH" "$RESULTS_ROOT/frontier_amd_trace029_runtime_debug.sbatch"
cp -f "$SCHEMA_CSV" "$RESULTS_ROOT/runtime_record_schema.csv"

exec > >(tee -a "$RESULTS_ROOT/job.stdout") 2> >(tee -a "$RESULTS_ROOT/job.stderr" >&2)

echo "[trace029-rtdebug] start $(date -u +%Y-%m-%dT%H:%M:%SZ)"
echo "[trace029-rtdebug] git_head=$(git -C "$REPO_ROOT" rev-parse HEAD)"
echo "[trace029-rtdebug] host=$(hostname)"
echo "[trace029-rtdebug] results_root=$RESULTS_ROOT"

if ! command -v module >/dev/null 2>&1 && [[ -f /etc/profile.d/modules.sh ]]; then
  source /etc/profile.d/modules.sh
fi
if command -v module >/dev/null 2>&1; then
  module purge || true
  module load rocm/6.4.2 2>/dev/null || true
  module load rocm-llvm-toolchain 2>/dev/null || true
  module list 2>&1 | tee "$RESULTS_ROOT/module_list.txt"
fi
env | sort > "$RESULTS_ROOT/submit_env.txt"
if command -v rocm-smi >/dev/null 2>&1; then
  rocm-smi > "$RESULTS_ROOT/rocm_smi_before.txt" 2>&1 || true
fi

CLANG="$(need_cmd clang++ "${HIP_HOME}/lib/llvm/bin/clang++" "${HIP_HOME}/llvm/bin/clang++")"
LLVM_AS="$(need_cmd llvm-as "${HIP_HOME}/lib/llvm/bin/llvm-as" "${HIP_HOME}/llvm/bin/llvm-as")"
OPT_BIN="$(need_cmd opt "${HIP_HOME}/lib/llvm/bin/opt" "${HIP_HOME}/llvm/bin/opt")"
PYTHON3="$(need_cmd python3 /usr/bin/python3)"

echo "[trace029-rtdebug] rebuilding fi_inject plugin"
bash "$PLUGIN_BUILD" 2>&1 | tee "$RESULTS_ROOT/plugin_build.log"

if [[ ! -f "$GOLDEN_FILE" ]]; then
  if [[ -f "$LEGACY_GOLDEN" ]]; then
    GOLDEN_FILE="$LEGACY_GOLDEN"
  else
    echo "missing corrected and legacy golden: $CORRECTED_GOLDEN / $LEGACY_GOLDEN" >&2
    exit 1
  fi
fi
cp -f "$GOLDEN_FILE" "$BENCH_RESULTS_DIR/pathfinder_golden.bin"

record_cmd "$PROBE_DIR/build_amd_device_ir.cmd" \
  "$CLANG" -x hip --offload-device-only --offload-arch="$HIP_ARCH" --hip-path="$HIP_HOME" \
  -Xclang -emit-llvm -S -O0 -g -D__STRICT_ANSI__ -D_GLIBCXX_USE_FLOAT128=0 \
  "$SCRATCH_MAIN" -o "$PROBE_DIR/device.ll"
"$CLANG" -x hip --offload-device-only --offload-arch="$HIP_ARCH" --hip-path="$HIP_HOME" \
  -Xclang -emit-llvm -S -O0 -g -D__STRICT_ANSI__ -D_GLIBCXX_USE_FLOAT128=0 \
  "$SCRATCH_MAIN" -o "$PROBE_DIR/device.ll"

record_cmd "$PROBE_DIR/assemble_amd_device_ir.cmd" "$LLVM_AS" "$PROBE_DIR/device.ll" -o "$PROBE_DIR/device.bc"
"$LLVM_AS" "$PROBE_DIR/device.ll" -o "$PROBE_DIR/device.bc"

record_cmd "$PROBE_DIR/dump_amd_injection_site_metadata.cmd" \
  "$OPT_BIN" -load-pass-plugin "$PLUGIN" -passes=fi-inject -fi-site=-1 -fi-target=result \
  -fi-int-float-only=1 -fi-include-constants=0 -fi-dump-sites-rich="$GENERATED_METADATA_CSV" \
  -disable-output "$PROBE_DIR/device.bc"
"$OPT_BIN" -load-pass-plugin "$PLUGIN" -passes=fi-inject -fi-site=-1 -fi-target=result \
  -fi-int-float-only=1 -fi-include-constants=0 -fi-dump-sites-rich="$GENERATED_METADATA_CSV" \
  -disable-output "$PROBE_DIR/device.bc"

"$PYTHON3" - "$GENERATED_METADATA_CSV" "$GENERATED_SITES_CSV" <<'PY'
import csv
import sys

metadata_csv, sites_csv = sys.argv[1:3]
rows = list(csv.DictReader(open(metadata_csv, newline="", encoding="utf-8")))
fieldnames = ["site_id", "opcode", "type_kind", "bitwidth", "operand_index", "function"]
with open(sites_csv, "w", newline="", encoding="utf-8") as f:
    writer = csv.DictWriter(f, fieldnames=fieldnames)
    writer.writeheader()
    for row in rows:
        writer.writerow({key: row[key] for key in fieldnames})
PY

"$PYTHON3" "$SELECT_SITE_SCRIPT" \
  --metadata-csv "$GENERATED_METADATA_CSV" \
  --sites-csv "$GENERATED_SITES_CSV" \
  --bit-index "$BIT_INDEX" \
  --selected-metadata-out "$SELECTED_METADATA_CSV" \
  --selected-sites-out "$SELECTED_SITES_CSV" \
  --validation-site-list-out "$VALIDATION_SITE_LIST" \
  --summary-json-out "$SELECTED_SUMMARY_JSON" | tee "$RESULTS_ROOT/selected_site_summary.out"

SITE_ID="$(awk -F, 'NR==2 {gsub(/\r/, "", $1); print $1}' "$SELECTED_METADATA_CSV")"
if [[ -z "$SITE_ID" ]]; then
  echo "failed to resolve regenerated TRACE029 site id" >&2
  exit 1
fi
read -r SELECTED_OPCODE SELECTED_TYPE_KIND SELECTED_BITWIDTH SELECTED_FUNCTION SELECTED_SOURCE_LINE SELECTED_SOURCE_COLUMN SELECTED_SIGNATURE_ORDINAL < <(
  awk -F, 'NR==2 {
    gsub(/\r/, "", $3); gsub(/\r/, "", $4); gsub(/\r/, "", $5);
    gsub(/\r/, "", $7); gsub(/\r/, "", $9); gsub(/\r/, "", $10); gsub(/\r/, "", $11);
    print $3, $4, $5, $7, $9, $10, $11
  }' "$SELECTED_METADATA_CSV"
)
echo "[trace029-rtdebug] selected regenerated site_id=$SITE_ID (corrected historical site was $CORRECTED_SITE_ID; site 123 superseded)"

export REPO_ROOT
export BENCH="$BENCH"
export SITE_ID="$SITE_ID"
export BIT_INDEX="$BIT_INDEX"
export BITIR_MACHINE_BACKEND=amd
export BITIR_MACHINE_GOLDEN_ROOT="$(dirname "$GOLDEN_FILE")"
export BITIR_GOLDEN_FILE="$(basename "$GOLDEN_FILE")"
export BITIR_SOURCE_DIR="$SCRATCH_SOURCE_DIR"
export BITIR_COMPARE_MODE=exact
export BITIR_RUN_ARGS="$PATHFINDER_COLS $PATHFINDER_ROWS $PATHFINDER_PYRAMID"
export BITIR_MACHINE_RUNTIME_HOME="$HIP_HOME"
export BITIR_MACHINE_HIP_ARCH="$HIP_ARCH"
export BITIR_AMD_EXECUTION_MODE=injected_ir
export BITIR_TRACE_METADATA_DIR="$PROBE_DIR"
export BITIR_SITE_LIST="$VALIDATION_SITE_LIST"
export SUMMARY_INCLUDE_PATHS=1
export CLEAN_RUN_ARTIFACTS=0
export TRACE_LEVEL=full
export TRACE_SOURCE_WINDOW=12
export INJECT_TARGET=result
export INT_FLOAT_ONLY=1
export INCLUDE_CONSTANTS=0
export PHASE=float
export KEEP_DUMPS=1
export EXPECT_INJECTION_OPCODE="$SELECTED_OPCODE"
export EXPECT_INJECTION_TYPE_KIND="$SELECTED_TYPE_KIND"
export EXPECT_INJECTION_BITWIDTH="$SELECTED_BITWIDTH"
export EXPECT_INJECTION_SOURCE_LINE="$SELECTED_SOURCE_LINE"
export EXPECT_INJECTION_SOURCE_COLUMN="$SELECTED_SOURCE_COLUMN"
export EXPECT_INJECTION_SIGNATURE_ORDINAL="$SELECTED_SIGNATURE_ORDINAL"
export EXPECT_INJECTION_FUNCTION="$SELECTED_FUNCTION"

echo "[trace029-rtdebug] baseline run bench=$BENCH site=$SITE_ID bit=$BIT_INDEX"
export HECBENCH_TRACE029_RUNTIME_CSV="$BASELINE_RUNTIME_CSV"
export HECBENCH_TRACE029_RUNTIME_LABEL=baseline
BASELINE=1 RESULTS_DIR="$BENCH_RESULTS_DIR" CSV="$BASELINE_SUMMARY_CSV" OUT_DIR="$BASELINE_TMP_DIR" \
  bash "$RUNNER"
copy_baseline_dump

echo "[trace029-rtdebug] injection run bench=$BENCH site=$SITE_ID bit=$BIT_INDEX expected_previous=$EXPECTED_PREVIOUS_RESULT"
export HECBENCH_TRACE029_RUNTIME_CSV="$INJECTED_RUNTIME_CSV"
export HECBENCH_TRACE029_RUNTIME_LABEL=injected
RESULTS_DIR="$BENCH_RESULTS_DIR" CSV="$INJECTED_SUMMARY_CSV" OUT_DIR="$INJECT_TMP_DIR" \
  bash "$RUNNER"

INJECTED_DUMP_ACTUAL="$BENCH_RESULTS_DIR/${BENCH}_site${SITE_ID}_bit${BIT_INDEX}.bin"
cp -f "$INJECTED_DUMP_ACTUAL" "$INJECTED_DUMP"

"$PYTHON3" "$COMPARE_SCRIPT" --golden "$GOLDEN_FILE" --candidate "$BASELINE_DUMP" --out-json "$BASELINE_COMPARE_JSON" > "$RESULTS_ROOT/baseline_dump_compare.out"
"$PYTHON3" "$COMPARE_SCRIPT" --golden "$GOLDEN_FILE" --candidate "$INJECTED_DUMP_ACTUAL" --out-json "$INJECTED_COMPARE_JSON" > "$RESULTS_ROOT/injected_dump_compare.out"

"$PYTHON3" - "$SELECTED_SUMMARY_JSON" "$BASELINE_SUMMARY_CSV" "$INJECTED_SUMMARY_CSV" "$BASELINE_RUNTIME_CSV" "$INJECTED_RUNTIME_CSV" "$BASELINE_COMPARE_JSON" "$INJECTED_COMPARE_JSON" "$SUMMARY_JSON" "$SUMMARY_TXT" "$EXPECTED_PREVIOUS_RESULT" "$ORIGINAL_SITE_ID" "$CORRECTED_SITE_ID" <<'PY'
import csv
import json
import sys
from pathlib import Path

(
    selected_summary_json,
    baseline_summary_csv,
    injected_summary_csv,
    baseline_runtime_csv,
    injected_runtime_csv,
    baseline_compare_json,
    injected_compare_json,
    out_json,
    out_txt,
    expected_previous_result,
    original_site_id,
    corrected_site_id,
) = sys.argv[1:13]


def one_row(path):
    rows = list(csv.DictReader(open(path, newline="", encoding="utf-8")))
    if len(rows) != 1:
        raise SystemExit(f"expected exactly one row in {path}, found {len(rows)}")
    return rows[0]


def aggregate(path):
    rows = list(csv.DictReader(open(path, newline="", encoding="utf-8")))
    for row in rows:
        if row["record_kind"] == "aggregate":
            return row
    raise SystemExit(f"missing aggregate row in {path}")


selected = json.loads(Path(selected_summary_json).read_text(encoding="utf-8"))
baseline = one_row(baseline_summary_csv)
injected = one_row(injected_summary_csv)
baseline_runtime = aggregate(baseline_runtime_csv)
injected_runtime = aggregate(injected_runtime_csv)
baseline_cmp = json.loads(Path(baseline_compare_json).read_text(encoding="utf-8"))
injected_cmp = json.loads(Path(injected_compare_json).read_text(encoding="utf-8"))

baseline_computed = int(baseline_runtime["total_computed_threads"] or 0)
baseline_writes = int(baseline_runtime["total_final_writes"] or 0)
injected_computed = int(injected_runtime["total_computed_threads"] or 0)
injected_writes = int(injected_runtime["total_final_writes"] or 0)

if injected_writes == 0 and baseline_writes > 0:
    masking_mode = "overflow_suppressed_final_writes"
elif injected_writes < baseline_writes:
    masking_mode = "overflow_reduced_final_writes"
elif injected_computed < baseline_computed:
    masking_mode = "overflow_reduced_computation"
elif injected["result"] == "MASKED" and injected_cmp.get("sha256_match"):
    masking_mode = "golden_match_without_write_suppression_evidence"
else:
    masking_mode = "non_masked_or_undetermined"

summary = {
    "selected_regenerated_site_id": selected["selected_site_id"],
    "original_superseded_site_id": int(original_site_id),
    "corrected_historical_site_id": int(corrected_site_id),
    "baseline": {
        "result": baseline["result"],
        "exit_code": baseline["exit_code"],
        "dump_sha256_match_golden": baseline_cmp.get("sha256_match"),
        "dump_mismatch_count": baseline_cmp.get("mismatch_count"),
        "total_computed_threads": baseline_computed,
        "total_final_writes": baseline_writes,
    },
    "injected": {
        "result": injected["result"],
        "exit_code": injected["exit_code"],
        "dump_sha256_match_golden": injected_cmp.get("sha256_match"),
        "dump_mismatch_count": injected_cmp.get("mismatch_count"),
        "total_computed_threads": injected_computed,
        "total_final_writes": injected_writes,
    },
    "classification_policy": "runner outcome and exact golden dump comparison only; CPU reference does not override MASKED/SDC/DUE",
    "diagnostic_masking_mode": masking_mode,
    "expected_previous_amd_result": expected_previous_result,
    "notes": [
        "Baseline with zero final writes is diagnostic evidence, not an automatic rejection.",
        "The runtime-debug adapter keeps the original Pathfinder configuration and does not initialize d_gpuResult.",
    ],
}

Path(out_json).write_text(json.dumps(summary, indent=2, sort_keys=True) + "\n", encoding="utf-8")
with open(out_txt, "w", encoding="utf-8") as f:
    f.write(f"selected_regenerated_site_id={summary['selected_regenerated_site_id']}\n")
    f.write(f"baseline_result={summary['baseline']['result']}\n")
    f.write(f"injected_result={summary['injected']['result']}\n")
    f.write(f"baseline_total_computed_threads={baseline_computed}\n")
    f.write(f"baseline_total_final_writes={baseline_writes}\n")
    f.write(f"injected_total_computed_threads={injected_computed}\n")
    f.write(f"injected_total_final_writes={injected_writes}\n")
    f.write(f"diagnostic_masking_mode={masking_mode}\n")
print(json.dumps(summary, indent=2, sort_keys=True))
PY

echo "[trace029-rtdebug] finish $(date -u +%Y-%m-%dT%H:%M:%SZ)"
