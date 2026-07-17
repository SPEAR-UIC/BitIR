#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="${REPO_ROOT:-/home/mdunlavy/GPU_FI}"
STAMP="$(date -u +%Y%m%d_%H%M%S)"
RUN_LABEL="${RUN_LABEL:-results}"
RESULTS_DIR="${REPO_ROOT}/divergence_analysis_outputs/nvidia_rerun_${RUN_LABEL}_${STAMP}"
PBS_SCRIPT="${REPO_ROOT}/HeCBench/nvidia_divergence_rerun.pbs"
DRY_RUN="${DRY_RUN:-0}"
MAX_BENCHES="${MAX_BENCHES:-0}"
MAX_ROWS_PER_BENCH="${MAX_ROWS_PER_BENCH:-0}"
BENCH_FILTER="${BENCH_FILTER:-}"
GOLDEN_ROOT="${GOLDEN_ROOT:-/home/mdunlavy/GPU_FI_outcome_divergence/Polaris_Golden_Outputs}"

mkdir -p "${RESULTS_DIR}"
cp -f "${PBS_SCRIPT}" "${RESULTS_DIR}/nvidia_divergence_rerun.pbs"
job_id="$(qsub \
  -v "REPO_ROOT=${REPO_ROOT},RESULTS_DIR=${RESULTS_DIR},DRY_RUN=${DRY_RUN},MAX_BENCHES=${MAX_BENCHES},MAX_ROWS_PER_BENCH=${MAX_ROWS_PER_BENCH},BENCH_FILTER=${BENCH_FILTER},GOLDEN_ROOT=${GOLDEN_ROOT}" \
  -o "${RESULTS_DIR}/pbs_stdout.log" \
  -e "${RESULTS_DIR}/pbs_stderr.log" \
  "${PBS_SCRIPT}")"
printf '%s\n' "${job_id}" > "${RESULTS_DIR}/pbs_job_id.txt"
printf 'job_id=%s\nresults_dir=%s\n' "${job_id}" "${RESULTS_DIR}"
