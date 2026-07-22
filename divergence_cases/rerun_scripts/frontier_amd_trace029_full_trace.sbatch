#!/bin/bash
#SBATCH -J frontier_amd_trace029
#SBATCH -A csc707
#SBATCH -p batch
#SBATCH -q debug
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --gpus-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=32G
#SBATCH --time=00:10:00
#SBATCH --output=divergence_cases/slurm_frontier_amd_trace029_%j.out
#SBATCH --error=divergence_cases/slurm_frontier_amd_trace029_%j.err

set -euo pipefail

SCRIPT_PATH="$(realpath "$0")"
REPO_ROOT="${REPO_ROOT:-$HOME/GPU_FI}"
RUN_CONFIG="${RUN_CONFIG:-$REPO_ROOT/HeCBench/config/runs/frontier_amd_trace029_full_trace.yml}"
WORKLIST="${WORKLIST:-$REPO_ROOT/divergence_analysis_outputs/full_trace_debug_worklists/batch00_single_case_trace029/amd_batch00_single_case_trace029_full_trace_worklist.csv}"
CASE_CSV="${CASE_CSV:-$REPO_ROOT/divergence_analysis_outputs/full_trace_debug_worklists/batch00_single_case_trace029/batch00_single_case_trace029_trace_case.csv}"
TRACE_CASE_ID="${TRACE_CASE_ID:-TRACE029}"
BENCH="${BENCH:-pathfinder}"
ORIGINAL_SITE_ID="${ORIGINAL_SITE_ID:-123}"
SITE_ID="${SITE_ID:-57}"
BIT_INDEX="${BIT_INDEX:-31}"
EXPECTED_RESULT="${EXPECTED_RESULT:-MASKED}"
RESULTS_ROOT="${RESULTS_ROOT:-$REPO_ROOT/divergence_cases/full_trace_results/frontier_amd_${TRACE_CASE_ID}_$(date -u +%Y%m%d_%H%M%S)}"
TRACE_RESULTS_DIR="${TRACE_RESULTS_DIR:-$RESULTS_ROOT/${BENCH}}"
TRACE_TMP_ROOT="${TRACE_TMP_ROOT:-$RESULTS_ROOT/tmp}"
TRACE_TMP_DIR="${TRACE_TMP_ROOT}/${BENCH}_site${SITE_ID}_bit${BIT_INDEX}"
GOLDEN_ROOT="${GOLDEN_ROOT:-$REPO_ROOT/Frontier_HIP_Golden_Outputs}"
BUILD_ROOT="${BUILD_ROOT:-$REPO_ROOT/HeCBench/build-hip}"
PATHFINDER_GOLDEN="${GOLDEN_ROOT}/pathfinder.bin"
METADATA_CSV="${METADATA_CSV:-$REPO_ROOT/HeCBench/results/llvm17_inject_amd/${BENCH}/sites_metadata.csv}"
SITES_CSV="${SITES_CSV:-$REPO_ROOT/HeCBench/results/llvm17_inject_amd/${BENCH}/sites.csv}"
ALIGNMENT_CSV="${ALIGNMENT_CSV:-$REPO_ROOT/divergence_cases/validation/cross_machine_alignment/${BENCH}/source_text_type_family_consensus_sites.csv}"
PAIRWISE_CSV="${PAIRWISE_CSV:-$REPO_ROOT/divergence_analysis_outputs/expanded_pairwise_anchor_rerun_candidates.csv}"
BASELINE_TMP_DIR="${TRACE_TMP_DIR}_baseline"
BASELINE_DUMP="${BASELINE_TMP_DIR}/${BENCH}_baseline.bin"
INJECTED_DUMP="${TRACE_RESULTS_DIR}/${BENCH}_site${SITE_ID}_bit${BIT_INDEX}.bin"
BASELINE_TRACE_DIR="${TRACE_RESULTS_DIR}/trace_baseline"
INJECTED_TRACE_DIR="${TRACE_RESULTS_DIR}/trace_site${SITE_ID}_bit${BIT_INDEX}"
EVIDENCE_SCRIPT="${EVIDENCE_SCRIPT:-$REPO_ROOT/divergence_cases/rerun_scripts/collect_trace029_evidence.py}"
SBATCH_STDOUT_SRC="${REPO_ROOT}/divergence_cases/slurm_frontier_amd_trace029_${SLURM_JOB_ID:-manual}.out"
SBATCH_STDERR_SRC="${REPO_ROOT}/divergence_cases/slurm_frontier_amd_trace029_${SLURM_JOB_ID:-manual}.err"
VALIDATION_SITE_LIST="${RESULTS_ROOT}/trace029_validation_site_list.csv"
OVERRIDE_METADATA_DIR="${RESULTS_ROOT}/metadata_override/${BENCH}"
OVERRIDE_METADATA_CSV="${OVERRIDE_METADATA_DIR}/sites_metadata.csv"
OVERRIDE_SITES_CSV="${OVERRIDE_METADATA_DIR}/sites.csv"
EXPECTED_OPCODE="${EXPECTED_OPCODE:-sub}"
EXPECTED_TYPE_KIND="${EXPECTED_TYPE_KIND:-int}"
EXPECTED_BITWIDTH="${EXPECTED_BITWIDTH:-32}"
EXPECTED_SOURCE_LINE="${EXPECTED_SOURCE_LINE:-66}"
EXPECTED_SOURCE_COLUMN="${EXPECTED_SOURCE_COLUMN:-37}"
EXPECTED_SIGNATURE_ORDINAL="${EXPECTED_SIGNATURE_ORDINAL:-1}"
EXPECTED_FUNCTION="${EXPECTED_FUNCTION:-_Z10pathfinderPKiS0_PiS1_iiiii}"
EXPECTED_SITE_CLASS="${EXPECTED_SITE_CLASS:-result}"
EXPECTED_OPERAND_INDEX="${EXPECTED_OPERAND_INDEX:--1}"
EXPECTED_SOURCE_FILE="${EXPECTED_SOURCE_FILE:-$REPO_ROOT/HeCBench/src/pathfinder-hip/main.cu}"

