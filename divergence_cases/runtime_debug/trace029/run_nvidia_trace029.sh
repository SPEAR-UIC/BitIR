#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="${REPO_ROOT:-/home/mdunlavy/GPU_FI}"
RESULTS_DIR="${RESULTS_DIR:?RESULTS_DIR is required}"
GOLDEN_ROOT="${GOLDEN_ROOT:-/home/mdunlavy/GPU_FI_outcome_divergence/Polaris_Golden_Outputs}"
RUNTIME_ROOT="${REPO_ROOT}/divergence_cases/runtime_debug/trace029"
RUNNER="${REPO_ROOT}/HeCBench/tools/llvm17_inject/run_benchmark_injection.sh"
PLUGIN_BUILD="${REPO_ROOT}/HeCBench/tools/llvm17_inject/build.sh"
WORKLIST_TOOL="${REPO_ROOT}/HeCBench/tools/llvm17_inject/build_bench_worklist.py"
INSTRUMENTER="${RUNTIME_ROOT}/instrument_pathfinder_cuda.py"
RESOLVER="${RUNTIME_ROOT}/resolve_trace029_site.py"
ORIGINAL_SOURCE="${REPO_ROOT}/HeCBench/src/pathfinder-cuda/main.cu"
SCRATCH_REL="${RESULTS_DIR#${REPO_ROOT}/}/scratch/pathfinder-cuda"
SCRATCH_DIR="${REPO_ROOT}/${SCRATCH_REL}"
SCRATCH_SOURCE="${SCRATCH_DIR}/main.cu"
METADATA_DIR="${RESULTS_DIR}/metadata"
PLAN="${RESULTS_DIR}/execution_plan.csv"
BENCH_DIR="${RESULTS_DIR}/pathfinder"
RUNTIME_DIR="${RESULTS_DIR}/runtime"
BASELINE_TMP="${RESULTS_DIR}/tmp/baseline"
INJECTION_TMP="${RESULTS_DIR}/tmp/injection"

cd "${REPO_ROOT}"
mkdir -p "${RESULTS_DIR}" "${SCRATCH_DIR}" "${METADATA_DIR}" "${BENCH_DIR}" \
  "${RUNTIME_DIR}" "${BASELINE_TMP}" "${INJECTION_TMP}"
cp -f "${REPO_ROOT}/HeCBench/nvidia_divergence_rerun.pbs" "${RESULTS_DIR}/nvidia_divergence_rerun.pbs"
cp -f "${BASH_SOURCE[0]}" "${RESULTS_DIR}/run_nvidia_trace029.sh"
cp -f "${ORIGINAL_SOURCE}" "${RESULTS_DIR}/pathfinder_cuda_original.cu"
python3 "${INSTRUMENTER}" "${ORIGINAL_SOURCE}" "${SCRATCH_SOURCE}"
cp -f "${SCRATCH_SOURCE}" "${RESULTS_DIR}/pathfinder_cuda_instrumented.cu"

module use /soft/modulefiles
module load PrgEnv-gnu
module load spack-pe-base
module load cmake
module load gcc-native/12.3
module load cudatoolkit-standalone/11.8.0
module load llvm/release-17.0.0

