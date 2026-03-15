#!/usr/bin/env bash
set -euo pipefail
set -E
ulimit -c 0
if [[ "${DEBUG_TIMING:-0}" -eq 1 ]]; then
  trap 'echo "[error] line ${LINENO}: ${BASH_COMMAND}" >&2' ERR
  set -x
  {
    echo "[env] SYCL_DEVICE_FILTER=${SYCL_DEVICE_FILTER:-}"
    echo "[env] ONEAPI_DEVICE_SELECTOR=${ONEAPI_DEVICE_SELECTOR:-}"
    echo "[env] ZE_AFFINITY_MASK=${ZE_AFFINITY_MASK:-}"
    echo "[env] LD_LIBRARY_PATH=${LD_LIBRARY_PATH:-}"
    ldconfig -p 2>/dev/null | grep -E 'libsycl|libze' || true
  } >&2
fi

ts() { date +"%Y-%m-%d %H:%M:%S"; }
ts_utc() { date -u +"%F %T"; }
step() {
  if [[ "${DEBUG_TIMING:-0}" -eq 1 ]]; then
    echo "[timing] $(ts) $*"
  fi
}

now_s() { date +%s; }

# Ensure module command exists on compute nodes.
if ! command -v module &> /dev/null; then
  if [[ -f /etc/profile.d/modules.sh ]]; then
    # shellcheck disable=SC1091
    source /etc/profile.d/modules.sh
  fi
fi

if command -v module &> /dev/null; then
  module purge || true
  module use /opt/aurora/25.190.0/spack/unified/0.10.1/install/modulefiles/Core 2>/dev/null || true
  module use /opt/aurora/25.190.0/modulefiles 2>/dev/null || true
  module load oneapi/release/2025.2.0 2>/dev/null || \
  module load oneapi/release/2025.0.5 2>/dev/null || \
  module load oneapi/release/2024.2.1 2>/dev/null || \
  module load oneapi/eng-compiler/2024.07.30.002 2>/dev/null || true
fi

# Ensure runtime sees GPUs.
export SYCL_DEVICE_FILTER="${SYCL_DEVICE_FILTER:-level_zero:gpu}"
export ONEAPI_DEVICE_SELECTOR="${ONEAPI_DEVICE_SELECTOR:-level_zero:gpu}"
if [[ -n "${ZE_AFFINITY_MASK:-}" ]]; then
  export ZE_AFFINITY_MASK
fi
REPO_ROOT="${REPO_ROOT:-$(pwd)}"
DEFAULT_SYCL_BIN="/opt/aurora/25.190.0/oneapi/compiler/latest/bin"
DEFAULT_SYCL_COMPILER_BIN="/opt/aurora/25.190.0/oneapi/compiler/latest/bin/compiler"
ALT_SYCL_BIN="/opt/aurora/25.190.0/oneapi/compiler/2025.2/bin"
ALT_SYCL_COMPILER_BIN="/opt/aurora/25.190.0/oneapi/compiler/2025.2/bin/compiler"
ICPX="${ICPX:-}"
SYCL_POST_LINK="${SYCL_POST_LINK:-}"
POSTLINK_SPLIT="${POSTLINK_SPLIT:-kernel}"
LLVM_SPIRV="${LLVM_SPIRV:-}"
CLANG_OFFLOAD_BUNDLER="${CLANG_OFFLOAD_BUNDLER:-}"
CLANG_OFFLOAD_WRAPPER="${CLANG_OFFLOAD_WRAPPER:-}"
CLANG_BIN="${CLANG_BIN:-}"

POSTLINK_SPLIT_ARG=(--split="${POSTLINK_SPLIT}")
if [[ -z "${POSTLINK_SPLIT}" || "${POSTLINK_SPLIT}" == "none" ]]; then
  echo "[postlink] POSTLINK_SPLIT='${POSTLINK_SPLIT}' not supported by sycl-post-link; omitting --split" >&2
  POSTLINK_SPLIT_ARG=()
fi

if [[ -z "${ICPX}" ]]; then
  if command -v icpx &> /dev/null; then
    ICPX="$(command -v icpx)"
  else
    for cand in \
      "${DEFAULT_SYCL_BIN}/icpx" \
      "${ALT_SYCL_BIN}/icpx" \
      "${DEFAULT_SYCL_COMPILER_BIN}/icpx" \
      "${ALT_SYCL_COMPILER_BIN}/icpx"; do
      if [[ -x "${cand}" ]]; then
        ICPX="${cand}"
        break
      fi
    done
  fi
fi
if [[ -z "${ICPX}" || ! -x "${ICPX}" ]]; then
  echo "icpx not found (set ICPX or load oneAPI)"
  exit 1
fi

# Fill in other oneAPI tools if not already provided.
SYCL_POST_LINK="${SYCL_POST_LINK:-$(command -v sycl-post-link || true)}"
LLVM_SPIRV="${LLVM_SPIRV:-$(command -v llvm-spirv || true)}"
CLANG_OFFLOAD_BUNDLER="${CLANG_OFFLOAD_BUNDLER:-$(command -v clang-offload-bundler || true)}"
CLANG_OFFLOAD_WRAPPER="${CLANG_OFFLOAD_WRAPPER:-$(command -v clang-offload-wrapper || true)}"
CLANG_BIN="${CLANG_BIN:-$(command -v clang++ || true)}"

if [[ -z "${SYCL_POST_LINK}" || ! -x "${SYCL_POST_LINK}" ]]; then
  for cand in \
    "${DEFAULT_SYCL_COMPILER_BIN}/sycl-post-link" \
    "${ALT_SYCL_COMPILER_BIN}/sycl-post-link" \
    "${DEFAULT_SYCL_BIN}/sycl-post-link" \
    "${ALT_SYCL_BIN}/sycl-post-link"; do
    if [[ -x "${cand}" ]]; then
      SYCL_POST_LINK="${cand}"
      break
    fi
  done
fi
if [[ -z "${LLVM_SPIRV}" || ! -x "${LLVM_SPIRV}" ]]; then
  for cand in \
    "${DEFAULT_SYCL_COMPILER_BIN}/llvm-spirv" \
    "${ALT_SYCL_COMPILER_BIN}/llvm-spirv" \
    "${DEFAULT_SYCL_BIN}/llvm-spirv" \
    "${ALT_SYCL_BIN}/llvm-spirv"; do
    if [[ -x "${cand}" ]]; then
      LLVM_SPIRV="${cand}"
      break
    fi
  done
fi
if [[ -z "${CLANG_OFFLOAD_BUNDLER}" || ! -x "${CLANG_OFFLOAD_BUNDLER}" ]]; then
  for cand in \
    "${DEFAULT_SYCL_COMPILER_BIN}/clang-offload-bundler" \
    "${ALT_SYCL_COMPILER_BIN}/clang-offload-bundler" \
    "${DEFAULT_SYCL_BIN}/clang-offload-bundler" \
    "${ALT_SYCL_BIN}/clang-offload-bundler"; do
    if [[ -x "${cand}" ]]; then
      CLANG_OFFLOAD_BUNDLER="${cand}"
      break
    fi
  done
fi
if [[ -z "${CLANG_OFFLOAD_WRAPPER}" || ! -x "${CLANG_OFFLOAD_WRAPPER}" ]]; then
  for cand in \
    "${DEFAULT_SYCL_COMPILER_BIN}/clang-offload-wrapper" \
    "${ALT_SYCL_COMPILER_BIN}/clang-offload-wrapper" \
    "${DEFAULT_SYCL_BIN}/clang-offload-wrapper" \
    "${ALT_SYCL_BIN}/clang-offload-wrapper"; do
    if [[ -x "${cand}" ]]; then
      CLANG_OFFLOAD_WRAPPER="${cand}"
      break
    fi
  done
fi
if [[ -z "${CLANG_BIN}" || ! -x "${CLANG_BIN}" ]]; then
  for cand in \
    "${DEFAULT_SYCL_COMPILER_BIN}/clang++" \
    "${ALT_SYCL_COMPILER_BIN}/clang++" \
    "${DEFAULT_SYCL_BIN}/clang++" \
    "${ALT_SYCL_BIN}/clang++"; do
    if [[ -x "${cand}" ]]; then
      CLANG_BIN="${cand}"
      break
    fi
  done
fi

LOCAL_LLVM_BIN="${REPO_ROOT}/HeCBench/tools/llvm17_inject/llvm/build/bin"
if [[ -x "${REPO_ROOT}/HeCBench/tools/llvm17_inject/llvm/build-spirv2/bin/opt" ]]; then
  LOCAL_LLVM_BIN="${REPO_ROOT}/HeCBench/tools/llvm17_inject/llvm/build-spirv2/bin"
fi

# Prefer a spack LLVM when no OPT_BIN is explicitly provided, since local builds
# may not match the FI plugin ABI (causing "Failed to load passes" errors).
if [[ -z "${OPT_BIN:-}" ]]; then
  LLVM_CONFIG_FALLBACK="$(find /opt/aurora/25.190.0/spack/unified -name llvm-config -print -quit 2>/dev/null || true)"
  if [[ -n "${LLVM_CONFIG_FALLBACK}" && -x "${LLVM_CONFIG_FALLBACK}" ]]; then
    LLVM_CONFIG="${LLVM_CONFIG_FALLBACK}"
    LLVM_BINDIR="$(${LLVM_CONFIG} --bindir)"
    OPT_BIN="${LLVM_BINDIR}/opt"
    LLVM_AS="${LLVM_BINDIR}/llvm-as"
    LLVM_DIS="${LLVM_BINDIR}/llvm-dis"
    echo "[opt] using spack LLVM: ${OPT_BIN}"
  fi
