#!/usr/bin/env bash
set -euo pipefail

LLVM_ROOT="${LLVM_ROOT:-/soft/compilers/llvm/release-17.0.6}"
LLVM_CONFIG="${LLVM_CONFIG:-${LLVM_ROOT}/bin/llvm-config}"
CLANGXX="${CLANGXX:-${LLVM_ROOT}/bin/clang++}"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUT_DIR="${OUT_DIR:-${SCRIPT_DIR}}"
SRC_DIR="${SRC_DIR:-${SCRIPT_DIR}}"

${CLANGXX} -std=c++17 -fPIC -shared \
  -I "${LLVM_ROOT}/include" \
  "$SRC_DIR/fi_inject_pass.cpp" \
  "$(${LLVM_CONFIG} --cxxflags --ldflags --system-libs --libs core)" \
  -o "$OUT_DIR/libfi_inject.so"

echo "Built $OUT_DIR/libfi_inject.so"
