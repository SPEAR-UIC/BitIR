#!/usr/bin/env bash
#SBATCH -J amd_dense_fp
#SBATCH -A csc707
#SBATCH -p batch
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --gpus-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --time=01:00:00
#SBATCH --output=OUT_amd_dense_fault_path_%j.out
#SBATCH --error=ERROR_amd_dense_fault_path_%j.err

set -euo pipefail

REPO_ROOT="${REPO_ROOT:-/ccs/home/mdunlavy/GPU_Fault_Injection}"
cd "${REPO_ROOT}"

export MANIFEST="${REPO_ROOT}/HeCBench/config/sites/divergence_trace_fault_path_amd_dense_embedding_focus.csv"
export RESULTS_ROOT="${REPO_ROOT}/HeCBench/results/divergence_trace_fault_path_frontier_v2/amd"
export TRIALS="${TRIALS:-2}"
export TRACE_LEVEL="${TRACE_LEVEL:-full}"
export TRACE_SOURCE_WINDOW="${TRACE_SOURCE_WINDOW:-16}"
export BITIR_RUN_TIMEOUT="${BITIR_RUN_TIMEOUT:-300s}"
export RUN_TIMEOUT_KILL_AFTER="${RUN_TIMEOUT_KILL_AFTER:-20s}"
export HIP_TRACE_API="${HIP_TRACE_API:-1}"
export HSA_ENABLE_DEBUG="${HSA_ENABLE_DEBUG:-1}"
export AMD_LOG_LEVEL="${AMD_LOG_LEVEL:-3}"
export ROCR_DEBUG_ENABLE="${ROCR_DEBUG_ENABLE:-1}"

bash "${REPO_ROOT}/HeCBench/tools/llvm17_inject/run_amd_fault_path_trace.sh"