fi

OPT_BIN="${OPT_BIN:-${LOCAL_LLVM_BIN}/opt}"
LLVM_CONFIG="${LLVM_CONFIG:-${LOCAL_LLVM_BIN}/llvm-config}"

if [[ ! -x "${OPT_BIN}" || ! -x "${LLVM_CONFIG}" ]]; then
  LLVM_CONFIG_FALLBACK="$(find /opt/aurora/25.190.0/spack/unified -name llvm-config -print -quit 2>/dev/null || true)"
  if [[ -n "${LLVM_CONFIG_FALLBACK}" && -x "${LLVM_CONFIG_FALLBACK}" ]]; then
    LLVM_CONFIG="${LLVM_CONFIG_FALLBACK}"
    LLVM_BINDIR="$(${LLVM_CONFIG} --bindir)"
    OPT_BIN="${LLVM_BINDIR}/opt"
    LLVM_AS="${LLVM_BINDIR}/llvm-as"
    LLVM_DIS="${LLVM_BINDIR}/llvm-dis"
  fi
fi

if [[ ! -x "${OPT_BIN}" ]]; then
  echo "opt not found (set OPT_BIN or install LLVM with opt in PATH)"
  exit 1
fi

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
EXTRA_INCLUDES=()
PREP_ONLY="${PREP_ONLY:-0}"
RUN_ONLY="${RUN_ONLY:-0}"
PREP_DIR="${PREP_DIR:-}"
INPUT_PROFILE="${INPUT_PROFILE:-small}"

if [[ "${INPUT_PROFILE}" == "small" ]]; then
  MATRIX_SIZE="${MATRIX_SIZE:-2048}"
  MATRIX_REPEAT="${MATRIX_REPEAT:-2}"
  LAYOUT_REPEAT="${LAYOUT_REPEAT:-10}"
  PATHFINDER_COLS="${PATHFINDER_COLS:-500}"
  PATHFINDER_ROWS="${PATHFINDER_ROWS:-500}"
  PATHFINDER_PYRAMID="${PATHFINDER_PYRAMID:-32}"
  ENTROPY_WIDTH="${ENTROPY_WIDTH:-2048}"
  ENTROPY_HEIGHT="${ENTROPY_HEIGHT:-2048}"
  ENTROPY_REPEAT="${ENTROPY_REPEAT:-2}"
  COLORWHEEL_RANGE="${COLORWHEEL_RANGE:-1.0}"
  COLORWHEEL_SIZE="${COLORWHEEL_SIZE:-2048}"
  COLORWHEEL_REPEAT="${COLORWHEEL_REPEAT:-2}"
  RANDOMACCESS_REPEAT="${RANDOMACCESS_REPEAT:-1}"
  DENSE_ROWS="${DENSE_ROWS:-2000}"
  DENSE_BATCH="${DENSE_BATCH:-32}"
  DENSE_REPEAT="${DENSE_REPEAT:-2}"
fi

if [[ -z "${BENCH}" ]]; then
  echo "BENCH is required"
  exit 1
fi

PLUGIN_DIR="${PLUGIN_DIR:-${REPO_ROOT}/HeCBench/tools/llvm17_inject}"
PLUGIN="${PLUGIN:-${PLUGIN_DIR}/libfi_inject.so}"
if [[ ! -f "${PLUGIN}" ]]; then
  echo "Missing plugin: ${PLUGIN}"
  exit 1
fi

case "${BENCH}" in
  matrix-rotate)
    SRC_DIR="HeCBench/src/matrix-rotate-sycl"
    RUN_ARGS=("${MATRIX_SIZE:-8192}" "${MATRIX_REPEAT:-10}")
    GOLDEN_NAME="matrix-rotate_${MATRIX_SIZE:-8192}_${MATRIX_REPEAT:-10}.bin"
    ;;
  jacobi)
    SRC_DIR="HeCBench/src/jacobi-sycl"
    RUN_ARGS=()
    GOLDEN_NAME="jacobi.bin"
    ;;
  layout)
    SRC_DIR="HeCBench/src/layout-sycl"
    RUN_ARGS=("${LAYOUT_REPEAT:-20}")
    GOLDEN_NAME="layout.bin"
    ;;
  dense-embedding)
    SRC_DIR="HeCBench/src/dense-embedding-sycl"
    RUN_ARGS=("${DENSE_ROWS:-1024}" "${DENSE_BATCH:-16}" "${DENSE_REPEAT:-1}")
    GOLDEN_NAME="dense-embedding.bin"
    ;;
  pathfinder)
    SRC_DIR="HeCBench/src/pathfinder-sycl"
    RUN_ARGS=("${PATHFINDER_COLS:-1000}" "${PATHFINDER_ROWS:-1000}" "${PATHFINDER_PYRAMID:-100}")
    GOLDEN_NAME="pathfinder.bin"
    ;;
  entropy)
    SRC_DIR="HeCBench/src/entropy-sycl"
    RUN_ARGS=("${ENTROPY_WIDTH:-4096}" "${ENTROPY_HEIGHT:-4096}" "${ENTROPY_REPEAT:-5}")
    GOLDEN_NAME="entropy.bin"
    EXTRA_INCLUDES=("${REPO_ROOT}/HeCBench/src/entropy-cuda")
    ;;
  colorwheel)
    SRC_DIR="HeCBench/src/colorwheel-sycl"
    RUN_ARGS=("${COLORWHEEL_RANGE:-1.0}" "${COLORWHEEL_SIZE:-4096}" "${COLORWHEEL_REPEAT:-5}")
    GOLDEN_NAME="colorwheel.bin"
    ;;
  randomAccess)
    SRC_DIR="HeCBench/src/randomAccess-sycl"
    RUN_ARGS=("${RANDOMACCESS_REPEAT:-3}")
    GOLDEN_NAME="randomAccess.bin"
    ;;
  *)
    echo "Unknown BENCH: ${BENCH}"
    exit 1
    ;;
esac

SRC="${REPO_ROOT}/${SRC_DIR}/main.cpp"
BENCH_DIR="${REPO_ROOT}/${SRC_DIR}"
GOLDEN_ROOT="${GOLDEN_ROOT:-${REPO_ROOT}/Aurora_Sycl_Golden_Outputs_small}"
GOLDEN="${GOLDEN:-${GOLDEN_ROOT}/${GOLDEN_NAME}}"

if [[ "${PERF_MODE:-0}" -eq 1 ]]; then
  if [[ -n "${PBS_JOBTMP:-}" && -d "${PBS_JOBTMP}" ]]; then
    OUT_DIR_BASE="${OUT_DIR_BASE:-${PBS_JOBTMP}/llvm17-inject-${BENCH}-sycl}"
  elif [[ -n "${TMPDIR:-}" && -d "${TMPDIR}" ]]; then
    OUT_DIR_BASE="${OUT_DIR_BASE:-${TMPDIR}/llvm17-inject-${BENCH}-sycl}"
  else
    OUT_DIR_BASE="${OUT_DIR_BASE:-/tmp/llvm17-inject-${BENCH}-sycl}"
  fi
else
  OUT_DIR_BASE="${OUT_DIR_BASE:-${REPO_ROOT}/HeCBench/build/llvm17-inject-${BENCH}-sycl}"
fi
if [[ "${RUN_ONLY}" -eq 1 && -n "${PREP_DIR}" ]]; then
  OUT_DIR="${OUT_DIR:-${PREP_DIR}}"
else
  OUT_DIR="${OUT_DIR:-${OUT_DIR_BASE}/site${SITE_ID}_bit${BIT_INDEX}_pid$$}"
fi
BIN_PATH="${OUT_DIR}/${BENCH}"
RESULTS_PROFILE="${RESULTS_PROFILE:-small}"
RESULTS_DIR="${RESULTS_DIR:-${REPO_ROOT}/HeCBench/results/llvm17_inject/${BENCH}-sycl-${RESULTS_PROFILE}}"
mkdir -p "${OUT_DIR}" "${RESULTS_DIR}"

RUN_DUMP_TMP="${OUT_DIR}/${BENCH}_site${SITE_ID}_bit${BIT_INDEX}.bin"
RUN_DUMP_FINAL="${RESULTS_DIR}/${BENCH}_site${SITE_ID}_bit${BIT_INDEX}.bin"
AGGREGATE_LOGS="${AGGREGATE_LOGS:-0}"
AGG_OUT="${RESULTS_DIR}/aggregate.out"
AGG_ERR="${RESULTS_DIR}/aggregate.err"
RUN_OUT="${RESULTS_DIR}/site${SITE_ID}_bit${BIT_INDEX}.out"
RUN_ERR="${RESULTS_DIR}/site${SITE_ID}_bit${BIT_INDEX}.err"
RUN_OUT_LOCAL="${RUN_OUT}"
RUN_ERR_LOCAL="${RUN_ERR}"
if [[ "${AGGREGATE_LOGS}" -eq 1 ]]; then
  RUN_OUT="${AGG_OUT}"
  RUN_ERR="${AGG_ERR}"
  RUN_OUT_LOCAL="${OUT_DIR}/run.out"
  RUN_ERR_LOCAL="${OUT_DIR}/run.err"
