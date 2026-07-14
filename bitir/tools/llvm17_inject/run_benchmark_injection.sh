#!/usr/bin/env bash
set -euo pipefail

need() {
  local name="$1"
  if [[ -z "${!name:-}" ]]; then
    echo "missing required setting: ${name}" >&2
    exit 1
  fi
}

trace_level_rank() {
  case "$1" in
    off|"") echo 0 ;;
    basic) echo 1 ;;
    machine) echo 2 ;;
    full) echo 3 ;;
    *)
      echo "unknown trace level: $1" >&2
      exit 1
      ;;
  esac
}

trace_record_command() {
  local name="$1"
  shift
  [[ -n "${TRACE_DIR:-}" ]] || return 0
  printf '%q ' "$@" > "$(trace_file "${name}.cmd")"
  printf '\n' >> "$(trace_file "${name}.cmd")"
}

trace_file() {
  printf '%s/%s_%s\n' "${TRACE_DIR}" "${TRACE_PREFIX}" "$1"
}

run_shell_block() {
  local label="$1"
  local command_text="$2"
  [[ -n "${command_text}" ]] || return 0
  [[ -n "${TRACE_DIR:-}" ]] && printf '%s\n' "${command_text}" > "$(trace_file "${label}.sh")"
  eval "${command_text}"
}

run_env_bin() {
  local env_line="$1"
  shift
  if [[ -z "${env_line}" ]]; then
    "$@"
    return
  fi
  local env_parts=()
  read -r -a env_parts <<< "${env_line}"
  env "${env_parts[@]}" "$@"
}

trace_runtime_env() {
  [[ -n "${TRACE_DIR:-}" ]] || return 0
  {
    echo "PWD=$(pwd)"
    env | sort
  } > "$(trace_file runtime_env.txt)" 2>/dev/null
}

trace_gpu_state() {
  local label="$1"
  [[ -n "${TRACE_DIR:-}" ]] || return 0
  [[ "${TRACE_RANK}" -ge 2 ]] || return 0
  [[ -n "${BITIR_MACHINE_GPU_QUERY_COMMAND:-}" ]] || return 0
  printf '%s\n' "${BITIR_MACHINE_GPU_QUERY_COMMAND}" > "$(trace_file "gpu_${label}.sh")"
  TRACE_GPU_LABEL="${label}" eval "${BITIR_MACHINE_GPU_QUERY_COMMAND}" > "$(trace_file "gpu_${label}.txt")" 2>&1 || true
}

resolve_source_file() {
  local dir="$1"
  local pattern="${BITIR_MACHINE_SOURCE_FILE:-}"
  need BITIR_MACHINE_SOURCE_FILE
  if [[ "${pattern}" == *"*"* || "${pattern}" == *"?"* || "${pattern}" == *"["* ]]; then
    find "${dir}" -maxdepth 2 -path "${dir}/${pattern}" | sort | head -n 1
    return
  fi
  printf '%s\n' "${dir}/${pattern}"
}

copy_trace_globs() {
  [[ -n "${TRACE_DIR:-}" ]] || return 0
  [[ "${TRACE_RANK}" -ge 2 ]] || return 0
  local pattern
  for pattern in ${BITIR_MACHINE_TRACE_COPY_GLOBS:-}; do
    compgen -G "${pattern}" > /dev/null || continue
    local file
    for file in ${pattern}; do
      [[ -f "${file}" ]] || continue
      cp -f "${file}" "$(trace_file "$(basename "${file}")")"
    done
  done
}

