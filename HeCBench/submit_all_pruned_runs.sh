#!/usr/bin/env bash
set -euo pipefail

# Submit pruned NVIDIA runs aligned to SYCL worklists.
# Assumes PBS scripts are already configured to route via prod.

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
RESULTS_ROOT="${REPO_ROOT}/HeCBench/results/llvm17_inject"
POLICY_SH="${REPO_ROOT}/HeCBench/tools/llvm17_inject/bench_policy.sh"

if [[ ! -f "${POLICY_SH}" ]]; then
  echo "[fatal] missing benchmark policy: ${POLICY_SH}"
  exit 1
fi
source "${POLICY_SH}"

benches=("${ACTIVE_BENCHES[@]}")

script_name_for() {
  local bench="$1"
  case "$bench" in
    dense-embedding) echo "dense_embedding" ;;
    matrix-rotate) echo "matrix_rotate" ;;
    randomAccess) echo "randomAccess" ;;
    *) echo "$bench" ;;
  esac
}

submit_float_int() {
  local bench="$1"
  local script="${REPO_ROOT}/HeCBench/fi_inject_$(script_name_for "${bench}")_sweep.pbs"
  if [[ ! -f "${script}" ]]; then
    echo "[skip] missing script ${script}"
    return
  fi
  qsub -v "BENCH=${bench},MISSING_ONLY=1,SKIP_EXISTING=1" "${script}"
}

submit_operand_or_pointer() {
  local bench="$1"
  local kind="$2"
  local worklist="${RESULTS_ROOT}/${bench}/worklist_${kind}.csv"
  local script="${REPO_ROOT}/HeCBench/fi_operand_$(script_name_for "${bench}")_sweep.pbs"
  if [[ ! -f "${script}" ]]; then
    echo "[skip] missing script ${script}"
    return
  fi
  if [[ ! -f "${worklist}" ]]; then
    echo "[skip] missing worklist ${worklist}"
    return
  fi
  qsub -v "BENCH=${bench},WORKLIST=${worklist},MISSING_ONLY=1,SKIP_EXISTING=1" "${script}"
}

echo "[submit] float/int (pruned)"
for bench in "${benches[@]}"; do
  if ! require_bench_active "${bench}"; then
    echo "[skip] blocked by benchmark policy: ${bench}"
    continue
  fi
  submit_float_int "${bench}"
done

echo "[submit] operand (pruned)"
for bench in "${benches[@]}"; do
  if ! require_bench_active "${bench}"; then
    echo "[skip] blocked by benchmark policy: ${bench}"
    continue
  fi
  submit_operand_or_pointer "${bench}" "operand"
done

echo "[submit] pointer (pruned)"
for bench in "${benches[@]}"; do
  if ! require_bench_active "${bench}"; then
    echo "[skip] blocked by benchmark policy: ${bench}"
    continue
  fi
  submit_operand_or_pointer "${bench}" "pointer"
done
