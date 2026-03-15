#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUT_DIR="${OUT_DIR:-${SCRIPT_DIR}}"
SRC_DIR="${SRC_DIR:-${SCRIPT_DIR}}"

DEFAULT_ONEAPI_ROOT="/opt/aurora/25.190.0/oneapi/compiler/latest/bin/compiler"
ALT_ONEAPI_ROOT="/opt/aurora/25.190.0/oneapi/compiler/2025.2/bin/compiler"
LOCAL_LLVM_BIN="${SCRIPT_DIR}/llvm/build/bin"

find_tool() {
  local current="$1"
  shift
  if [[ -n "${current}" && -x "${current}" ]]; then
    printf '%s\n' "${current}"
    return 0
  fi

  local name="$1"
  shift
  if command -v "${name}" >/dev/null 2>&1; then
    command -v "${name}"
    return 0
  fi

  local candidate
  for candidate in "$@"; do
    if [[ -x "${candidate}" ]]; then
      printf '%s\n' "${candidate}"
      return 0
    fi
  done
  return 1
}

LLVM_CONFIG="$(find_tool "${LLVM_CONFIG:-}" llvm-config \
  "${LOCAL_LLVM_BIN}/llvm-config" \
  "${DEFAULT_ONEAPI_ROOT}/llvm-config" "${ALT_ONEAPI_ROOT}/llvm-config")" || {
  LLVM_CONFIG_FALLBACK="$(find /opt/aurora/25.190.0/spack/unified -name llvm-config -print -quit 2>/dev/null || true)"
  if [[ -n "${LLVM_CONFIG_FALLBACK}" && -x "${LLVM_CONFIG_FALLBACK}" ]]; then
    LLVM_CONFIG="${LLVM_CONFIG_FALLBACK}"
  else
    echo "llvm-config not found" >&2
    exit 1
  fi
}

LLVM_BINDIR="$("${LLVM_CONFIG}" --bindir)"
LLVM_INCLUDEDIR="$("${LLVM_CONFIG}" --includedir)"
CLANGXX="$(find_tool "${CLANGXX:-}" clang++ \
  "${LLVM_BINDIR}/clang++" \
  "${LOCAL_LLVM_BIN}/clang++" \
  "${DEFAULT_ONEAPI_ROOT}/clang++" "${ALT_ONEAPI_ROOT}/clang++")" || {
  echo "clang++ not found" >&2
  exit 1
}

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
  -I "${LLVM_INCLUDEDIR}" \
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
