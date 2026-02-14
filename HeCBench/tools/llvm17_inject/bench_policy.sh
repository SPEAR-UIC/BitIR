#!/usr/bin/env bash

# Canonical benchmark policy for FI campaign submissions.
# Keep this list in one place so all submitters stay consistent.

ACTIVE_BENCHES=(
  matrix-rotate
  jacobi
  layout
  dense-embedding
  pathfinder
  entropy
  colorwheel
  randomAccess
  crc64
)

DEPRECATED_BENCHES=(
  atomicCost
  bsearch
  btree
  match
  bwt
)

is_bench_active() {
  local b="$1"
  local x
  for x in "${ACTIVE_BENCHES[@]}"; do
    [[ "${x}" == "${b}" ]] && return 0
  done
  return 1
}

is_bench_deprecated() {
  local b="$1"
  local x
  for x in "${DEPRECATED_BENCHES[@]}"; do
    [[ "${x}" == "${b}" ]] && return 0
  done
  return 1
}

require_bench_active() {
  local b="$1"
  if is_bench_active "${b}"; then
    return 0
  fi
  if is_bench_deprecated "${b}"; then
    echo "[bench-policy] blocked deprecated benchmark: ${b}" >&2
  else
    echo "[bench-policy] blocked unknown benchmark: ${b}" >&2
  fi
  echo "[bench-policy] active benchmarks: ${ACTIVE_BENCHES[*]}" >&2
  return 1
}
