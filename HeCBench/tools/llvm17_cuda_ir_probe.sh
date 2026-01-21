#!/usr/bin/env bash
set -euo pipefail

if command -v module &> /dev/null; then
  module use /soft/modulefiles || true
  module load llvm/release-17.0.0 || true
fi

: "${CUDA_ARCH:=sm_80}"

if [[ -z "${CUDA_HOME:-}" ]]; then
  if [[ -d "/soft/compilers/cudatoolkit/cuda-11.8.0" ]]; then
    CUDA_HOME="/soft/compilers/cudatoolkit/cuda-11.8.0"
  elif [[ -d "/soft/compilers/cudatoolkit/cuda-12.9.1" ]]; then
    CUDA_HOME="/soft/compilers/cudatoolkit/cuda-12.9.1"
  elif [[ -d "/opt/nvidia/hpc_sdk/Linux_x86_64/25.5/cuda/11.8" ]]; then
    CUDA_HOME="/opt/nvidia/hpc_sdk/Linux_x86_64/25.5/cuda/11.8"
  elif [[ -d "/opt/nvidia/hpc_sdk/Linux_x86_64/25.5/cuda/12.9" ]]; then
    CUDA_HOME="/opt/nvidia/hpc_sdk/Linux_x86_64/25.5/cuda/12.9"
  else
    echo "CUDA_HOME not set and no default CUDA install found."
    exit 1
  fi
fi

if ! command -v clang++ &> /dev/null; then
  echo "clang++ not found in PATH. Load llvm/release-17.0.0 module first."
  exit 1
fi

PROBE_DIR="${PROBE_DIR:-$PWD/HeCBench/build/llvm17-probe}"
mkdir -p "$PROBE_DIR"

cat > "${PROBE_DIR}/fi_probe.cu" <<'CU'
#define __global__ __attribute__((global))
#define __host__ __attribute__((host))
#define __device__ __attribute__((device))
#define __shared__ __attribute__((shared))
#define __align__(n) __attribute__((aligned(n)))
#define __launch_bounds__(t, b) __attribute__((launch_bounds(t, b)))

extern "C" __global__ void fi_probe() {
  // intentionally empty to minimize CUDA runtime/header usage
}
CU

echo "[probe] clang++: $(command -v clang++)"
clang++ --version | head -n 1 || true

GCC_TOOLCHAIN="${GCC_TOOLCHAIN:-/usr/lib64/gcc/x86_64-suse-linux/7}"
if [[ ! -d "${GCC_TOOLCHAIN}" ]]; then
  GCC_TOOLCHAIN="${GCC_TOOLCHAIN%/*}"
fi
GCC_VER="$(basename "${GCC_TOOLCHAIN}")"
GCC_CXX_INC="/usr/include/c++/${GCC_VER}"
GCC_CXX_INC_TARGET="/usr/include/c++/${GCC_VER}/x86_64-suse-linux"
GCC_CXX_INC_BACKWARD="/usr/include/c++/${GCC_VER}/backward"
GCC_C_INC="/usr/lib64/gcc/x86_64-suse-linux/${GCC_VER}/include"

echo "[probe] CUDA_HOME=${CUDA_HOME}"
echo "[probe] CUDA_ARCH=${CUDA_ARCH}"
echo "[probe] GCC_TOOLCHAIN=${GCC_TOOLCHAIN}"
echo "[probe] GCC_CXX_INC=${GCC_CXX_INC}"

IR_LL="${PROBE_DIR}/fi_probe.ll"
IR_BC="${PROBE_DIR}/fi_probe.bc"

CLANG_CC1_FLAGS=(
  -triple nvptx64-nvidia-cuda
  -target-cpu "${CUDA_ARCH}"
  -emit-llvm
  -O0
  -fcuda-is-device
  -x cuda
)

clang++ -cc1 "${CLANG_CC1_FLAGS[@]}" \
  -o "${IR_LL}" \
  "${PROBE_DIR}/fi_probe.cu"

if command -v llvm-as &> /dev/null; then
  llvm-as "${IR_LL}" -o "${IR_BC}"
else
  echo "[probe] llvm-as not found; skipping bitcode generation."
fi

if [[ ! -s "${IR_LL}" ]]; then
  echo "[probe] ERROR: LLVM IR file not created: ${IR_LL}"
  exit 1
fi

echo "[probe] LLVM IR generated: ${IR_LL}"
echo "[probe] Kernel definition:"
grep -n "define.*@fi_probe" "${IR_LL}" || true

if command -v opt &> /dev/null; then
  echo "[probe] Instruction count:"
  opt -instcount -disable-output "${IR_BC}" 2>&1 | tail -n 5 || true
else
  echo "[probe] opt not found; skipping instruction count."
fi

echo "[probe] Done."
