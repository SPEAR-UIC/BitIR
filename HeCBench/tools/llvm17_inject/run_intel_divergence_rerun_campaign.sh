#!/usr/bin/env bash
set -euo pipefail

need() {
  local name="$1"
  if [[ -z "${!name:-}" ]]; then
    echo "missing required setting: ${name}" >&2
    exit 1
  fi
}

REPO_ROOT="${REPO_ROOT:-$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)}"
WORKLIST="${WORKLIST:-${REPO_ROOT}/divergence_analysis_outputs/intel_rerun_worklist.csv}"
ANCHOR_CSV="${ANCHOR_CSV:-${REPO_ROOT}/divergence_analysis_outputs/expanded_pairwise_anchor_rerun_candidates.csv}"
RESULTS_DIR="${RESULTS_DIR:-${REPO_ROOT}/HeCBench/results/intel_divergence_rerun_$(date -u +%Y%m%dT%H%M%SZ)}"
CONFIG_PATH="${CONFIG_PATH:-${REPO_ROOT}/HeCBench/config/bitir.yml}"
RUNNER="${REPO_ROOT}/HeCBench/tools/llvm17_inject/run_benchmark_injection.sh"
PLUGIN_BUILD="${REPO_ROOT}/HeCBench/tools/llvm17_inject/build.sh"
HECBENCH_BUILD="${REPO_ROOT}/HeCBench/build.sh"
GOLDEN_ROOT="${REPO_ROOT}/Aurora_Sycl_Golden_Outputs"
BUILD_DIR="${REPO_ROOT}/HeCBench/build/sycl-intel-golden"
BIN_ROOT="${BUILD_DIR}/bin/sycl"

need WORKLIST
need ANCHOR_CSV
need CONFIG_PATH

mkdir -p "${RESULTS_DIR}"
RESULTS_DIR="$(cd "${RESULTS_DIR}" && pwd)"

if [[ ! -f "${WORKLIST}" ]]; then
  echo "missing worklist: ${WORKLIST}" >&2
  exit 1
fi
if [[ ! -f "${ANCHOR_CSV}" ]]; then
  echo "missing anchor reference: ${ANCHOR_CSV}" >&2
  exit 1
fi
if [[ ! -f "${RUNNER}" ]]; then
  echo "missing runner: ${RUNNER}" >&2
  exit 1
fi

cp -f "${WORKLIST}" "${RESULTS_DIR}/intel_rerun_worklist.csv"
cp -f "${ANCHOR_CSV}" "${RESULTS_DIR}/expanded_pairwise_anchor_rerun_candidates.csv"

WORKLIST_TSV="${RESULTS_DIR}/intel_rerun_worklist.tsv"
BENCH_MANIFEST="${RESULTS_DIR}/bench_manifest.tsv"
BENCH_ONLY_FILE="${RESULTS_DIR}/benchmarks.txt"
BASELINE_STATUS_CSV="${RESULTS_DIR}/benchmark_baseline_status.csv"
PER_ROW_CSV="${RESULTS_DIR}/per_row_outcomes.csv"
SUMMARY_TXT="${RESULTS_DIR}/rerun_summary.txt"
HELPER_LOG="${RESULTS_DIR}/campaign.log"

python3 - "${WORKLIST}" "${WORKLIST_TSV}" "${BENCH_MANIFEST}" "${BENCH_ONLY_FILE}" "${CONFIG_PATH}" <<'PY'
import csv
import sys
from collections import OrderedDict
from pathlib import Path

import yaml

worklist_path = Path(sys.argv[1])
worklist_tsv = Path(sys.argv[2])
manifest_path = Path(sys.argv[3])
bench_only_path = Path(sys.argv[4])
config_path = Path(sys.argv[5])

cfg = yaml.safe_load(config_path.read_text(encoding="utf-8"))
bench_cfg = cfg["benchmarks"]

rows = list(csv.DictReader(worklist_path.open(newline="", encoding="utf-8")))
if not rows:
    raise SystemExit("empty Intel rerun worklist")