export CUDA_HOME=/soft/compilers/cudatoolkit/cuda-11.8.0
export PATH="${CUDA_HOME}/bin:${PATH:-}"
export LD_LIBRARY_PATH="${CUDA_HOME}/lib64:${LD_LIBRARY_PATH:-}"
export CUDA_DEVICE_ORDER=PCI_BUS_ID
export CUDA_VISIBLE_DEVICES=0
export CUDA_LAUNCH_BLOCKING=1
export REPO_ROOT
export BENCH=pathfinder
export BITIR_BENCH=pathfinder
export BITIR_SOURCE_DIR="${SCRATCH_REL}"
export BITIR_MACHINE_BACKEND=nvidia
export BITIR_MACHINE_BINARY_SUBDIR=cuda
export BITIR_MACHINE_GOLDEN_ROOT="${GOLDEN_ROOT}"
export BITIR_MACHINE_RESULTS_ROOT="${RESULTS_DIR#${REPO_ROOT}/}/metadata_results"
export BITIR_MACHINE_RUNTIME_HOME="${CUDA_HOME}"
export BITIR_MACHINE_CUDA_ARCH_NAME=sm_80
export BITIR_MACHINE_COMPILER_DRIVER=nvcc
export BITIR_MACHINE_GPU_QUERY_TOOL=nvidia-smi
export BITIR_GOLDEN_FILE=pathfinder.bin
export BITIR_COMPARE_MODE=exact
export BITIR_RUN_ARGS="10000 1000 1000"
export BITIR_EXTRA_INCLUDES=""
export BITIR_FAULT_MODEL_INJECT_TARGET=result
export BITIR_FAULT_MODEL_INT_FLOAT_ONLY=1
export BITIR_FAULT_MODEL_INCLUDE_CONSTANTS=0
export INJECT_TARGET=result
export INT_FLOAT_ONLY=1
export INCLUDE_CONSTANTS=0
export KEEP_DUMPS=1
export SKIP_EXISTING=0
export TRACE_LEVEL=full
export BITIR_RUN_TIMEOUT=600
export ABS_TOL=1e-5
export REL_TOL=0.0
export SUMMARY_INCLUDE_PATHS=0

printf 'trace_case_id=TRACE029\nbackend=nvidia\noriginal_site_id=9\nbit_index=31\nargs=10000 1000 1000\ngit_head=%s\nhost=%s\nstarted_utc=%s\n' \
  "$(git -C "${REPO_ROOT}" rev-parse HEAD)" "$(hostname)" "$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
  > "${RESULTS_DIR}/campaign_metadata.txt"
module -t list > "${RESULTS_DIR}/module_list.txt" 2>&1 || true

echo "[trace029] build injection plugin"
bash "${PLUGIN_BUILD}" > "${RESULTS_DIR}/plugin_build.log" 2>&1

echo "[trace029] regenerate metadata from scratch instrumented source"
python3 "${WORKLIST_TOOL}" \
  --bench pathfinder \
  --backend nvidia \
  --source-dir "${SCRATCH_REL}" \
  --target result \
  --int-float-only 1 \
  --include-constants 0 \
  --out-dir "${RESULTS_DIR#${REPO_ROOT}/}/metadata_build" \
  --sites "${METADATA_DIR}/sites.csv" \
  --sites-rich "${METADATA_DIR}/sites_metadata.csv" \
  --sites-canonical "${METADATA_DIR}/sites_canonical.csv" \
  --metadata-only > "${RESULTS_DIR}/metadata_generation.log" 2>&1

REGENERATED_SITE="$(python3 "${RESOLVER}" \
  --metadata "${METADATA_DIR}/sites_metadata.csv" \
  --source "${SCRATCH_SOURCE}" \
  --bit-index 31 \
  --output "${PLAN}")"
cp -f "${PLAN}" "${RESULTS_DIR}/trace029_validation_site_list.csv"

python3 - "${PLAN}" <<'PY'
import csv
import sys
rows = list(csv.DictReader(open(sys.argv[1], newline="", encoding="utf-8")))
if len(rows) != 1:
    raise SystemExit("execution plan must contain exactly one row, found %d" % len(rows))
row = rows[0]
if row.get("bench") != "pathfinder" or row.get("bit_index") != "31":
    raise SystemExit("unexpected execution plan row: %r" % row)
if row.get("original_nvidia_site_id") != "9" or row.get("original_bit_index") != "31":
    raise SystemExit("TRACE029 provenance mismatch: %r" % row)
print("verified one-row execution plan: regenerated site %s bit 31" % row["site_id"])
PY

export SITE_ID="${REGENERATED_SITE}"
export BIT_INDEX=31
export BITIR_SITE_LIST="${PLAN}"
export BITIR_TRACE_METADATA_DIR="${METADATA_DIR}"
export EXPECT_INJECTION_OPCODE=sub
export EXPECT_INJECTION_TYPE_KIND=int
export EXPECT_INJECTION_BITWIDTH=32
export EXPECT_INJECTION_SOURCE_LINE="$(python3 - "${PLAN}" <<'PY'
import csv, sys
print(next(csv.DictReader(open(sys.argv[1], newline="", encoding="utf-8")))["source_line"])
PY
)"
export EXPECT_INJECTION_SOURCE_COLUMN="$(python3 - "${PLAN}" <<'PY'
import csv, sys
print(next(csv.DictReader(open(sys.argv[1], newline="", encoding="utf-8")))["source_column"])
PY
)"
export EXPECT_INJECTION_SIGNATURE_ORDINAL="$(python3 - "${PLAN}" <<'PY'
import csv, sys
print(next(csv.DictReader(open(sys.argv[1], newline="", encoding="utf-8")))["signature_ordinal"])
PY
)"
export EXPECT_INJECTION_FUNCTION="$(python3 - "${PLAN}" <<'PY'
import csv, sys
print(next(csv.DictReader(open(sys.argv[1], newline="", encoding="utf-8")))["function"])
PY
)"

