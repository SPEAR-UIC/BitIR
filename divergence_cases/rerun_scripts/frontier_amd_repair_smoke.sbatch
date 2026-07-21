#!/bin/bash
#SBATCH -J frontier_amd_repair
#SBATCH -A csc707
#SBATCH -p batch
#SBATCH -q debug
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --gpus-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=32G
#SBATCH --time=00:30:00
#SBATCH --output=divergence_cases/slurm_frontier_amd_repair_%j.out
#SBATCH --error=divergence_cases/slurm_frontier_amd_repair_%j.err

set -euo pipefail

SCRIPT_PATH="$(realpath "$0")"
REPO_ROOT="${REPO_ROOT:-$HOME/GPU_FI}"
RUN_CONFIG="${RUN_CONFIG:-$REPO_ROOT/HeCBench/config/runs/frontier_amd_rerun.yml}"
RESULTS_ROOT="${RESULTS_ROOT:-$REPO_ROOT/divergence_cases/repair_smoke/$(date -u +%Y%m%d_%H%M%S)}"
GOLDEN_ROOT="${GOLDEN_ROOT:-$REPO_ROOT/Frontier_HIP_Golden_Outputs}"
BUILD_ROOT="${BUILD_ROOT:-$REPO_ROOT/HeCBench/build-hip}"

cd "$REPO_ROOT"
mkdir -p "$RESULTS_ROOT" "$RESULTS_ROOT/.bitir_jobs" "$GOLDEN_ROOT"

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

echo "[repair] start $(date -u +%Y-%m-%dT%H:%M:%SZ)"
echo "[repair] repo_root=$REPO_ROOT"
echo "[repair] results_root=$RESULTS_ROOT"
echo "[repair] git_head=$(git rev-parse HEAD)"

echo "[repair] rebuilding fi_inject plugin"
FORCE_REBUILD=1 bash HeCBench/tools/llvm17_inject/build.sh

echo "[repair] building pathfinder and randomAccess HIP binaries"
BENCH_ONLY="pathfinder,randomAccess" REPO_ROOT="$REPO_ROOT" BUILD_DIR="$BUILD_ROOT" bash HeCBench/build.sh

PATHFINDER_BIN="$BUILD_ROOT/bin/hip/pathfinder"
PATHFINDER_GOLDEN="$GOLDEN_ROOT/pathfinder.bin"

echo "[repair] generating $PATHFINDER_GOLDEN"
HECBENCH_GPU_DEBUG=1 HECBENCH_FI_FORCE_DUMP=1 "$PATHFINDER_BIN" 10000 1000 1000 "$PATHFINDER_GOLDEN" \
  > "$RESULTS_ROOT/pathfinder_golden.out" 2> "$RESULTS_ROOT/pathfinder_golden.err"
ls -lh "$PATHFINDER_GOLDEN"

run_baseline() {
  local bench="$1"
  local site_id="$2"
  local bit_index="$3"
  local bench_dir="$RESULTS_ROOT/$bench"
  mkdir -p "$bench_dir"
  echo "[repair] baseline bench=$bench site=$site_id bit=$bit_index"
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
}

run_inject() {
  local bench="$1"
  local site_id="$2"
  local bit_index="$3"
  local bench_dir="$RESULTS_ROOT/$bench"
  mkdir -p "$bench_dir"
  echo "[repair] inject bench=$bench site=$site_id bit=$bit_index"
  RESULTS_DIR="$bench_dir" \
  CSV="$bench_dir/summary.csv" \
  OUT_DIR="$RESULTS_ROOT/tmp/${bench}_site${site_id}_bit${bit_index}" \
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
}

run_baseline pathfinder 395 3
run_inject randomAccess 320 1
run_inject randomAccess 320 2

echo "[repair] done $(date -u +%Y-%m-%dT%H:%M:%SZ)"
for file in \
  "$RESULTS_ROOT/pathfinder/baseline_summary.csv" \
  "$RESULTS_ROOT/randomAccess/summary.csv"; do
  if [[ -f "$file" ]]; then
    echo "[repair] --- $file ---"
    cat "$file"
  fi
done