ordered_benches = OrderedDict()
for row in rows:
    ordered_benches.setdefault(row["bench"], None)

with worklist_tsv.open("w", encoding="utf-8", newline="") as f:
    fields = [
        "worklist_id",
        "bench",
        "site_id",
        "bit_index",
        "comparison",
        "expected_original_result",
        "nvidia_site_id",
        "amd_site_id",
        "intel_site_id",
        "nvidia_result",
        "amd_result",
        "intel_result",
        "match_tier",
        "notes",
    ]
    f.write("\t".join(fields) + "\n")
    for row in rows:
        f.write("\t".join(row.get(field, "") for field in fields) + "\n")

with bench_only_path.open("w", encoding="utf-8") as f:
    for bench in ordered_benches:
        f.write(f"{bench}\n")

with manifest_path.open("w", encoding="utf-8", newline="") as f:
    fields = [
        "bench",
        "source_dir",
        "golden_file",
        "compare_mode",
        "run_args",
        "extra_includes",
        "pass_line",
        "fail_line",
        "pass_regex",
        "fail_regex",
    ]
    f.write("\t".join(fields) + "\n")
    for bench in ordered_benches:
        data = bench_cfg[bench]
        env = data.get("env", {})
        rendered_args = []
        for raw in data.get("args", []):
            value = raw
            for key, env_value in env.items():
                value = value.replace(f"{{{key}}}", str(env_value))
            rendered_args.append(value)
        golden_name = data["golden_file"]
        for key, env_value in env.items():
            golden_name = golden_name.replace(f"{{{key}}}", str(env_value))
        extra_includes = data.get("extra_includes", {}).get("intel", [])
        status = data.get("status", {})
        record = {
            "bench": bench,
            "source_dir": data["source_dirs"]["intel"],
            "golden_file": golden_name,
            "compare_mode": data.get("compare_mode", "exact"),
            "run_args": " ".join(rendered_args),
            "extra_includes": " ".join(extra_includes),
            "pass_line": status.get("pass_line", ""),
            "fail_line": status.get("fail_line", ""),
            "pass_regex": status.get("pass_regex", ""),
            "fail_regex": status.get("fail_regex", ""),
        }
        f.write("\t".join(record[field] for field in fields) + "\n")
PY

export REPO_ROOT
export BITIR_WORKDIR="${REPO_ROOT}"
export BITIR_MACHINE="aurora_divergence_rerun"
export BITIR_MACHINE_BACKEND="intel"
export BITIR_MACHINE_BUILD_DIR="HeCBench/build/sycl-intel-golden"
export BITIR_MACHINE_BINARY_SUBDIR="sycl"
export BITIR_MACHINE_GOLDEN_ROOT="Aurora_Sycl_Golden_Outputs"
export BITIR_MACHINE_RESULTS_ROOT="HeCBench/results/llvm17_inject"
export BITIR_MACHINE_DEVICE_VISIBLE_ENV="ONEAPI_DEVICE_SELECTOR"
export BITIR_MACHINE_DEVICE_VISIBLE_VALUE="level_zero:gpu"
export BITIR_MACHINE_SYCL_TARGET="spir64"
export BITIR_MACHINE_SYCL_OFFLOAD_TARGET="sycl-spir64-unknown-unknown"
export BITIR_MACHINE_SYCL_HOST_TRIPLE="x86_64-unknown-linux-gnu"
export BITIR_MACHINE_TOOL_SEARCH_ROOTS="/opt/aurora/25.190.0/oneapi/compiler/latest/bin /opt/aurora/25.190.0/oneapi/compiler/latest/bin/compiler /opt/aurora/25.190.0/oneapi/compiler/2025.2/bin /opt/aurora/25.190.0/oneapi/compiler/2025.2/bin/compiler"
export BITIR_MACHINE_LLVM_SEARCH_ROOT="/opt/aurora/25.190.0/spack/unified"
export BITIR_RUN_TIMEOUT="200"
export TRACE_LEVEL="${TRACE_LEVEL:-basic}"
export ABS_TOL="${ABS_TOL:-0}"
export REL_TOL="${REL_TOL:-0}"
export INJECT_TARGET="${INJECT_TARGET:-result}"
export INT_FLOAT_ONLY="${INT_FLOAT_ONLY:-1}"
export INCLUDE_CONSTANTS="${INCLUDE_CONSTANTS:-0}"

