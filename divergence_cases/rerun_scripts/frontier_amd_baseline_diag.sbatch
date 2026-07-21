#!/bin/bash
#SBATCH -J frontier_amd_base_diag
#SBATCH -A csc707
#SBATCH -p batch
#SBATCH -q debug
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --gpus-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=32G
#SBATCH --time=00:30:00
#SBATCH --output=divergence_cases/slurm_frontier_amd_base_diag_%j.out
#SBATCH --error=divergence_cases/slurm_frontier_amd_base_diag_%j.err

set -euo pipefail

SCRIPT_PATH="$(realpath "$0")"
REPO_ROOT="${REPO_ROOT:-$HOME/GPU_FI}"
RUN_CONFIG="${RUN_CONFIG:-$REPO_ROOT/HeCBench/config/runs/frontier_amd_rerun.yml}"
RESULTS_ROOT="${RESULTS_ROOT:-$REPO_ROOT/divergence_cases/baseline_diagnose/$(date -u +%Y%m%d_%H%M%S)}"

cd "$REPO_ROOT"
mkdir -p "$RESULTS_ROOT" "$RESULTS_ROOT/.bitir_jobs"

if ! command -v module >/dev/null 2>&1 && [[ -f /etc/profile.d/modules.sh ]]; then
  source /etc/profile.d/modules.sh
fi

if command -v module >/dev/null 2>&1; then
  module purge || true
  module load rocm/6.4.2 2>/dev/null || true
  module load rocm-llvm-toolchain 2>/dev/null || true
fi

export BITIR_JOBS_DIR="$RESULTS_ROOT/.bitir_jobs"
export BITIR_WORK_ROOT="$REPO_ROOT"
export JOB_SCRIPT_PATH="$SCRIPT_PATH"

run_baseline() {
  local bench="$1"
  local site_id="$2"
  local bit_index="$3"
  local bench_dir="$RESULTS_ROOT/$bench"
  mkdir -p "$bench_dir"
  echo "[diag] baseline bench=$bench site=$site_id bit=$bit_index"
  set +e
  BASELINE=1 \
  RESULTS_DIR="$bench_dir" \
  CSV="$bench_dir/baseline_summary.csv" \
  OUT_DIR="$RESULTS_ROOT/tmp/${bench}_baseline" \
  BITIR_TRACE_METADATA_DIR="$REPO_ROOT/HeCBench/results/llvm17_inject_amd/$bench" \
  python3 HeCBench/tools/llvm17_inject/bitir_pipeline.py \
    inject-one "$RUN_CONFIG" \
    --repo-root "$REPO_ROOT" \
    --machine amd \
    --bench "$bench" \
    --site-id "$site_id" \
    --bit-index "$bit_index" \
    --fault-model amd_rerun_result \
    --local
  local rc=$?
  set -e
  echo "[diag] bench=$bench rc=$rc"
  if [[ -f "$bench_dir/baseline_summary.csv" ]]; then
    tail -n +1 "$bench_dir/baseline_summary.csv"
  else
    echo "[diag] missing baseline_summary.csv for $bench"
  fi
}

run_baseline pathfinder 395 3
run_baseline entropy 443 17
