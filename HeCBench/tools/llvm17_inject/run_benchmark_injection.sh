#!/usr/bin/env bash
set -euo pipefail

need() {
  local name="$1"
  if [[ -z "${!name:-}" ]]; then
    echo "missing required setting: ${name}" >&2
    exit 1
  fi
}

tool_or_fail() {
  local current="$1"
  local name="$2"
  shift 2
  if [[ -n "${current}" && -x "${current}" ]]; then
    printf '%s\n' "${current}"
    return 0
  fi
  if command -v "${name}" >/dev/null 2>&1; then
    command -v "${name}"
    return 0
  fi
  local candidate
  for candidate in "$@"; do
    if [[ -n "${candidate}" && -x "${candidate}" ]]; then
      printf '%s\n' "${candidate}"
      return 0
    fi
  done
  echo "missing required tool: ${name}" >&2
  exit 1
}

find_tool_under_root() {
  local root="$1"
  local name="$2"
  [[ -n "${root}" && -d "${root}" ]] || return 1
  find "${root}" -type f -name "${name}" 2>/dev/null | head -n 1
}

trace_level_rank() {
  case "$1" in
    off|"")
      echo 0
      ;;
    basic)
      echo 1
      ;;
    backend)
      echo 2
      ;;
    full)
      echo 3
      ;;
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
  printf '%q ' "$@" > "${TRACE_DIR}/${name}.cmd"
  printf '\n' >> "${TRACE_DIR}/${name}.cmd"
}

trace_runtime_env() {
  [[ -n "${TRACE_DIR:-}" ]] || return 0
  {
    echo "PWD=$(pwd)"
    env | sort | egrep '^(ONEAPI_|SYCL_|UR_|ZE_|LEVEL_ZERO_|LIBOMPTARGET_|CUDA_|NVIDIA_|ROCR_|HIP_|HSA_)' || true
  } > "${TRACE_DIR}/runtime_env.txt" 2>/dev/null

  if command -v sycl-ls >/dev/null 2>&1; then
    trace_record_command sycl_ls sycl-ls
    sycl-ls > "${TRACE_DIR}/sycl-ls.txt" 2>&1 || true
  fi
}

trace_gpu_state() {
  local label="$1"
  [[ -n "${TRACE_DIR:-}" ]] || return 0
  local tool="${BITIR_MACHINE_GPU_QUERY_TOOL:-}"
  [[ -n "${tool}" ]] || return 0
  if ! command -v "${tool}" >/dev/null 2>&1; then
    return 0
  fi

  case "${tool}" in
    nvidia-smi)
      {
        "${tool}" -L
        printf '\n'
        "${tool}" -q
      } > "${TRACE_DIR}/gpu_${label}.txt" 2>&1 || true
      ;;
    xpu-smi)
      {
        "${tool}" discovery
        printf '\n'
        "${tool}" dump
      } > "${TRACE_DIR}/gpu_${label}.txt" 2>&1 || true
      ;;
    rocm-smi)
      "${tool}" > "${TRACE_DIR}/gpu_${label}.txt" 2>&1 || true
      ;;
    *)
      "${tool}" > "${TRACE_DIR}/gpu_${label}.txt" 2>&1 || true
      ;;
  esac
}

