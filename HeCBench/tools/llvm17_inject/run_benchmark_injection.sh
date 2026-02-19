#!/usr/bin/env bash
set -euo pipefail
start_ns=$(date +%s%N)
now_ns() { date +%s%N; }
# Compatibility shim: if any stale script path still calls `cho`,
# treat it as `echo` so jobs do not fail.
cho() { echo "$@"; }

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

BENCH="${BENCH:-}"
SITE_ID="${SITE_ID:-1}"
BIT_INDEX="${BIT_INDEX:-0}"
ABS_TOL="${ABS_TOL:-0.0}"
REL_TOL="${REL_TOL:-0.0}"
BASELINE="${BASELINE:-0}"
COMPARE_MODE="${COMPARE_MODE:-exact}"
INJECT_TARGET="${INJECT_TARGET:-result}"
INT_FLOAT_ONLY="${INT_FLOAT_ONLY:-1}"
INCLUDE_CONSTANTS="${INCLUDE_CONSTANTS:-0}"
CACHE_DEVICE_IR="${CACHE_DEVICE_IR:-1}"
GENERATE_IR_LL="${GENERATE_IR_LL:-0}"
HOST_SOURCES=()

if [[ -z "${BENCH}" ]]; then
  echo "BENCH is required"
  exit 1
fi

PLUGIN="${PLUGIN:-${REPO_ROOT}/HeCBench/tools/llvm17_inject/libfi_inject.so}"
if [[ ! -f "${PLUGIN}" ]]; then
  echo "Missing plugin: ${PLUGIN}"
  exit 1
fi

OUT_DIR="${OUT_DIR:-${REPO_ROOT}/HeCBench/build/llvm17-inject-${BENCH}}"
BIN_PATH="${OUT_DIR}/${BENCH}"
RESULTS_DIR="${RESULTS_DIR:-${REPO_ROOT}/HeCBench/results/llvm17_inject/${BENCH}}"
mkdir -p "${OUT_DIR}" "${RESULTS_DIR}"

TIMING_CSV="${TIMING_CSV:-${RESULTS_DIR}/timing.csv}"
TIMING_TMP="${RESULTS_DIR}/timing_site${SITE_ID}_bit${BIT_INDEX}.tmp"
> "${TIMING_TMP}"
BUSY_FLAG="${RESULTS_DIR}/gpu_busy.flag"
log_timing() {
  local label="$1" start="$2" end="$3"
  local dur_ms=$(( (end - start) / 1000000 ))
  echo "timing_${label}_ms: ${dur_ms}" >> "${TIMING_TMP}"
  if [[ ! -f "${TIMING_CSV}" ]]; then
    echo "site_id,bit_index,phase,duration_ms" > "${TIMING_CSV}"
  fi
  echo "${SITE_ID},${BIT_INDEX},${label},${dur_ms}" >> "${TIMING_CSV}"
}

