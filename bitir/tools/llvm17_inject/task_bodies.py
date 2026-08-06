from textwrap import dedent

BENCH_LIST_BLOCK = dedent(
    """
    if [[ -n "${BENCH_ONLY_FILE:-}" && -f "${BENCH_ONLY_FILE}" ]]; then
      mapfile -t BENCH_LIST < "${BENCH_ONLY_FILE}"
    elif [[ -n "${BENCH_ONLY:-}" ]]; then
      BENCH_ONLY_NORM="${BENCH_ONLY//,/ }"
      read -r -a BENCH_LIST <<< "${BENCH_ONLY_NORM}"
    else
      read -r -a BENCH_LIST <<< "${BITIR_BENCHMARKS:-}"
    fi
    """
).strip()

RUN_ARGS_BLOCK = dedent(
    """
    bench_args=()
    if [[ -n "${BITIR_RUN_ARGS:-}" ]]; then
      read -r -a bench_args <<< "${BITIR_RUN_ARGS}"
    fi
    """
).strip()


def build_body():
    return dedent(
        f"""
        need() {{
          local name="$1"
          if [[ -z "${{!name:-}}" ]]; then
            echo "missing required setting: ${{name}}" >&2
            exit 1
          fi
        }}

        run_env_bin() {{
          local env_line="$1"
          shift
          if [[ -z "${{env_line}}" ]]; then
            "$@"
            return
          fi
          local env_parts=()
          read -r -a env_parts <<< "${{env_line}}"
          env "${{env_parts[@]}}" "$@"
        }}

        check_cuda_host_compiler() {{
          [[ "${{DEVICE_BIN_SUBDIR}}" == "cuda" ]] || return 0
          local nvcc_bin="${{BITIR_MACHINE_RUNTIME_HOME:-}}/bin/nvcc"
          [[ -x "${{nvcc_bin}}" ]] || nvcc_bin="$(command -v nvcc || true)"
          [[ -n "${{nvcc_bin}}" ]] || return 0
          local host_cxx="${{BITIR_MACHINE_CUDA_HOST_COMPILER:-}}"
          if [[ -z "${{host_cxx}}" ]]; then
            host_cxx="$(command -v g++ || true)"
          elif [[ "${{host_cxx}}" != /* ]]; then
            host_cxx="$(command -v "${{host_cxx}}" || true)"
          fi
          [[ -n "${{host_cxx}}" ]] || return 0
          local cuda_major gcc_major
          cuda_major="$("${{nvcc_bin}}" --version | sed -n 's/.*release \\([0-9][0-9]*\\).*/\\1/p' | head -n 1)"
          gcc_major="$("${{host_cxx}}" -dumpfullversion -dumpversion 2>/dev/null | cut -d. -f1)"
          if [[ "${{cuda_major:-0}}" -le 11 && "${{gcc_major:-0}}" -ge 12 ]]; then
            echo "unsupported CUDA host compiler combination detected:" >&2
            echo "  nvcc=${{nvcc_bin}} CUDA major=${{cuda_major}}" >&2
            echo "  host_cxx=${{host_cxx}} GCC major=${{gcc_major}}" >&2
            echo "CUDA 11.x is not reliable with GCC 12+ libstdc++; set machines.<name>.cuda_host_compiler to a GCC 11-or-older g++." >&2
            exit 2
          fi
        }}

        REPO_DIR="${{PWD}}"
        BUILD_DIR="${{REPO_DIR}}/${{BITIR_MACHINE_BUILD_DIR:?BITIR_MACHINE_BUILD_DIR is required}}"
        OUTPUT_ROOT="${{REPO_DIR}}/${{BITIR_MACHINE_GOLDEN_ROOT:?BITIR_MACHINE_GOLDEN_ROOT is required}}"
        DEVICE_BIN_SUBDIR="${{BITIR_MACHINE_BINARY_SUBDIR:?BITIR_MACHINE_BINARY_SUBDIR is required}}"
        need BITIR_MACHINE_BUILD_CONFIGURE
        mkdir -p "${{OUTPUT_ROOT}}"

        {BENCH_LIST_BLOCK}

        targets=()
        for bench in "${{BENCH_LIST[@]}}"; do
          targets+=("${{bench}}-${{DEVICE_BIN_SUBDIR}}")
        done
        benchmarks_cmake="$(IFS=';'; echo "${{BENCH_LIST[*]}}")"
        BITIR_GOLDEN_KEY="${{REPO_DIR}}/bitir/build/golden_keys/hecbench/${{DEVICE_BIN_SUBDIR}}/golden_outputs.yml"
        python3 "${{BITIR_ROOT}}/tools/benchmarks/profile_golden_outputs.py" \
          --benchmarks "${{benchmarks_cmake}}" \
          --models "${{DEVICE_BIN_SUBDIR}}" \
          --text-benchmarks "${{BITIR_TEXT_BENCHMARKS:-}}" \
          --output-key "${{BITIR_GOLDEN_KEY}}"
        export BITIR_GOLDEN_KEY
        apply_golden_key_config() {{
          local key_mode
          key_mode="$(python3 "${{BITIR_ROOT}}/tools/benchmarks/golden_key_query.py" \
            --key "${{BITIR_GOLDEN_KEY}}" \
            --benchmark "${{BENCH}}" \
            --model "${{DEVICE_BIN_SUBDIR}}" \
            --field compare_mode)"
          if [[ "${{key_mode}}" == "text" ]]; then
            BITIR_COMPARE_MODE="text"
            if [[ -z "${{BITIR_GOLDEN_FILE:-}}" || "${{BITIR_GOLDEN_FILE}}" == "${{BENCH}}.bin" ]]; then
              BITIR_GOLDEN_FILE="${{BENCH}}.txt"
            fi
          fi
          export BITIR_COMPARE_MODE BITIR_GOLDEN_FILE
        }}
        BITIR_CMAKE_SOURCE_ROOT="${{REPO_DIR}}/bitir/build/hecbench/${{DEVICE_BIN_SUBDIR}}"
        python3 "${{BITIR_ROOT}}/tools/benchmarks/prepare_benchmark_set.py" \
          --output-root "${{BITIR_CMAKE_SOURCE_ROOT}}" \
          --benchmarks "${{benchmarks_cmake}}" \
          --models "${{DEVICE_BIN_SUBDIR}}"
        export BITIR_CMAKE_SOURCE_ROOT

        if [[ -n "${{BITIR_MACHINE_BUILD_PREPARE:-}}" ]]; then
          eval "${{BITIR_MACHINE_BUILD_PREPARE}}"
        fi
        check_cuda_host_compiler
        eval "${{BITIR_MACHINE_BUILD_CONFIGURE}}"
        cmake --build "${{BUILD_DIR}}" --target "${{targets[@]}}"

        for bench in "${{BENCH_LIST[@]}}"; do
          set_benchmark_config "${{bench}}"
          apply_golden_key_config
          bin="${{BUILD_DIR}}/bin/${{DEVICE_BIN_SUBDIR}}/${{bench}}"
          dump="${{OUTPUT_ROOT}}/${{BITIR_GOLDEN_FILE:-${{bench}}.bin}}"
          text_out="${{OUTPUT_ROOT}}/${{BITIR_GOLDEN_FILE:-${{bench}}.txt}}"
          {RUN_ARGS_BLOCK}
          if [[ "${{BITIR_COMPARE_MODE:-exact}}" == "text" ]]; then
            rm -f "${{text_out}}"
            "${{bin}}" "${{bench_args[@]}}" > "${{text_out}}" 2> "${{OUTPUT_ROOT}}/${{bench}}.err"
          else
            rm -f "${{dump}}"
            BITIR_DUMP_PATH="${{dump}}" run_env_bin "${{BITIR_MACHINE_BUILD_RUN_DUMP_ENV:-}}" "${{bin}}" "${{bench_args[@]}}" "${{dump}}" > "${{OUTPUT_ROOT}}/${{bench}}.log" 2> "${{OUTPUT_ROOT}}/${{bench}}.err"
          fi
        done
        """
    ).strip()


