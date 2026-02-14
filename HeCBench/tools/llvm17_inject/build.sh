#!/usr/bin/env bash
set -euo pipefail

LLVM_ROOT="${LLVM_ROOT:-/soft/compilers/llvm/release-17.0.6}"
LLVM_CONFIG="${LLVM_CONFIG:-${LLVM_ROOT}/bin/llvm-config}"
CLANGXX="${CLANGXX:-${LLVM_ROOT}/bin/clang++}"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUT_DIR="${OUT_DIR:-${SCRIPT_DIR}}"
SRC_DIR="${SRC_DIR:-${SCRIPT_DIR}}"

PLUGIN_PATH="${OUT_DIR}/libfi_inject.so"
LOCK_PATH="${OUT_DIR}/.libfi_inject.lock"

# Avoid rebuilding unless explicitly requested.
if [[ "${FORCE_REBUILD:-0}" -ne 1 && -s "${PLUGIN_PATH}" ]]; then
  echo "Using existing ${PLUGIN_PATH}"
  exit 0
fi

mkdir -p "${OUT_DIR}"
exec 9>"${LOCK_PATH}"
flock 9

TMP_OUT="$(mktemp "${PLUGIN_PATH}.tmp.XXXXXX")"
${CLANGXX} -std=c++17 -fPIC -shared \
  -I "${LLVM_ROOT}/include" \
  "$SRC_DIR/fi_inject_pass.cpp" \
  "$(${LLVM_CONFIG} --cxxflags --ldflags --system-libs --libs core)" \
  -o "${TMP_OUT}"

if [[ ! -s "${TMP_OUT}" ]]; then
  echo "Error: build produced empty plugin at ${TMP_OUT}" >&2
  rm -f "${TMP_OUT}"
  exit 1
fi

mv -f "${TMP_OUT}" "${PLUGIN_PATH}"
echo "Built ${PLUGIN_PATH}"
