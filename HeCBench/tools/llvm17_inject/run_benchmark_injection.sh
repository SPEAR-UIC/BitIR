#!/usr/bin/env bash
BACKEND="${BITIR_MACHINE_BACKEND:?BITIR_MACHINE_BACKEND is required}"
if [[ "${BACKEND}" == "intel" ]]; then
set -euo pipefail
set -E
ulimit -c 0
if [[ "${DEBUG_TIMING:-0}" -eq 1 ]]; then
  DEVICE_ENV_NAME="${BITIR_MACHINE_DEVICE_VISIBLE_ENV:-DEVICE_SELECTOR}"
  trap 'echo "[error] line ${LINENO}: ${BASH_COMMAND}" >&2' ERR
  set -x
  {
    echo "[env] SYCL_DEVICE_FILTER=${SYCL_DEVICE_FILTER:-}"
    echo "[env] ${DEVICE_ENV_NAME}=${!DEVICE_ENV_NAME:-}"
    echo "[env] ZE_AFFINITY_MASK=${ZE_AFFINITY_MASK:-}"
    echo "[env] LD_LIBRARY_PATH=${LD_LIBRARY_PATH:-}"
    ldconfig -p 2>/dev/null | grep -E 'libsycl|libze' || true
  } >&2
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

REPO_ROOT="${REPO_ROOT:-$(pwd)}"
BITIR_MACHINE="${BITIR_MACHINE:?BITIR_MACHINE is required}"
BENCH="${BENCH:-}"

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
  for p in ${BITIR_MACHINE_MODULE_USE:-}; do
    module use "${p}" 2>/dev/null || true
  done
  for m in ${MODULE_LIST:-${BITIR_MACHINE_MODULES:-}}; do
    module load "${m}" 2>/dev/null || true
  done
fi

# Ensure runtime sees GPUs.
DEVICE_VISIBLE_ENV="${BITIR_MACHINE_DEVICE_VISIBLE_ENV:?BITIR_MACHINE_DEVICE_VISIBLE_ENV is required}"
DEVICE_VISIBLE_VALUE="${BITIR_MACHINE_DEVICE_VISIBLE_VALUE:?BITIR_MACHINE_DEVICE_VISIBLE_VALUE is required}"
export SYCL_DEVICE_FILTER="${SYCL_DEVICE_FILTER:-${DEVICE_VISIBLE_VALUE}}"
export "${DEVICE_VISIBLE_ENV}=${!DEVICE_VISIBLE_ENV:-${DEVICE_VISIBLE_VALUE}}"
if [[ -n "${ZE_AFFINITY_MASK:-}" ]]; then
  export ZE_AFFINITY_MASK
fi
ICPX="${ICPX:-}"
SYCL_POST_LINK="${SYCL_POST_LINK:-}"
POSTLINK_SPLIT="${POSTLINK_SPLIT:-${BITIR_MACHINE_SYCL_POSTLINK_SPLIT:-kernel}}"
LLVM_SPIRV="${LLVM_SPIRV:-}"
CLANG_OFFLOAD_BUNDLER="${CLANG_OFFLOAD_BUNDLER:-}"
CLANG_OFFLOAD_WRAPPER="${CLANG_OFFLOAD_WRAPPER:-}"
CLANG_BIN="${CLANG_BIN:-}"
SYCL_TARGET="${BITIR_MACHINE_SYCL_TARGET:-}"
SYCL_DEVICE_TRIPLE="${BITIR_MACHINE_SYCL_DEVICE_TRIPLE:-}"
SYCL_OFFLOAD_TARGET="${BITIR_MACHINE_SYCL_OFFLOAD_TARGET:-}"
SYCL_HOST_TRIPLE="${BITIR_MACHINE_SYCL_HOST_TRIPLE:-}"
TOOL_SEARCH_ROOTS="${BITIR_MACHINE_TOOL_SEARCH_ROOTS:-}"
LLVM_SEARCH_ROOT="${BITIR_MACHINE_LLVM_SEARCH_ROOT:-}"

