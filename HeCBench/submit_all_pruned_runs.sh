#!/usr/bin/env bash
set -euo pipefail

# Submit pruned NVIDIA runs aligned to SYCL worklists.
# Routing rule: tiny tails go to debug; everything else stays on prod/default.

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
RESULTS_ROOT="${REPO_ROOT}/HeCBench/results/llvm17_inject"
POLICY_SH="${REPO_ROOT}/HeCBench/tools/llvm17_inject/bench_policy.sh"

if [[ ! -f "${POLICY_SH}" ]]; then
  echo "[fatal] missing benchmark policy: ${POLICY_SH}"
  exit 1
fi
source "${POLICY_SH}"

benches=("${ACTIVE_BENCHES[@]}")
TINY_DEBUG_MAX="${TINY_DEBUG_MAX:-10}"
DRY_RUN="${DRY_RUN:-0}"

submit_qsub() {
  local -a args=("$@")
  if [[ "${DRY_RUN}" == "1" ]]; then
    printf '[dry-run] qsub'
    for a in "${args[@]}"; do
      printf ' %q' "${a}"
    done
    printf '\n'
    return 0
  fi
  qsub "${args[@]}"
}

script_name_for() {
  local bench="$1"
  case "$bench" in
    dense-embedding) echo "dense_embedding" ;;
    matrix-rotate) echo "matrix_rotate" ;;
    randomAccess) echo "randomAccess" ;;
    *) echo "$bench" ;;
  esac
}

phase_for_kind() {
  local kind="$1"
  case "${kind}" in
    float) echo "float" ;;
    operand) echo "operand" ;;
    pointer) echo "pointer" ;;
    *) echo "${kind}" ;;
  esac
}

script_path_for_kind() {
  local bench="$1"
  local kind="$2"
  local base
  base="$(script_name_for "${bench}")"
  case "${kind}" in
    float) echo "${REPO_ROOT}/HeCBench/fi_inject_${base}_sweep.pbs" ;;
    operand) echo "${REPO_ROOT}/HeCBench/fi_operand_${base}_sweep.pbs" ;;
    pointer) echo "${REPO_ROOT}/HeCBench/fi_pointer_${base}_sweep.pbs" ;;
    *) return 1 ;;
  esac
}

missing_count_for() {
  local bench="$1"
  local kind="$2"
  local phase missing_csv missing_compare fallback
  phase="$(phase_for_kind "${kind}")"
  missing_csv="${RESULTS_ROOT}/${bench}/${phase}/worklist_missing.csv"
  missing_compare="${RESULTS_ROOT}/${bench}/${phase}/worklist_missing_compare.csv"
  fallback="${RESULTS_ROOT}/${bench}/worklist_${kind}.csv"

  if [[ -f "${missing_csv}" ]]; then
    awk 'NR>1 {c++} END{print c+0}' "${missing_csv}"
    return 0
  fi
  if [[ -f "${missing_compare}" ]]; then
    awk 'NR>1 {c++} END{print c+0}' "${missing_compare}"
    return 0
  fi
  if [[ -f "${fallback}" ]]; then
    awk 'NR>1 {c++} END{print c+0}' "${fallback}"
    return 0
  fi
  echo "-1"
}

submit_kind() {
  local bench="$1"
  local kind="$2"
  local script phase missing_count route
  script="$(script_path_for_kind "${bench}" "${kind}")"
  phase="$(phase_for_kind "${kind}")"
  if [[ ! -f "${script}" ]]; then
    echo "[skip] missing script ${script}"
    return
  fi
  missing_count="$(missing_count_for "${bench}" "${kind}")"
  if [[ "${missing_count}" == "0" ]]; then
    echo "[skip] ${bench}/${phase}: missing=0"
    return
  fi
  if [[ "${missing_count}" == "-1" ]]; then
    echo "[warn] ${bench}/${phase}: no missing/worklist file found; submitting with script defaults"
  fi

  route="prod"
  if [[ "${missing_count}" -gt 0 && "${missing_count}" -le "${TINY_DEBUG_MAX}" ]]; then
    route="debug"
  fi

  echo "[submit] ${bench}/${phase}: missing=${missing_count} route=${route}"
  if [[ "${route}" == "debug" ]]; then
    submit_qsub \
      -q debug \
      -l select=1:ncpus=32:ngpus=4:mem=128gb \
      -l walltime=01:00:00 \
      -v "BENCH=${bench},MISSING_ONLY=1,SKIP_EXISTING=1,WORKLIST_QUEUE=1,CPU_PER_GPU=8" \
      "${script}"
  else
    submit_qsub \
      -v "BENCH=${bench},MISSING_ONLY=1,SKIP_EXISTING=1,WORKLIST_QUEUE=1,CPU_PER_GPU=8" \
      "${script}"
  fi
}

echo "[submit] float/int (pruned)"
for bench in "${benches[@]}"; do
  if ! require_bench_active "${bench}"; then
    echo "[skip] blocked by benchmark policy: ${bench}"
    continue
  fi
  submit_kind "${bench}" "float"
done

echo "[submit] operand (pruned)"
for bench in "${benches[@]}"; do
  if ! require_bench_active "${bench}"; then
    echo "[skip] blocked by benchmark policy: ${bench}"
    continue
  fi
  submit_kind "${bench}" "operand"
done

echo "[submit] pointer (pruned)"
for bench in "${benches[@]}"; do
  if ! require_bench_active "${bench}"; then
    echo "[skip] blocked by benchmark policy: ${bench}"
    continue
  fi
  submit_kind "${bench}" "pointer"
done