{
  echo "repo_root=${REPO_ROOT}"
  echo "results_dir=${RESULTS_DIR}"
  echo "worklist=${WORKLIST}"
  echo "anchor_csv=${ANCHOR_CSV}"
} > "${RESULTS_DIR}/campaign_context.txt"

echo "bench,baseline_status,baseline_result,generated_golden,baseline_site_id,baseline_bit_index,notes" > "${BASELINE_STATUS_CSV}"
echo "worklist_id,bench,site_id,bit_index,comparison,expected_original_result,match_tier,baseline_status,runner_result,runner_exit_code,runner_stdout,runner_stderr,runner_dump,notes" > "${PER_ROW_CSV}"

mkdir -p "${GOLDEN_ROOT}"

{
  echo "[campaign] start $(date -u +%Y-%m-%dT%H:%M:%SZ)"
  echo "[campaign] results_dir=${RESULTS_DIR}"
  echo "[campaign] building injection plugin"
} | tee -a "${HELPER_LOG}"

bash "${PLUGIN_BUILD}" 2>&1 | tee -a "${HELPER_LOG}"

{
  echo "[campaign] configuring HeCBench Intel build"
  echo "[campaign] benches $(paste -sd, "${BENCH_ONLY_FILE}")"
} | tee -a "${HELPER_LOG}"

BENCH_ONLY_FILE="${BENCH_ONLY_FILE}" bash "${HECBENCH_BUILD}" 2>&1 | tee -a "${HELPER_LOG}"

declare -A SOURCE_DIR_MAP GOLDEN_FILE_MAP COMPARE_MODE_MAP RUN_ARGS_MAP EXTRA_INCLUDES_MAP

while IFS=$'\t' read -r bench source_dir golden_file compare_mode run_args extra_includes pass_line fail_line pass_regex fail_regex; do
  [[ "${bench}" == "bench" ]] && continue
  SOURCE_DIR_MAP["${bench}"]="${source_dir}"
  GOLDEN_FILE_MAP["${bench}"]="${golden_file}"
  COMPARE_MODE_MAP["${bench}"]="${compare_mode}"
  RUN_ARGS_MAP["${bench}"]="${run_args}"
  EXTRA_INCLUDES_MAP["${bench}"]="${extra_includes}"
done < "${BENCH_MANIFEST}"

declare -A BENCH_BASELINE_STATUS BENCH_BASELINE_RESULT BENCH_GOLDEN_GENERATED

run_bench_baseline() {
  local bench="$1"
  local baseline_site="$2"
  local baseline_bit="$3"
  local bench_dir="${RESULTS_DIR}/benchmarks/${bench}"
  local bench_log="${bench_dir}/benchmark.log"
  local summary_csv="${bench_dir}/summary.csv"
  local summary_line result

  mkdir -p "${bench_dir}"

  export BENCH="${bench}"
  export BITIR_SOURCE_DIR="${SOURCE_DIR_MAP[${bench}]}"
  export BITIR_GOLDEN_FILE="${GOLDEN_FILE_MAP[${bench}]}"
  export BITIR_COMPARE_MODE="${COMPARE_MODE_MAP[${bench}]}"
  export BITIR_RUN_ARGS="${RUN_ARGS_MAP[${bench}]}"
  export BITIR_EXTRA_INCLUDES="${EXTRA_INCLUDES_MAP[${bench}]}"

  {
    echo "[benchmark:${bench}] baseline site=${baseline_site} bit=${baseline_bit}"
  } | tee -a "${bench_log}" "${HELPER_LOG}"

  BASELINE=1 \
  SITE_ID="${baseline_site}" \
  BIT_INDEX="${baseline_bit}" \
  RESULTS_DIR="${bench_dir}" \
  SKIP_EXISTING=0 \
  bash "${RUNNER}" 2>&1 | tee -a "${bench_log}" "${HELPER_LOG}"

  summary_line="$(tail -n 1 "${summary_csv}")"
  IFS=, read -r _ _ _ result _ _ _ _ <<< "${summary_line}"
  BENCH_BASELINE_RESULT["${bench}"]="${result}"
  if [[ "${result}" == "BASELINE" ]]; then
    BENCH_BASELINE_STATUS["${bench}"]="pass"
  else
    BENCH_BASELINE_STATUS["${bench}"]="fail"
  fi
}