if [[ -z "${SYCL_TARGET}" || -z "${SYCL_DEVICE_TRIPLE}" || -z "${SYCL_OFFLOAD_TARGET}" || -z "${SYCL_HOST_TRIPLE}" ]]; then
  echo "Missing SYCL target metadata in machine config for ${BITIR_MACHINE}"
  exit 1
fi

read -r -a TOOL_SEARCH_ROOTS_ARR <<< "${TOOL_SEARCH_ROOTS}"

POSTLINK_SPLIT_ARG=(--split="${POSTLINK_SPLIT}")
if [[ -z "${POSTLINK_SPLIT}" || "${POSTLINK_SPLIT}" == "none" ]]; then
  echo "[postlink] POSTLINK_SPLIT='${POSTLINK_SPLIT}' not supported by sycl-post-link; omitting --split" >&2
  POSTLINK_SPLIT_ARG=()
fi

if [[ -z "${ICPX}" ]]; then
  if command -v icpx &> /dev/null; then
    ICPX="$(command -v icpx)"
  else
    for root in "${TOOL_SEARCH_ROOTS_ARR[@]}"; do
      cand="${root}/icpx"
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
  for root in "${TOOL_SEARCH_ROOTS_ARR[@]}"; do
    cand="${root}/sycl-post-link"
    if [[ -x "${cand}" ]]; then
      SYCL_POST_LINK="${cand}"
      break
    fi
  done
fi
if [[ -z "${LLVM_SPIRV}" || ! -x "${LLVM_SPIRV}" ]]; then
  for root in "${TOOL_SEARCH_ROOTS_ARR[@]}"; do
    cand="${root}/llvm-spirv"
    if [[ -x "${cand}" ]]; then
      LLVM_SPIRV="${cand}"
      break
    fi
  done
fi
if [[ -z "${CLANG_OFFLOAD_BUNDLER}" || ! -x "${CLANG_OFFLOAD_BUNDLER}" ]]; then
  for root in "${TOOL_SEARCH_ROOTS_ARR[@]}"; do
    cand="${root}/clang-offload-bundler"
    if [[ -x "${cand}" ]]; then
      CLANG_OFFLOAD_BUNDLER="${cand}"
      break
    fi
  done
fi
if [[ -z "${CLANG_OFFLOAD_WRAPPER}" || ! -x "${CLANG_OFFLOAD_WRAPPER}" ]]; then
  for root in "${TOOL_SEARCH_ROOTS_ARR[@]}"; do
    cand="${root}/clang-offload-wrapper"
    if [[ -x "${cand}" ]]; then
      CLANG_OFFLOAD_WRAPPER="${cand}"
      break
    fi
  done
fi
if [[ -z "${CLANG_BIN}" || ! -x "${CLANG_BIN}" ]]; then
  for root in "${TOOL_SEARCH_ROOTS_ARR[@]}"; do
    cand="${root}/clang++"
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
  LLVM_CONFIG_FALLBACK="$(find "${LLVM_SEARCH_ROOT}" -name llvm-config -print -quit 2>/dev/null || true)"
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
  LLVM_CONFIG_FALLBACK="$(find "${LLVM_SEARCH_ROOT}" -name llvm-config -print -quit 2>/dev/null || true)"
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

SITE_ID="${SITE_ID:-1}"
BIT_INDEX="${BIT_INDEX:-0}"
ABS_TOL="${ABS_TOL:?ABS_TOL is required}"
REL_TOL="${REL_TOL:?REL_TOL is required}"
BASELINE="${BASELINE:-0}"
COMPARE_MODE="${COMPARE_MODE:-${BITIR_COMPARE_MODE:-exact}}"
INJECT_TARGET="${INJECT_TARGET:-${BITIR_FAULT_MODEL_INJECT_TARGET:-result}}"
INT_FLOAT_ONLY="${INT_FLOAT_ONLY:-${BITIR_FAULT_MODEL_INT_FLOAT_ONLY:-1}}"
INCLUDE_CONSTANTS="${INCLUDE_CONSTANTS:-${BITIR_FAULT_MODEL_INCLUDE_CONSTANTS:-0}}"
EXTRA_INCLUDES=()
PREP_ONLY="${PREP_ONLY:-0}"
RUN_ONLY="${RUN_ONLY:-0}"
PREP_DIR="${PREP_DIR:-}"
INPUT_PROFILE="${INPUT_PROFILE:-default}"

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