fi
WRITE_SUMMARY="${WRITE_SUMMARY:-0}"
CSV="${CSV:-${RESULTS_DIR}/summary.csv}"
KERNEL_TIMING_LOG="${KERNEL_TIMING_LOG:-}"
if [[ -z "${KERNEL_TIMING_LOG}" && "${HECBENCH_TIMING_DEBUG:-0}" -eq 1 ]]; then
  KERNEL_TIMING_LOG="${RESULTS_DIR}/kernel_timing.log"
fi
SITE_METADATA_CSV="${SITE_METADATA_CSV:-${RESULTS_DIR}/sites_metadata.csv}"
if [[ ! -f "${SITE_METADATA_CSV}" ]]; then
  SITE_METADATA_CSV="${REPO_ROOT}/HeCBench/results/llvm17_inject/${BENCH}-sycl/sites_metadata.csv"
fi

mkdir -p "${RESULTS_DIR}" "${OUT_DIR}"

append_aggregate() {
  local src="$1"
  local dst="$2"
  if command -v flock >/dev/null 2>&1; then
    flock "${dst}" -c "cat \"${src}\" >> \"${dst}\"" || return 1
  else
    cat "${src}" >> "${dst}" || return 1
  fi
}

progress_ping() { :; }

log_timing_metric() {
  local name="$1"
  local seconds="$2"
  if [[ -n "${KERNEL_TIMING_LOG:-}" ]]; then
    echo "[timing] ${name} site=${SITE_ID} bit=${BIT_INDEX} seconds=${seconds}" >> "${KERNEL_TIMING_LOG}"
  fi
}

lookup_site_function() {
  local metadata_csv="$1"
  local site_id="$2"
  [[ -f "${metadata_csv}" ]] || return 1
  python3 - "${metadata_csv}" "${site_id}" <<'PY'
import csv, sys
path = sys.argv[1]
site_id = sys.argv[2]
with open(path, newline='', encoding='utf-8', errors='replace') as fh:
    for row in csv.DictReader(fh):
        if row.get('site_id') == site_id:
            print(row.get('function', ''))
            sys.exit(0)
sys.exit(1)
PY
}

filter_postlink_lines_for_site() {
  local site_function="$1"
  shift
  local matched=()
  local line sym_path
  if [[ -z "${site_function}" ]]; then
    printf '%s\n' "$@"
    return 0
  fi
  for line in "$@"; do
    sym_path="${line##*|}"
    if [[ -f "${sym_path}" ]] && grep -Fq "${site_function}" "${sym_path}" 2>/dev/null; then
      matched+=("${line}")
    fi
  done
  if [[ "${#matched[@]}" -gt 0 ]]; then
    printf '%s\n' "${matched[@]}"
  else
    printf '%s\n' "$@"
  fi
}

STAGE_TIMEOUT_SEC="${STAGE_TIMEOUT_SEC:-0}"
TIMEOUT_KILL_SEC="${TIMEOUT_KILL_SEC:-30}"
TIMEOUT_COMPILE="${TIMEOUT_COMPILE:-${STAGE_TIMEOUT_SEC}}"
TIMEOUT_UNBUNDLE="${TIMEOUT_UNBUNDLE:-${STAGE_TIMEOUT_SEC}}"
TIMEOUT_OPT="${TIMEOUT_OPT:-${STAGE_TIMEOUT_SEC}}"
TIMEOUT_REASSEMBLE="${TIMEOUT_REASSEMBLE:-${STAGE_TIMEOUT_SEC}}"
TIMEOUT_POSTLINK="${TIMEOUT_POSTLINK:-${STAGE_TIMEOUT_SEC}}"
TIMEOUT_SPIRV="${TIMEOUT_SPIRV:-${STAGE_TIMEOUT_SEC}}"
TIMEOUT_WRAP="${TIMEOUT_WRAP:-${STAGE_TIMEOUT_SEC}}"
TIMEOUT_LINK="${TIMEOUT_LINK:-${STAGE_TIMEOUT_SEC}}"
TIMEOUT_RUN="${TIMEOUT_RUN:-${STAGE_TIMEOUT_SEC}}"

stage_timeout() {
  local stage="$1"
  local timeout_sec="$2"
  shift 2
  if [[ "${timeout_sec}" -gt 0 ]]; then
    echo "[timeout] stage=${stage} limit=${timeout_sec}s"
    timeout -k "${TIMEOUT_KILL_SEC}" "${timeout_sec}" "$@"
    local rc=$?
    if [[ "${rc}" -eq 124 || "${rc}" -eq 137 ]]; then
      echo "[timeout] stage=${stage} rc=${rc}"
    fi
    return "${rc}"
  fi
  "$@"
}

COMPARE_FLOAT="${REPO_ROOT}/HeCBench/tools/llvm17_inject/compare_matrix_dump.py"
COMPARE_EXACT="${REPO_ROOT}/HeCBench/tools/llvm17_inject/compare_binary_exact.py"
SDC_METRICS="${REPO_ROOT}/HeCBench/tools/llvm17_inject/compute_sdc_metrics.py"
REDUCE_LOGGING="${REDUCE_LOGGING:-1}"
COMPARE_WORKERS="${COMPARE_WORKERS:-1}"
COMPARE_PROGRESS_INTERVAL="${COMPARE_PROGRESS_INTERVAL:-5}"
BASELINE_PATH="${BASELINE_PATH:-${RESULTS_DIR}/baseline_${BENCH}.bin}"
BASELINE_DIR="${BASELINE_DIR:-${RESULTS_DIR}/baseline}"
BASELINE_OUT="${BASELINE_DIR}/baseline.out"
BASELINE_ERR="${BASELINE_DIR}/baseline.err"

IR_BC="${OUT_DIR}/device.bc"
IR_INJ_LL="${OUT_DIR}/device.injected.ll"
IR_INJ_ONEAPI_BC="${OUT_DIR}/device.injected.oneapi.bc"
POSTLINK_TABLE="${OUT_DIR}/postlink.table"
POSTLINK_LOG_DIR="${POSTLINK_LOG_DIR:-${OUT_DIR}}"
POSTLINK_TIMING_LOG="${POSTLINK_LOG_DIR}/postlink_timing.log"
WRITE_STAGE_DEBUG_LOGS="${WRITE_STAGE_DEBUG_LOGS:-0}"
OPT_TIMING_LOG="${OPT_TIMING_LOG:-${OUT_DIR}/opt_timing.log}"
TIMING_DEBUG="${HECBENCH_TIMING_DEBUG:-0}"
if [[ "${WRITE_STAGE_DEBUG_LOGS}" -eq 0 ]]; then
  POSTLINK_TIMING_LOG="/dev/null"
  OPT_TIMING_LOG="/dev/null"
fi
SPV_FILE="${OUT_DIR}/device.injected.spv"
WRAPPER_BCS=()
HOST_OBJ="${OUT_DIR}/host.o"
BUNDLE_OBJ="${OUT_DIR}/bundle.o"
WRAPPER_LIST="${OUT_DIR}/wrapper.list"

USE_CACHE="${USE_CACHE:-1}"
USE_OPT_BC="${USE_OPT_BC:-1}"
USE_DEVICE_CACHE="${USE_DEVICE_CACHE:-1}"
OPT_TRIPLE_OVERRIDE="${OPT_TRIPLE_OVERRIDE:-}"
SERIALIZE_OPT="${SERIALIZE_OPT:-0}"
OPT_LOCK_FILE="${OPT_LOCK_FILE:-/tmp/fi_opt_lock}"
if [[ -n "${TMPDIR:-}" ]]; then
  CACHE_DIR="${CACHE_DIR:-${TMPDIR}/llvm17-inject-${BENCH}-sycl-cache}"
else
  CACHE_DIR="${CACHE_DIR:-${OUT_DIR_BASE}/cache}"
