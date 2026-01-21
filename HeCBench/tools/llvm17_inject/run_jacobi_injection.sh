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
LLC_BIN="${LLC_BIN:-/soft/compilers/llvm/release-17.0.6/bin/llc}"

CUDA_HOME="${CUDA_HOME:-/soft/compilers/cudatoolkit/cuda-11.8.0}"
CUDA_ARCH="${CUDA_ARCH:-sm_80}"

SITE_ID="${SITE_ID:-1}"
BIT_INDEX="${BIT_INDEX:-0}"
ABS_TOL="${ABS_TOL:-0.0}"
REL_TOL="${REL_TOL:-0.0}"
INJECT_TARGET="${INJECT_TARGET:-result}"
INT_FLOAT_ONLY="${INT_FLOAT_ONLY:-1}"
BASELINE="${BASELINE:-0}"

PLUGIN="${REPO_ROOT}/HeCBench/tools/llvm17_inject/libllfi_inject.so"
if [[ ! -f "${PLUGIN}" ]]; then
  echo "Missing plugin: ${PLUGIN}"
  exit 1
fi

OUT_DIR="${OUT_DIR:-${REPO_ROOT}/HeCBench/build/llvm17-inject-jacobi}"
BIN_PATH="${OUT_DIR}/jacobi"
RESULTS_DIR="${RESULTS_DIR:-${REPO_ROOT}/HeCBench/results/llvm17_inject/jacobi}"
mkdir -p "${OUT_DIR}" "${RESULTS_DIR}"

SRC="${REPO_ROOT}/HeCBench/src/jacobi-cuda/main.cu"
BENCH_DIR="${REPO_ROOT}/HeCBench/src/jacobi-cuda"
GOLDEN="${GOLDEN:-${REPO_ROOT}/Polaris_Golden_Outputs/jacobi.bin}"
RUN_DUMP_TMP="${OUT_DIR}/jacobi_site${SITE_ID}_bit${BIT_INDEX}.bin"
RUN_DUMP_FINAL="${RESULTS_DIR}/jacobi_site${SITE_ID}_bit${BIT_INDEX}.bin"
RUN_OUT="${RESULTS_DIR}/site${SITE_ID}_bit${BIT_INDEX}.out"
RUN_ERR="${RESULTS_DIR}/site${SITE_ID}_bit${BIT_INDEX}.err"
CSV="${CSV:-${RESULTS_DIR}/summary.csv}"
COMPARE_TOOL="${REPO_ROOT}/HeCBench/tools/llvm17_inject/compare_matrix_dump.py"
BASELINE_PATH="${BASELINE_PATH:-${RESULTS_DIR}/baseline_jacobi.bin}"

IR_LL="${OUT_DIR}/device.ll"
IR_BC="${OUT_DIR}/device.bc"
IR_INJ_BC="${OUT_DIR}/device.injected.bc"
IR_INJ_LL="${OUT_DIR}/device.injected.ll"
PTX_FILE="${OUT_DIR}/device.injected.ptx"
FATBIN_FILE="${OUT_DIR}/device.injected.fatbin"

if [[ "${BASELINE}" -eq 0 ]]; then
  if [[ ! -f "${GOLDEN}" ]]; then
    echo "Golden file not found: ${GOLDEN}"
    exit 1
  fi
  echo "[inject] golden=${GOLDEN}"
  SKIP_EXISTING="${SKIP_EXISTING:-1}"
  if [[ "${SKIP_EXISTING}" -eq 1 && -f "${RUN_OUT}" && -f "${RUN_ERR}" ]]; then
    echo "[inject] skip existing site=${SITE_ID} bit=${BIT_INDEX}"
    exit 0
  fi
else
  echo "[inject] baseline_mode=1 path=${BASELINE_PATH}"
fi

if [[ ! -f "${COMPARE_TOOL}" ]]; then
  echo "Missing compare tool: ${COMPARE_TOOL}"
  exit 1
fi

export LD_LIBRARY_PATH="${CUDA_HOME}/lib64:${LD_LIBRARY_PATH:-}"

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
  -llfi-target="${INJECT_TARGET}" \
  -llfi-int-float-only="${INT_FLOAT_ONLY}" \
  "${IR_BC}" -o "${IR_INJ_BC}"