case "${BENCH}" in
  matrix-rotate)
    SRC_DIR="HeCBench/src/matrix-rotate-cuda"
    RUN_ARGS=("${MATRIX_SIZE:-8192}" "${MATRIX_REPEAT:-10}")
    GOLDEN_NAME="matrix-rotate_${MATRIX_SIZE:-8192}_${MATRIX_REPEAT:-10}.bin"
    ;;
  jacobi)
    SRC_DIR="HeCBench/src/jacobi-cuda"
    RUN_ARGS=()
    GOLDEN_NAME="jacobi.bin"
    ;;
  layout)
    SRC_DIR="HeCBench/src/layout-cuda"
    RUN_ARGS=("${LAYOUT_REPEAT:-20}")
    GOLDEN_NAME="layout.bin"
    ;;
  atomicCost)
    SRC_DIR="HeCBench/src/atomicCost-cuda"
    RUN_ARGS=("${ATOMIC_NELEMS:-16}" "${ATOMIC_REPEAT:-5}")
    GOLDEN_NAME="atomicCost.bin"
    ;;
  dense-embedding)
    SRC_DIR="HeCBench/src/dense-embedding-cuda"
    RUN_ARGS=("${DENSE_ROWS:-5000}" "${DENSE_BATCH:-64}" "${DENSE_REPEAT:-5}")
    GOLDEN_NAME="dense-embedding.bin"
    ;;
  pathfinder)
    SRC_DIR="HeCBench/src/pathfinder-cuda"
    RUN_ARGS=("${PATHFINDER_COLS:-1000}" "${PATHFINDER_ROWS:-1000}" "${PATHFINDER_PYRAMID:-100}")
    GOLDEN_NAME="pathfinder.bin"
    ;;
  bsearch)
    SRC_DIR="HeCBench/src/bsearch-cuda"
    RUN_ARGS=("${BSEARCH_ELEMENTS:-16777216}" "${BSEARCH_REPEAT:-10}")
    GOLDEN_NAME="bsearch.bin"
    ;;
  match)
    SRC_DIR="HeCBench/src/match-cuda"
    SRC_NAME="main.cu"
    HOST_SOURCES=("main.cu")
    RUN_ARGS=("${MATCH_REPEAT:-1}")
    GOLDEN_NAME=""
    ;;
  crc64)
    SRC_DIR="HeCBench/src/crc64-cuda"
    SRC_NAME="CRC64.cu"
    HOST_SOURCES=("CRC64.cu" "CRC64Test.cu")
    RUN_ARGS=("${CRC64_NTESTS:-2}" "${CRC64_SEED:-5}" "${CRC64_MAX_LEN:-65536}")
    GOLDEN_NAME=""
    ;;
  btree)
    SRC_DIR="HeCBench/src/btree-cuda"
    SRC_NAME="main.cu"
    HOST_SOURCES=("main.cu")
    RUN_ARGS=("${BTREE_NUM_KEYS:-262144}" "${BTREE_NUM_QUERIES:-262144}" "${BTREE_SEED:-12345}")
    GOLDEN_NAME=""
    ;;
  entropy)
    SRC_DIR="HeCBench/src/entropy-cuda"
    RUN_ARGS=("${ENTROPY_WIDTH:-4096}" "${ENTROPY_HEIGHT:-4096}" "${ENTROPY_REPEAT:-5}")
    GOLDEN_NAME="entropy.bin"
    ;;
  colorwheel)
    SRC_DIR="HeCBench/src/colorwheel-cuda"
    RUN_ARGS=("${COLORWHEEL_RANGE:-1.0}" "${COLORWHEEL_SIZE:-4096}" "${COLORWHEEL_REPEAT:-5}")
    GOLDEN_NAME="colorwheel.bin"
    ;;
  randomAccess)
    SRC_DIR="HeCBench/src/randomAccess-cuda"
    RUN_ARGS=("${RANDOMACCESS_REPEAT:-3}")
    GOLDEN_NAME="randomAccess.bin"
    ;;
  *)
    echo "Unknown BENCH: ${BENCH}"
    exit 1
    ;;
esac