fi
CACHE_BUNDLE="${CACHE_DIR}/bundle.o"
CACHE_HOST="${CACHE_DIR}/host.o"
CACHE_DEVICE_BC="${CACHE_DIR}/device.bc"
if [[ "${RUN_ONLY}" -eq 0 && "${USE_CACHE}" -eq 1 ]]; then
  mkdir -p "${CACHE_DIR}"
  if [[ ! -f "${CACHE_BUNDLE}" || ! -f "${CACHE_HOST}" || ! -f "${CACHE_DEVICE_BC}" ]]; then
    LOCK_DIR="${CACHE_DIR}.lock"
    lock_waits=0
    CACHE_LOCK_MAX_WAIT_SEC="${CACHE_LOCK_MAX_WAIT_SEC:-0}"
    until mkdir "${LOCK_DIR}" 2>/dev/null; do
      lock_waits=$((lock_waits + 1))
      if (( lock_waits % 10 == 0 )); then
        echo "[cache] waiting for lock ${LOCK_DIR} (${lock_waits}s)"
      fi
      if [[ "${CACHE_LOCK_MAX_WAIT_SEC}" -gt 0 && "${lock_waits}" -gt "${CACHE_LOCK_MAX_WAIT_SEC}" ]]; then
        echo "[cache] lock wait exceeded ${CACHE_LOCK_MAX_WAIT_SEC}s at ${LOCK_DIR}"
        exit 99
      fi
      progress_ping
      sleep 1
    done
    echo "[cache] lock acquired ${LOCK_DIR}"
    if [[ ! -f "${CACHE_BUNDLE}" || ! -f "${CACHE_HOST}" || ! -f "${CACHE_DEVICE_BC}" ]]; then
      echo "[cache] miss: generating device.bc/host.o/bundle.o in ${CACHE_DIR}"
      step "compile: icpx -fsycl (cache)"
      progress_ping
      stage_timeout compile "${TIMEOUT_COMPILE}" ${ICPX} -fsycl -fsycl-targets=spir64 -O0 -g0 -DUSE_GPU \
        -I "${BENCH_DIR}" \
        -I "${REPO_ROOT}/HeCBench/src" \
        ${EXTRA_INCLUDES:+${EXTRA_INCLUDES[@]/#/-I }} \
        -c "${SRC}" -o "${CACHE_BUNDLE}"
      step "unbundle: clang-offload-bundler (cache)"
      progress_ping
      stage_timeout unbundle "${TIMEOUT_UNBUNDLE}" ${CLANG_OFFLOAD_BUNDLER} --unbundle --type=o \
        --input="${CACHE_BUNDLE}" \
        --output="${CACHE_HOST}" \
        --output="${CACHE_DEVICE_BC}" \
        --targets=host-x86_64-unknown-linux-gnu,sycl-spir64-unknown-unknown
      echo "[cache] generated: ${CACHE_DEVICE_BC}"
    fi
    rmdir "${LOCK_DIR}" || true
  fi
  HOST_OBJ="${CACHE_HOST}"
  IR_BC="${CACHE_DEVICE_BC}"
  if [[ -f "${CACHE_DEVICE_BC}" ]]; then
    echo "[cache] hit: ${CACHE_DEVICE_BC}"
  fi
fi

# Ensure prep dir has a device.bc for RUN_ONLY workers.
if [[ "${RUN_ONLY}" -eq 0 && "${USE_CACHE}" -eq 1 ]]; then
  mkdir -p "${OUT_DIR}"
  if [[ "${IR_BC}" != "${OUT_DIR}/device.bc" ]]; then
    ln -sf "${IR_BC}" "${OUT_DIR}/device.bc"
  fi
  if [[ "${HOST_OBJ}" != "${OUT_DIR}/host.o" ]]; then
    ln -sf "${HOST_OBJ}" "${OUT_DIR}/host.o"
  fi
  if [[ -n "${CACHE_BUNDLE:-}" && "${CACHE_BUNDLE}" != "${OUT_DIR}/bundle.o" ]]; then
    ln -sf "${CACHE_BUNDLE}" "${OUT_DIR}/bundle.o"
  fi
fi

if [[ "${CACHE_ONLY:-0}" -eq 1 ]]; then
  echo "[cache] cache-only complete for bench=${BENCH}"
  exit 0
fi

SKIP_EXISTING="${SKIP_EXISTING:-1}"
if [[ "${BASELINE}" -eq 0 && "${SKIP_EXISTING}" -eq 1 && -f "${RUN_OUT}" && -f "${RUN_ERR}" ]]; then
  if grep -q '^Result:' "${RUN_OUT}"; then
    echo "[inject] skip existing site=${SITE_ID} bit=${BIT_INDEX}"
    if [[ "${PREP_ONLY}" -eq 1 ]]; then
      # Prevent PREP_ONLY from enqueuing a ready file without artifacts.
      exit 2
    fi
    exit 0
  fi
fi

if [[ ! -f "${GOLDEN}" ]]; then
  echo "Golden file not found: ${GOLDEN}"
  exit 1
fi

if [[ "${RUN_ONLY}" -eq 0 && "${USE_CACHE}" -eq 0 ]]; then
  step "compile: icpx -fsycl"
  progress_ping
  stage_timeout compile "${TIMEOUT_COMPILE}" ${ICPX} -fsycl -fsycl-targets=spir64 -O0 -g0 -DUSE_GPU \
    -I "${BENCH_DIR}" \
    -I "${REPO_ROOT}/HeCBench/src" \
    ${EXTRA_INCLUDES:+${EXTRA_INCLUDES[@]/#/-I }} \
    -c "${SRC}" -o "${BUNDLE_OBJ}"

  step "unbundle: clang-offload-bundler"
  progress_ping
  stage_timeout unbundle "${TIMEOUT_UNBUNDLE}" ${CLANG_OFFLOAD_BUNDLER} --unbundle --type=o \
    --input="${BUNDLE_OBJ}" \
    --output="${HOST_OBJ}" \
    --output="${IR_BC}" \
    --targets=host-x86_64-unknown-linux-gnu,sycl-spir64-unknown-unknown
fi

IR_FOR_POSTLINK="${IR_BC}"
if [[ "${RUN_ONLY}" -eq 0 && "${BASELINE}" -ne 1 ]]; then
  opt_start="$(now_s)"
  step "inject: opt fi-inject"
  progress_ping
  if [[ "${SERIALIZE_OPT}" -eq 1 ]]; then
    exec 9>"${OPT_LOCK_FILE}"
    flock 9
  fi
  opt_args=(
    -load-pass-plugin "${PLUGIN}"
    -passes=fi-inject
    -fi-site="${SITE_ID}"
    -fi-bit="${BIT_INDEX}"
    -fi-target="${INJECT_TARGET}"
    -fi-int-float-only="${INT_FLOAT_ONLY}"
    -fi-include-constants="${INCLUDE_CONSTANTS}"
  )
  if [[ -n "${OPT_TRIPLE_OVERRIDE}" ]]; then
    opt_args+=("-mtriple=${OPT_TRIPLE_OVERRIDE}")
  fi
  opt_args+=("${IR_BC}")
  if [[ "${USE_OPT_BC}" -eq 1 ]]; then
    opt_args+=(-o "${IR_INJ_ONEAPI_BC}")
  else
    opt_args+=(-S -o "${IR_INJ_LL}")
  fi

  if [[ "${TIMING_DEBUG}" -eq 1 ]]; then
    echo "[opt] $(ts_utc) start" >> "${OPT_TIMING_LOG}"
    echo "[opt] cmd: ${OPT_BIN} ${opt_args[*]}" >> "${OPT_TIMING_LOG}"
    if [[ -f "${IR_BC}" ]]; then
      echo "[opt] input: ${IR_BC} $(stat -c '%s bytes' "${IR_BC}")" >> "${OPT_TIMING_LOG}"
    fi
  fi
  if [[ "${SUPPRESS_OPT_WARNINGS:-0}" -eq 1 ]]; then
    stage_timeout opt "${TIMEOUT_OPT}" ${OPT_BIN} "${opt_args[@]}" 2>"${OUT_DIR}/opt_warnings.log"
    opt_rc=$?
  else
    stage_timeout opt "${TIMEOUT_OPT}" ${OPT_BIN} "${opt_args[@]}"
    opt_rc=$?
  fi
  if [[ "${TIMING_DEBUG}" -eq 1 ]]; then
    echo "[opt] rc=${opt_rc} end $(ts_utc)" >> "${OPT_TIMING_LOG}"
  fi
  if [[ "${SERIALIZE_OPT}" -eq 1 ]]; then
    flock -u 9
    exec 9>&-
  fi
  step "inject: opt done"
  opt_end="$(now_s)"
  echo "[timing] opt_seconds=$((opt_end - opt_start))"
  if [[ "${USE_OPT_BC}" -eq 1 ]]; then
    if [[ -f "${IR_INJ_ONEAPI_BC}" ]]; then
      if [[ "${TIMING_DEBUG}" -eq 1 ]]; then
        echo "[opt] output: ${IR_INJ_ONEAPI_BC} $(stat -c '%s bytes' "${IR_INJ_ONEAPI_BC}")" >> "${OPT_TIMING_LOG}"
      fi
    fi
  else
    if [[ -f "${IR_INJ_LL}" ]]; then
      if [[ "${TIMING_DEBUG}" -eq 1 ]]; then
        echo "[opt] output: ${IR_INJ_LL} $(stat -c '%s bytes' "${IR_INJ_LL}")" >> "${OPT_TIMING_LOG}"
      fi
    fi
  fi
  if [[ "${USE_OPT_BC}" -eq 1 ]]; then
    IR_FOR_POSTLINK="${IR_INJ_ONEAPI_BC}"
  else
    step "reassemble: clang -emit-llvm"
    progress_ping
    stage_timeout reassemble "${TIMEOUT_REASSEMBLE}" ${CLANG_BIN} -target spir64-unknown-unknown -x ir -emit-llvm -c "${IR_INJ_LL}" -o "${IR_INJ_ONEAPI_BC}"
    IR_FOR_POSTLINK="${IR_INJ_ONEAPI_BC}"
  fi
fi

CACHE_WRAPPER_LIST=""
if [[ "${RUN_ONLY}" -eq 0 && "${USE_DEVICE_CACHE}" -eq 1 && "${BASELINE}" -ne 1 ]]; then
  step "device-cache: enter"
  echo "[device-cache] $(ts) enter site=${SITE_ID} bit=${BIT_INDEX}" | tee -a "${POSTLINK_TIMING_LOG}"
  progress_ping
  CACHE_KEY="site${SITE_ID}_bit${BIT_INDEX}_t${INJECT_TARGET}_io${INT_FLOAT_ONLY}_c${INCLUDE_CONSTANTS}"
  CACHE_DEVICE_DIR="${CACHE_DIR}/device/${CACHE_KEY}"
  CACHE_WRAPPER_LIST="${CACHE_DEVICE_DIR}/wrapper.list"
  mkdir -p "${CACHE_DIR}/device"
  if [[ -f "${CACHE_WRAPPER_LIST}" ]]; then
    step "device-cache: wrapper.bc hit"
    echo "[device-cache] $(ts) wrapper.bc hit ${CACHE_DEVICE_DIR}" | tee -a "${POSTLINK_TIMING_LOG}"
    while read -r name; do
      [[ -z "${name}" ]] && continue
      WRAPPER_BCS+=("${CACHE_DEVICE_DIR}/${name}")
    done < "${CACHE_WRAPPER_LIST}"
    : > "${WRAPPER_LIST}"
    for bc in "${WRAPPER_BCS[@]}"; do
      echo "${bc}" >> "${WRAPPER_LIST}"
    done
  else
    LOCK_DIR="${CACHE_DEVICE_DIR}.lock"
    lock_waits=0
    lock_start="$(now_s)"
    until mkdir "${LOCK_DIR}" 2>/dev/null; do
      lock_waits=$((lock_waits + 1))
      if (( lock_waits % 10 == 0 )); then
        echo "[device-cache] $(ts) waiting for lock ${LOCK_DIR} (${lock_waits}s)" | tee -a "${POSTLINK_TIMING_LOG}"
      fi
      sleep 1
    done
    lock_end="$(now_s)"
    echo "[device-cache] $(ts) lock acquired ${LOCK_DIR} wait_seconds=$((lock_end - lock_start))" | tee -a "${POSTLINK_TIMING_LOG}"
    step "device-cache: lock acquired"
    if [[ -f "${CACHE_WRAPPER_LIST}" ]]; then
      step "device-cache: wrapper.bc hit"
      echo "[device-cache] $(ts) wrapper.bc hit after lock ${CACHE_DEVICE_DIR}" | tee -a "${POSTLINK_TIMING_LOG}"
      while read -r name; do
        [[ -z "${name}" ]] && continue
        WRAPPER_BCS+=("${CACHE_DEVICE_DIR}/${name}")
      done < "${CACHE_WRAPPER_LIST}"
      : > "${WRAPPER_LIST}"
      for bc in "${WRAPPER_BCS[@]}"; do
        echo "${bc}" >> "${WRAPPER_LIST}"
      done
    else
      mkdir -p "${CACHE_DEVICE_DIR}"
      step "device-cache: wrapper.bc miss"
      echo "[device-cache] $(ts) wrapper.bc miss ${CACHE_DEVICE_DIR}" | tee -a "${POSTLINK_TIMING_LOG}"
      step "post-link: sycl-post-link"
      progress_ping
      echo "[postlink] $(ts) start" | tee -a "${POSTLINK_TIMING_LOG}"
      echo "[postlink] cmd: ${SYCL_POST_LINK} ${POSTLINK_SPLIT_ARG[*]} --symbols --properties -o ${POSTLINK_TABLE} ${IR_FOR_POSTLINK}" | tee -a "${POSTLINK_TIMING_LOG}"
      echo "[postlink] entering sycl-post-link (pid=$$)" | tee -a "${POSTLINK_TIMING_LOG}"
      if [[ -f "${IR_FOR_POSTLINK}" ]]; then
        echo "[postlink] input: ${IR_FOR_POSTLINK} $(stat -c '%s bytes' "${IR_FOR_POSTLINK}")" | tee -a "${POSTLINK_TIMING_LOG}"
      fi
      postlink_start="$(now_s)"
      if ! stage_timeout postlink "${TIMEOUT_POSTLINK}" ${SYCL_POST_LINK} "${POSTLINK_SPLIT_ARG[@]}" --symbols --properties \
        -o "${POSTLINK_TABLE}" "${IR_FOR_POSTLINK}"; then
        rc=$?
        echo "[postlink] rc=${rc} end $(ts)" | tee -a "${POSTLINK_TIMING_LOG}"
        exit "${rc}"
      fi
      postlink_end="$(now_s)"
      echo "[postlink] completed sycl-post-link (pid=$$) duration=$((postlink_end - postlink_start))s" | tee -a "${POSTLINK_TIMING_LOG}"
      echo "[timing] postlink_seconds=$((postlink_end - postlink_start))" | tee -a "${POSTLINK_TIMING_LOG}"
      echo "[postlink] rc=0 end $(ts)" | tee -a "${POSTLINK_TIMING_LOG}"
      if [[ -f "${POSTLINK_TABLE}" ]]; then
        echo "[postlink] table: ${POSTLINK_TABLE} $(stat -c '%s bytes' "${POSTLINK_TABLE}")" | tee -a "${POSTLINK_TIMING_LOG}"
      fi

      mapfile -t POSTLINK_LINES < <(grep -v '^\[' "${POSTLINK_TABLE}" || true)
      if [[ "${#POSTLINK_LINES[@]}" -eq 0 ]]; then
        echo "sycl-post-link produced empty table: ${POSTLINK_TABLE}"
        rmdir "${LOCK_DIR}" || true
        exit 1
      fi
      SITE_FUNCTION="${SITE_FUNCTION:-$(lookup_site_function "${SITE_METADATA_CSV}" "${SITE_ID}" 2>/dev/null || true)}"
      mapfile -t POSTLINK_LINES < <(filter_postlink_lines_for_site "${SITE_FUNCTION:-}" "${POSTLINK_LINES[@]}")
      echo "[postlink] selected ${#POSTLINK_LINES[@]} row(s) for site=${SITE_ID} function=${SITE_FUNCTION:-unknown}" | tee -a "${POSTLINK_TIMING_LOG}"
      : > "${CACHE_WRAPPER_LIST}"
      for POSTLINK_LINE in "${POSTLINK_LINES[@]}"; do
        POSTLINK_BC="${POSTLINK_LINE%%|*}"
        POSTLINK_PROP="${POSTLINK_LINE#*|}"
        POSTLINK_PROP="${POSTLINK_PROP%%|*}"
        POSTLINK_SYM="${POSTLINK_LINE##*|}"
        POSTLINK_BASE="$(basename "${POSTLINK_BC}" .bc)"
        SPV_FILE_LOCAL="${OUT_DIR}/${POSTLINK_BASE}.spv"
        WRAPPER_BC_LOCAL="${OUT_DIR}/${POSTLINK_BASE}.wrapper.bc"

        step "spirv: llvm-spirv"
        progress_ping
        echo "[spirv] $(ts) start" | tee -a "${POSTLINK_TIMING_LOG}"
        echo "[spirv] cmd: ${LLVM_SPIRV} --spirv-ext=+SPV_INTEL_subgroups,+SPV_EXT_shader_atomic_float_add ${POSTLINK_BC} -o ${SPV_FILE_LOCAL}" | tee -a "${POSTLINK_TIMING_LOG}"
        spirv_start="$(now_s)"
        if ! stage_timeout spirv "${TIMEOUT_SPIRV}" ${LLVM_SPIRV} --spirv-ext=+SPV_INTEL_subgroups,+SPV_EXT_shader_atomic_float_add "${POSTLINK_BC}" -o "${SPV_FILE_LOCAL}"; then
          rc=$?
          echo "[spirv] rc=${rc} end $(ts)" | tee -a "${POSTLINK_TIMING_LOG}"
          exit "${rc}"
        fi
        spirv_end="$(now_s)"
        echo "[timing] spirv_seconds=$((spirv_end - spirv_start))" | tee -a "${POSTLINK_TIMING_LOG}"
        echo "[spirv] rc=0 end $(ts)" | tee -a "${POSTLINK_TIMING_LOG}"
        if [[ -f "${SPV_FILE_LOCAL}" ]]; then
          echo "[spirv] output: ${SPV_FILE_LOCAL} $(stat -c '%s bytes' "${SPV_FILE_LOCAL}")" | tee -a "${POSTLINK_TIMING_LOG}"
        fi

        step "wrap: clang-offload-wrapper"
        progress_ping
        echo "[wrap] $(ts) start" | tee -a "${POSTLINK_TIMING_LOG}"
        echo "[wrap] cmd: ${CLANG_OFFLOAD_WRAPPER} -host x86_64-unknown-linux-gnu -kind=sycl -target=spir64 -format=spirv -entries=${POSTLINK_SYM} -properties=${POSTLINK_PROP} ${SPV_FILE_LOCAL} -o ${WRAPPER_BC_LOCAL}" | tee -a "${POSTLINK_TIMING_LOG}"
        wrap_start="$(now_s)"
        if ! stage_timeout wrap "${TIMEOUT_WRAP}" ${CLANG_OFFLOAD_WRAPPER} \
          -host x86_64-unknown-linux-gnu \
          -kind=sycl \
          -target=spir64 \
          -format=spirv \
          -entries="${POSTLINK_SYM}" \
          -properties="${POSTLINK_PROP}" \
          "${SPV_FILE_LOCAL}" \
          -o "${WRAPPER_BC_LOCAL}"; then
          rc=$?
          echo "[wrap] rc=${rc} end $(ts)" | tee -a "${POSTLINK_TIMING_LOG}"
          exit "${rc}"
        fi
        wrap_end="$(now_s)"
        echo "[timing] wrap_seconds=$((wrap_end - wrap_start))" | tee -a "${POSTLINK_TIMING_LOG}"
        echo "[wrap] rc=0 end $(ts)" | tee -a "${POSTLINK_TIMING_LOG}"
        if [[ -f "${WRAPPER_BC_LOCAL}" ]]; then
          echo "[wrap] output: ${WRAPPER_BC_LOCAL} $(stat -c '%s bytes' "${WRAPPER_BC_LOCAL}")" | tee -a "${POSTLINK_TIMING_LOG}"
        fi

        WRAPPER_BCS+=("${WRAPPER_BC_LOCAL}")
        cp -f "${WRAPPER_BC_LOCAL}" "${CACHE_DEVICE_DIR}/"
        echo "$(basename "${WRAPPER_BC_LOCAL}")" >> "${CACHE_WRAPPER_LIST}"
      done
      : > "${WRAPPER_LIST}"
      for bc in "${WRAPPER_BCS[@]}"; do
        echo "${bc}" >> "${WRAPPER_LIST}"
      done
    fi
    rmdir "${LOCK_DIR}" || true
  fi
  echo "[device-cache] $(ts) exit site=${SITE_ID} bit=${BIT_INDEX}" | tee -a "${POSTLINK_TIMING_LOG}"
elif [[ "${RUN_ONLY}" -eq 0 ]]; then
  step "post-link: sycl-post-link"
  progress_ping
  echo "[postlink] $(ts) start" | tee -a "${POSTLINK_TIMING_LOG}"
  echo "[postlink] cmd: ${SYCL_POST_LINK} ${POSTLINK_SPLIT_ARG[*]} --symbols --properties -o ${POSTLINK_TABLE} ${IR_FOR_POSTLINK}" | tee -a "${POSTLINK_TIMING_LOG}"
  echo "[postlink] entering sycl-post-link (pid=$$)" | tee -a "${POSTLINK_TIMING_LOG}"
  if [[ -f "${IR_FOR_POSTLINK}" ]]; then
    echo "[postlink] input: ${IR_FOR_POSTLINK} $(stat -c '%s bytes' "${IR_FOR_POSTLINK}")" | tee -a "${POSTLINK_TIMING_LOG}"
  fi
  postlink_start="$(now_s)"
  if ! ${SYCL_POST_LINK} "${POSTLINK_SPLIT_ARG[@]}" --symbols --properties \
    -o "${POSTLINK_TABLE}" "${IR_FOR_POSTLINK}"; then
    rc=$?
    echo "[postlink] rc=${rc} end $(ts)" | tee -a "${POSTLINK_TIMING_LOG}"
    exit "${rc}"
  fi
  postlink_end="$(now_s)"
  echo "[postlink] completed sycl-post-link (pid=$$) duration=$((postlink_end - postlink_start))s" | tee -a "${POSTLINK_TIMING_LOG}"
  echo "[timing] postlink_seconds=$((postlink_end - postlink_start))" | tee -a "${POSTLINK_TIMING_LOG}"
  echo "[postlink] rc=0 end $(ts)" | tee -a "${POSTLINK_TIMING_LOG}"
  if [[ -f "${POSTLINK_TABLE}" ]]; then
    echo "[postlink] table: ${POSTLINK_TABLE} $(stat -c '%s bytes' "${POSTLINK_TABLE}")" | tee -a "${POSTLINK_TIMING_LOG}"
  fi

  mapfile -t POSTLINK_LINES < <(grep -v '^\[' "${POSTLINK_TABLE}" || true)
  if [[ "${#POSTLINK_LINES[@]}" -eq 0 ]]; then
    echo "sycl-post-link produced empty table: ${POSTLINK_TABLE}"
    exit 1
  fi
  SITE_FUNCTION="${SITE_FUNCTION:-$(lookup_site_function "${SITE_METADATA_CSV}" "${SITE_ID}" 2>/dev/null || true)}"
  mapfile -t POSTLINK_LINES < <(filter_postlink_lines_for_site "${SITE_FUNCTION:-}" "${POSTLINK_LINES[@]}")
  echo "[postlink] selected ${#POSTLINK_LINES[@]} row(s) for site=${SITE_ID} function=${SITE_FUNCTION:-unknown}" | tee -a "${POSTLINK_TIMING_LOG}"
  for POSTLINK_LINE in "${POSTLINK_LINES[@]}"; do
    POSTLINK_BC="${POSTLINK_LINE%%|*}"
    POSTLINK_PROP="${POSTLINK_LINE#*|}"
    POSTLINK_PROP="${POSTLINK_PROP%%|*}"
    POSTLINK_SYM="${POSTLINK_LINE##*|}"
    POSTLINK_BASE="$(basename "${POSTLINK_BC}" .bc)"
    SPV_FILE_LOCAL="${OUT_DIR}/${POSTLINK_BASE}.spv"
    WRAPPER_BC_LOCAL="${OUT_DIR}/${POSTLINK_BASE}.wrapper.bc"

    step "spirv: llvm-spirv"
    progress_ping
    echo "[spirv] $(ts) start" | tee -a "${POSTLINK_TIMING_LOG}"
    echo "[spirv] cmd: ${LLVM_SPIRV} --spirv-ext=+SPV_INTEL_subgroups,+SPV_EXT_shader_atomic_float_add ${POSTLINK_BC} -o ${SPV_FILE_LOCAL}" | tee -a "${POSTLINK_TIMING_LOG}"
    spirv_start="$(now_s)"
    if ! ${LLVM_SPIRV} --spirv-ext=+SPV_INTEL_subgroups,+SPV_EXT_shader_atomic_float_add "${POSTLINK_BC}" -o "${SPV_FILE_LOCAL}"; then
      rc=$?
      echo "[spirv] rc=${rc} end $(ts)" | tee -a "${POSTLINK_TIMING_LOG}"
      exit "${rc}"
    fi
    spirv_end="$(now_s)"
    echo "[timing] spirv_seconds=$((spirv_end - spirv_start))" | tee -a "${POSTLINK_TIMING_LOG}"
    echo "[spirv] rc=0 end $(ts)" | tee -a "${POSTLINK_TIMING_LOG}"
    if [[ -f "${SPV_FILE_LOCAL}" ]]; then
      echo "[spirv] output: ${SPV_FILE_LOCAL} $(stat -c '%s bytes' "${SPV_FILE_LOCAL}")" | tee -a "${POSTLINK_TIMING_LOG}"
    fi

    step "wrap: clang-offload-wrapper"
    progress_ping
    echo "[wrap] $(ts) start" | tee -a "${POSTLINK_TIMING_LOG}"
    echo "[wrap] cmd: ${CLANG_OFFLOAD_WRAPPER} -host x86_64-unknown-linux-gnu -kind=sycl -target=spir64 -format=spirv -entries=${POSTLINK_SYM} -properties=${POSTLINK_PROP} ${SPV_FILE_LOCAL} -o ${WRAPPER_BC_LOCAL}" | tee -a "${POSTLINK_TIMING_LOG}"
    wrap_start="$(now_s)"
    if ! ${CLANG_OFFLOAD_WRAPPER} \
      -host x86_64-unknown-linux-gnu \
      -kind=sycl \
      -target=spir64 \
      -format=spirv \
      -entries="${POSTLINK_SYM}" \
      -properties="${POSTLINK_PROP}" \
      "${SPV_FILE_LOCAL}" \
      -o "${WRAPPER_BC_LOCAL}"; then
      rc=$?
      echo "[wrap] rc=${rc} end $(ts)" | tee -a "${POSTLINK_TIMING_LOG}"
      exit "${rc}"
    fi
    wrap_end="$(now_s)"
    echo "[timing] wrap_seconds=$((wrap_end - wrap_start))" | tee -a "${POSTLINK_TIMING_LOG}"
    echo "[wrap] rc=0 end $(ts)" | tee -a "${POSTLINK_TIMING_LOG}"
    if [[ -f "${WRAPPER_BC_LOCAL}" ]]; then
      echo "[wrap] output: ${WRAPPER_BC_LOCAL} $(stat -c '%s bytes' "${WRAPPER_BC_LOCAL}")" | tee -a "${POSTLINK_TIMING_LOG}"
    fi
    WRAPPER_BCS+=("${WRAPPER_BC_LOCAL}")
  done
  : > "${WRAPPER_LIST}"
  for bc in "${WRAPPER_BCS[@]}"; do
    echo "${bc}" >> "${WRAPPER_LIST}"
  done
fi

if [[ "${RUN_ONLY}" -eq 1 ]]; then
  if [[ -f "${WRAPPER_LIST}" ]]; then
    WRAPPER_BCS=()
    while read -r bc; do
      [[ -z "${bc}" ]] && continue
      WRAPPER_BCS+=("${bc}")
    done < "${WRAPPER_LIST}"
  fi
fi

if [[ "${PREP_ONLY}" -eq 1 ]]; then
  if [[ -f "${OUT_DIR}/device.bc" && -f "${OUT_DIR}/host.o" && -f "${OUT_DIR}/wrapper.list" ]]; then
    echo "[prep] ready out_dir=${OUT_DIR}"
    exit 0
  fi
  echo "[prep] incomplete artifacts in ${OUT_DIR}"
  exit 3
fi

step "link: icpx"
progress_ping
total_start="$(now_s)"
link_start="$(now_s)"
LINK_LOG="${OUT_DIR}/link.log"
echo "[link] start $(ts) pid=$$" | tee -a "${LINK_LOG}"
echo "[link] cmd: ${ICPX} -fsycl -fsycl-targets=spir64 ${HOST_OBJ} ${WRAPPER_BCS[*]} -o ${BIN_PATH}" | tee -a "${LINK_LOG}"
echo "[link] inputs:" | tee -a "${LINK_LOG}"
ls -l "${HOST_OBJ}" "${WRAPPER_BCS[@]}" | tee -a "${LINK_LOG}"
 set +e
 stage_timeout link "${TIMEOUT_LINK}" ${ICPX} -fsycl -fsycl-targets=spir64 \
   "${HOST_OBJ}" "${WRAPPER_BCS[@]}" -o "${BIN_PATH}" \
   >"${OUT_DIR}/link.out" 2>"${OUT_DIR}/link.err"
 link_rc=$?
 set -e
echo "[link] rc=${link_rc} end $(ts)" | tee -a "${LINK_LOG}"
if [[ ${link_rc} -ne 0 ]]; then
  echo "[link] nonzero rc=${link_rc}, see ${OUT_DIR}/link.err" | tee -a "${LINK_LOG}"
  exit "${link_rc}"
fi
link_end="$(now_s)"
echo "[timing] link_seconds=$((link_end - link_start))"
log_timing_metric "link_seconds" "$((link_end - link_start))"

set +e
echo "[run] start $(ts) pid=$$ bin=${BIN_PATH}" >> "${RUN_OUT_LOCAL}"
step "run: benchmark"
progress_ping
run_start="$(now_s)"
stage_timeout run "${TIMEOUT_RUN}" env HECBENCH_LLFI_FORCE_DUMP=1 "${BIN_PATH}" "${RUN_ARGS[@]}" "${RUN_DUMP_TMP}" >"${RUN_OUT_LOCAL}" 2>"${RUN_ERR_LOCAL}"
status=$?
echo "[run] end $(ts) pid=$$ status=${status}" >> "${RUN_OUT_LOCAL}"
run_end="$(now_s)"
run_seconds=$((run_end - run_start))
echo "[timing] run_seconds=${run_seconds}" >> "${RUN_OUT_LOCAL}"
log_timing_metric "kernel_seconds" "${run_seconds}"
set -e

run_timed_out=0
if [[ ${status} -eq 124 || ${status} -eq 137 ]]; then
  run_timed_out=1
  echo "[timeout] benchmark run exceeded ${TIMEOUT_RUN}s status=${status}" >> "${RUN_OUT_LOCAL}"
  echo "[hang-timeout] stage=run result=DUE:TIMEOUT timeout_sec=${TIMEOUT_RUN} status=${status}" >> "${RUN_OUT_LOCAL}"
fi

do_compare_and_record() {
COMPARE_TOOL="${COMPARE_EXACT}"
if [[ "${BENCH}" == "matrix-rotate" || "${COMPARE_MODE}" == "float" ]]; then
  COMPARE_TOOL="${COMPARE_FLOAT}"
fi
if [[ ! -f "${COMPARE_TOOL}" ]]; then
  echo "Missing compare tool: ${COMPARE_TOOL}"
  exit 1
fi

fast_exact_compare=0

metrics_abs_diff=""
metrics_rmse=""
metrics_hamming=""
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

parse_metrics() {
  local file="$1"
  local line
  line="$(grep '^METRICS ' "$file" | tail -n1 || true)"
  if [[ -z "${line}" ]]; then
    return
  fi
  metrics_abs_diff="$(echo "$line" | awk -F'abs_diff_max=' '{print $2}' | awk '{print $1}')"
  metrics_rmse="$(echo "$line" | awk -F'rmse=' '{print $2}' | awk '{print $1}')"
  metrics_hamming="$(echo "$line" | awk -F'hamming_bits=' '{print $2}' | awk '{print $1}')"
}

emit_metrics() {
  local out_file="$1"
  if [[ -n "${metric_abs_max}" ]]; then echo "METRIC metric_abs_max=${metric_abs_max}" >> "${out_file}"; fi
  if [[ -n "${metric_mean_abs}" ]]; then echo "METRIC metric_mean_abs=${metric_mean_abs}" >> "${out_file}"; fi
  if [[ -n "${metric_rmse}" ]]; then echo "METRIC metric_rmse=${metric_rmse}" >> "${out_file}"; fi
  if [[ -n "${metric_max_rel}" ]]; then echo "METRIC metric_max_rel=${metric_max_rel}" >> "${out_file}"; fi
  if [[ -n "${metric_mean_rel}" ]]; then echo "METRIC metric_mean_rel=${metric_mean_rel}" >> "${out_file}"; fi
  if [[ -n "${metric_p95_abs}" ]]; then echo "METRIC metric_p95_abs=${metric_p95_abs}" >> "${out_file}"; fi
  if [[ -n "${metric_p99_abs}" ]]; then echo "METRIC metric_p99_abs=${metric_p99_abs}" >> "${out_file}"; fi
  if [[ -n "${metric_num_bad}" ]]; then echo "METRIC metric_num_bad=${metric_num_bad}" >> "${out_file}"; fi
  if [[ -n "${metric_frac_bad}" ]]; then echo "METRIC metric_frac_bad=${metric_frac_bad}" >> "${out_file}"; fi
  if [[ -n "${metric_max_ulp}" ]]; then echo "METRIC metric_max_ulp=${metric_max_ulp}" >> "${out_file}"; fi
  if [[ -n "${metric_mean_ulp}" ]]; then echo "METRIC metric_mean_ulp=${metric_mean_ulp}" >> "${out_file}"; fi
  if [[ -n "${metric_ham_bits}" ]]; then echo "METRIC metric_ham_bits=${metric_ham_bits}" >> "${out_file}"; fi
  if [[ -n "${metric_ham_bytes}" ]]; then echo "METRIC metric_ham_bytes=${metric_ham_bytes}" >> "${out_file}"; fi
  if [[ -n "${metric_size_bytes}" ]]; then echo "METRIC metric_size_bytes=${metric_size_bytes}" >> "${out_file}"; fi
}

METRICS_ONLY_ON_SDC="${METRICS_ONLY_ON_SDC:-1}"

due_detected=0
DUE_RE="${DUE_RE:-segmentation fault|segfault|SIGSEGV|SIGABRT|aborted|abort\\b|device lost|UR_RESULT_ERROR_DEVICE_LOST|ZE_RESULT_ERROR_DEVICE_LOST|fatal error|core dumped|GPU hang|reset|unrecoverable}"
if [[ -s "${RUN_ERR_LOCAL}" ]]; then
  if grep -Eqi "${DUE_RE}" "${RUN_ERR_LOCAL}"; then
    due_detected=1
    echo "[due] detected from stderr via regex: ${DUE_RE}" >> "${RUN_OUT_LOCAL}"
  fi
fi

result="FAILURE"
dump_path=""
if [[ ${run_timed_out} -eq 1 ]]; then
  echo "[classify] timeout treated as hard failure dump_present=$([[ -f "${RUN_DUMP_TMP}" ]] && echo 1 || echo 0)" >> "${RUN_OUT_LOCAL}"
elif [[ -f "${RUN_DUMP_TMP}" ]]; then
  if [[ ${status} -eq 0 ]]; then
    masked_suffix="no-flag"
    sdc_suffix="not-flagged"
  else
    masked_suffix="flagged-for-fail"
    sdc_suffix="flagged-for-fail"
  fi
  if [[ "${BASELINE}" -eq 1 ]]; then
    mkdir -p "${BASELINE_DIR}"
    cp -f "${RUN_DUMP_TMP}" "${BASELINE_PATH}"
    if [[ "${fast_exact_compare}" -eq 1 ]]; then
compare_start="$(now_s)"
      set +e
      cmp -s "${GOLDEN}" "${BASELINE_PATH}"
      cmp_rc=$?
      set -e
      compare_end="$(now_s)"
      compare_seconds=$((compare_end - compare_start))
      echo "[timing] compare_seconds=${compare_seconds}" >> "${BASELINE_OUT}"
      log_timing_metric "compare_seconds" "${compare_seconds}"
      if [[ "${cmp_rc}" -eq 0 ]]; then
        result="BASELINE"
      elif [[ "${cmp_rc}" -eq 1 ]]; then
        result="BASELINE_MISMATCH"
      else
        result="UNKNOWN"
      fi
    else
      compare_args=("${COMPARE_TOOL}" "${GOLDEN}" "${BASELINE_PATH}")
      if [[ "${COMPARE_TOOL}" == "${COMPARE_FLOAT}" ]]; then
        compare_args+=(--abs-tol "${ABS_TOL}" --rel-tol "${REL_TOL}" --workers "${COMPARE_WORKERS}")
      fi
      compare_log="${OUT_DIR}/compare_baseline.log"
      : > "${compare_log}"
      compare_start="$(now_s)"
      set +e
      python3 "${compare_args[@]}" >>"${compare_log}" 2>>"${BASELINE_ERR}"
      compare_rc=$?
      set -e
      if [[ ${compare_rc} -eq 0 ]]; then
        result="BASELINE"
      else
        result="BASELINE_MISMATCH"
      fi
      compare_end="$(now_s)"
      compare_seconds=$((compare_end - compare_start))
      echo "[timing] compare_seconds=${compare_seconds}" >> "${BASELINE_OUT}"
      log_timing_metric "compare_seconds" "${compare_seconds}"
      if [[ "${REDUCE_LOGGING}" -eq 0 ]]; then
        cat "${compare_log}" >> "${BASELINE_OUT}"
      fi
      parse_metrics "${compare_log}"
      if [[ "${result}" == "BASELINE_MISMATCH" && "${METRICS_ONLY_ON_SDC}" -eq 0 ]]; then
        emit_metrics "${BASELINE_OUT}"
      fi
      if [[ "${REDUCE_LOGGING}" -eq 1 ]]; then
        rm -f "${compare_log}"
      fi
    fi
    dump_path="${BASELINE_PATH}"
  else
    echo "[compare] start $(ts) tool=${COMPARE_TOOL}" >> "${RUN_OUT_LOCAL}"
    if [[ "${fast_exact_compare}" -eq 1 ]]; then
      compare_start="$(now_s)"
      set +e
      cmp -s "${GOLDEN}" "${RUN_DUMP_TMP}"
      cmp_rc=$?
      set -e
      compare_end="$(now_s)"
      compare_seconds=$((compare_end - compare_start))
      echo "[timing] compare_seconds=${compare_seconds}" >> "${RUN_OUT_LOCAL}"
      log_timing_metric "compare_seconds" "${compare_seconds}"
      if [[ "${cmp_rc}" -eq 0 ]]; then
        result="MASKED:${masked_suffix}"
      elif [[ "${cmp_rc}" -eq 1 ]]; then
        result="SDC:${sdc_suffix}"
        if [[ -f "${SDC_METRICS}" ]]; then
          SDC_BAD_THRESH="${SDC_BAD_THRESH:-1e-3}"
          if [[ "${COMPARE_TOOL}" == "${COMPARE_FLOAT}" ]]; then
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
          else
            metrics_out=$(python3 "${SDC_METRICS}" "${GOLDEN}" "${RUN_DUMP_TMP}" --mode exact 2>/dev/null || true)
            while IFS= read -r line; do
              case "${line}" in
                metric_ham_bits=*) metric_ham_bits="${line#*=}" ;;
                metric_ham_bytes=*) metric_ham_bytes="${line#*=}" ;;
                metric_size_bytes=*) metric_size_bytes="${line#*=}" ;;
              esac
            done <<< "${metrics_out}"
          fi
        fi
      else
        result="UNKNOWN"
      fi
    else
      compare_args=("${COMPARE_TOOL}" "${GOLDEN}" "${RUN_DUMP_TMP}")
      if [[ "${COMPARE_TOOL}" == "${COMPARE_FLOAT}" ]]; then
        compare_args+=(--abs-tol "${ABS_TOL}" --rel-tol "${REL_TOL}" --workers "${COMPARE_WORKERS}")
      fi
      compare_log="${OUT_DIR}/compare_run.log"
      : > "${compare_log}"
      compare_start="$(now_s)"
      set +e
      python3 "${compare_args[@]}" >>"${compare_log}" 2>>"${RUN_ERR_LOCAL}"
      compare_rc=$?
      set -e
      if [[ ${compare_rc} -eq 0 ]]; then
        result="MASKED:${masked_suffix}"
      else
        result="SDC:${sdc_suffix}"
        if [[ -f "${SDC_METRICS}" ]]; then
          SDC_BAD_THRESH="${SDC_BAD_THRESH:-1e-3}"
          if [[ "${COMPARE_TOOL}" == "${COMPARE_FLOAT}" ]]; then
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
          else
            metrics_out=$(python3 "${SDC_METRICS}" "${GOLDEN}" "${RUN_DUMP_TMP}" --mode exact 2>/dev/null || true)
            while IFS= read -r line; do
              case "${line}" in
                metric_ham_bits=*) metric_ham_bits="${line#*=}" ;;
                metric_ham_bytes=*) metric_ham_bytes="${line#*=}" ;;
                metric_size_bytes=*) metric_size_bytes="${line#*=}" ;;
              esac
            done <<< "${metrics_out}"
          fi
        fi
      fi
      compare_end="$(now_s)"
      compare_seconds=$((compare_end - compare_start))
      echo "[timing] compare_seconds=${compare_seconds}" >> "${RUN_OUT_LOCAL}"
      log_timing_metric "compare_seconds" "${compare_seconds}"
      if [[ "${REDUCE_LOGGING}" -eq 0 ]]; then
        cat "${compare_log}" >> "${RUN_OUT_LOCAL}"
      fi
      parse_metrics "${compare_log}"
    fi
    if [[ "${result}" == SDC* ]]; then
      emit_metrics "${RUN_OUT_LOCAL}"
    fi
    if [[ "${REDUCE_LOGGING}" -eq 1 ]]; then
      rm -f "${compare_log}"
    fi
    echo "[compare] end $(ts) result=${result}" >> "${RUN_OUT_LOCAL}"
  fi