cd "$REPO_ROOT"
mkdir -p "$RESULTS_ROOT" "$TRACE_RESULTS_DIR" "$TRACE_TMP_ROOT" "$RESULTS_ROOT/.bitir_jobs" "$GOLDEN_ROOT"

exec > >(tee -a "$RESULTS_ROOT/job.stdout") 2> >(tee -a "$RESULTS_ROOT/job.stderr" >&2)

finalize_trace029_artifacts() {
  local rc="$1"
  set +e
  echo "[trace029] finalize rc=${rc} $(date -u +%Y-%m-%dT%H:%M:%SZ)"
  if command -v rocm-smi >/dev/null 2>&1; then
    rocm-smi > "$RESULTS_ROOT/rocm_smi_after.txt" 2>&1 || true
  fi
  if [[ -n "${SLURM_JOB_ID:-}" ]] && command -v scontrol >/dev/null 2>&1; then
    scontrol show job "$SLURM_JOB_ID" > "$RESULTS_ROOT/slurm_job_details.txt" 2>&1 || true
  fi
  if [[ -f "$SBATCH_STDOUT_SRC" ]]; then
    cp -f "$SBATCH_STDOUT_SRC" "$RESULTS_ROOT/slurm.stdout" || true
  fi
  if [[ -f "$SBATCH_STDERR_SRC" ]]; then
    cp -f "$SBATCH_STDERR_SRC" "$RESULTS_ROOT/slurm.stderr" || true
  fi
  if [[ -f "$BASELINE_DUMP" ]]; then
    cp -f "$BASELINE_DUMP" "$TRACE_RESULTS_DIR/${BENCH}_baseline.bin" || true
  fi
  for d in "$BASELINE_TRACE_DIR" "$INJECTED_TRACE_DIR"; do
    [[ -d "$d" ]] || continue
    if [[ -f "$d/gpu_before.txt" && ! -f "$d/gpu_state.before.txt" ]]; then
      cp -f "$d/gpu_before.txt" "$d/gpu_state.before.txt" || true
    fi
    if [[ -f "$d/gpu_after.txt" && ! -f "$d/gpu_state.after.txt" ]]; then
      cp -f "$d/gpu_after.txt" "$d/gpu_state.after.txt" || true
    fi
  done
  if [[ -f "$EVIDENCE_SCRIPT" ]]; then
    python3 "$EVIDENCE_SCRIPT" \
      --results-root "$RESULTS_ROOT" \
      --trace-results-dir "$TRACE_RESULTS_DIR" \
      --bench "$BENCH" \
      --site-id "$SITE_ID" \
      --bit-index "$BIT_INDEX" \
      --trace-case-id "$TRACE_CASE_ID" \
      --worklist "$WORKLIST" \
      --case-csv "$CASE_CSV" \
      --metadata-csv "$METADATA_CSV" \
      --sites-csv "$SITES_CSV" \
      --alignment-csv "$ALIGNMENT_CSV" \
      --pairwise-csv "$PAIRWISE_CSV" \
      --golden "$PATHFINDER_GOLDEN" \
      --baseline-dump "$TRACE_RESULTS_DIR/${BENCH}_baseline.bin" \
      --injected-dump "$INJECTED_DUMP" \
      --baseline-trace-dir "$BASELINE_TRACE_DIR" \
      --injected-trace-dir "$INJECTED_TRACE_DIR" \
      --numeric-type int32 \
      > "$RESULTS_ROOT/evidence_collect.out" 2> "$RESULTS_ROOT/evidence_collect.err" || true
  fi
  find "$RESULTS_ROOT" -type f | LC_ALL=C sort > "$RESULTS_ROOT/result_files.txt" || true
  echo "$rc" > "$RESULTS_ROOT/job_exit_code.txt"
}
trap 'rc=$?; finalize_trace029_artifacts "$rc"; exit "$rc"' EXIT

