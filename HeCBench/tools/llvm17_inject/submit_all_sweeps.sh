#!/bin/bash
set -euo pipefail

REPO_ROOT="${REPO_ROOT:-$(pwd)}"
PBS_SCRIPT="${REPO_ROOT}/HeCBench/llvm17_inject_bench_sweep.pbs"

if [[ ! -f "${PBS_SCRIPT}" ]]; then
  echo "Missing PBS script: ${PBS_SCRIPT}"
  exit 1
fi

BENCHES=(
  matrix-rotate
  jacobi
  layout
  atomicCost
  dense-embedding
  pathfinder
  bsearch
  entropy
  colorwheel
  randomAccess
)

for bench in "${BENCHES[@]}"; do
  results_dir="${REPO_ROOT}/HeCBench/results/llvm17_inject/${bench}"
  mkdir -p "${results_dir}"
  last_site=0

  if compgen -G "${results_dir}/summary_node*_gpu*.csv" > /dev/null; then
    last_site=$(awk -F',' 'NR>1 && $1 ~ /^[0-9]+$/ {if ($1>max) max=$1} END{print max+0}' "${results_dir}"/summary_node*_gpu*.csv)
  elif [[ -f "${results_dir}/summary.csv" ]]; then
    last_site=$(awk -F',' 'NR>1 && $1 ~ /^[0-9]+$/ {if ($1>max) max=$1} END{print max+0}' "${results_dir}/summary.csv")
  fi

  start_site=$((last_site + 1))
  if (( start_site < 1 )); then
    start_site=1
  fi

  compare_mode="exact"
  case "${bench}" in
    matrix-rotate|jacobi)
      compare_mode="float"
      ;;
  esac

  echo "[submit] bench=${bench} START_SITE=${start_site} COMPARE_MODE=${compare_mode}"
  qsub -v "BENCH=${bench},START_SITE=${start_site},SKIP_EXISTING=1,COMPARE_MODE=${compare_mode}" "${PBS_SCRIPT}"
done