SRC_NAME="${SRC_NAME:-main.cu}"
SRC="${REPO_ROOT}/${SRC_DIR}/${SRC_NAME}"
BENCH_DIR="${REPO_ROOT}/${SRC_DIR}"
if [[ ${#HOST_SOURCES[@]} -eq 0 ]]; then
  HOST_SOURCES=("${SRC_NAME}")
fi
HOST_SOURCE_PATHS=()
for host_src in "${HOST_SOURCES[@]}"; do
  HOST_SOURCE_PATHS+=("${BENCH_DIR}/${host_src}")
done
GOLDEN="${GOLDEN:-${REPO_ROOT}/Polaris_Golden_Outputs/${GOLDEN_NAME}}"
RUN_DUMP_TMP="${OUT_DIR}/${BENCH}_site${SITE_ID}_bit${BIT_INDEX}.bin"
RUN_DUMP_FINAL="${RESULTS_DIR}/${BENCH}_site${SITE_ID}_bit${BIT_INDEX}.bin"
RUN_OUT="${RESULTS_DIR}/site${SITE_ID}_bit${BIT_INDEX}.out"
RUN_ERR="${RESULTS_DIR}/site${SITE_ID}_bit${BIT_INDEX}.err"
CSV="${CSV:-${RESULTS_DIR}/summary.csv}"
COMPARE_FLOAT="${REPO_ROOT}/HeCBench/tools/llvm17_inject/compare_matrix_dump.py"
COMPARE_EXACT="${REPO_ROOT}/HeCBench/tools/llvm17_inject/compare_binary_exact.py"
COMPARE_TEXT="${REPO_ROOT}/HeCBench/tools/llvm17_inject/compare_text_signature.py"
SDC_METRICS="${REPO_ROOT}/HeCBench/tools/llvm17_inject/compute_sdc_metrics.py"
BASELINE_PATH="${BASELINE_PATH:-${RESULTS_DIR}/baseline_${BENCH}.bin}"
BASELINE_DIR="${BASELINE_DIR:-${RESULTS_DIR}/baseline}"
BASELINE_OUT="${BASELINE_DIR}/baseline.out"
BASELINE_ERR="${BASELINE_DIR}/baseline.err"
BASELINE_META="${BASELINE_DIR}/baseline_meta.txt"
BASELINE_STDOUT="${BASELINE_DIR}/baseline.stdout"
GOLDEN_TEXT="${GOLDEN_TEXT:-${REPO_ROOT}/Polaris_Golden_Outputs/${BENCH}.txt}"
# Persisting baseline binaries can consume large quota quickly (GB-scale for some benches).
# Default off; compare still uses the temporary dump produced by the run.
PERSIST_BASELINE_BIN="${PERSIST_BASELINE_BIN:-0}"

IR_LL="${OUT_DIR}/device.ll"
IR_BC="${OUT_DIR}/device.bc"
IR_INJ_BC="${OUT_DIR}/device.injected.bc"
IR_INJ_LL="${OUT_DIR}/device.injected.ll"
PTX_FILE="${OUT_DIR}/device.injected.ptx"
FATBIN_FILE="${OUT_DIR}/device.injected.fatbin"

if [[ "${BASELINE}" -eq 0 ]]; then
  if [[ "${COMPARE_MODE}" != "text" ]]; then
    if [[ ! -f "${GOLDEN}" ]]; then
      echo "Golden file not found: ${GOLDEN}"
      exit 1
    fi
    echo "[inject] golden=${GOLDEN}"
  fi
  SKIP_EXISTING="${SKIP_EXISTING:-1}"
  if [[ "${SKIP_EXISTING}" -eq 1 && -f "${RUN_OUT}" && -f "${RUN_ERR}" ]]; then
    echo "[inject] skip existing site=${SITE_ID} bit=${BIT_INDEX}"
    exit 0
  fi
else
  echo "[inject] baseline_mode=1 path=${BASELINE_PATH}"
  if [[ "${COMPARE_MODE}" == "text" ]]; then
    if [[ ! -f "${GOLDEN_TEXT}" ]]; then
      echo "Golden text file not found: ${GOLDEN_TEXT}"
      exit 1
    fi
  else
    if [[ ! -f "${GOLDEN}" ]]; then
      echo "Golden file not found: ${GOLDEN}"
      exit 1
    fi
  fi
  mkdir -p "${BASELINE_DIR}"
fi

COMPARE_TOOL="${COMPARE_EXACT}"
if [[ "${COMPARE_MODE}" == "float" ]]; then
  COMPARE_TOOL="${COMPARE_FLOAT}"
elif [[ "${COMPARE_MODE}" == "text" ]]; then
  COMPARE_TOOL="${COMPARE_TEXT}"
fi
if [[ ! -f "${COMPARE_TOOL}" ]]; then
  echo "Missing compare tool: ${COMPARE_TOOL}"
  exit 1
fi

export LD_LIBRARY_PATH="${CUDA_HOME}/lib64:${LD_LIBRARY_PATH:-}"

if [[ "${CACHE_DEVICE_IR}" -eq 1 && -f "${IR_BC}" ]]; then
  if [[ "${SRC}" -nt "${IR_BC}" ]]; then
    rm -f "${IR_BC}" "${IR_LL}"
  fi
fi

if [[ ! -f "${IR_BC}" ]]; then
  t0=$(now_ns)
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

  t1=$(now_ns)
  ${LLVM_AS} "${IR_LL}" -o "${IR_BC}"
  t2=$(now_ns)
  log_timing emit_llvm "${t0}" "${t1}"
  log_timing llvm_as "${t1}" "${t2}"
fi

if [[ "${BASELINE}" -eq 1 ]]; then
  IR_FOR_PTX="${IR_BC}"
else
  t3=$(now_ns)
  ${OPT_BIN} -load-pass-plugin "${PLUGIN}" \
  -passes=fi-inject \
  -fi-site="${SITE_ID}" \
  -fi-bit="${BIT_INDEX}" \
  -fi-target="${INJECT_TARGET}" \
  -fi-int-float-only="${INT_FLOAT_ONLY}" \
  -fi-include-constants="${INCLUDE_CONSTANTS}" \
  "${IR_BC}" -o "${IR_INJ_BC}"
  t4=$(now_ns)
  log_timing inject_pass "${t3}" "${t4}"
  if [[ "${GENERATE_IR_LL}" -eq 1 ]]; then
    t5=$(now_ns)
    ${OPT_BIN} -S "${IR_INJ_BC}" -o "${IR_INJ_LL}"
    t6=$(now_ns)
    log_timing bc_to_ll "${t5}" "${t6}"
  fi
  IR_FOR_PTX="${IR_INJ_BC}"
fi

 t7=$(now_ns)
${LLC_BIN} -march=nvptx64 -mcpu="${CUDA_ARCH}" -o "${PTX_FILE}" "${IR_FOR_PTX}"
 t8=$(now_ns)
 log_timing llc_ptx "${t7}" "${t8}"

NVCC_BIN="${CUDA_HOME}/bin/nvcc"
if [[ -x "${NVCC_BIN}" ]]; then
  t9=$(now_ns)
  "${NVCC_BIN}" --fatbin -arch="${CUDA_ARCH}" "${PTX_FILE}" -o "${FATBIN_FILE}"
  t10=$(now_ns)
  log_timing fatbin "${t9}" "${t10}"
else
  echo "Error: nvcc not found at ${NVCC_BIN}"
  exit 1
fi

rm -f "${BIN_PATH}"
echo "[inject] using -Xclang -fcuda-include-gpubinary -Xclang ${FATBIN_FILE}"

 t11=$(now_ns)
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
  "${HOST_SOURCE_PATHS[@]}" \
  -L"${CUDA_HOME}/lib64" -lcudart \
  -o "${BIN_PATH}"
 t12=$(now_ns)
 log_timing host_link "${t11}" "${t12}"

if ! readelf -S "${BIN_PATH}" | grep -E -q "nv.*fatbin|nv.*cubin|\\.nv"; then
  echo "[inject] error: no CUDA fatbin/cubin section found in ${BIN_PATH}"
  exit 1
fi

 t13=$(now_ns)
 set +e
if [[ "${BASELINE}" -eq 1 ]]; then
  if [[ "${COMPARE_MODE}" == "text" ]]; then
    "${BIN_PATH}" "${RUN_ARGS[@]}" >"${BASELINE_OUT}" 2>"${BASELINE_ERR}"
  else
    HECBENCH_FI_FORCE_DUMP=1 "${BIN_PATH}" "${RUN_ARGS[@]}" "${RUN_DUMP_TMP}" >"${BASELINE_OUT}" 2>"${BASELINE_ERR}"
  fi
  status=$?
else
  if [[ "${COMPARE_MODE}" == "text" ]]; then
    "${BIN_PATH}" "${RUN_ARGS[@]}" >"${RUN_OUT}" 2>"${RUN_ERR}"
  else
    HECBENCH_FI_FORCE_DUMP=1 "${BIN_PATH}" "${RUN_ARGS[@]}" "${RUN_DUMP_TMP}" >"${RUN_OUT}" 2>"${RUN_ERR}"
  fi
  status=$?
fi
set -e
 t14=$(now_ns)
 log_timing run "${t13}" "${t14}"

# Append timing info after run so stdout redirection doesn't clobber it.
if [[ "${BASELINE}" -eq 1 ]]; then
  cat "${TIMING_TMP}" >> "${BASELINE_OUT}" 2>/dev/null || true
else
  cat "${TIMING_TMP}" >> "${RUN_OUT}" 2>/dev/null || true
fi
rm -f "${TIMING_TMP}" || true

# Quarantine malformed text outputs so they are not counted as completed pairs.
if [[ "${BASELINE}" -eq 0 ]]; then
  has_nul=0
  if [[ -f "${RUN_OUT}" ]] && python3 -c 'import pathlib,sys; b=pathlib.Path(sys.argv[1]).read_bytes(); raise SystemExit(0 if b"\x00" in b else 1)' "${RUN_OUT}" 2>/dev/null; then
    has_nul=1
  fi
  if [[ -f "${RUN_ERR}" ]] && python3 -c 'import pathlib,sys; b=pathlib.Path(sys.argv[1]).read_bytes(); raise SystemExit(0 if b"\x00" in b else 1)' "${RUN_ERR}" 2>/dev/null; then
    has_nul=1
  fi
  if [[ "${has_nul}" -eq 1 ]]; then
    quarantine_dir="${RESULTS_DIR}/quarantine_nul"
    mkdir -p "${quarantine_dir}"
    ts="$(date +%Y%m%d_%H%M%S)"
    mv -f "${RUN_OUT}" "${quarantine_dir}/$(basename "${RUN_OUT}").${ts}.bad" 2>/dev/null || true
    mv -f "${RUN_ERR}" "${quarantine_dir}/$(basename "${RUN_ERR}").${ts}.bad" 2>/dev/null || true
    {
      echo "Result: FAILURE (exit nul_output)"
      echo "[runner] quarantined NUL-corrupted stdout/stderr for site=${SITE_ID} bit=${BIT_INDEX}"
      echo "[runner] quarantine_dir=${quarantine_dir}"
    } > "${RUN_OUT}"
    status=86
  fi
fi

result="FAILURE"
dump_path=""
metric_abs_max=""
metric_mean_abs=""
metric_rmse=""
metric_max_rel=""
metric_mean_rel=""
metric_p95_abs=""
metric_p99_abs=""
metric_num_bad=""
metric_frac_bad=""
metric_max_ulp=""
metric_mean_ulp=""
metric_ham_bits=""
metric_ham_bytes=""
metric_size_bytes=""
if [[ "${BASELINE}" -eq 1 ]]; then
  if [[ ${status} -eq 0 ]]; then
    if [[ "${COMPARE_MODE}" == "text" ]]; then
      set +e
      text_cmp_out=$(python3 "${COMPARE_TOOL}" --bench "${BENCH}" --baseline "${GOLDEN_TEXT}" --candidate "${BASELINE_OUT}" 2>>"${BASELINE_ERR}")
      text_cmp_status=$?
      set -e
      if [[ -n "${text_cmp_out}" ]]; then
        echo "${text_cmp_out}" >> "${BASELINE_OUT}"
      fi
      if [[ ${text_cmp_status} -eq 0 ]]; then
        result="BASELINE"
      else
        result="BASELINE_MISMATCH"
        echo "[baseline] compare_failed golden_text=${GOLDEN_TEXT}" >>"${BASELINE_ERR}"
      fi
      cp -f "${BASELINE_OUT}" "${BASELINE_STDOUT}"
    elif [[ -f "${RUN_DUMP_TMP}" ]]; then
      baseline_compare_path="${RUN_DUMP_TMP}"
      if [[ "${PERSIST_BASELINE_BIN}" -eq 1 ]]; then
        if cp -f "${RUN_DUMP_TMP}" "${BASELINE_PATH}"; then
          baseline_compare_path="${BASELINE_PATH}"
          dump_path="${BASELINE_PATH}"
        else
          echo "[baseline] warning: failed to persist baseline to ${BASELINE_PATH}; using temp dump for compare" >>"${BASELINE_ERR}"
        fi
      fi
      if [[ "${COMPARE_MODE}" == "float" ]]; then
        python3 "${COMPARE_TOOL}" "${GOLDEN}" "${baseline_compare_path}" --abs-tol "${ABS_TOL}" --rel-tol "${REL_TOL}" >>"${BASELINE_OUT}" 2>>"${BASELINE_ERR}"
      else
        python3 "${COMPARE_TOOL}" "${GOLDEN}" "${baseline_compare_path}" >>"${BASELINE_OUT}" 2>>"${BASELINE_ERR}"
      fi
      if [[ $? -eq 0 ]]; then
        result="BASELINE"
      else
        result="BASELINE_MISMATCH"
        echo "[baseline] compare_failed golden=${GOLDEN}" >>"${BASELINE_ERR}"
      fi
      if [[ "${PERSIST_BASELINE_BIN}" -eq 1 && -f "${BASELINE_PATH}" ]]; then
        dump_path="${BASELINE_PATH}"
      else
        dump_path=""
      fi
    fi
  fi
  {
    echo "bench=${BENCH}"
    echo "golden=${GOLDEN}"
    echo "golden_text=${GOLDEN_TEXT}"
    echo "baseline=${BASELINE_PATH}"
    echo "baseline_stdout=${BASELINE_STDOUT}"
    echo "status=${status}"
    echo "result=${result}"
  } >"${BASELINE_META}"
else
  can_compare=0
  if [[ "${COMPARE_MODE}" == "text" ]]; then
    if [[ ${status} -eq 0 ]]; then
      can_compare=1
    fi
  else
    if [[ -f "${RUN_DUMP_TMP}" ]]; then
      can_compare=1
    fi
  fi
  if [[ ${can_compare} -eq 1 ]]; then
    if [[ ${status} -ne 0 ]]; then
      echo "[compare] forcing compare despite nonzero status=${status}" >> "${RUN_OUT}"
    fi
    set +e
    if [[ "${COMPARE_MODE}" == "text" ]]; then
      text_cmp_out=$(python3 "${COMPARE_TOOL}" --bench "${BENCH}" --baseline "${BASELINE_STDOUT}" --candidate "${RUN_OUT}" 2>>"${RUN_ERR}")
      cmp_status=$?
      if [[ -n "${text_cmp_out}" ]]; then
        echo "${text_cmp_out}" >> "${RUN_OUT}"
      fi
      while IFS= read -r line; do
        case "${line}" in
          metric_num_bad=*) metric_num_bad="${line#*=}" ;;
          metric_frac_bad=*) metric_frac_bad="${line#*=}" ;;
        esac
      done <<< "${text_cmp_out}"
    elif [[ "${COMPARE_MODE}" == "float" ]]; then
      python3 "${COMPARE_TOOL}" "${GOLDEN}" "${RUN_DUMP_TMP}" --abs-tol "${ABS_TOL}" --rel-tol "${REL_TOL}" >>"${RUN_OUT}" 2>>"${RUN_ERR}"
      cmp_status=$?
    else
      python3 "${COMPARE_TOOL}" "${GOLDEN}" "${RUN_DUMP_TMP}" >>"${RUN_OUT}" 2>>"${RUN_ERR}"
      cmp_status=$?
    fi
    set -e
    if [[ ${cmp_status} -eq 0 ]]; then
      result="MASKED"
    else
      result="SDC"
      if [[ "${COMPARE_MODE}" == "text" ]]; then
        :
      elif [[ -f "${SDC_METRICS}" ]]; then
        SDC_BAD_THRESH="${SDC_BAD_THRESH:-1e-3}"
        if [[ "${COMPARE_MODE}" == "float" ]]; then
          metrics_out=$(python3 "${SDC_METRICS}" "${GOLDEN}" "${RUN_DUMP_TMP}" --mode float --bad-threshold "${SDC_BAD_THRESH}" 2>/dev/null || true)
          while IFS= read -r line; do
            case "${line}" in
              metric_abs_max=*) metric_abs_max="${line#*=}" ;;
              metric_mean_abs=*) metric_mean_abs="${line#*=}" ;;
              metric_rmse=*) metric_rmse="${line#*=}" ;;
              metric_max_rel=*) metric_max_rel="${line#*=}" ;;
              metric_mean_rel=*) metric_mean_rel="${line#*=}" ;;
              metric_p95_abs=*) metric_p95_abs="${line#*=}" ;;
              metric_p99_abs=*) metric_p99_abs="${line#*=}" ;;
              metric_num_bad=*) metric_num_bad="${line#*=}" ;;
              metric_frac_bad=*) metric_frac_bad="${line#*=}" ;;
              metric_max_ulp=*) metric_max_ulp="${line#*=}" ;;
              metric_mean_ulp=*) metric_mean_ulp="${line#*=}" ;;
              metric_size_bytes=*) metric_size_bytes="${line#*=}" ;;
            esac
          done <<< "${metrics_out}"
          if [[ -n "${metrics_out}" ]]; then
            {
              echo "${metrics_out}"
            } >> "${RUN_OUT}"
          fi
        else
          metrics_out=$(python3 "${SDC_METRICS}" "${GOLDEN}" "${RUN_DUMP_TMP}" --mode exact 2>/dev/null || true)
          while IFS= read -r line; do
            case "${line}" in
              metric_ham_bits=*) metric_ham_bits="${line#*=}" ;;
              metric_ham_bytes=*) metric_ham_bytes="${line#*=}" ;;
              metric_size_bytes=*) metric_size_bytes="${line#*=}" ;;
            esac
          done <<< "${metrics_out}"
          if [[ -n "${metrics_out}" ]]; then
            {
              echo "${metrics_out}"
            } >> "${RUN_OUT}"
          fi
        fi
      fi
    fi
  elif [[ "${COMPARE_MODE}" != "text" && ! -f "${RUN_DUMP_TMP}" ]]; then
    echo "[compare] skipped: missing dump ${RUN_DUMP_TMP} status=${status}" >> "${RUN_OUT}"
  fi