SRC_DIR="${BITIR_SOURCE_DIR:-}"
GOLDEN_NAME="${BITIR_GOLDEN_FILE:-${BENCH}.bin}"
if [[ -n "${BITIR_EXTRA_INCLUDES:-}" ]]; then
  read -r -a EXTRA_INCLUDES <<< "${BITIR_EXTRA_INCLUDES}"
fi
RUN_ARGS=()
if [[ -n "${BITIR_RUN_ARGS:-}" ]]; then
  read -r -a RUN_ARGS <<< "${BITIR_RUN_ARGS}"
fi
if [[ -z "${SRC_DIR}" ]]; then
  echo "Missing YAML source_dir for BENCH=${BENCH} machine=${BITIR_MACHINE}"
  exit 1
fi

SRC="${REPO_ROOT}/${SRC_DIR}/main.cpp"
BENCH_DIR="${REPO_ROOT}/${SRC_DIR}"
GOLDEN_ROOT="${GOLDEN_ROOT:-${REPO_ROOT}/${BITIR_MACHINE_GOLDEN_ROOT:?BITIR_MACHINE_GOLDEN_ROOT is required}}"
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
RESULTS_PROFILE="${RESULTS_PROFILE:-default}"
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
TIMEOUT_RUN="${TIMEOUT_RUN:-${BITIR_TIMEOUT_SEC}}"

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
      stage_timeout compile "${TIMEOUT_COMPILE}" ${ICPX} -fsycl -fsycl-targets="${SYCL_TARGET}" -O0 -g0 -DUSE_GPU \
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
        --targets="host-${SYCL_HOST_TRIPLE},${SYCL_OFFLOAD_TARGET}"
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
  stage_timeout compile "${TIMEOUT_COMPILE}" ${ICPX} -fsycl -fsycl-targets="${SYCL_TARGET}" -O0 -g0 -DUSE_GPU \
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
    --targets="host-${SYCL_HOST_TRIPLE},${SYCL_OFFLOAD_TARGET}"
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
    stage_timeout reassemble "${TIMEOUT_REASSEMBLE}" ${CLANG_BIN} -target "${SYCL_DEVICE_TRIPLE}" -x ir -emit-llvm -c "${IR_INJ_LL}" -o "${IR_INJ_ONEAPI_BC}"
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
        echo "[wrap] cmd: ${CLANG_OFFLOAD_WRAPPER} -host ${SYCL_HOST_TRIPLE} -kind=sycl -target=${SYCL_TARGET} -format=spirv -entries=${POSTLINK_SYM} -properties=${POSTLINK_PROP} ${SPV_FILE_LOCAL} -o ${WRAPPER_BC_LOCAL}" | tee -a "${POSTLINK_TIMING_LOG}"
        wrap_start="$(now_s)"
        if ! stage_timeout wrap "${TIMEOUT_WRAP}" ${CLANG_OFFLOAD_WRAPPER} \
          -host "${SYCL_HOST_TRIPLE}" \
          -kind=sycl \
          -target="${SYCL_TARGET}" \
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
    echo "[wrap] cmd: ${CLANG_OFFLOAD_WRAPPER} -host ${SYCL_HOST_TRIPLE} -kind=sycl -target=${SYCL_TARGET} -format=spirv -entries=${POSTLINK_SYM} -properties=${POSTLINK_PROP} ${SPV_FILE_LOCAL} -o ${WRAPPER_BC_LOCAL}" | tee -a "${POSTLINK_TIMING_LOG}"
    wrap_start="$(now_s)"
    if ! ${CLANG_OFFLOAD_WRAPPER} \
      -host "${SYCL_HOST_TRIPLE}" \
      -kind=sycl \
      -target="${SYCL_TARGET}" \
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
echo "[link] cmd: ${ICPX} -fsycl -fsycl-targets=${SYCL_TARGET} ${HOST_OBJ} ${WRAPPER_BCS[*]} -o ${BIN_PATH}" | tee -a "${LINK_LOG}"
echo "[link] inputs:" | tee -a "${LINK_LOG}"
ls -l "${HOST_OBJ}" "${WRAPPER_BCS[@]}" | tee -a "${LINK_LOG}"
 set +e
 stage_timeout link "${TIMEOUT_LINK}" ${ICPX} -fsycl -fsycl-targets="${SYCL_TARGET}" \
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
if [[ "${COMPARE_MODE}" == "float" ]]; then
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
exit 0
fi
if [[ "${BACKEND}" == "amd" ]]; then
  echo "AMD injection runner is not wired yet"
  exit 1