elif [[ ${status} -ne 0 ]]; then
  if [[ ${due_detected} -eq 1 ]]; then
    echo "[classify] due-without-dump treated as hard failure" >> "${RUN_OUT_LOCAL}"
    result="FAILURE"
  fi
fi

KEEP_DUMPS="${KEEP_DUMPS:-0}"
if [[ -f "${RUN_DUMP_TMP}" ]]; then
  dump_start="$(now_s)"
  if [[ "${BASELINE}" -eq 1 ]]; then
    rm -f "${RUN_DUMP_TMP}"
  elif [[ "${KEEP_DUMPS}" -eq 1 ]]; then
    mv -f "${RUN_DUMP_TMP}" "${RUN_DUMP_FINAL}"
    dump_path="${RUN_DUMP_FINAL}"
  else
    rm -f "${RUN_DUMP_TMP}"
  fi
  dump_end="$(now_s)"
  dump_seconds=$((dump_end - dump_start))
  echo "[timing] dump_seconds=${dump_seconds}" >> "${RUN_OUT_LOCAL}"
  log_timing_metric "dump_seconds" "${dump_seconds}"
fi

if [[ "${WRITE_SUMMARY}" -eq 1 ]]; then
  csv_start="$(now_s)"
  if [[ ! -f "${CSV}" ]]; then
    echo "site_id,bit_index,result,exit_code,stdout,stderr,dump,metric_abs_max,metric_mean_abs,metric_rmse,metric_max_rel,metric_mean_rel,metric_p95_abs,metric_p99_abs,metric_num_bad,metric_frac_bad,metric_max_ulp,metric_mean_ulp,metric_ham_bits,metric_ham_bytes,metric_size_bytes" > "${CSV}" || { echo "[error] failed to write CSV header" >&2; exit 5; }
  fi
  echo "${SITE_ID},${BIT_INDEX},${result},${status},${RUN_OUT},${RUN_ERR},${dump_path},${metric_abs_max},${metric_mean_abs},${metric_rmse},${metric_max_rel},${metric_mean_rel},${metric_p95_abs},${metric_p99_abs},${metric_num_bad},${metric_frac_bad},${metric_max_ulp},${metric_mean_ulp},${metric_ham_bits},${metric_ham_bytes},${metric_size_bytes}" >> "${CSV}" || { echo "[error] failed to append CSV row" >&2; : > "${RESULTS_DIR}/.fatal_io"; exit 5; }
  csv_end="$(now_s)"
  csv_seconds=$((csv_end - csv_start))
  echo "[timing] csv_seconds=${csv_seconds}" >> "${RUN_OUT_LOCAL}"
  log_timing_metric "csv_seconds" "${csv_seconds}"
