#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="${REPO_ROOT:-$(pwd)}"
MANIFEST="${MANIFEST:-${REPO_ROOT}/HeCBench/results/llvm17_inject_stability_sample/random100_manifest.csv}"

if [[ ! -f "${MANIFEST}" ]]; then
  echo "Missing manifest: ${MANIFEST}" >&2
  exit 2
fi

header="$(head -n 1 "${MANIFEST}" | tr -d '\r')"

tail -n +2 "${MANIFEST}" | while IFS=, read -r c1 c2 c3 c4 c5; do
  [[ -z "${c1}" ]] && continue
  c1="${c1//$'\r'/}"
  c2="${c2//$'\r'/}"
  c3="${c3//$'\r'/}"
  c4="${c4//$'\r'/}"
  c5="${c5//$'\r'/}"

  if [[ "${header}" == "bench,phase,worklist,results_dir,num_pairs" ]]; then
    bench="${c1}"
    phase="${c2}"
    worklist="${c3}"
    results_dir="${c4}"
    pairs="${c5}"
    compare_mode="exact"
  else
    bench="${c1}"
    phase="${c2}"
    pairs="${c3}"
    compare_mode="${c4}"
    worklist="${c5}"
    results_dir="$(dirname "${REPO_ROOT}/${worklist}")"
  fi

  echo "[sample] bench=${bench} phase=${phase} pairs=${pairs} compare=${compare_mode} results_dir=${results_dir}"
  BENCH="${bench}" \
  PHASE="${phase}" \
  INJECT_TARGET="$(
    case "${phase}" in
      operand) echo operand ;;
      pointer) echo pointer ;;
      *) echo result ;;
    esac
  )" \
  COMPARE_MODE="${compare_mode}" \
  RESULTS_SUBDIR="llvm17_inject_stability_sample" \
  RESULTS_DIR_OVERRIDE="${results_dir}" \
  WORKLIST="$(
    case "${worklist}" in
      /*) echo "${worklist}" ;;
      *) echo "${REPO_ROOT}/${worklist}" ;;
    esac
  )" \
  WORKLIST_QUEUE=1 \
  MISSING_ONLY=0 \
  SKIP_EXISTING=0 \
  REBUILD_WORKLIST=0 \
  REBUILD_PRUNED_WORKLIST=0 \
  CPU_PER_GPU="${CPU_PER_GPU:-1}" \
  INJECT_TIMEOUT_SEC="${INJECT_TIMEOUT_SEC:-180}" \
  TIMEOUT_STREAK_ABORT="${TIMEOUT_STREAK_ABORT:-0}" \
  RANDOMACCESS_REPEAT="${RANDOMACCESS_REPEAT:-1}" \
  ABS_TOL="${ABS_TOL:-1e-5}" \
  REL_TOL="${REL_TOL:-1e-6}" \
  bash "${REPO_ROOT}/HeCBench/llvm17_inject_bench_sweep.pbs"
done