echo "[trace029] no-flip baseline site=${SITE_ID} bit=31"
TRACE029_RUNTIME_PREFIX="${RUNTIME_DIR}/baseline" TRACE029_RUNTIME_PHASE=baseline \
  BASELINE=1 TRIAL_INDEX=1 RESULTS_DIR="${BENCH_DIR}" OUT_DIR="${BASELINE_TMP}" \
  bash "${RUNNER}" > "${BENCH_DIR}/baseline_driver.log" 2>&1
cp -f "${BASELINE_TMP}/pathfinder_baseline.bin" "${BENCH_DIR}/pathfinder_baseline.bin"
baseline_result="$(awk -F, 'NR > 1 {value=$4} END {print value}' "${BENCH_DIR}/summary.csv")"
if [[ "${baseline_result}" != "BASELINE" ]]; then
  echo "TRACE029 no-flip baseline exact comparison failed: ${baseline_result}" >&2
  exit 1
fi

echo "[trace029] injection regenerated_site=${SITE_ID} bit=31"
TRACE029_RUNTIME_PREFIX="${RUNTIME_DIR}/injected" TRACE029_RUNTIME_PHASE=injected \
  BASELINE=0 TRIAL_INDEX=1 RESULTS_DIR="${BENCH_DIR}" OUT_DIR="${INJECTION_TMP}" \
  bash "${RUNNER}" > "${BENCH_DIR}/site${SITE_ID}_bit31.driver.log" 2>&1

for required in baseline_runtime_summary.csv injected_runtime_summary.csv \
  baseline_runtime_records.csv injected_runtime_records.csv; do
  [[ -f "${RUNTIME_DIR}/${required}" ]] || { echo "missing runtime artifact: ${required}" >&2; exit 1; }
done

for phase in baseline injected; do
  python3 "${RUNTIME_ROOT}/write_frontier_runtime_csv.py" \
    --summary "${RUNTIME_DIR}/${phase}_runtime_summary.csv" \
    --records "${RUNTIME_DIR}/${phase}_runtime_records.csv" \
    --output "${RUNTIME_DIR}/${phase}_runtime.csv"
done

python3 - "${BENCH_DIR}/summary.csv" "${RUNTIME_DIR}" "${RESULTS_DIR}/outcomes.csv" <<'PY'
import csv
import sys
summary_path, runtime_dir, output = sys.argv[1:4]
rows = list(csv.DictReader(open(summary_path, newline="", encoding="utf-8")))
fields = ["phase", "outcome", "process_exit", "total_threads", "valid_threads",
          "computed_threads", "final_writing_threads"]
with open(output, "w", newline="", encoding="utf-8") as handle:
    writer = csv.DictWriter(handle, fieldnames=fields, lineterminator="\n")
    writer.writeheader()
    for phase, result_row in (("baseline", rows[0]), ("injected", rows[-1])):
        runtime = next(csv.DictReader(open(runtime_dir + "/" + phase + "_runtime_summary.csv", newline="", encoding="utf-8")))
        writer.writerow({"phase": phase, "outcome": result_row["result"],
                         "process_exit": result_row["exit_code"],
                         "total_threads": runtime["total_threads"],
                         "valid_threads": runtime["valid_threads"],
                         "computed_threads": runtime["computed_threads"],
                         "final_writing_threads": runtime["final_writing_threads"]})
PY

printf 'regenerated_site_id=%s\nfinished_utc=%s\n' "${SITE_ID}" "$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
  >> "${RESULTS_DIR}/campaign_metadata.txt"
echo "[trace029] complete results=${RESULTS_DIR}"