fi

# Detect GPU busy/unavailable errors and flag for throttling.
if [[ "${BASELINE}" -eq 0 ]]; then
  if grep -qi "CUDA-capable device(s) is/are busy or unavailable" "${RUN_OUT}" "${RUN_ERR}" 2>/dev/null; then
    echo "[gpu] busy/unavailable detected; flagging ${BUSY_FLAG}" >> "${RUN_OUT}"
    touch "${BUSY_FLAG}"
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
  echo "site_id,bit_index,result,exit_code,stdout,stderr,dump,metric_abs_max,metric_mean_abs,metric_rmse,metric_max_rel,metric_mean_rel,metric_p95_abs,metric_p99_abs,metric_num_bad,metric_frac_bad,metric_max_ulp,metric_mean_ulp,metric_ham_bits,metric_ham_bytes,metric_size_bytes" > "${CSV}"
fi
if [[ "${BASELINE}" -eq 1 ]]; then
  echo "0,0,${result},${status},${BASELINE_OUT},${BASELINE_ERR},${dump_path},${metric_abs_max},${metric_mean_abs},${metric_rmse},${metric_max_rel},${metric_mean_rel},${metric_p95_abs},${metric_p99_abs},${metric_num_bad},${metric_frac_bad},${metric_max_ulp},${metric_mean_ulp},${metric_ham_bits},${metric_ham_bytes},${metric_size_bytes}" >> "${CSV}"
else
  echo "${SITE_ID},${BIT_INDEX},${result},${status},${RUN_OUT},${RUN_ERR},${dump_path},${metric_abs_max},${metric_mean_abs},${metric_rmse},${metric_max_rel},${metric_mean_rel},${metric_p95_abs},${metric_p99_abs},${metric_num_bad},${metric_frac_bad},${metric_max_ulp},${metric_mean_ulp},${metric_ham_bits},${metric_ham_bytes},${metric_size_bytes}" >> "${CSV}"
fi

if [[ "${BASELINE}" -eq 1 ]]; then
  echo "Result: ${result} (exit ${status})" >> "${BASELINE_OUT}"
else
  echo "Result: ${result} (exit ${status})" >> "${RUN_OUT}"
fi
echo "Result: ${result} (exit ${status})"
end_ns=$(date +%s%N)
dur_ms=$(( (end_ns - start_ns) / 1000000 ))
if [[ "${BASELINE}" -eq 1 ]]; then
  echo "timing_ms: ${dur_ms}" >> "${BASELINE_OUT}"
else
  echo "timing_ms: ${dur_ms}" >> "${RUN_OUT}"
fi