echo "[trace029] start $(date -u +%Y-%m-%dT%H:%M:%SZ)"
echo "[trace029] repo_root=$REPO_ROOT"
echo "[trace029] results_root=$RESULTS_ROOT"
echo "[trace029] run_config=$RUN_CONFIG"
echo "[trace029] worklist=$WORKLIST"
echo "[trace029] case_csv=$CASE_CSV"
echo "[trace029] git_head=$(git rev-parse HEAD)"
echo "[trace029] host=$(hostname)"

cp -f "$RUN_CONFIG" "$RESULTS_ROOT/frontier_amd_trace029_full_trace.yml"
cp -f "$WORKLIST" "$RESULTS_ROOT/amd_batch00_single_case_trace029_full_trace_worklist.csv"
cp -f "$CASE_CSV" "$RESULTS_ROOT/batch00_single_case_trace029_trace_case.csv"
cp -f "$SCRIPT_PATH" "$RESULTS_ROOT/frontier_amd_trace029_full_trace.sbatch"
mkdir -p "$OVERRIDE_METADATA_DIR"

python3 - "$BENCH" "$SITE_ID" "$BIT_INDEX" "$VALIDATION_SITE_LIST" "$OVERRIDE_METADATA_CSV" "$OVERRIDE_SITES_CSV" \
  "$EXPECTED_OPCODE" "$EXPECTED_SOURCE_LINE" "$EXPECTED_SOURCE_COLUMN" "$EXPECTED_FUNCTION" "$EXPECTED_SITE_CLASS" \
  "$EXPECTED_TYPE_KIND" "$EXPECTED_BITWIDTH" "$EXPECTED_SIGNATURE_ORDINAL" "$EXPECTED_OPERAND_INDEX" "$EXPECTED_SOURCE_FILE" <<'PY'
import csv
import sys

(
    bench,
    site_id,
    bit_index,
    validation_csv,
    metadata_csv,
    sites_csv,
    opcode,
    source_line,
    source_column,
    function,
    site_class,
    type_kind,
    bitwidth,
    signature_ordinal,
    operand_index,
    source_file,
) = sys.argv[1:17]

