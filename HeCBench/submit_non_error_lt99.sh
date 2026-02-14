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
  "jacobi|qsub HeCBench/fi_inject_jacobi_sweep.pbs"
  "randomAccess|qsub HeCBench/fi_inject_randomAccess_sweep.pbs"
  "colorwheel|qsub HeCBench/fi_operand_colorwheel_sweep.pbs"
  "jacobi|qsub HeCBench/fi_operand_jacobi_sweep.pbs"
  "matrix-rotate|qsub HeCBench/fi_operand_matrix_rotate_sweep.pbs"
  "pathfinder|qsub HeCBench/fi_operand_pathfinder_sweep.pbs"
)

log="HeCBench/submit_non_error_lt99.log"
echo "[$(date)] non-error <99 submitter start" >> "$log"

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
  eval "$cmd" >> "$log" 2>&1
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

echo "[$(date)] non-error <99 submitter done" >> "$log"
