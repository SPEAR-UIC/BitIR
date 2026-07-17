#!/bin/bash
#SBATCH -J frontier_amd_rerun
#SBATCH -A csc707
#SBATCH -p batch
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --gpus-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=32G
#SBATCH --time=02:00:00
#SBATCH --output=divergence_cases/slurm_frontier_amd_rerun_%j.out
#SBATCH --error=divergence_cases/slurm_frontier_amd_rerun_%j.err

set -euo pipefail

SCRIPT_PATH="$(realpath "$0")"
REPO_ROOT="${REPO_ROOT:-$HOME/GPU_FI}"
cd "$REPO_ROOT"

if ! command -v module >/dev/null 2>&1 && [[ -f /etc/profile.d/modules.sh ]]; then
  source /etc/profile.d/modules.sh
fi

if command -v module >/dev/null 2>&1; then
  module purge || true
  module load rocm/6.4.2 2>/dev/null || true
  module load rocm-llvm-toolchain 2>/dev/null || true
fi

export SLURM_JOB_SCRIPT="$SCRIPT_PATH"
exec bash divergence_cases/rerun_scripts/frontier_amd_rerun_driver.sh