validation_fields = [
    "bench",
    "site_id",
    "bit_index",
    "opcode",
    "source_line",
    "source_column",
    "function",
    "site_class",
    "type_kind",
    "bitwidth",
    "signature_ordinal",
]
validation_row = {
    "bench": bench,
    "site_id": site_id,
    "bit_index": bit_index,
    "opcode": opcode,
    "source_line": source_line,
    "source_column": source_column,
    "function": function,
    "site_class": site_class,
    "type_kind": type_kind,
    "bitwidth": bitwidth,
    "signature_ordinal": signature_ordinal,
}
with open(validation_csv, "w", newline="", encoding="utf-8") as f:
    w = csv.DictWriter(f, fieldnames=validation_fields)
    w.writeheader()
    w.writerow(validation_row)

metadata_fields = [
    "site_id",
    "site_class",
    "opcode",
    "type_kind",
    "bitwidth",
    "operand_index",
    "function",
    "source_file",
    "source_line",
    "source_column",
    "signature_ordinal",
    "semantic_key",
]
semantic_key = "|".join(
    [
        function,
        site_class,
        opcode,
        type_kind,
        bitwidth,
        operand_index,
        source_file,
        source_line,
        source_column,
        signature_ordinal,
    ]
)
metadata_row = {
    "site_id": site_id,
    "site_class": site_class,
    "opcode": opcode,
    "type_kind": type_kind,
    "bitwidth": bitwidth,
    "operand_index": operand_index,
    "function": function,
    "source_file": source_file,
    "source_line": source_line,
    "source_column": source_column,
    "signature_ordinal": signature_ordinal,
    "semantic_key": semantic_key,
}
with open(metadata_csv, "w", newline="", encoding="utf-8") as f:
    w = csv.DictWriter(f, fieldnames=metadata_fields)
    w.writeheader()
    w.writerow(metadata_row)

sites_fields = ["site_id", "opcode", "type_kind", "bitwidth", "operand_index", "function"]
sites_row = {
    "site_id": site_id,
    "opcode": opcode,
    "type_kind": type_kind,
    "bitwidth": bitwidth,
    "operand_index": operand_index,
    "function": function,
}
with open(sites_csv, "w", newline="", encoding="utf-8") as f:
    w = csv.DictWriter(f, fieldnames=sites_fields)
    w.writeheader()
    w.writerow(sites_row)
PY

if ! command -v module >/dev/null 2>&1 && [[ -f /etc/profile.d/modules.sh ]]; then
  source /etc/profile.d/modules.sh
fi

if command -v module >/dev/null 2>&1; then
  module purge || true
  module load rocm/6.4.2 2>/dev/null || true
  module load rocm-llvm-toolchain 2>/dev/null || true
fi

if command -v module >/dev/null 2>&1; then
  module list 2>&1 | tee "$RESULTS_ROOT/module_list.txt"
fi
env | sort > "$RESULTS_ROOT/submit_env.txt"
if command -v rocm-smi >/dev/null 2>&1; then
  rocm-smi > "$RESULTS_ROOT/rocm_smi_before.txt" 2>&1 || true
fi

export JOB_SCRIPT_PATH="$SCRIPT_PATH"
export BITIR_JOBS_DIR="$RESULTS_ROOT/.bitir_jobs"
export BITIR_WORK_ROOT="$REPO_ROOT"
export BITIR_MACHINE=amd
export BITIR_MACHINE_BACKEND=amd
export BITIR_MACHINE_BUILD_DIR="HeCBench/build-hip"
export BITIR_MACHINE_BINARY_SUBDIR="hip"
export BITIR_MACHINE_GOLDEN_ROOT="Frontier_HIP_Golden_Outputs"
export BITIR_MACHINE_RUNTIME_HOME="/opt/rocm-6.4.2"
export BITIR_MACHINE_HIP_ARCH="gfx90a"
export BITIR_MACHINE_LLVM_SEARCH_ROOT="/opt/rocm-6.4.2/lib/llvm"
export BITIR_MACHINE_TOOL_SEARCH_ROOTS="/opt/rocm-6.4.2/lib/llvm/bin"
export BITIR_MACHINE_MODULES="rocm/6.4.2 rocm-llvm-toolchain"
export BITIR_TRACE_METADATA_DIR="$OVERRIDE_METADATA_DIR"
export BITIR_SITE_LIST="$VALIDATION_SITE_LIST"
export SUMMARY_INCLUDE_PATHS=1
export CLEAN_RUN_ARTIFACTS=0
export FORCE_REBUILD=1
export EXPECT_INJECTION_OPCODE="$EXPECTED_OPCODE"
export EXPECT_INJECTION_TYPE_KIND="$EXPECTED_TYPE_KIND"
export EXPECT_INJECTION_BITWIDTH="$EXPECTED_BITWIDTH"
export EXPECT_INJECTION_SOURCE_LINE="$EXPECTED_SOURCE_LINE"
export EXPECT_INJECTION_SOURCE_COLUMN="$EXPECTED_SOURCE_COLUMN"
export EXPECT_INJECTION_SIGNATURE_ORDINAL="$EXPECTED_SIGNATURE_ORDINAL"
export EXPECT_INJECTION_FUNCTION="$EXPECTED_FUNCTION"