trace_finalize() {
  [[ -n "${TRACE_DIR:-}" ]] || return 0
  local bench_key metadata_dir metadata_csv worklist_csv source_line start end file
  bench_key="$(basename "${BITIR_SOURCE_DIR}")"
  metadata_dir="${BITIR_TRACE_METADATA_DIR:-${REPO_ROOT}/HeCBench/results/llvm17_inject/${bench_key}}"
  metadata_csv="${metadata_dir}/sites_metadata.csv"
  worklist_csv="${metadata_dir}/${TRACE_WORKLIST_NAME}"

  cat > "${TRACE_DIR}/trace_manifest.txt" <<EOF
trace_level=${TRACE_LEVEL}
backend=${BACKEND}
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
    } > "${TRACE_DIR}/site_metadata.csv"
    source_line="$(awk -F, 'NR == 2 { print $8 }' "${TRACE_DIR}/site_metadata.csv" 2>/dev/null || true)"
    if [[ -n "${source_line}" && "${source_line}" =~ ^[0-9]+$ ]]; then
      start=$((source_line - TRACE_SOURCE_WINDOW))
      end=$((source_line + TRACE_SOURCE_WINDOW))
      if [[ "${start}" -lt 1 ]]; then
        start=1
      fi
      sed -n "${start},${end}p" "${SRC}" > "${TRACE_DIR}/source_window.txt"
    fi
  fi

  if [[ -f "${worklist_csv}" ]]; then
    {
      head -n 1 "${worklist_csv}"
      awk -F, -v site="${SITE_ID}" -v bit="${BIT_INDEX}" '$2 == site && $3 == bit { print }' "${worklist_csv}"
    } > "${TRACE_DIR}/worklist_row.csv"
  fi

  for file in "${IR_LL:-}" "${IR_BC:-}" "${IR_INJ_BC:-}" "${RUN_OUT}" "${RUN_ERR}" "${RUN_DUMP:-}"; do
    [[ -f "${file}" ]] || continue
    cp -f "${file}" "${TRACE_DIR}/$(basename "${file}")"
  done

  if [[ "${TRACE_RANK}" -ge 2 ]]; then
    if [[ -n "${OPT_BIN:-}" && -f "${IR_INJ_BC:-}" ]]; then
      trace_record_command render_injected_ir "${OPT_BIN}" -S "${IR_INJ_BC}" -o "${TRACE_DIR}/device.injected.ll"
      "${OPT_BIN}" -S "${IR_INJ_BC}" -o "${TRACE_DIR}/device.injected.ll" >/dev/null 2>&1 || true
    fi
    if [[ "${BACKEND}" == "nvidia" ]]; then
      for file in "${PTX_FILE:-}" "${FATBIN_FILE:-}"; do
        [[ -f "${file}" ]] || continue
        cp -f "${file}" "${TRACE_DIR}/$(basename "${file}")"
      done
    fi
    if [[ "${BACKEND}" == "intel" ]]; then
      for file in "${POSTLINK_TABLE:-}" "${OUT_DIR}"/*.spv "${OUT_DIR}"/*.wrapper.bc "${OUT_DIR}"/*.bc; do
        [[ -f "${file}" ]] || continue
        cp -f "${file}" "${TRACE_DIR}/$(basename "${file}")"
      done
    fi
    if [[ -f "${BIN_PATH:-}" ]]; then
      ldd "${BIN_PATH}" > "${TRACE_DIR}/binary_libraries.txt" 2>&1 || true
    fi
  fi

  if [[ "${TRACE_RANK}" -ge 3 ]]; then
    for file in "${OUT_DIR}"/*; do
      [[ -f "${file}" ]] || continue
      cp -f "${file}" "${TRACE_DIR}/$(basename "${file}")"
    done
  fi
}

source_file() {
  local dir="$1"
  case "${BACKEND}" in
    intel)
      printf '%s\n' "${dir}/main.cpp"
      ;;
    nvidia)
      if [[ -f "${dir}/main.cu" ]]; then
        printf '%s\n' "${dir}/main.cu"
        return
      fi
      find "${dir}" -maxdepth 1 -name '*.cu' | sort | head -n 1
      ;;
    *)
      echo "unsupported backend: ${BACKEND}" >&2
      exit 1
      ;;
  esac
}

build_include_args() {
  INCLUDE_ARGS=(-I "${BENCH_DIR}" -I "${REPO_ROOT}/HeCBench/src")
  local include_path
  for include_path in "${EXTRA_INCLUDES[@]}"; do
    if [[ "${include_path}" != /* ]]; then
      include_path="${REPO_ROOT}/${include_path}"
    fi
    INCLUDE_ARGS+=(-I "${include_path}")
  done
}

compare_result() {
  if [[ "${COMPARE_MODE}" == "text" ]]; then
    python3 "${COMPARE_TEXT}" --bench "${BENCH}" --baseline "${TEXT_BASELINE}" --candidate "${TEXT_CANDIDATE}"
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

common_run() {
  mkdir -p "${RESULTS_DIR}" "${OUT_DIR}"
  TRIAL_INDEX="${TRIAL_INDEX:-1}"
  TRIAL_SUFFIX=""
  if [[ "${TRIAL_INDEX}" != "1" ]]; then
    TRIAL_SUFFIX="_trial${TRIAL_INDEX}"
  fi
  RUN_OUT="${RESULTS_DIR}/site${SITE_ID}_bit${BIT_INDEX}${TRIAL_SUFFIX}.out"
  RUN_ERR="${RESULTS_DIR}/site${SITE_ID}_bit${BIT_INDEX}${TRIAL_SUFFIX}.err"
  RUN_DUMP="${OUT_DIR}/${BENCH}_site${SITE_ID}_bit${BIT_INDEX}${TRIAL_SUFFIX}.bin"
  DUMP_RECORD=""
  SUMMARY_CSV="${CSV:-${RESULTS_DIR}/summary.csv}"
  if [[ "${TRACE_RANK}" -gt 0 ]]; then
    TRACE_NAME="trace_site${SITE_ID}_bit${BIT_INDEX}${TRIAL_SUFFIX}"
    if [[ "${BASELINE}" == "1" ]]; then
      TRACE_NAME="trace_baseline${TRIAL_SUFFIX}"
    fi
    TRACE_DIR="${RESULTS_DIR}/${TRACE_NAME}"
    mkdir -p "${TRACE_DIR}"
  fi

  if [[ "${BASELINE}" == "1" ]]; then
    RUN_OUT="${RESULTS_DIR}/baseline.out"
    RUN_ERR="${RESULTS_DIR}/baseline.err"
    RUN_DUMP="${OUT_DIR}/${BENCH}_baseline.bin"
  elif [[ "${SKIP_EXISTING:-1}" == "1" && -f "${RUN_OUT}" && -f "${RUN_ERR}" ]]; then
    echo "[inject] skip existing site=${SITE_ID} bit=${BIT_INDEX}"
    exit 0
  fi
}

setup_common() {
  need BITIR_MACHINE_BACKEND
  need BITIR_MACHINE_GOLDEN_ROOT
  need BITIR_SOURCE_DIR
  need BENCH
  need SITE_ID
  need BIT_INDEX
  need ABS_TOL
  need REL_TOL
  need BITIR_COMPARE_MODE

  REPO_ROOT="${REPO_ROOT:-$(pwd)}"
  BACKEND="${BITIR_MACHINE_BACKEND}"
  BENCH_DIR="${REPO_ROOT}/${BITIR_SOURCE_DIR}"
  SRC="$(source_file "${BENCH_DIR}")"
  if [[ ! -f "${SRC}" ]]; then
    echo "missing source file: ${SRC}" >&2
    exit 1
  fi

  BASELINE="${BASELINE:-0}"
  COMPARE_MODE="${BITIR_COMPARE_MODE}"
  INJECT_TARGET="${INJECT_TARGET:-${BITIR_FAULT_MODEL_INJECT_TARGET:-result}}"
  INT_FLOAT_ONLY="${INT_FLOAT_ONLY:-${BITIR_FAULT_MODEL_INT_FLOAT_ONLY:-1}}"
  INCLUDE_CONSTANTS="${INCLUDE_CONSTANTS:-${BITIR_FAULT_MODEL_INCLUDE_CONSTANTS:-0}}"
  TRACE_LEVEL="${TRACE_LEVEL:-${BITIR_FAULT_MODEL_TRACE_LEVEL:-off}}"
  TRACE_RANK="$(trace_level_rank "${TRACE_LEVEL}")"
  TRACE_SOURCE_WINDOW="${TRACE_SOURCE_WINDOW:-${BITIR_FAULT_MODEL_TRACE_SOURCE_WINDOW:-6}}"
  TRACE_PHASE="${PHASE:-${BITIR_FAULT_MODEL_PHASE:-}}"
  TRACE_WORKLIST_NAME="worklist.csv"
  if [[ -n "${TRACE_PHASE}" ]]; then
    TRACE_WORKLIST_NAME="${TRACE_PHASE}/worklist.csv"
  fi
  GOLDEN_NAME="${BITIR_GOLDEN_FILE:-${BENCH}.bin}"
  GOLDEN_ROOT="${REPO_ROOT}/${BITIR_MACHINE_GOLDEN_ROOT}"
  GOLDEN_FILE="${GOLDEN_ROOT}/${GOLDEN_NAME}"
  GOLDEN_TEXT="${GOLDEN_ROOT}/${BITIR_GOLDEN_FILE:-${BENCH}.txt}"
  RESULTS_DIR="${RESULTS_DIR:-${REPO_ROOT}/${BITIR_MACHINE_RESULTS_ROOT}/${BENCH}}"
  SCRATCH_ROOT="${TMPDIR:-/tmp}"
  OUT_DIR="${OUT_DIR:-${SCRATCH_ROOT}/bitir_${BACKEND}_${BENCH}_site${SITE_ID}_bit${BIT_INDEX}}"
  PLUGIN="${PLUGIN:-${REPO_ROOT}/HeCBench/tools/llvm17_inject/libfi_inject.so}"

  RUN_ARGS=()
  if [[ -n "${BITIR_RUN_ARGS:-}" ]]; then
    read -r -a RUN_ARGS <<< "${BITIR_RUN_ARGS}"
  fi
  EXTRA_INCLUDES=()
  if [[ -n "${BITIR_EXTRA_INCLUDES:-}" ]]; then
    read -r -a EXTRA_INCLUDES <<< "${BITIR_EXTRA_INCLUDES}"
  fi
  build_include_args

  COMPARE_FLOAT="${REPO_ROOT}/HeCBench/tools/llvm17_inject/compare_matrix_dump.py"
  COMPARE_EXACT="${REPO_ROOT}/HeCBench/tools/llvm17_inject/compare_binary_exact.py"
  COMPARE_TEXT="${REPO_ROOT}/HeCBench/tools/llvm17_inject/compare_text_signature.py"

  if [[ ! -f "${PLUGIN}" ]]; then
    echo "missing plugin: ${PLUGIN}" >&2
    exit 1
  fi
  if [[ "${COMPARE_MODE}" == "text" && ! -f "${GOLDEN_TEXT}" ]]; then
    echo "missing golden text: ${GOLDEN_TEXT}" >&2
    exit 1
  fi
  if [[ "${COMPARE_MODE}" != "text" && ! -f "${GOLDEN_FILE}" ]]; then
    echo "missing golden file: ${GOLDEN_FILE}" >&2
    exit 1
  fi
}

prepare_nvidia() {
  need BITIR_MACHINE_RUNTIME_HOME
  need BITIR_MACHINE_CUDA_ARCH_NAME
  need BITIR_MACHINE_COMPILER_DRIVER

  CUDA_HOME="${BITIR_MACHINE_RUNTIME_HOME}"
  CUDA_ARCH="${BITIR_MACHINE_CUDA_ARCH_NAME}"
  CLANG="$(tool_or_fail "${CLANG:-}" clang++)"
  LLVM_AS="$(tool_or_fail "${LLVM_AS:-}" llvm-as)"
  OPT_BIN="$(tool_or_fail "${OPT_BIN:-}" opt)"
  LLC_BIN="$(tool_or_fail "${LLC_BIN:-}" llc)"
  NVCC_BIN="$(tool_or_fail "" "${BITIR_MACHINE_COMPILER_DRIVER}" "${CUDA_HOME}/bin/${BITIR_MACHINE_COMPILER_DRIVER}")"

  export LD_LIBRARY_PATH="${CUDA_HOME}/lib64:${LD_LIBRARY_PATH:-}"

  IR_LL="${OUT_DIR}/device.ll"
  IR_BC="${OUT_DIR}/device.bc"
  IR_INJ_BC="${OUT_DIR}/device.injected.bc"
  PTX_FILE="${OUT_DIR}/device.injected.ptx"
  FATBIN_FILE="${OUT_DIR}/device.injected.fatbin"
  BIN_PATH="${OUT_DIR}/${BENCH}"
}

build_nvidia_binary() {
  # Build device IR
  trace_record_command build_device_ir \
    "${CLANG}" -x cuda --cuda-device-only --cuda-gpu-arch="${CUDA_ARCH}" --cuda-path="${CUDA_HOME}" \
    -Xclang -emit-llvm -S -O0 -g -D__STRICT_ANSI__ -D_GLIBCXX_USE_FLOAT128=0 \
    "${INCLUDE_ARGS[@]}" "${SRC}" -o "${IR_LL}"
  "${CLANG}" -x cuda \
    --cuda-device-only \
    --cuda-gpu-arch="${CUDA_ARCH}" \
    --cuda-path="${CUDA_HOME}" \
    -Xclang -emit-llvm \
    -S -O0 -g \
    -D__STRICT_ANSI__ \
    -D_GLIBCXX_USE_FLOAT128=0 \
    "${INCLUDE_ARGS[@]}" \
    "${SRC}" -o "${IR_LL}"

  trace_record_command assemble_device_ir "${LLVM_AS}" "${IR_LL}" -o "${IR_BC}"
  "${LLVM_AS}" "${IR_LL}" -o "${IR_BC}"

  local ir_for_ptx="${IR_BC}"
  if [[ "${BASELINE}" != "1" ]]; then
    # Inject one site and bit
    trace_record_command inject_device_ir \
      "${OPT_BIN}" -load-pass-plugin "${PLUGIN}" -passes=fi-inject -fi-site="${SITE_ID}" \
      -fi-bit="${BIT_INDEX}" -fi-target="${INJECT_TARGET}" -fi-int-float-only="${INT_FLOAT_ONLY}" \
      -fi-include-constants="${INCLUDE_CONSTANTS}" "${IR_BC}" -o "${IR_INJ_BC}"
    "${OPT_BIN}" -load-pass-plugin "${PLUGIN}" \
      -passes=fi-inject \
      -fi-site="${SITE_ID}" \
      -fi-bit="${BIT_INDEX}" \
      -fi-target="${INJECT_TARGET}" \
      -fi-int-float-only="${INT_FLOAT_ONLY}" \
      -fi-include-constants="${INCLUDE_CONSTANTS}" \
      "${IR_BC}" -o "${IR_INJ_BC}"
    ir_for_ptx="${IR_INJ_BC}"
  fi

  trace_record_command lower_ptx "${LLC_BIN}" -march=nvptx64 -mcpu="${CUDA_ARCH}" -o "${PTX_FILE}" "${ir_for_ptx}"
  "${LLC_BIN}" -march=nvptx64 -mcpu="${CUDA_ARCH}" -o "${PTX_FILE}" "${ir_for_ptx}"
  trace_record_command pack_fatbin "${NVCC_BIN}" --fatbin -arch="${CUDA_ARCH}" "${PTX_FILE}" -o "${FATBIN_FILE}"
  "${NVCC_BIN}" --fatbin -arch="${CUDA_ARCH}" "${PTX_FILE}" -o "${FATBIN_FILE}"
  trace_record_command link_host_binary \
    "${CLANG}" -x cuda --cuda-host-only --cuda-gpu-arch="${CUDA_ARCH}" --cuda-path="${CUDA_HOME}" \
    -Xclang -fcuda-include-gpubinary -Xclang "${FATBIN_FILE}" -O0 -g -D__STRICT_ANSI__ \
    -D_GLIBCXX_USE_FLOAT128=0 "${INCLUDE_ARGS[@]}" "${SRC}" -L"${CUDA_HOME}/lib64" -lcudart -o "${BIN_PATH}"
  "${CLANG}" -x cuda \
    --cuda-host-only \
    --cuda-gpu-arch="${CUDA_ARCH}" \
    --cuda-path="${CUDA_HOME}" \
    -Xclang -fcuda-include-gpubinary -Xclang "${FATBIN_FILE}" \
    -O0 -g \
    -D__STRICT_ANSI__ \
    -D_GLIBCXX_USE_FLOAT128=0 \
    "${INCLUDE_ARGS[@]}" \
    "${SRC}" \
    -L"${CUDA_HOME}/lib64" -lcudart \
    -o "${BIN_PATH}"
}

prepare_intel() {
  need BITIR_MACHINE_SYCL_TARGET
  need BITIR_MACHINE_SYCL_OFFLOAD_TARGET
  need BITIR_MACHINE_SYCL_HOST_TRIPLE

  TOOL_SEARCH_ROOTS=()
  LLVM_SEARCH_ROOT="${BITIR_MACHINE_LLVM_SEARCH_ROOT:-}"
  if [[ -n "${BITIR_MACHINE_TOOL_SEARCH_ROOTS:-}" ]]; then
    read -r -a TOOL_SEARCH_ROOTS <<< "${BITIR_MACHINE_TOOL_SEARCH_ROOTS}"
  fi

  local icpx_candidates=()
  local bundler_candidates=()
  local postlink_candidates=()
  local spirv_candidates=()
  local wrapper_candidates=()
  local opt_candidates=()
  local root
  for root in "${TOOL_SEARCH_ROOTS[@]}"; do
    icpx_candidates+=("${root}/icpx")
    bundler_candidates+=("${root}/clang-offload-bundler")
    postlink_candidates+=("${root}/sycl-post-link")
    spirv_candidates+=("${root}/llvm-spirv")
    wrapper_candidates+=("${root}/clang-offload-wrapper")
    opt_candidates+=("${root}/opt" "${root}/llvm/bin/opt")
  done
  if [[ -n "${LLVM_SEARCH_ROOT}" ]]; then
    root="$(find_tool_under_root "${LLVM_SEARCH_ROOT}" opt || true)"
    if [[ -n "${root}" ]]; then
      opt_candidates+=("${root}")
    fi
  fi

  ICPX="$(tool_or_fail "${ICPX:-}" icpx "${icpx_candidates[@]}")"
  CLANG_OFFLOAD_BUNDLER="$(tool_or_fail "${CLANG_OFFLOAD_BUNDLER:-}" clang-offload-bundler "${bundler_candidates[@]}")"
  SYCL_POST_LINK="$(tool_or_fail "${SYCL_POST_LINK:-}" sycl-post-link "${postlink_candidates[@]}")"
  LLVM_SPIRV="$(tool_or_fail "${LLVM_SPIRV:-}" llvm-spirv "${spirv_candidates[@]}")"
  CLANG_OFFLOAD_WRAPPER="$(tool_or_fail "${CLANG_OFFLOAD_WRAPPER:-}" clang-offload-wrapper "${wrapper_candidates[@]}")"
  OPT_BIN="$(tool_or_fail "${OPT_BIN:-}" opt "${opt_candidates[@]}")"

  export SYCL_DEVICE_FILTER="${BITIR_MACHINE_DEVICE_VISIBLE_VALUE:-}"
  if [[ -n "${BITIR_MACHINE_DEVICE_VISIBLE_ENV:-}" && -n "${BITIR_MACHINE_DEVICE_VISIBLE_VALUE:-}" ]]; then
    export "${BITIR_MACHINE_DEVICE_VISIBLE_ENV}=${BITIR_MACHINE_DEVICE_VISIBLE_VALUE}"
  fi

  BUNDLE_OBJ="${OUT_DIR}/bundle.o"
  HOST_OBJ="${OUT_DIR}/host.o"
  IR_BC="${OUT_DIR}/device.bc"
  IR_INJ_BC="${OUT_DIR}/device.injected.bc"
  POSTLINK_TABLE="${OUT_DIR}/postlink.table"
  BIN_PATH="${OUT_DIR}/${BENCH}"
  WRAPPER_BCS=()
}

build_intel_binary() {
  # Build host object and device bitcode
  trace_record_command build_bundle \
    "${ICPX}" -fsycl -fsycl-targets="${BITIR_MACHINE_SYCL_TARGET}" -O0 -g0 -DUSE_GPU \
    "${INCLUDE_ARGS[@]}" -c "${SRC}" -o "${BUNDLE_OBJ}"
  "${ICPX}" -fsycl -fsycl-targets="${BITIR_MACHINE_SYCL_TARGET}" -O0 -g0 -DUSE_GPU \
    "${INCLUDE_ARGS[@]}" \
    -c "${SRC}" -o "${BUNDLE_OBJ}"

  trace_record_command unbundle_device_ir \
    "${CLANG_OFFLOAD_BUNDLER}" --unbundle --type=o --input="${BUNDLE_OBJ}" --output="${HOST_OBJ}" \
    --output="${IR_BC}" --targets="host-${BITIR_MACHINE_SYCL_HOST_TRIPLE},${BITIR_MACHINE_SYCL_OFFLOAD_TARGET}"
  "${CLANG_OFFLOAD_BUNDLER}" --unbundle --type=o \
    --input="${BUNDLE_OBJ}" \
    --output="${HOST_OBJ}" \
    --output="${IR_BC}" \
    --targets="host-${BITIR_MACHINE_SYCL_HOST_TRIPLE},${BITIR_MACHINE_SYCL_OFFLOAD_TARGET}"

  local ir_for_postlink="${IR_BC}"
  if [[ "${BASELINE}" != "1" ]]; then
    # Inject one site and bit
    trace_record_command inject_device_ir \
      "${OPT_BIN}" -load-pass-plugin "${PLUGIN}" -passes=fi-inject -fi-site="${SITE_ID}" \
      -fi-bit="${BIT_INDEX}" -fi-target="${INJECT_TARGET}" -fi-int-float-only="${INT_FLOAT_ONLY}" \
      -fi-include-constants="${INCLUDE_CONSTANTS}" "${IR_BC}" -o "${IR_INJ_BC}"
    "${OPT_BIN}" -load-pass-plugin "${PLUGIN}" \
      -passes=fi-inject \
      -fi-site="${SITE_ID}" \
      -fi-bit="${BIT_INDEX}" \
      -fi-target="${INJECT_TARGET}" \
      -fi-int-float-only="${INT_FLOAT_ONLY}" \
      -fi-include-constants="${INCLUDE_CONSTANTS}" \
      "${IR_BC}" -o "${IR_INJ_BC}"
    ir_for_postlink="${IR_INJ_BC}"
  fi

  trace_record_command split_postlink "${SYCL_POST_LINK}" --split=kernel --symbols --properties -o "${POSTLINK_TABLE}" "${ir_for_postlink}"
  "${SYCL_POST_LINK}" --split=kernel --symbols --properties -o "${POSTLINK_TABLE}" "${ir_for_postlink}"

  local postlink_line postlink_bc postlink_prop postlink_sym postlink_base spv_file wrapper_bc
  while read -r postlink_line; do
    [[ -z "${postlink_line}" || "${postlink_line}" == \[* ]] && continue
    postlink_bc="${postlink_line%%|*}"
    postlink_prop="${postlink_line#*|}"
    postlink_prop="${postlink_prop%%|*}"
    postlink_sym="${postlink_line##*|}"
    postlink_base="$(basename "${postlink_bc}" .bc)"
    spv_file="${OUT_DIR}/${postlink_base}.spv"
    wrapper_bc="${OUT_DIR}/${postlink_base}.wrapper.bc"
    trace_record_command "spirv_${postlink_base}" "${LLVM_SPIRV}" --spirv-ext=+SPV_INTEL_subgroups,+SPV_EXT_shader_atomic_float_add "${postlink_bc}" -o "${spv_file}"
    "${LLVM_SPIRV}" --spirv-ext=+SPV_INTEL_subgroups,+SPV_EXT_shader_atomic_float_add "${postlink_bc}" -o "${spv_file}"
    trace_record_command "wrap_${postlink_base}" \
      "${CLANG_OFFLOAD_WRAPPER}" -host "${BITIR_MACHINE_SYCL_HOST_TRIPLE}" -kind=sycl \
      -target="${BITIR_MACHINE_SYCL_TARGET}" -format=spirv -entries="${postlink_sym}" \
      -properties="${postlink_prop}" "${spv_file}" -o "${wrapper_bc}"
    "${CLANG_OFFLOAD_WRAPPER}" \
      -host "${BITIR_MACHINE_SYCL_HOST_TRIPLE}" \
      -kind=sycl \
      -target="${BITIR_MACHINE_SYCL_TARGET}" \
      -format=spirv \
      -entries="${postlink_sym}" \
      -properties="${postlink_prop}" \
      "${spv_file}" \
      -o "${wrapper_bc}"
    WRAPPER_BCS+=("${wrapper_bc}")
  done < "${POSTLINK_TABLE}"

  if [[ "${#WRAPPER_BCS[@]}" == "0" ]]; then
    echo "sycl-post-link produced no wrappers" >&2
    exit 1
  fi

  trace_record_command link_host_binary \
    "${ICPX}" -fsycl -fsycl-targets="${BITIR_MACHINE_SYCL_TARGET}" "${HOST_OBJ}" "${WRAPPER_BCS[@]}" -o "${BIN_PATH}"
  "${ICPX}" -fsycl -fsycl-targets="${BITIR_MACHINE_SYCL_TARGET}" \
    "${HOST_OBJ}" "${WRAPPER_BCS[@]}" -o "${BIN_PATH}"
}

run_binary() {
  set +e
  trace_runtime_env
  trace_gpu_state before
  if [[ "${COMPARE_MODE}" == "text" ]]; then
    trace_record_command run_binary "${BIN_PATH}" "${RUN_ARGS[@]}"
    "${BIN_PATH}" "${RUN_ARGS[@]}" > "${RUN_OUT}" 2> "${RUN_ERR}"
    RUN_STATUS=$?
  elif [[ "${BACKEND}" == "intel" ]]; then
    trace_record_command run_binary HECBENCH_GPU_DEBUG=1 HECBENCH_LLFI_FORCE_DUMP=1 "${BIN_PATH}" "${RUN_ARGS[@]}" "${RUN_DUMP}"
    HECBENCH_GPU_DEBUG=1 HECBENCH_LLFI_FORCE_DUMP=1 "${BIN_PATH}" "${RUN_ARGS[@]}" "${RUN_DUMP}" > "${RUN_OUT}" 2> "${RUN_ERR}"
    RUN_STATUS=$?
  else
    trace_record_command run_binary HECBENCH_GPU_DEBUG=1 HECBENCH_FI_FORCE_DUMP=1 "${BIN_PATH}" "${RUN_ARGS[@]}" "${RUN_DUMP}"
    HECBENCH_GPU_DEBUG=1 HECBENCH_FI_FORCE_DUMP=1 "${BIN_PATH}" "${RUN_ARGS[@]}" "${RUN_DUMP}" > "${RUN_OUT}" 2> "${RUN_ERR}"
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
    elif [[ "${RUN_STATUS}" == "0" && -f "${RUN_DUMP}" ]]; then
      DUMP_CANDIDATE="${RUN_DUMP}"
      if compare_result >> "${RUN_OUT}" 2>> "${RUN_ERR}"; then
        RESULT="BASELINE"
      else
        RESULT="BASELINE_MISMATCH"
      fi
    fi
  else
    if [[ "${RUN_STATUS}" == "0" ]]; then
      if [[ "${COMPARE_MODE}" == "text" ]]; then
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
      else
        RESULT="DUE"
      fi
    else
      RESULT="FAILURE"
    fi
  fi

  trace_finalize

  if [[ -f "${RUN_DUMP}" && "${KEEP_DUMPS:-0}" == "1" && "${BASELINE}" != "1" ]]; then
    local dump_final="${RESULTS_DIR}/${BENCH}_site${SITE_ID}_bit${BIT_INDEX}${TRIAL_SUFFIX}.bin"
    mv -f "${RUN_DUMP}" "${dump_final}"
    DUMP_RECORD="${dump_final}"
  fi

  echo "Result: ${RESULT} (exit ${RUN_STATUS})" >> "${RUN_OUT}"
  echo "Result: ${RESULT} (exit ${RUN_STATUS})"
  write_summary
}

setup_common
common_run

case "${BACKEND}" in
  nvidia)
    prepare_nvidia
    build_nvidia_binary
    ;;
  intel)
    prepare_intel
    build_intel_binary
    ;;
  *)
    echo "unsupported backend: ${BACKEND}" >&2
    exit 1
    ;;
esac

run_binary
finalize_run