fi

total_end="$(now_s)"
total_seconds=$((total_end - total_start))
echo "[timing] total_seconds=${total_seconds}" >> "${RUN_OUT_LOCAL}"
log_timing_metric "total_seconds" "${total_seconds}"

if [[ "${AGGREGATE_LOGS}" -eq 1 ]]; then
  echo "=== site=${SITE_ID} bit=${BIT_INDEX} end $(ts) ===" >> "${RUN_OUT_LOCAL}"
  echo "=== site=${SITE_ID} bit=${BIT_INDEX} end $(ts) ===" >> "${RUN_ERR_LOCAL}"
  append_aggregate "${RUN_OUT_LOCAL}" "${AGG_OUT}" || { echo "[error] failed to append to aggregate.out" >&2; : > "${RESULTS_DIR}/.fatal_io"; exit 4; }
  append_aggregate "${RUN_ERR_LOCAL}" "${AGG_ERR}" || { echo "[error] failed to append to aggregate.err" >&2; : > "${RESULTS_DIR}/.fatal_io"; exit 4; }
  rm -f "${RUN_OUT_LOCAL}" "${RUN_ERR_LOCAL}"
fi

echo "Result: ${result} (exit ${status})"
}

if [[ "${ASYNC_COMPARE:-0}" -eq 1 ]]; then
  KEEP_DUMPS=1
  ( do_compare_and_record ) &
  disown || true
  exit 0
fi
do_compare_and_record
if [[ "${AGGREGATE_LOGS}" -eq 1 ]]; then
  echo "=== site=${SITE_ID} bit=${BIT_INDEX} start $(ts) ===" >> "${RUN_OUT_LOCAL}"
  echo "=== site=${SITE_ID} bit=${BIT_INDEX} start $(ts) ===" >> "${RUN_ERR_LOCAL}"
fi
