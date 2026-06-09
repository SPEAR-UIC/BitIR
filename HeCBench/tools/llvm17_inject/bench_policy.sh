#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
read -r -a ACTIVE_BENCHES <<< "${BITIR_BENCHMARKS:-}"

is_bench_active() {
  local b="$1"
  local x
  for x in "${ACTIVE_BENCHES[@]}"; do
    [[ "${x}" == "${b}" ]] && return 0
  done
  return 1
}

bench_source_exists() {
  local b="$1"
  local suffix="${BITIR_MACHINE_BINARY_SUBDIR:-}"
  local repo_root="${REPO_ROOT:-$(cd "${SCRIPT_DIR}/../../.." && pwd)}"
  [[ -n "${suffix}" ]] || return 1
  [[ -d "${repo_root}/HeCBench/src/${b}-${suffix}" ]]
}

require_bench_active() {
  local b="$1"
  if is_bench_active "${b}"; then
    return 0
  fi
  if bench_source_exists "${b}"; then
    return 0
  fi
  echo "[bench-policy] blocked benchmark with no source directory for the selected machine: ${b}" >&2
  echo "[bench-policy] active benchmarks: ${ACTIVE_BENCHES[*]}" >&2
  return 1
}