trace_finalize() {
  [[ -n "${TRACE_DIR:-}" ]] || return 0
  local metadata_dir metadata_csv worklist_csv source_line start end file
  metadata_dir="${BITIR_TRACE_METADATA_DIR:-${RESULTS_DIR}}"
  metadata_csv="${BITIR_TRACE_METADATA_CSV:-${metadata_dir}/sites_metadata.csv}"
  worklist_csv="${metadata_dir}/${TRACE_WORKLIST_NAME}"

  cat > "$(trace_file trace_manifest.txt)" <<EOF
trace_level=${TRACE_LEVEL}
bench=${BENCH}
source=${SRC}
source_dir=${BITIR_SOURCE_DIR}
site_id=${SITE_ID}
bit_index=${BIT_INDEX}
inject_target=${INJECT_TARGET}
compare_mode=${COMPARE_MODE}
phase=${TRACE_PHASE}
results_dir=${RESULTS_DIR}
out_dir=${OUT_DIR}
run_out=${RUN_OUT}
run_err=${RUN_ERR}
run_dump=${RUN_DUMP}
EOF

  trace_runtime_env

  if [[ -f "${metadata_csv}" ]]; then
    {
      head -n 1 "${metadata_csv}"
      awk -F, -v site="${SITE_ID}" '$1 == site { print }' "${metadata_csv}"
    } > "$(trace_file site_metadata.csv)"
    source_line="$(awk -F, 'NR == 2 { print $8 }' "$(trace_file site_metadata.csv)" 2>/dev/null || true)"
    if [[ -n "${source_line}" && "${source_line}" =~ ^[0-9]+$ ]]; then
      start=$((source_line - TRACE_SOURCE_WINDOW))
      end=$((source_line + TRACE_SOURCE_WINDOW))
      [[ "${start}" -lt 1 ]] && start=1
      sed -n "${start},${end}p" "${SRC}" > "$(trace_file source_window.txt)"
    fi
  fi

  if [[ -f "${worklist_csv}" ]]; then
    {
      head -n 1 "${worklist_csv}"
      awk -F, -v site="${SITE_ID}" -v bit="${BIT_INDEX}" '$2 == site && $3 == bit { print }' "${worklist_csv}"
    } > "$(trace_file worklist_row.csv)"
  fi

  for file in "${IR_LL}" "${IR_BC}" "${IR_INJ_BC}" "${RUN_OUT}" "${RUN_ERR}" "${RUN_DUMP:-}" "${BIN_PATH}"; do
    [[ -f "${file}" ]] || continue
    cp -f "${file}" "$(trace_file "$(basename "${file}")")"
  done

  local trace_opt="${BITIR_MACHINE_OPT_BIN:-${OPT_BIN:-}}"
  if [[ "${TRACE_RANK}" -ge 2 && -n "${trace_opt}" && -f "${IR_INJ_BC}" ]]; then
    trace_record_command render_injected_ir "${trace_opt}" -S "${IR_INJ_BC}" -o "$(trace_file device.injected.ll)"
    "${trace_opt}" -S "${IR_INJ_BC}" -o "$(trace_file device.injected.ll)" >/dev/null 2>&1 || true
  fi

  if [[ "${TRACE_RANK}" -ge 2 && -f "${BIN_PATH}" ]]; then
    ldd "${BIN_PATH}" > "$(trace_file binary_libraries.txt)" 2>&1 || true
  fi

  copy_trace_globs

  if [[ "${TRACE_RANK}" -ge 3 ]]; then
    for file in "${OUT_DIR}"/*; do
      [[ -f "${file}" ]] || continue
      cp -f "${file}" "$(trace_file "$(basename "${file}")")"
    done
  fi
}

compare_result() {
  if [[ "${COMPARE_MODE}" == "text" ]]; then
    python3 "${COMPARE_TEXT}" --baseline "${TEXT_BASELINE}" --candidate "${TEXT_CANDIDATE}"
    return
  fi
  if [[ "${COMPARE_MODE}" == "float" ]]; then
    python3 "${COMPARE_FLOAT}" "${GOLDEN_FILE}" "${DUMP_CANDIDATE}" --abs-tol "${ABS_TOL}" --rel-tol "${REL_TOL}"
    return
  fi
  python3 "${COMPARE_EXACT}" "${GOLDEN_FILE}" "${DUMP_CANDIDATE}"
}

write_summary() {
  if [[ ! -f "${SUMMARY_CSV}" ]]; then
    echo "site_id,bit_index,trial,result,exit_code,stdout,stderr,dump" > "${SUMMARY_CSV}"
  fi
  echo "${SITE_ID},${BIT_INDEX},${TRIAL_INDEX},${RESULT},${RUN_STATUS},${RUN_OUT},${RUN_ERR},${DUMP_RECORD}" >> "${SUMMARY_CSV}"
}

print_file_tail() {
  local label="$1"
  local path="$2"
  [[ -f "${path}" ]] || return 0
  echo "[debug] ${label}: ${path}"
  if [[ -s "${path}" ]]; then
    echo "[debug] tail ${label}:"
    tail -n 40 "${path}" || true
  else
    echo "[debug] ${label} is empty"
  fi
}

write_trace_results() {
  [[ -n "${TRACE_DIR:-}" ]] || return 0
  {
    echo "result=${RESULT}"
    echo "exit_code=${RUN_STATUS}"
    echo "bench=${BENCH}"
    echo "baseline=${BASELINE}"
    echo "site_id=${SITE_ID}"
    echo "bit_index=${BIT_INDEX}"
    echo "stdout=${RUN_OUT}"
    echo "stderr=${RUN_ERR}"
    echo "scratch=${OUT_DIR}"
    echo "dump=${RUN_DUMP}"
    echo "trace_dir=${TRACE_DIR}"
  } > "$(trace_file trace_results.txt)"
}

print_failure_debug_body() {
  echo "[debug] failure bench=${BENCH} baseline=${BASELINE} site=${SITE_ID} bit=${BIT_INDEX}"
  echo "[debug] result=${RESULT} exit=${RUN_STATUS}"
  echo "[debug] stdout=${RUN_OUT}"
  echo "[debug] stderr=${RUN_ERR}"
  echo "[debug] scratch=${OUT_DIR}"
  echo "[debug] expected_dump=${RUN_DUMP}"
  [[ -n "${TRACE_DIR:-}" ]] && echo "[debug] trace=${TRACE_DIR}"
  [[ -f "${RUN_DUMP}" ]] || echo "[debug] dump was not produced"
  print_file_tail stdout "${RUN_OUT}"
  print_file_tail stderr "${RUN_ERR}"
}

print_failure_debug() {
  case "${RESULT}" in
    BASELINE|MASKED|SDC|DUE) return 0 ;;
  esac
  if [[ -n "${TRACE_DIR:-}" ]]; then
    print_failure_debug_body | tee -a "$(trace_file trace_results.txt)"
    return
  fi
  print_failure_debug_body
}

common_run() {
  mkdir -p "${RESULTS_DIR}" "${OUT_DIR}"
  TRIAL_INDEX="${TRIAL_INDEX:-1}"
  TRIAL_SUFFIX=""
  if [[ "${TRIAL_INDEX}" != "1" ]]; then
    TRIAL_SUFFIX="_trial${TRIAL_INDEX}"
  fi
  RESULT_TAG="${RESULT_TAG:-${BENCH}_${PHASE:-inject}}"
  RESULT_FILE_PREFIX=""
  RESULT_FILE_SUFFIX=""
  if [[ -n "${RESULT_TAG}" ]]; then
    RESULT_FILE_PREFIX="${RESULT_TAG}_"
    RESULT_FILE_SUFFIX="_${RESULT_TAG}"
  fi
  RUN_OUT="${RESULTS_DIR}/${RESULT_FILE_PREFIX}site${SITE_ID}_bit${BIT_INDEX}${TRIAL_SUFFIX}.out"
  RUN_ERR="${RESULTS_DIR}/${RESULT_FILE_PREFIX}site${SITE_ID}_bit${BIT_INDEX}${TRIAL_SUFFIX}.err"
  RUN_DUMP="${OUT_DIR}/${BENCH}_site${SITE_ID}_bit${BIT_INDEX}${TRIAL_SUFFIX}.bin"
  DUMP_RECORD=""
  SUMMARY_CSV="${CSV:-${RESULTS_DIR}/${RESULT_TAG:-summary}_summary.csv}"
  if [[ "${TRACE_RANK}" -gt 0 ]]; then
    TRACE_PREFIX="${RESULT_FILE_PREFIX}site${SITE_ID}_bit${BIT_INDEX}${TRIAL_SUFFIX}"
    if [[ "${BASELINE}" == "1" ]]; then
      TRACE_PREFIX="${RESULT_FILE_PREFIX}baseline${TRIAL_SUFFIX}"
    fi
    TRACE_DIR="${RESULTS_DIR}"
    mkdir -p "${TRACE_DIR}"
  fi
  if [[ "${BASELINE}" == "1" ]]; then
    RUN_OUT="${RESULTS_DIR}/${RESULT_FILE_PREFIX}baseline.out"
    RUN_ERR="${RESULTS_DIR}/${RESULT_FILE_PREFIX}baseline.err"
    RUN_DUMP="${OUT_DIR}/${BENCH}_baseline.bin"
  elif [[ "${SKIP_EXISTING:-1}" == "1" && -f "${RUN_OUT}" && -f "${RUN_ERR}" ]]; then
    echo "[inject] skip existing site=${SITE_ID} bit=${BIT_INDEX}"
    exit 0
  fi
}

setup_common() {
  need BITIR_MACHINE_GOLDEN_ROOT
  need BITIR_MACHINE_RESULTS_ROOT
  need BITIR_SOURCE_DIR
  need BITIR_MACHINE_SOURCE_FILE
  need BENCH
  need SITE_ID
  need BIT_INDEX
  need BITIR_COMPARE_MODE
  if [[ -z "${BITIR_MACHINE_INJECT_BUILD_BASELINE:-}" && -z "${BITIR_MACHINE_INJECT_BUILD:-}" ]]; then
    echo "missing required setting: BITIR_MACHINE_INJECT_BUILD_BASELINE or BITIR_MACHINE_INJECT_BUILD" >&2
    exit 1
  fi
  if [[ -z "${BITIR_MACHINE_INJECT_BUILD_INJECTED:-}" && -z "${BITIR_MACHINE_INJECT_BUILD:-}" ]]; then
    echo "missing required setting: BITIR_MACHINE_INJECT_BUILD_INJECTED or BITIR_MACHINE_INJECT_BUILD" >&2
    exit 1
  fi

  REPO_ROOT="${REPO_ROOT:-$(pwd)}"
  BITIR_ROOT="${BITIR_ROOT:-${REPO_ROOT}/bitir}"
  need BITIR_BENCHMARK_ROOT
  BITIR_BENCHMARK_SOURCE_ROOT="${BITIR_BENCHMARK_SOURCE_ROOT:-${BITIR_BENCHMARK_ROOT}/src}"
  if [[ "${BITIR_SOURCE_DIR}" == /* ]]; then
    BENCH_DIR="${BITIR_SOURCE_DIR}"
  elif [[ "${BITIR_SOURCE_DIR}" == bitir/* ]]; then
    BENCH_DIR="${REPO_ROOT}/${BITIR_SOURCE_DIR}"
  else
    BENCH_DIR="${BITIR_BENCHMARK_ROOT}/${BITIR_SOURCE_DIR}"
  fi
  SRC="$(resolve_source_file "${BENCH_DIR}")"
  [[ -f "${SRC}" ]] || { echo "missing source file: ${SRC}" >&2; exit 1; }

  BASELINE="${BASELINE:-0}"
  COMPARE_MODE="${BITIR_COMPARE_MODE}"
  if [[ "${COMPARE_MODE}" == "float" ]]; then
    need ABS_TOL
    need REL_TOL
  fi
  INJECT_TARGET="${INJECT_TARGET:-${BITIR_FAULT_MODEL_INJECT_TARGET:-result}}"
  INT_FLOAT_ONLY="${INT_FLOAT_ONLY:-${BITIR_FAULT_MODEL_INT_FLOAT_ONLY:-1}}"
  INCLUDE_CONSTANTS="${INCLUDE_CONSTANTS:-${BITIR_FAULT_MODEL_INCLUDE_CONSTANTS:-0}}"
  TRACE_LEVEL="${TRACE_LEVEL:-${BITIR_FAULT_MODEL_TRACE_LEVEL:-off}}"
  TRACE_RANK="$(trace_level_rank "${TRACE_LEVEL}")"
  TRACE_SOURCE_WINDOW="${TRACE_SOURCE_WINDOW:-${BITIR_FAULT_MODEL_TRACE_SOURCE_WINDOW:-6}}"
  TRACE_PHASE="${PHASE:-${BITIR_FAULT_MODEL_PHASE:-}}"
  TRACE_WORKLIST_NAME="${BITIR_TRACE_WORKLIST_NAME:-worklist.csv}"

  GOLDEN_NAME="${BITIR_GOLDEN_FILE:-${BENCH}.bin}"
  GOLDEN_ROOT="${REPO_ROOT}/${BITIR_MACHINE_GOLDEN_ROOT}"
  GOLDEN_FILE="${GOLDEN_ROOT}/${GOLDEN_NAME}"
  GOLDEN_TEXT="${GOLDEN_ROOT}/${BITIR_GOLDEN_FILE:-${BENCH}.txt}"
  RESULTS_DIR="${RESULTS_DIR:-${REPO_ROOT}/results/$(date -u +%Y%m%d_%H%M%S)}"
  SCRATCH_ROOT="${TMPDIR:-/tmp}"
  OUT_DIR="${OUT_DIR:-${SCRATCH_ROOT}/bitir_${BENCH}_site${SITE_ID}_bit${BIT_INDEX}}"
  PLUGIN="${PLUGIN:-${BITIR_ROOT}/tools/llvm17_inject/libfi_inject.so}"

  RUN_ARGS=()
  [[ -n "${BITIR_RUN_ARGS:-}" ]] && read -r -a RUN_ARGS <<< "${BITIR_RUN_ARGS}"
  EXTRA_INCLUDES=()
  [[ -n "${BITIR_EXTRA_INCLUDES:-}" ]] && read -r -a EXTRA_INCLUDES <<< "${BITIR_EXTRA_INCLUDES}"
  INCLUDE_ARGS=(-I "${BENCH_DIR}" -I "${BITIR_BENCHMARK_SOURCE_ROOT}")
  local include_path
  for include_path in "${EXTRA_INCLUDES[@]}"; do
    [[ "${include_path}" == /* ]] || include_path="${REPO_ROOT}/${include_path}"
    INCLUDE_ARGS+=(-I "${include_path}")
  done

  COMPARE_FLOAT="${BITIR_ROOT}/tools/llvm17_inject/compare_float_dump.py"
  COMPARE_EXACT="${BITIR_ROOT}/tools/llvm17_inject/compare_binary_exact.py"
  COMPARE_TEXT="${BITIR_ROOT}/tools/llvm17_inject/compare_text_signature.py"

  [[ -f "${PLUGIN}" ]] || { echo "missing plugin: ${PLUGIN}" >&2; exit 1; }
  if [[ "${COMPARE_MODE}" == "text" ]]; then
    [[ -f "${GOLDEN_TEXT}" ]] || { echo "missing golden text: ${GOLDEN_TEXT}" >&2; exit 1; }
  else
    [[ -f "${GOLDEN_FILE}" ]] || { echo "missing golden file: ${GOLDEN_FILE}" >&2; exit 1; }
  fi

  IR_LL="${OUT_DIR}/device.ll"
  IR_BC="${OUT_DIR}/device.bc"
  IR_INJ_BC="${OUT_DIR}/device.injected.bc"
  PTX_FILE="${OUT_DIR}/device.injected.ptx"
  FATBIN_FILE="${OUT_DIR}/device.injected.fatbin"
  POSTLINK_TABLE="${OUT_DIR}/postlink.table"
  BIN_PATH="${OUT_DIR}/${BENCH}"
  export REPO_ROOT BITIR_ROOT BITIR_BENCHMARK_ROOT BITIR_BENCHMARK_SOURCE_ROOT
  export BENCH_DIR SRC OUT_DIR BIN_PATH IR_LL IR_BC IR_INJ_BC PTX_FILE FATBIN_FILE POSTLINK_TABLE
  export PLUGIN SITE_ID BIT_INDEX INJECT_TARGET INT_FLOAT_ONLY INCLUDE_CONSTANTS
}

build_binary() {
  if [[ -n "${BITIR_MACHINE_INJECT_PREPARE:-}" ]]; then
    run_shell_block inject_prepare "${BITIR_MACHINE_INJECT_PREPARE}"
  fi
  if [[ "${BASELINE}" == "1" ]]; then
    if [[ "${SITE_ID}" == "-1" ]]; then
      run_shell_block inject_build_baseline_no_flip "${BITIR_MACHINE_INJECT_BUILD_INJECTED:-${BITIR_MACHINE_INJECT_BUILD:-}}"
      return
    fi
    run_shell_block inject_build_baseline "${BITIR_MACHINE_INJECT_BUILD_BASELINE:-${BITIR_MACHINE_INJECT_BUILD:-}}"
    return
  fi
  run_shell_block inject_build_injected "${BITIR_MACHINE_INJECT_BUILD_INJECTED:-${BITIR_MACHINE_INJECT_BUILD:-}}"
}

run_binary() {
  set +e
  trace_runtime_env
  trace_gpu_state before
  if [[ "${COMPARE_MODE}" == "text" ]]; then
    trace_record_command run_binary "${BIN_PATH}" "${RUN_ARGS[@]}"
    "${BIN_PATH}" "${RUN_ARGS[@]}" > "${RUN_OUT}" 2> "${RUN_ERR}"
    RUN_STATUS=$?
  else
    trace_record_command run_binary run_env_bin "${BITIR_MACHINE_RUN_DUMP_ENV:-}" "${BIN_PATH}" "${RUN_ARGS[@]}" "${RUN_DUMP}"
    BITIR_DUMP_PATH="${RUN_DUMP}" run_env_bin "${BITIR_MACHINE_RUN_DUMP_ENV:-}" "${BIN_PATH}" "${RUN_ARGS[@]}" "${RUN_DUMP}" > "${RUN_OUT}" 2> "${RUN_ERR}"
    RUN_STATUS=$?
  fi
  trace_gpu_state after
  set -e
}

finalize_run() {
  RESULT="FAILURE"
  DUMP_RECORD=""

  if [[ "${BASELINE}" == "1" ]]; then
    if [[ "${COMPARE_MODE}" == "text" ]]; then
      TEXT_BASELINE="${GOLDEN_TEXT}"
      TEXT_CANDIDATE="${RUN_OUT}"
      if compare_result >> "${RUN_OUT}" 2>> "${RUN_ERR}"; then
        RESULT="BASELINE"
        cp -f "${RUN_OUT}" "${RESULTS_DIR}/baseline.stdout"
      else
        RESULT="BASELINE_MISMATCH"
      fi
    elif [[ -f "${RUN_DUMP}" ]]; then
      DUMP_CANDIDATE="${RUN_DUMP}"
      if compare_result >> "${RUN_OUT}" 2>> "${RUN_ERR}"; then
        RESULT="BASELINE"
      else
        RESULT="BASELINE_MISMATCH"
      fi
    fi
  else
    if [[ "${COMPARE_MODE}" == "text" && "${RUN_STATUS}" == "0" ]]; then
      TEXT_BASELINE="${RESULTS_DIR}/baseline.stdout"
      TEXT_CANDIDATE="${RUN_OUT}"
      if compare_result >> "${RUN_OUT}" 2>> "${RUN_ERR}"; then
        RESULT="MASKED"
      else
        RESULT="SDC"
      fi
    elif [[ -f "${RUN_DUMP}" ]]; then
      DUMP_CANDIDATE="${RUN_DUMP}"
      if compare_result >> "${RUN_OUT}" 2>> "${RUN_ERR}"; then
        RESULT="MASKED"
      else
        RESULT="SDC"
      fi
    elif [[ "${RUN_STATUS}" == "0" ]]; then
      RESULT="DUE"
    fi
  fi

  trace_finalize
  write_trace_results

  if [[ -f "${RUN_DUMP}" && "${KEEP_DUMPS:-0}" == "1" && "${BASELINE}" != "1" ]]; then
    local dump_final="${RESULTS_DIR}/${BENCH}_site${SITE_ID}_bit${BIT_INDEX}${TRIAL_SUFFIX}.bin"
    mv -f "${RUN_DUMP}" "${dump_final}"
    DUMP_RECORD="${dump_final}"
  fi

  echo "Result: ${RESULT} (exit ${RUN_STATUS})" >> "${RUN_OUT}"
  echo "Result: ${RESULT} (exit ${RUN_STATUS})"
  print_failure_debug
  write_summary
  if [[ "${BASELINE}" == "1" && "${RESULT}" != "BASELINE" ]]; then
    echo "[debug] baseline failed; stopping before injection campaign" >&2
    exit 1
  fi
}

setup_common
TRIAL_INDEX=1
common_run
build_binary

TRACE_REPEATS="${TRACE_REPEATS:-1}"
if ! [[ "${TRACE_REPEATS}" =~ ^[0-9]+$ ]] || [[ "${TRACE_REPEATS}" -lt 1 ]]; then
  TRACE_REPEATS=1
fi
if [[ "${BASELINE}" == "1" ]]; then
  TRACE_REPEATS=1
fi

for ((trial = 1; trial <= TRACE_REPEATS; trial++)); do
  TRIAL_INDEX="${trial}"
  common_run
  run_binary
  finalize_run
done
