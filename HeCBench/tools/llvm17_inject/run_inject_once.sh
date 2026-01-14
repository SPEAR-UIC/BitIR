#!/usr/bin/env bash
set -euo pipefail

if command -v module &> /dev/null; then
  module use /soft/modulefiles || true
  module load llvm/release-17.0.0 || true
fi

REPO_ROOT="${REPO_ROOT:-$(pwd)}"
CLANG="${CLANG:-/soft/compilers/llvm/release-17.0.6/bin/clang++}"
OPT_BIN="${OPT_BIN:-/soft/compilers/llvm/release-17.0.6/bin/opt}"
LLVM_AS="${LLVM_AS:-/soft/compilers/llvm/release-17.0.6/bin/llvm-as}"

CUDA_HOME="${CUDA_HOME:-/soft/compilers/cudatoolkit/cuda-11.8.0}"
CUDA_ARCH="${CUDA_ARCH:-sm_80}"

BENCH="${BENCH:-matrix-rotate}"
SITE_ID="${SITE_ID:-1}"
BIT_INDEX="${BIT_INDEX:-0}"

BENCH_DIR="${REPO_ROOT}/HeCBench/src/${BENCH}-cuda"
SRC="${BENCH_DIR}/main.cu"
OUT_DIR="${REPO_ROOT}/HeCBench/build/llvm17-inject-${BENCH}"
PLUGIN="${REPO_ROOT}/HeCBench/tools/llvm17_inject/libllfi_inject.so"

if [[ ! -f "${PLUGIN}" ]]; then
  echo "Missing plugin: ${PLUGIN}"
  exit 1
fi

mkdir -p "${OUT_DIR}"

IR_LL="${OUT_DIR}/device.ll"
IR_BC="${OUT_DIR}/device.bc"
IR_INJ_BC="${OUT_DIR}/device.injected.bc"
IR_INJ_LL="${OUT_DIR}/device.injected.ll"

${CLANG} -x cuda \
  --cuda-device-only \
  --cuda-gpu-arch="${CUDA_ARCH}" \
  --cuda-path="${CUDA_HOME}" \
  -Xclang -emit-llvm \
  -S -O0 -g \
  -D__STRICT_ANSI__ \
  -D_GLIBCXX_USE_FLOAT128=0 \
  -nostdinc++ \
  -isystem /usr/include/c++/7 \
  -isystem /usr/include/c++/7/x86_64-suse-linux \
  -isystem /usr/include/c++/7/backward \
  -isystem /usr/lib64/gcc/x86_64-suse-linux/7/include \
  -I "${BENCH_DIR}" \
  -I "${REPO_ROOT}/HeCBench/src" \
  "${SRC}" -o "${IR_LL}"

${LLVM_AS} "${IR_LL}" -o "${IR_BC}"

${OPT_BIN} -load-pass-plugin "${PLUGIN}" \
  -passes=llfi-inject \
  -llfi-site="${SITE_ID}" \
  -llfi-bit="${BIT_INDEX}" \
  "${IR_BC}" -o "${IR_INJ_BC}"

${OPT_BIN} -S "${IR_INJ_BC}" -o "${IR_INJ_LL}"

echo "Injected site ${SITE_ID} bit ${BIT_INDEX} -> ${IR_INJ_LL}"