echo "[trace029] rebuilding fi_inject plugin"
bash HeCBench/tools/llvm17_inject/build.sh 2>&1 | tee "$RESULTS_ROOT/plugin_build.log"

if [[ -f "$PATHFINDER_GOLDEN" ]]; then
  echo "[trace029] existing golden $PATHFINDER_GOLDEN"
  ls -lh "$PATHFINDER_GOLDEN"
else
  echo "[trace029] missing golden, building pathfinder and generating $PATHFINDER_GOLDEN"
  BENCH_ONLY="$BENCH" REPO_ROOT="$REPO_ROOT" BUILD_DIR="$BUILD_ROOT" bash HeCBench/build.sh 2>&1 | tee "$RESULTS_ROOT/golden_build.log"
  HECBENCH_GPU_DEBUG=1 HECBENCH_FI_FORCE_DUMP=1 "$BUILD_ROOT/bin/hip/$BENCH" 10000 1000 1000 "$PATHFINDER_GOLDEN" \
    > "$RESULTS_ROOT/golden_generate.out" 2> "$RESULTS_ROOT/golden_generate.err"
  ls -lh "$PATHFINDER_GOLDEN"
fi

echo "[trace029] baseline run bench=$BENCH site=$SITE_ID bit=$BIT_INDEX expected=$EXPECTED_RESULT"
BASELINE=1 \
RESULTS_DIR="$TRACE_RESULTS_DIR" \
CSV="$TRACE_RESULTS_DIR/baseline_summary.csv" \
OUT_DIR="$BASELINE_TMP_DIR" \
python3 HeCBench/tools/llvm17_inject/bitir_pipeline.py \
  inject-one "$RUN_CONFIG" \
  --repo-root "$REPO_ROOT" \
  --machine amd \
  --bench "$BENCH" \
  --site-id "$SITE_ID" \
  --bit-index "$BIT_INDEX" \
  --fault-model trace029_full \
  --local

echo "[trace029] injection run bench=$BENCH site=$SITE_ID bit=$BIT_INDEX expected=$EXPECTED_RESULT"
RESULTS_DIR="$TRACE_RESULTS_DIR" \
CSV="$TRACE_RESULTS_DIR/summary.csv" \
OUT_DIR="$TRACE_TMP_DIR" \
python3 HeCBench/tools/llvm17_inject/bitir_pipeline.py \
  inject-one "$RUN_CONFIG" \
  --repo-root "$REPO_ROOT" \
  --machine amd \
  --bench "$BENCH" \
  --site-id "$SITE_ID" \
  --bit-index "$BIT_INDEX" \
  --fault-model trace029_full \
  --local

python3 - "$TRACE_RESULTS_DIR/summary.csv" "$EXPECTED_RESULT" <<'PY'
import csv, sys
path, expected = sys.argv[1:3]
rows = list(csv.DictReader(open(path, newline="", encoding="utf-8")))
if len(rows) != 1:
    raise SystemExit(f"expected exactly 1 summary row, found {len(rows)}")
row = rows[0]
actual = row.get("result", "")
print(f"[trace029] summary result={actual} exit_code={row.get('exit_code','')}")
if actual != expected:
    raise SystemExit(f"unexpected rerun result: expected {expected}, got {actual}")
PY

echo "[trace029] finish $(date -u +%Y-%m-%dT%H:%M:%SZ)"
echo "[trace029] trace_results_dir=$TRACE_RESULTS_DIR"