BASELINE_BODY = dedent(
    """
    REPO_DIR="${PWD}"
    RUNNER="${BITIR_ROOT}/tools/llvm17_inject/run_benchmark_injection.sh"
    if [[ ! -f "${RUNNER}" ]]; then
      echo "missing runner: ${RUNNER}" >&2
      exit 1
    fi

    RESULTS_RUN_DIR="${REPO_DIR}/results/$(date -u +%Y%m%d_%H%M%S)"
    mkdir -p "${RESULTS_RUN_DIR}"
    echo "[baseline] run_results=${RESULTS_RUN_DIR}"

    """ + BENCH_LIST_BLOCK + """

    for bench in "${BENCH_LIST[@]}"; do
      set_benchmark_config "${bench}"
      BASELINE=1 BENCH="${bench}" SITE_ID=-1 BIT_INDEX=0 RESULTS_DIR="${RESULTS_RUN_DIR}" RESULT_TAG="${bench}_baseline" bash "${RUNNER}"
    done
    """
).strip()


DEPLOY_BODY = dedent(
    """
    need() {
      local name="$1"
      if [[ -z "${!name:-}" ]]; then
        echo "missing required setting: ${name}" >&2
        exit 1
      fi
    }

    worklist_suffix() {
      case "${INJECT_TARGET}" in
        operand) printf '%s\\n' "_operand" ;;
        pointer) printf '%s\\n' "_pointer" ;;
        *) printf '%s\\n' "" ;;
      esac
    }

    apply_worklist_mode() {
      case "${WORKLIST_MODE:-}" in
        ""|instruction_result|instruction_results|result)
          INJECT_TARGET=result
          ;;
        all|all_bits|all_sites)
          INJECT_TARGET=all
          INT_FLOAT_ONLY=0
          ;;
        random)
          INJECT_TARGET=all
          INT_FLOAT_ONLY=0
          WORKLIST_RANDOM_SAMPLE="${WORKLIST_RANDOM_SAMPLE:-${MAX_RUNS}}"
          ;;
        pointer|pointer_only|instruction_pointer|instruction_pointers)
          INJECT_TARGET=pointer
          ;;
        int|int_only)
          INJECT_TARGET=all
          WORKLIST_TYPE_KIND="${WORKLIST_TYPE_KIND:-int}"
          ;;
        float|float_only)
          INJECT_TARGET=all
          WORKLIST_TYPE_KIND="${WORKLIST_TYPE_KIND:-float}"
          ;;
        operand|operand_only|instruction_operand|instruction_operands)
          INJECT_TARGET=operand
          ;;
        add|add_instructions)
          INJECT_TARGET=all
          WORKLIST_OPCODES="${WORKLIST_OPCODES:-add,fadd}"
          ;;
        sub|sub_instructions)
          INJECT_TARGET=all
          WORKLIST_OPCODES="${WORKLIST_OPCODES:-sub,fsub}"
          ;;
        mul|mul_instructions)
          INJECT_TARGET=all
          WORKLIST_OPCODES="${WORKLIST_OPCODES:-mul,fmul}"
          ;;
        div|div_instructions)
          INJECT_TARGET=all
          WORKLIST_OPCODES="${WORKLIST_OPCODES:-udiv,sdiv,fdiv}"
          ;;
        rem|remainder_instructions)
          INJECT_TARGET=all
          WORKLIST_OPCODES="${WORKLIST_OPCODES:-urem,srem,frem}"
          ;;
        shift|shift_instructions)
          INJECT_TARGET=all
          WORKLIST_OPCODES="${WORKLIST_OPCODES:-shl,lshr,ashr}"
          ;;
        bitwise|bitwise_instructions)
          INJECT_TARGET=all
          WORKLIST_OPCODES="${WORKLIST_OPCODES:-and,or,xor}"
          ;;
        compare|compare_instructions)
          INJECT_TARGET=all
          WORKLIST_OPCODES="${WORKLIST_OPCODES:-icmp,fcmp}"
          ;;
        cast|cast_instructions)
          INJECT_TARGET=all
          WORKLIST_OPCODES="${WORKLIST_OPCODES:-trunc,zext,sext,fptrunc,fpext,fptoui,fptosi,uitofp,sitofp,ptrtoint,inttoptr,bitcast,addrspacecast}"
          ;;
        zext|sext|trunc|bitcast|select|load|store|getelementptr|gep|call|phi)
          INJECT_TARGET=all
          if [[ "${WORKLIST_MODE}" == "gep" ]]; then
            WORKLIST_OPCODES="${WORKLIST_OPCODES:-getelementptr}"
          else
            WORKLIST_OPCODES="${WORKLIST_OPCODES:-${WORKLIST_MODE}}"
          fi
          ;;
        *_instruction|*_instructions)
          INJECT_TARGET=all
          opcode_mode="${WORKLIST_MODE%_instructions}"
          opcode_mode="${opcode_mode%_instruction}"
          [[ "${opcode_mode}" == "gep" ]] && opcode_mode="getelementptr"
          WORKLIST_OPCODES="${WORKLIST_OPCODES:-${opcode_mode}}"
          ;;
        *)
          if [[ "${WORKLIST_MODE}" =~ ^[A-Za-z][A-Za-z0-9_.-]*$ ]]; then
            INJECT_TARGET=all
            WORKLIST_OPCODES="${WORKLIST_OPCODES:-${WORKLIST_MODE}}"
          else
            echo "unknown worklist selection mode: ${WORKLIST_MODE}" >&2
            exit 1
          fi
          ;;
      esac
    }

    need BITIR_WORKDIR
    need BITIR_MACHINE_RESULTS_ROOT

    REPO_ROOT="${BITIR_WORKDIR}"
    RUNNER="${BITIR_ROOT}/tools/llvm17_inject/run_benchmark_injection.sh"
    PLUGIN_BUILD="${BITIR_ROOT}/tools/llvm17_inject/build.sh"
    WORKLIST_TOOL="${BITIR_ROOT}/tools/llvm17_inject/build_bench_worklist.py"

    INJECT_TARGET="${INJECT_TARGET:-${BITIR_FAULT_MODEL_INJECT_TARGET:-result}}"
    INT_FLOAT_ONLY="${INT_FLOAT_ONLY:-${BITIR_FAULT_MODEL_INT_FLOAT_ONLY:-1}}"
    INCLUDE_CONSTANTS="${INCLUDE_CONSTANTS:-${BITIR_FAULT_MODEL_INCLUDE_CONSTANTS:-0}}"
    PHASE="${PHASE:-${BITIR_FAULT_MODEL_PHASE:-float}}"
    RUN_BASELINE="${RUN_BASELINE:-0}"
    SKIP_EXISTING="${SKIP_EXISTING:-1}"
    MAX_RUNS="${MAX_INJECTIONS:-${MAX_PAIRS:-0}}"
    WORKLIST_MODE="${WORKLIST_MODE:-${BITIR_FAULT_MODEL_SELECTION_MODE:-}}"
    WORKLIST_TYPE_KIND="${WORKLIST_TYPE_KIND:-${BITIR_FAULT_MODEL_TYPE_KIND:-}}"
    WORKLIST_OPCODES="${WORKLIST_OPCODES:-${BITIR_FAULT_MODEL_OPCODES:-}}"
    WORKLIST_RANDOM_SAMPLE="${WORKLIST_RANDOM_SAMPLE:-${BITIR_FAULT_MODEL_RANDOM_SAMPLE:-}}"
    WORKLIST_RANDOM_SEED="${WORKLIST_RANDOM_SEED:-${BITIR_FAULT_MODEL_RANDOM_SEED:-1}}"
    apply_worklist_mode
    cd "${REPO_ROOT}"

    [[ -f "${RUNNER}" ]] || { echo "missing runner: ${RUNNER}" >&2; exit 1; }
    [[ -f "${WORKLIST_TOOL}" ]] || { echo "missing worklist tool: ${WORKLIST_TOOL}" >&2; exit 1; }

    """ + BENCH_LIST_BLOCK + """

    benchmarks_cmake="$(IFS=';'; echo "${BENCH_LIST[*]}")"
    BITIR_GOLDEN_KEY="${REPO_ROOT}/bitir/build/golden_keys/hecbench/${BITIR_MACHINE_BINARY_SUBDIR}/golden_outputs.yml"
    python3 "${BITIR_ROOT}/tools/benchmarks/profile_golden_outputs.py" \
      --benchmarks "${benchmarks_cmake}" \
      --models "${BITIR_MACHINE_BINARY_SUBDIR}" \
      --text-benchmarks "${BITIR_TEXT_BENCHMARKS:-}" \
      --output-key "${BITIR_GOLDEN_KEY}"
    export BITIR_GOLDEN_KEY
    apply_golden_key_config() {
      local key_mode
      key_mode="$(python3 "${BITIR_ROOT}/tools/benchmarks/golden_key_query.py" \
        --key "${BITIR_GOLDEN_KEY}" \
        --benchmark "${BENCH}" \
        --model "${BITIR_MACHINE_BINARY_SUBDIR}" \
        --field compare_mode)"
      if [[ "${key_mode}" == "text" ]]; then
        BITIR_COMPARE_MODE="text"
        if [[ -z "${BITIR_GOLDEN_FILE:-}" || "${BITIR_GOLDEN_FILE}" == "${BENCH}.bin" ]]; then
          BITIR_GOLDEN_FILE="${BENCH}.txt"
        fi
      fi
      export BITIR_COMPARE_MODE BITIR_GOLDEN_FILE
    }

    BITIR_DEPLOY_SOURCE_ROOT="${REPO_ROOT}/bitir/build/hecbench/${BITIR_MACHINE_BINARY_SUBDIR}"
    BITIR_DEPLOY_VARIANTS="${BITIR_DEPLOY_SOURCE_ROOT}/benchmark_variants.csv"
    python3 "${BITIR_ROOT}/tools/benchmarks/prepare_benchmark_set.py" \
      --output-root "${BITIR_DEPLOY_SOURCE_ROOT}" \
      --benchmarks "${benchmarks_cmake}" \
      --models "${BITIR_MACHINE_BINARY_SUBDIR}"
    prepared_source_dir() {
      awk -F, -v bench="$1" -v model="${BITIR_MACHINE_BINARY_SUBDIR}" \
        'NR > 1 && $1 == bench && $2 == model { print $3; found = 1; exit } END { if (!found) exit 1 }' \
        "${BITIR_DEPLOY_VARIANTS}"
    }

    bash "${PLUGIN_BUILD}"

    RESULTS_RUN_DIR="${REPO_ROOT}/results/$(date -u +%Y%m%d_%H%M%S)"
    mkdir -p "${RESULTS_RUN_DIR}"
    echo "[deploy] run_results=${RESULTS_RUN_DIR}"

    total_count=0
    for bench in "${BENCH_LIST[@]}"; do
      set_benchmark_config "${bench}"
      BITIR_SOURCE_DIR="$(prepared_source_dir "${BENCH}")" || { echo "missing prepared source for ${BENCH}-${BITIR_MACHINE_BINARY_SUBDIR}" >&2; exit 1; }
      export BITIR_SOURCE_DIR
      apply_golden_key_config
      need BENCH
      need BITIR_SOURCE_DIR

      SITE_LIST="${SITE_LIST:-${BITIR_SITE_LIST:-${BITIR_FAULT_MODEL_SITE_LIST:-}}}"
      RESULTS_DIR="${RESULTS_RUN_DIR}"
      RESULT_TAG="${BENCH}_${PHASE:-default}"
      WORKLIST="${RESULTS_DIR}/${RESULT_TAG}_worklist.csv"
      if [[ -n "${SITE_LIST}" && "${SITE_LIST}" != /* ]]; then
        SITE_LIST="${REPO_ROOT}/${SITE_LIST}"
      fi

      mkdir -p "${RESULTS_DIR}"
      echo "[deploy] bench=${BENCH}"
      echo "[deploy] results=${RESULTS_DIR}"
      echo "[deploy] result_tag=${RESULT_TAG}"
      echo "[deploy] target=${INJECT_TARGET}"

      python3 "${WORKLIST_TOOL}" \
        --bench "${BENCH}" \
        --source-dir "${BITIR_SOURCE_DIR}" \
        --target "${INJECT_TARGET}" \
        --int-float-only "${INT_FLOAT_ONLY}" \
        --include-constants "${INCLUDE_CONSTANTS}" \
        --type-kind "${WORKLIST_TYPE_KIND}" \
        --opcode "${WORKLIST_OPCODES}" \
        --random-sample "${WORKLIST_RANDOM_SAMPLE:-0}" \
        --random-seed "${WORKLIST_RANDOM_SEED}" \
        --sites "${RESULTS_DIR}/${RESULT_TAG}_sites.csv" \
        --sites-rich "${RESULTS_DIR}/${RESULT_TAG}_sites_metadata.csv" \
        --worklist "${WORKLIST}"

      [[ -s "${WORKLIST}" ]] || { echo "empty worklist: ${WORKLIST}" >&2; exit 1; }
      worklist_rows="$(awk 'NR > 1 { count++ } END { print count + 0 }' "${WORKLIST}")"
      if [[ "${MAX_RUNS}" == "0" ]]; then
        echo "[deploy] worklist candidates=${worklist_rows} run_limit=all"
      else
        echo "[deploy] worklist candidates=${worklist_rows} run_limit=${MAX_RUNS}"
      fi

      if [[ "${RUN_BASELINE}" == "1" ]]; then
        echo "[deploy] baseline no-flip site=-1 bit=0"
        BASELINE=1 SITE_ID=-1 BIT_INDEX=0 RESULTS_DIR="${RESULTS_DIR}" RESULT_TAG="${RESULT_TAG}" \
          BITIR_TRACE_METADATA_DIR="${RESULTS_DIR}" BITIR_TRACE_WORKLIST_NAME="$(basename "${WORKLIST}")" \
          BITIR_TRACE_METADATA_CSV="${RESULTS_DIR}/${RESULT_TAG}_sites_metadata.csv" \
          bash "${RUNNER}"
      fi

      INPUT_LIST="${WORKLIST}"
      if [[ -n "${SITE_LIST}" ]]; then
        [[ -f "${SITE_LIST}" ]] || { echo "missing site list: ${SITE_LIST}" >&2; exit 1; }
        INPUT_LIST="${SITE_LIST}"
      fi

      count=0
      while IFS=, read -r a b c _; do
        site_id="${a}"
        bit_index="${b}"
        if [[ "${a}" =~ ^[0-9]+$ && "${b}" =~ ^[0-9]+$ && "${c:-}" =~ ^[0-9]+$ ]]; then
          site_id="${b}"
          bit_index="${c}"
        fi
        [[ "${site_id}" == "site_id" || "${site_id}" == "index" || "${site_id}" == "x_index" ]] && continue
        [[ -n "${site_id}" && -n "${bit_index}" ]] || continue
        if [[ "${MAX_RUNS}" != "0" && "${count}" -ge "${MAX_RUNS}" ]]; then
          break
        fi
        echo "[deploy] site=${site_id} bit=${bit_index}"
        BASELINE=0 SITE_ID="${site_id}" BIT_INDEX="${bit_index}" RESULTS_DIR="${RESULTS_DIR}" RESULT_TAG="${RESULT_TAG}" \
          BITIR_TRACE_METADATA_DIR="${RESULTS_DIR}" BITIR_TRACE_WORKLIST_NAME="$(basename "${WORKLIST}")" \
          BITIR_TRACE_METADATA_CSV="${RESULTS_DIR}/${RESULT_TAG}_sites_metadata.csv" \
          SKIP_EXISTING="${SKIP_EXISTING}" bash "${RUNNER}"
        count=$((count + 1))
      done < "${INPUT_LIST}"

      total_count=$((total_count + count))
      echo "[deploy] completed ${count} injection sites for ${BENCH}"
    done

    echo "[deploy] completed ${total_count} injection sites total"
    """
).strip()



def task_body(task):
    if task in {"build", "golden"}:
        return build_body()
    if task == "baseline":
        return BASELINE_BODY
    if task == "deploy":
        return DEPLOY_BODY
    if task == "inject-one":
        return 'bash "${BITIR_ROOT}/tools/llvm17_inject/run_benchmark_injection.sh"'
    raise SystemExit(f"unsupported task={task!r}")