fi
set -euo pipefail
start_ns=$(date +%s%N)
now_ns() { date +%s%N; }
# Compatibility shim: if any stale script path still calls `cho`,
# treat it as `echo` so jobs do not fail.
cho() { echo "$@"; }

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

REPO_ROOT="${REPO_ROOT:-$(pwd)}"
BITIR_MACHINE="${BITIR_MACHINE:?BITIR_MACHINE is required}"
BENCH="${BENCH:-}"
CLANG="${CLANG:-$(command -v clang++ || true)}"
OPT_BIN="${OPT_BIN:-$(command -v opt || true)}"
LLVM_AS="${LLVM_AS:-$(command -v llvm-as || true)}"
LLC_BIN="${LLC_BIN:-$(command -v llc || true)}"

CUDA_HOME="${CUDA_HOME:-${BITIR_MACHINE_RUNTIME_HOME:?BITIR_MACHINE_RUNTIME_HOME is required}}"
CUDA_ARCH="${CUDA_ARCH:-${BITIR_MACHINE_CUDA_ARCH_NAME:?BITIR_MACHINE_CUDA_ARCH_NAME is required}}"
DEVICE_VISIBLE_ENV="${BITIR_MACHINE_DEVICE_VISIBLE_ENV:?BITIR_MACHINE_DEVICE_VISIBLE_ENV is required}"
DEVICE_VISIBLE_VALUE="${BITIR_MACHINE_DEVICE_VISIBLE_VALUE:?BITIR_MACHINE_DEVICE_VISIBLE_VALUE is required}"
DEVICE_BIN_SUBDIR="${BITIR_MACHINE_BINARY_SUBDIR:?BITIR_MACHINE_BINARY_SUBDIR is required}"
COMPILER_DRIVER="${BITIR_MACHINE_COMPILER_DRIVER:?BITIR_MACHINE_COMPILER_DRIVER is required}"
SITE_ID="${SITE_ID:-1}"
BIT_INDEX="${BIT_INDEX:-0}"
ABS_TOL="${ABS_TOL:?ABS_TOL is required}"
REL_TOL="${REL_TOL:?REL_TOL is required}"
BASELINE="${BASELINE:-0}"
COMPARE_MODE="${COMPARE_MODE:-${BITIR_COMPARE_MODE:-exact}}"
INJECT_TARGET="${INJECT_TARGET:-${BITIR_FAULT_MODEL_INJECT_TARGET:-result}}"
INT_FLOAT_ONLY="${INT_FLOAT_ONLY:-${BITIR_FAULT_MODEL_INT_FLOAT_ONLY:-1}}"
INCLUDE_CONSTANTS="${INCLUDE_CONSTANTS:-${BITIR_FAULT_MODEL_INCLUDE_CONSTANTS:-0}}"
CACHE_DEVICE_IR="${CACHE_DEVICE_IR:-1}"
GENERATE_IR_LL="${GENERATE_IR_LL:-0}"
HOST_SOURCES=()

if [[ -z "${BENCH}" ]]; then
  echo "BENCH is required"
  exit 1