run_bench_injection() {
  local worklist_id="$1"
  local bench="$2"
  local site_id="$3"
  local bit_index="$4"
  local comparison="$5"
  local expected_original_result="$6"
  local match_tier="$7"
  local notes="$8"
  local bench_dir="${RESULTS_DIR}/benchmarks/${bench}"
  local bench_log="${bench_dir}/benchmark.log"
  local summary_csv="${bench_dir}/summary.csv"
  local summary_line result exit_code stdout_path stderr_path dump_path

  export BENCH="${bench}"
  export BITIR_SOURCE_DIR="${SOURCE_DIR_MAP[${bench}]}"
  export BITIR_GOLDEN_FILE="${GOLDEN_FILE_MAP[${bench}]}"
  export BITIR_COMPARE_MODE="${COMPARE_MODE_MAP[${bench}]}"
  export BITIR_RUN_ARGS="${RUN_ARGS_MAP[${bench}]}"
  export BITIR_EXTRA_INCLUDES="${EXTRA_INCLUDES_MAP[${bench}]}"

  {
    echo "[benchmark:${bench}] injection worklist_id=${worklist_id} site=${site_id} bit=${bit_index}"
  } | tee -a "${bench_log}" "${HELPER_LOG}"

  BASELINE=0 \
  SITE_ID="${site_id}" \
  BIT_INDEX="${bit_index}" \
  RESULTS_DIR="${bench_dir}" \
  SKIP_EXISTING=0 \
  bash "${RUNNER}" 2>&1 | tee -a "${bench_log}" "${HELPER_LOG}"

  summary_line="$(tail -n 1 "${summary_csv}")"
  IFS=, read -r _ _ _ result exit_code stdout_path stderr_path dump_path <<< "${summary_line}"
  printf '%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s\n' \
    "${worklist_id}" \
    "${bench}" \
    "${site_id}" \
    "${bit_index}" \
    "${comparison}" \
    "${expected_original_result}" \
    "${match_tier}" \
    "${BENCH_BASELINE_STATUS[${bench}]}" \
    "${result}" \
    "${exit_code}" \
    "${stdout_path}" \
    "${stderr_path}" \
    "${dump_path}" \
    "${notes}" >> "${PER_ROW_CSV}"
}

