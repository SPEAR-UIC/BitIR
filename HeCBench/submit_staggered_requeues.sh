#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

REPO_ROOT="$(pwd)"
POLICY_SH="${REPO_ROOT}/HeCBench/tools/llvm17_inject/bench_policy.sh"
if [[ ! -f "${POLICY_SH}" ]]; then
  echo "[fatal] missing benchmark policy: ${POLICY_SH}"
  exit 1
fi
source "${POLICY_SH}"

submit_items=(
  "pathfinder|qsub -q debug -N pathfinder_fi_debug -l select=1:ncpus=32:ngpus=4:mem=128gb -l walltime=01:00:00 -o OUT_pathfinder_fi_debug.out -e ERROR_pathfinder_fi_debug.err -v BENCH=pathfinder,RESULTS_SUBDIR_BASE=fi_debug_pathfinder,RESULTS_SUBDIR=fi_debug_pathfinder,WORKLIST_PRUNED=${PWD}/HeCBench/results/llvm17_inject/pathfinder-sycl/worklist_sycl_aligned.csv,MISSING_ONLY=1,CPU_PER_GPU=8,MONITOR_GPU=1,MONITOR_INTERVAL=10 HeCBench/llvm17_inject_bench_sweep.pbs"
  "jacobi|qsub HeCBench/fi_inject_jacobi_sweep.pbs"
  "randomAccess|qsub HeCBench/fi_inject_randomAccess_sweep.pbs"
  "colorwheel|qsub HeCBench/fi_operand_colorwheel_sweep.pbs"
  "jacobi|qsub HeCBench/fi_operand_jacobi_sweep.pbs"
  "matrix-rotate|qsub HeCBench/fi_operand_matrix_rotate_sweep.pbs"
  "pathfinder|qsub HeCBench/fi_operand_pathfinder_sweep.pbs"
)

log="HeCBench/submit_staggered_requeues.log"
echo "[$(date)] staggered submitter start" >> "$log"

submit_cmd() {
  local bench="$1"
  local cmd="$2"
  while true; do
    qcount=$(qstat -u "$USER" 2>/dev/null | awk 'NR>5 && $10=="Q" {c++} END{print c+0}')
    if [[ "$qcount" -lt 1 ]]; then
      break
    fi
    sleep 20
  done
  echo "[$(date)] submitting: $cmd" >> "$log"
  if eval "$cmd" >> "$log" 2>&1; then
    echo "[$(date)] submitted ok" >> "$log"
  else
    echo "[$(date)] submit failed; will retry in 30s" >> "$log"
    sleep 30
    eval "$cmd" >> "$log" 2>&1 || true
  fi
  sleep 5
}

for item in "${submit_items[@]}"; do
  bench="${item%%|*}"
  cmd="${item#*|}"
  if ! require_bench_active "${bench}"; then
    echo "[$(date)] skip blocked bench: ${bench}" >> "$log"
    continue
  fi
  submit_cmd "${bench}" "${cmd}"
done

echo "[$(date)] staggered submitter done" >> "$log"