fi
if [[ -z "${CLANG}" || -z "${OPT_BIN}" || -z "${LLVM_AS}" || -z "${LLC_BIN}" ]]; then
  echo "Required LLVM tools are not available in PATH"
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

signal_name_from_exit() {
  local status="$1"
  if [[ ! "${status}" =~ ^[0-9]+$ ]]; then
    return 1
  fi
  local sig=0
  if (( status > 128 && status < 192 )); then
    sig=$((status - 128))
  else
    return 1
  fi
  case "${sig}" in
    4) echo "SIGILL" ;;
    6) echo "SIGABRT" ;;
    8) echo "SIGFPE" ;;
    9) echo "SIGKILL" ;;
    11) echo "SIGSEGV" ;;
    13) echo "SIGPIPE" ;;
    15) echo "SIGTERM" ;;
    *) echo "SIG${sig}" ;;
  esac
}

signal_name_from_failure_kind() {
  local kind="$1"
  case "${kind}" in
    signal_segv|signal_segv_text|signal_segv_cuda_illegal_address) echo "SIGSEGV" ;;
    signal_abrt|signal_abrt_text) echo "SIGABRT" ;;
    signal_fpe|signal_fpe_text) echo "SIGFPE" ;;
    signal_ill) echo "SIGILL" ;;
    signal_kill) echo "SIGKILL" ;;
    signal_term) echo "SIGTERM" ;;
    *) return 1 ;;
  esac
}

taxonomy_from_result() {
  local result="$1"
  local status="$2"
  local failure_kind="$3"
  local out_path="$4"
  local err_path="$5"
  local flagged=0
  if [[ "${result}" == "DUE" || "${result}" == "FAILURE" || -n "${failure_kind}" || "${status}" != "0" ]]; then
    flagged=1
  else
    local out_text=""
    local err_text=""
    [[ -f "${out_path}" ]] && out_text="$(cat "${out_path}" 2>/dev/null || true)"
    [[ -f "${err_path}" ]] && err_text="$(cat "${err_path}" 2>/dev/null || true)"
    local combined_text="${out_text}"$'\n'"${err_text}"
    local fail_regex="${BITIR_STATUS_FAIL_REGEX:-}"
    local pass_regex="${BITIR_STATUS_PASS_REGEX:-}"
    local fail_line="${BITIR_STATUS_FAIL_LINE:-}"
    local pass_line="${BITIR_STATUS_PASS_LINE:-}"
    if [[ -n "${fail_regex}" ]] && grep -Eq "${fail_regex}" <<< "${combined_text}"; then
      flagged=1
    elif [[ -n "${pass_regex}" ]] && grep -Eq "${pass_regex}" <<< "${combined_text}"; then
      flagged=0
    elif [[ -n "${fail_line}" ]] && grep -Fxq "${fail_line}" <<< "${out_text}"; then
      flagged=1
    elif [[ -n "${pass_line}" ]] && grep -Fxq "${pass_line}" <<< "${out_text}"; then
      flagged=0
    fi
  fi
  case "${result}" in
    MASKED)
      if [[ ${flagged} -eq 1 ]]; then
        echo "MASKED_FLAGGED"
      else
        echo "MASKED_UNFLAGGED"
      fi
      ;;
    SDC)
      if [[ ${flagged} -eq 1 ]]; then
        echo "SDC_FLAGGED"
      else
        echo "SDC_NOTFLAGGED"
      fi
      ;;
    DUE|FAILURE)
      if [[ "${status}" == timeout_* || "${failure_kind}" == "hang_timeout" ]]; then
        echo "FAILURE_HANG"
      else
        echo "FAILURE_NONHANG"
      fi
      ;;
    *)
      echo ""
      ;;
  esac
}

