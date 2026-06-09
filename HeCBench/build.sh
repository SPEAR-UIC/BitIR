#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="${REPO_ROOT:-$HOME/GPU_FI}"
BITIR_MACHINE="${BITIR_MACHINE:-}"

BITIR_MACHINE="${BITIR_MACHINE:?BITIR_MACHINE is required from YAML or environment}"

if command -v module >/dev/null 2>&1; then
  for p in ${BITIR_MACHINE_MODULE_USE:-}; do
    module use "${p}" 2>/dev/null || true
  done
  for m in ${MODULE_LIST:-${BITIR_MACHINE_MODULES:-}}; do
    module load "${m}" 2>/dev/null || true
  done
fi

BUILD_DIR="${BUILD_DIR:-${REPO_ROOT}/${BITIR_MACHINE_BUILD_DIR:-HeCBench/build}}"
BINARY_SUFFIX="${BITIR_MACHINE_BINARY_SUBDIR:-cuda}"
HECBENCH_ROOT="${REPO_ROOT}/HeCBench"

if [[ -n "${BENCH_ONLY_FILE:-}" && -f "${BENCH_ONLY_FILE}" ]]; then
  mapfile -t BENCH_LIST < "${BENCH_ONLY_FILE}"
elif [[ -n "${BENCH_ONLY:-}" ]]; then
  BENCH_ONLY_NORM="${BENCH_ONLY//,/ }"
  read -r -a BENCH_LIST <<< "${BENCH_ONLY_NORM}"
else
  read -r -a BENCH_LIST <<< "${BITIR_BENCHMARKS:-}"
fi

if [[ "${#BENCH_LIST[@]}" -eq 0 ]]; then
  echo "No benchmarks selected"
  exit 2
fi

targets=()
benchmarks=()
for bench in "${BENCH_LIST[@]}"; do
  targets+=("${bench}-${BINARY_SUFFIX}")
  benchmarks+=("${bench}-${BINARY_SUFFIX}")
done

cmake_args=(
  cmake -S "${HECBENCH_ROOT}"
  -B "${BUILD_DIR}"
  -DHECBENCH_BENCHMARKS="$(IFS=';'; echo "${benchmarks[*]}")"
  -DCMAKE_BUILD_TYPE="${CMAKE_BUILD_TYPE:-Release}"
)

case "${BITIR_MACHINE_BACKEND:-}" in
  nvidia)
    cmake_args+=(-DHECBENCH_ENABLE_CUDA=ON -DHECBENCH_ENABLE_HIP=OFF -DHECBENCH_ENABLE_SYCL=OFF -DHECBENCH_ENABLE_OPENMP=OFF)
    if [[ -n "${BITIR_MACHINE_CUDA_ARCH:-}" ]]; then
      cmake_args+=(-DHECBENCH_CUDA_ARCH="${BITIR_MACHINE_CUDA_ARCH}")
    fi
    ;;
  intel)
    cmake_args+=(-DHECBENCH_ENABLE_CUDA=OFF -DHECBENCH_ENABLE_HIP=OFF -DHECBENCH_ENABLE_SYCL=ON -DHECBENCH_ENABLE_OPENMP=OFF)
    if [[ -n "${BITIR_MACHINE_SYCL_TARGET:-}" ]]; then
      cmake_args+=(-DHECBENCH_SYCL_TARGET="${BITIR_MACHINE_SYCL_TARGET}")
    fi
    ;;
  amd)
    cmake_args+=(-DHECBENCH_ENABLE_CUDA=OFF -DHECBENCH_ENABLE_HIP=ON -DHECBENCH_ENABLE_SYCL=OFF -DHECBENCH_ENABLE_OPENMP=OFF)
    if [[ -n "${BITIR_MACHINE_HIP_ARCH:-}" ]]; then
      cmake_args+=(-DHECBENCH_HIP_ARCH="${BITIR_MACHINE_HIP_ARCH}")
    fi
    ;;
esac

"${cmake_args[@]}"
cmake --build "${BUILD_DIR}" --target "${targets[@]}"