${OPT_BIN} -S "${IR_INJ_BC}" -o "${IR_INJ_LL}"

${LLC_BIN} -march=nvptx64 -mcpu="${CUDA_ARCH}" -o "${PTX_FILE}" "${IR_INJ_BC}"

NVCC_BIN="${CUDA_HOME}/bin/nvcc"
if [[ -x "${NVCC_BIN}" ]]; then
  "${NVCC_BIN}" --fatbin -arch="${CUDA_ARCH}" "${PTX_FILE}" -o "${FATBIN_FILE}"
else
  echo "Error: nvcc not found at ${NVCC_BIN}"
  exit 1
fi

rm -f "${BIN_PATH}"
echo "[inject] using -Xclang -fcuda-include-gpubinary -Xclang ${FATBIN_FILE}"

${CLANG} -x cuda \
  --cuda-host-only \
  --cuda-gpu-arch="${CUDA_ARCH}" \
  --cuda-path="${CUDA_HOME}" \
  -Xclang -fcuda-include-gpubinary -Xclang "${FATBIN_FILE}" \
  -O0 -g \
  -D__STRICT_ANSI__ \
  -D_GLIBCXX_USE_FLOAT128=0 \
  -nostdinc++ \
  -isystem /usr/include/c++/7 \
  -isystem /usr/include/c++/7/x86_64-suse-linux \
  -isystem /usr/include/c++/7/backward \
  -isystem /usr/lib64/gcc/x86_64-suse-linux/7/include \
  -I "${BENCH_DIR}" \
  -I "${REPO_ROOT}/HeCBench/src" \
  "${SRC}" \
  -L"${CUDA_HOME}/lib64" -lcudart \
  -o "${BIN_PATH}"

if ! readelf -S "${BIN_PATH}" | grep -E -q "nv.*fatbin|nv.*cubin|\\.nv"; then
  echo "[inject] error: no CUDA fatbin/cubin section found in ${BIN_PATH}"
  exit 1
fi

set +e
HECBENCH_LLFI_FORCE_DUMP=1 "${BIN_PATH}" "${RUN_DUMP_TMP}" >"${RUN_OUT}" 2>"${RUN_ERR}"
status=$?
set -e

result="FAILURE"
dump_path=""
if [[ ${status} -eq 0 ]]; then
  if [[ -f "${RUN_DUMP_TMP}" ]]; then
    if [[ "${BASELINE}" -eq 1 ]]; then
      cp -f "${RUN_DUMP_TMP}" "${BASELINE_PATH}"
      echo "[inject] baseline_written=${BASELINE_PATH}" >>"${RUN_OUT}"
      dump_path="${BASELINE_PATH}"
      result="BASELINE"
    else
      if python3 "${COMPARE_TOOL}" "${GOLDEN}" "${RUN_DUMP_TMP}" --abs-tol "${ABS_TOL}" --rel-tol "${REL_TOL}" >>"${RUN_OUT}" 2>>"${RUN_ERR}"; then
        result="MASKED"
      else
        result="SDC"
      fi
    fi
  fi
fi

KEEP_DUMPS="${KEEP_DUMPS:-0}"
if [[ -f "${RUN_DUMP_TMP}" ]]; then
  if [[ "${BASELINE}" -eq 1 ]]; then
    rm -f "${RUN_DUMP_TMP}"
  elif [[ "${KEEP_DUMPS}" -eq 1 ]]; then
    mv -f "${RUN_DUMP_TMP}" "${RUN_DUMP_FINAL}"
    dump_path="${RUN_DUMP_FINAL}"
  else
    rm -f "${RUN_DUMP_TMP}"
  fi
fi

if [[ ! -f "${CSV}" ]]; then
  echo "site_id,bit_index,result,exit_code,stdout,stderr,dump" > "${CSV}"
fi
echo "${SITE_ID},${BIT_INDEX},${result},${status},${RUN_OUT},${RUN_ERR},${dump_path}" >> "${CSV}"

echo "Result: ${result} (exit ${status})"