classify_failure_kind() {
  local status="$1"
  local result="$2"
  local out_path="$3"
  local err_path="$4"

  if [[ "${status}" == timeout_* ]]; then
    echo "hang_timeout"
    return 0
  fi
  case "${status}" in
    missing_dump_no_crash) echo "missing_dump" ; return 0 ;;
    missing_out) echo "missing_out_stub" ; return 0 ;;
    nul_output) echo "nul_output" ; return 0 ;;
  esac

  local signal_name=""
  if signal_name="$(signal_name_from_exit "${status}")"; then
    case "${signal_name}" in
      SIGSEGV) echo "signal_segv" ;;
      SIGABRT) echo "signal_abrt" ;;
      SIGFPE) echo "signal_fpe" ;;
      SIGILL) echo "signal_ill" ;;
      SIGKILL) echo "signal_kill" ;;
      SIGTERM) echo "signal_term" ;;
      *) echo "signal_exit" ;;
    esac
    return 0
  fi

  if [[ -f "${out_path}" || -f "${err_path}" ]]; then
    if grep -Eqi "an illegal memory access was encountered|illegal memory access" "${out_path}" "${err_path}" 2>/dev/null; then
      echo "signal_segv_cuda_illegal_address"
      return 0
    fi
    if grep -Eqi "misaligned address" "${out_path}" "${err_path}" 2>/dev/null; then
      echo "gpu_misaligned_address"
      return 0
    fi
    if grep -Eqi "unspecified launch failure" "${out_path}" "${err_path}" 2>/dev/null; then
      echo "gpu_unspecified_launch_failure"
      return 0
    fi
    if grep -Eqi "launch failed|launch failure" "${out_path}" "${err_path}" 2>/dev/null; then
      echo "gpu_launch_failure"
      return 0
    fi
    if grep -Eqi "device-side assert|device side assert" "${out_path}" "${err_path}" 2>/dev/null; then
      echo "gpu_device_assert"
      return 0
    fi
    if grep -Eqi "out of memory" "${out_path}" "${err_path}" 2>/dev/null; then
      echo "gpu_out_of_memory"
      return 0
    fi
    if grep -Eqi "invalid device function" "${out_path}" "${err_path}" 2>/dev/null; then
      echo "gpu_invalid_device_function"
      return 0
    fi
    if grep -Eqi "warp illegal instruction|trap" "${out_path}" "${err_path}" 2>/dev/null; then
      echo "gpu_trap"
      return 0
    fi
    if grep -Eqi "segmentation fault|sigsegv" "${out_path}" "${err_path}" 2>/dev/null; then
      echo "signal_segv_text"
      return 0
    fi
    if grep -Eqi "aborted|sigabrt" "${out_path}" "${err_path}" 2>/dev/null; then
      echo "signal_abrt_text"
      return 0
    fi
    if grep -Eqi "floating point exception|sigfpe" "${out_path}" "${err_path}" 2>/dev/null; then
      echo "signal_fpe_text"
      return 0
    fi
    if grep -Eqi "found [0-9]+ errors in [0-9]+ locations \\(FAIL\\)|\\bFAIL\\b" "${out_path}" "${err_path}" 2>/dev/null; then
      echo "kernel_reported_fail"
      return 0
    fi
  fi

  if [[ "${status}" =~ ^[0-9]+$ && "${status}" != "0" ]]; then
    echo "nonzero_exit_${status}"
    return 0
  fi
  if [[ "${result}" == "FAILURE" ]]; then
    echo "failure_unspecified"
    return 0
  fi
  return 1
}

SRC_DIR="${BITIR_SOURCE_DIR:-}"
GOLDEN_NAME="${BITIR_GOLDEN_FILE:-${BENCH}.bin}"
RUN_ARGS=()
if [[ -n "${BITIR_RUN_ARGS:-}" ]]; then
  read -r -a RUN_ARGS <<< "${BITIR_RUN_ARGS}"
fi
if [[ -z "${SRC_DIR}" ]]; then
  echo "Missing YAML source_dir for BENCH=${BENCH} machine=${BITIR_MACHINE}"
  exit 1
fi

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
GOLDEN="${GOLDEN:-${REPO_ROOT}/${BITIR_MACHINE_GOLDEN_ROOT:?BITIR_MACHINE_GOLDEN_ROOT is required}/${GOLDEN_NAME}}"
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
GOLDEN_TEXT="${GOLDEN_TEXT:-${REPO_ROOT}/${BITIR_MACHINE_GOLDEN_ROOT:?BITIR_MACHINE_GOLDEN_ROOT is required}/${BITIR_GOLDEN_FILE:-${BENCH}.txt}}"
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