current_bench=""
baseline_site=""
baseline_bit=""
while IFS=$'\t' read -r worklist_id bench site_id bit_index comparison expected_original_result nvidia_site_id amd_site_id intel_site_id nvidia_result amd_result intel_result match_tier notes; do
  [[ "${worklist_id}" == "worklist_id" ]] && continue

  if [[ "${bench}" != "${current_bench}" ]]; then
    current_bench="${bench}"
    baseline_site="${site_id}"
    baseline_bit="${bit_index}"
    BENCH_GOLDEN_GENERATED["${bench}"]="no"

    golden_path="${GOLDEN_ROOT}/${GOLDEN_FILE_MAP[${bench}]}"
    bench_dir="${RESULTS_DIR}/benchmarks/${bench}"
    bench_log="${bench_dir}/benchmark.log"
    mkdir -p "${bench_dir}"

    if [[ ! -f "${golden_path}" ]]; then
      {
        echo "[benchmark:${bench}] generating missing golden ${golden_path}"
      } | tee -a "${bench_log}" "${HELPER_LOG}"
      bin_path="${BIN_ROOT}/${bench}"
      if [[ ! -x "${bin_path}" ]]; then
        echo "missing built benchmark binary: ${bin_path}" >&2
        exit 1
      fi
      rm -f "${golden_path}"
      if [[ -n "${RUN_ARGS_MAP[${bench}]}" ]]; then
        read -r -a bench_args <<< "${RUN_ARGS_MAP[${bench}]}"
      else
        bench_args=()
      fi
      HECBENCH_LLFI_FORCE_DUMP=1 "${bin_path}" "${bench_args[@]}" "${golden_path}" \
        > "${bench_dir}/golden_${bench}.out" 2> "${bench_dir}/golden_${bench}.err"
      BENCH_GOLDEN_GENERATED["${bench}"]="yes"
    else
      {
        echo "[benchmark:${bench}] reusing existing golden ${golden_path}"
      } | tee -a "${bench_log}" "${HELPER_LOG}"
    fi

    run_bench_baseline "${bench}" "${baseline_site}" "${baseline_bit}"
    printf '%s,%s,%s,%s,%s,%s,%s\n' \
      "${bench}" \
      "${BENCH_BASELINE_STATUS[${bench}]}" \
      "${BENCH_BASELINE_RESULT[${bench}]}" \
      "${BENCH_GOLDEN_GENERATED[${bench}]}" \
      "${baseline_site}" \
      "${baseline_bit}" \
      "" >> "${BASELINE_STATUS_CSV}"
  fi

  if [[ "${BENCH_BASELINE_STATUS[${bench}]}" != "pass" ]]; then
    printf '%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s\n' \
      "${worklist_id}" \
      "${bench}" \
      "${site_id}" \
      "${bit_index}" \
      "${comparison}" \
      "${expected_original_result}" \
      "${match_tier}" \
      "${BENCH_BASELINE_STATUS[${bench}]}" \
      "SKIPPED_BASELINE_FAILURE" \
      "" \
      "" \
      "" \
      "" \
      "${notes}" >> "${PER_ROW_CSV}"
    continue
  fi

  run_bench_injection "${worklist_id}" "${bench}" "${site_id}" "${bit_index}" "${comparison}" "${expected_original_result}" "${match_tier}" "${notes}"
done < "${WORKLIST_TSV}"

python3 - "${PER_ROW_CSV}" "${BASELINE_STATUS_CSV}" <<'PY' > "${SUMMARY_TXT}"
import csv
import sys
from collections import Counter

per_row_path = sys.argv[1]
baseline_path = sys.argv[2]

baseline_rows = list(csv.DictReader(open(baseline_path, newline="", encoding="utf-8")))
per_rows = list(csv.DictReader(open(per_row_path, newline="", encoding="utf-8")))

print("Baseline status by benchmark:")
for row in baseline_rows:
    print(
        f"{row['bench']}: baseline_status={row['baseline_status']} "
        f"baseline_result={row['baseline_result']} generated_golden={row['generated_golden']} "
        f"site={row['baseline_site_id']} bit={row['baseline_bit_index']}"
    )

counts = Counter(row["runner_result"] for row in per_rows)
print("")
print("Rerun result counts:")
for key in sorted(counts):
    print(f"{key}: {counts[key]}")

print("")
print(f"total_rows: {len(per_rows)}")
print(f"baseline_passed_benches: {sum(row['baseline_status'] == 'pass' for row in baseline_rows)}")
print(f"baseline_failed_benches: {sum(row['baseline_status'] != 'pass' for row in baseline_rows)}")
PY

{
  echo "[campaign] completed $(date -u +%Y-%m-%dT%H:%M:%SZ)"
  cat "${SUMMARY_TXT}"
} | tee -a "${HELPER_LOG}"
