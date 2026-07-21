#!/bin/bash
#SBATCH -J bitir_amd_inject_one
#SBATCH -A UIC-HPC
#SBATCH -p batch
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --gpus-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=32G
#SBATCH --time=01:00:00
#SBATCH --output=OUT_hip_inject_one_colorwheel.out
#SBATCH --error=ERROR_hip_inject_one_colorwheel.err

set -euo pipefail
echo "[trace] start $(date -u +%Y-%m-%dT%H:%M:%SZ)"
echo "[trace] host $(hostname)"
echo "[trace] pwd $(pwd)"
export BITIR_WORKDIR=/ccs/home/mdunlavy/GPU_FI
export BITIR_MACHINE=amd
export BITIR_TIMEOUT_SEC=200
export ABS_TOL=1e-5
export REL_TOL=0.0
export BITIR_BENCHMARKS=colorwheel
export BENCH=colorwheel
export BITIR_BENCH=colorwheel
export BENCH_ONLY=colorwheel
export BITIR_SOURCE_DIR=HeCBench/src/colorwheel-hip
export BITIR_EXTRA_INCLUDES=''
export BITIR_GOLDEN_FILE=colorwheel.bin
export BITIR_RUN_ARGS='10000 8 1'
export BITIR_COMPARE_MODE=exact
export BITIR_STATUS_PASS_LINE=PASS
export BITIR_STATUS_FAIL_LINE=FAIL
export COLORWHEEL_RANGE=10000
export COLORWHEEL_SIZE=8
export COLORWHEEL_REPEAT=1
export SITE_ID=143
export BIT_INDEX=2
export BITIR_FAULT_MODEL_NAME=amd_rerun_result
export BITIR_FAULT_MODEL_INJECT_TARGET=result
export BITIR_FAULT_MODEL_PHASE=float
export BITIR_FAULT_MODEL_INT_FLOAT_ONLY=1
export BITIR_FAULT_MODEL_INCLUDE_CONSTANTS=0
export BITIR_FAULT_MODEL_KEEP_DUMPS=0
export BITIR_FAULT_MODEL_RUN_BASELINE=0
export BITIR_FAULT_MODEL_SKIP_EXISTING=0
export BITIR_FAULT_MODEL_MISSING_ONLY=0
export BITIR_FAULT_MODEL_WORKLIST_QUEUE=0
export BITIR_FAULT_MODEL_TRACE_LEVEL=off
export INJECT_TARGET=result
export PHASE=float
export INT_FLOAT_ONLY=1
export INCLUDE_CONSTANTS=0
export KEEP_DUMPS=0
export RUN_BASELINE=0
export SKIP_EXISTING=0
export MISSING_ONLY=0
export TRACE_LEVEL=off
export WORKLIST_QUEUE=0
export BITIR_MACHINE_BACKEND=amd
export BITIR_MACHINE_MACHINE_LABEL=Frontier
export BITIR_MACHINE_SCHEDULER=slurm
export BITIR_MACHINE_SUBMIT_COMMAND=sbatch
export BITIR_MACHINE_MODULE_USE=''
export BITIR_MACHINE_BUILD_DIR=HeCBench/build-hip
export BITIR_MACHINE_BINARY_SUBDIR=hip
export BITIR_MACHINE_RESULTS_ROOT=HeCBench/results/llvm17_inject_amd
export BITIR_MACHINE_GOLDEN_ROOT=Frontier_HIP_Golden_Outputs
export BITIR_MACHINE_TIMEOUT_SEC=200
export BITIR_MACHINE_COMPARE_BACKEND=amd
export BITIR_MACHINE_GPU_QUERY_TOOL=rocm-smi
export BITIR_MACHINE_DEVICE_VISIBLE_ENV=ROCR_VISIBLE_DEVICES
export BITIR_MACHINE_DEVICE_VISIBLE_VALUE=0
export BITIR_MACHINE_COMPILER_DRIVER=hipcc
export BITIR_MACHINE_RUNTIME_HOME=/opt/rocm-6.4.2
export BITIR_MACHINE_HIP_ARCH=gfx90a
export BITIR_MACHINE_MODULES='rocm/6.4.2 rocm-llvm-toolchain'
export BITIR_MACHINE_LLVM_SEARCH_ROOT=/opt/rocm-6.4.2/lib/llvm
export BITIR_MACHINE_TOOL_SEARCH_ROOTS=/opt/rocm-6.4.2/lib/llvm/bin
if ! command -v module >/dev/null 2>&1 && [[ -f /etc/profile.d/modules.sh ]]; then
  source /etc/profile.d/modules.sh
fi
if command -v module >/dev/null 2>&1; then
  module purge || true
  module load rocm/6.4.2 2>/dev/null || true
  module load rocm-llvm-toolchain 2>/dev/null || true
fi
echo "[trace] after modules $(date -u +%Y-%m-%dT%H:%M:%SZ)"
command -v cmake >/dev/null 2>&1 && echo "[trace] cmake $(command -v cmake)" || echo "[trace] cmake missing"
command -v python3 >/dev/null 2>&1 && echo "[trace] python3 $(command -v python3)" || echo "[trace] python3 missing"
cd "${BITIR_WORKDIR}"
echo "[trace] workdir ${BITIR_WORKDIR}"
bash HeCBench/tools/llvm17_inject/run_benchmark_injection.sh