NVCC_BIN="${CUDA_HOME}/bin/${COMPILER_DRIVER}"
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
failure_kind=""
failure_signal=""
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
    if [[ "${status}" == "0" ]]; then
      # Process exited cleanly but did not emit a dump: treat as incomplete data.
      result="DUE"
      status="missing_dump_no_crash"
      echo "[compare] required dump missing (non-crash) ${RUN_DUMP_TMP}" >> "${RUN_OUT}"
    else
      echo "[compare] skipped: missing dump ${RUN_DUMP_TMP} status=${status}" >> "${RUN_OUT}"
    fi
  fi
fi

# Detect GPU busy/unavailable errors and flag for throttling.
if [[ "${BASELINE}" -eq 0 ]]; then
  if grep -qi "CUDA-capable device(s) is/are busy or unavailable" "${RUN_OUT}" "${RUN_ERR}" 2>/dev/null; then
    echo "[gpu] busy/unavailable detected; flagging ${BUSY_FLAG}" >> "${RUN_OUT}"
    touch "${BUSY_FLAG}"
  fi
fi

if [[ "${BASELINE}" -eq 0 ]]; then
  failure_kind="$(classify_failure_kind "${status}" "${result}" "${RUN_OUT}" "${RUN_ERR}" || true)"
  failure_signal="$(signal_name_from_exit "${status}" || true)"
  if [[ -z "${failure_signal}" && -n "${failure_kind}" ]]; then
    failure_signal="$(signal_name_from_failure_kind "${failure_kind}" || true)"
  fi
  if [[ -n "${failure_kind}" ]]; then
    echo "failure_kind=${failure_kind}" >> "${RUN_OUT}"
  fi
  if [[ -n "${failure_signal}" ]]; then
    echo "failure_signal=${failure_signal}" >> "${RUN_OUT}"
  fi
fi

taxonomy=""
if [[ "${BASELINE}" -eq 0 ]]; then
  taxonomy="$(taxonomy_from_result "${result}" "${status}" "${failure_kind}" "${RUN_OUT}" "${RUN_ERR}")"
  if [[ -n "${taxonomy}" ]]; then
    echo "taxonomy=${taxonomy}" >> "${RUN_OUT}"
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
  echo "site_id,bit_index,result,taxonomy,exit_code,failure_kind,failure_signal,stdout,stderr,dump,metric_abs_max,metric_mean_abs,metric_rmse,metric_max_rel,metric_mean_rel,metric_p95_abs,metric_p99_abs,metric_num_bad,metric_frac_bad,metric_max_ulp,metric_mean_ulp,metric_ham_bits,metric_ham_bytes,metric_size_bytes" > "${CSV}"
fi
if [[ "${BASELINE}" -eq 1 ]]; then
  echo "0,0,${result},,${status},,,${BASELINE_OUT},${BASELINE_ERR},${dump_path},${metric_abs_max},${metric_mean_abs},${metric_rmse},${metric_max_rel},${metric_mean_rel},${metric_p95_abs},${metric_p99_abs},${metric_num_bad},${metric_frac_bad},${metric_max_ulp},${metric_mean_ulp},${metric_ham_bits},${metric_ham_bytes},${metric_size_bytes}" >> "${CSV}"
else
  echo "${SITE_ID},${BIT_INDEX},${result},${taxonomy},${status},${failure_kind},${failure_signal},${RUN_OUT},${RUN_ERR},${dump_path},${metric_abs_max},${metric_mean_abs},${metric_rmse},${metric_max_rel},${metric_mean_rel},${metric_p95_abs},${metric_p99_abs},${metric_num_bad},${metric_frac_bad},${metric_max_ulp},${metric_mean_ulp},${metric_ham_bits},${metric_ham_bytes},${metric_size_bytes}" >> "${CSV}"
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
