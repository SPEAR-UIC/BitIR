#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 2 ]]; then
  echo "usage: $0 <bench> <out_dir>" >&2
  exit 1
fi

BENCH="$1"
OUT_DIR="$2"
REPO_ROOT="${REPO_ROOT:-$(pwd)}"
HIP_HOME="${HIP_HOME:-/opt/rocm-6.4.2}"
PLUGIN_BUILD="${REPO_ROOT}/HeCBench/tools/llvm17_inject/build.sh"
PLUGIN_PATH="${REPO_ROOT}/HeCBench/tools/llvm17_inject/libfi_inject.so"

case "${BENCH}" in
  colorwheel)
    SRC_DIR="${REPO_ROOT}/HeCBench/src/colorwheel-hip"
    HIP_ARCH="gfx90a"
    ;;
  randomAccess)
    SRC_DIR="${REPO_ROOT}/HeCBench/src/randomAccess-hip"
    HIP_ARCH="gfx90a"
    ;;
  *)
    echo "unsupported bench: ${BENCH}" >&2
    exit 1
    ;;
esac

SRC="${SRC_DIR}/main.cu"
CLANG="${HIP_HOME}/lib/llvm/bin/clang++"
LLVM_AS="${HIP_HOME}/lib/llvm/bin/llvm-as"
OPT_BIN="${HIP_HOME}/lib/llvm/bin/opt"

mkdir -p "${OUT_DIR}"
PATH="${HIP_HOME}/lib/llvm/bin:${HIP_HOME}/bin:${PATH}" \
  OPT_BIN="${OPT_BIN}" \
  "${PLUGIN_BUILD}"

"${CLANG}" \
  -x hip \
  --offload-device-only \
  --offload-arch="${HIP_ARCH}" \
  --hip-path="${HIP_HOME}" \
  -Xclang -emit-llvm \
  -S \
  -O0 \
  -g \
  -D__STRICT_ANSI__ \
  -D_GLIBCXX_USE_FLOAT128=0 \
  -I "${SRC_DIR}" \
  -I "${REPO_ROOT}/HeCBench/src" \
  "${SRC}" \
  -o "${OUT_DIR}/${BENCH}.device.ll"

"${LLVM_AS}" "${OUT_DIR}/${BENCH}.device.ll" -o "${OUT_DIR}/${BENCH}.device.bc"

"${OPT_BIN}" \
  -load-pass-plugin "${PLUGIN_PATH}" \
  -passes=fi-inject \
  -fi-site=-1 \
  -fi-target=result \
  -fi-int-float-only=1 \
  -fi-include-constants=0 \
  -fi-dump-sites-rich="${OUT_DIR}/${BENCH}.sites_metadata.csv" \
  -disable-output \
  "${OUT_DIR}/${BENCH}.device.bc"
