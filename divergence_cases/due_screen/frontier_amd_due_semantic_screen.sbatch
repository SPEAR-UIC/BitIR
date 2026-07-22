#!/bin/bash
#SBATCH -J amd_due_semantic_screen
#SBATCH -A csc707
#SBATCH -p batch
#SBATCH -q debug
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --gpus-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=64G
#SBATCH --time=02:00:00
#SBATCH --output=divergence_cases/slurm_frontier_amd_due_semantic_screen_%j.out
#SBATCH --error=divergence_cases/slurm_frontier_amd_due_semantic_screen_%j.err

set -euo pipefail

SCRIPT_PATH="$(realpath "$0")"
REPO_ROOT="${REPO_ROOT:-$HOME/GPU_FI}"
RUN_ROOT="${RUN_ROOT:-$REPO_ROOT/divergence_cases/due_screen/results/frontier_amd_due_screen_$(date -u +%Y%m%d_%H%M%S)}"
COMPACT_DIR="${RUN_ROOT}/compact"
RAW_DIR="${RUN_ROOT}/raw"
WORKLIST_CSV="${WORKLIST_CSV:-$REPO_ROOT/divergence_cases/due_screen/amd_due_resolved_worklist.csv}"
CROSSWALK_CSV="${CROSSWALK_CSV:-$REPO_ROOT/divergence_cases/due_screen/amd_due_site_crosswalk.csv}"
COMPARE_SCRIPT="${REPO_ROOT}/divergence_cases/due_screen/write_binary_compare_report.py"
RUNNER="${REPO_ROOT}/HeCBench/tools/llvm17_inject/run_benchmark_injection.sh"
HIP_HOME="${HIP_HOME:-/opt/rocm-6.4.2}"

copy_if_small() {
  local src="$1" dst="$2" max_bytes="$3"
  [[ -f "$src" ]] || return 0
  local size
  size=$(stat -c %s "$src")
  if [[ "$size" -le "$max_bytes" ]]; then
    mkdir -p "$(dirname "$dst")"
    cp -f "$src" "$dst"
  fi
}

hash_file() {
  python3 - "$1" <<'PY'
import hashlib, sys
h = hashlib.sha256()
with open(sys.argv[1], "rb") as fh:
    while True:
        chunk = fh.read(1024 * 1024)
        if not chunk:
            break
        h.update(chunk)
print(h.hexdigest())
PY
}

append_dump_hash() {
  local screen_id="$1" bench="$2" phase="$3" trial="$4" path="$5"
  if [[ ! -f "$path" ]]; then
    echo "${screen_id},${bench},${phase},${trial},${path},,," >> "$COMPACT_DIR/dump_hashes.csv"
    return
  fi
  local size sha
  size=$(stat -c %s "$path")
  sha=$(hash_file "$path")
  echo "${screen_id},${bench},${phase},${trial},${path},${size},${sha},$(basename "$path")" >> "$COMPACT_DIR/dump_hashes.csv"
}

classify_failure_mode() {
  local out_file="$1" err_file="$2"
  if rg -qi 'missing required tool|unsupported BITIR|generated injection metadata mismatch|golden_missing|candidate_missing|llvm-config not found|clang\+\+ not found|missing source file|No such file|cannot find HIP runtime|error:' "$out_file" "$err_file" 2>/dev/null; then
    echo "INFRA_FAILURE"
    return
  fi
  echo "RUNTIME_FAILURE"
}

mkdir -p "$RUN_ROOT" "$COMPACT_DIR" "$RAW_DIR" "$COMPACT_DIR/due_diagnostics"
cp -f "$SCRIPT_PATH" "$RUN_ROOT/frontier_amd_due_semantic_screen.sbatch"
cp -f "$WORKLIST_CSV" "$COMPACT_DIR/amd_due_resolved_worklist.csv"
cp -f "$CROSSWALK_CSV" "$COMPACT_DIR/amd_due_site_crosswalk.csv"

exec > >(tee -a "$RUN_ROOT/job.stdout") 2> >(tee -a "$RUN_ROOT/job.stderr" >&2)

echo "screen_id,bench,phase,trial,path,bytes,sha256,basename" > "$COMPACT_DIR/dump_hashes.csv"
echo "bench,baseline_result,baseline_exit_code,baseline_match_golden,baseline_dump_path" > "$COMPACT_DIR/baseline_status.csv"
echo "screen_id,bench,original_site_id,fresh_site_id,bit_index,trial1_result,trial2_result,trial1_exit_code,trial2_exit_code,trial1_match_golden,trial2_match_golden,final_result,reproducible" > "$COMPACT_DIR/rerun_summary.csv"

if ! command -v module >/dev/null 2>&1 && [[ -f /etc/profile.d/modules.sh ]]; then
  source /etc/profile.d/modules.sh
fi
if command -v module >/dev/null 2>&1; then
  module purge || true
  module load rocm/6.4.2 2>/dev/null || true
  module load rocm-llvm-toolchain 2>/dev/null || true
  module list 2>&1 | tee "$RUN_ROOT/module_list.txt"
fi
env | sort > "$RUN_ROOT/submit_env.txt"

declare -A source_dir run_args golden_file compare_mode status_pass status_fail baseline_ok baseline_dump
source_dir[colorwheel]="HeCBench/src/colorwheel-hip"
run_args[colorwheel]="10000 8 1"
golden_file[colorwheel]="Frontier_HIP_Golden_Outputs/colorwheel.bin"
compare_mode[colorwheel]="exact"
status_pass[colorwheel]=""
status_fail[colorwheel]=""

source_dir[randomAccess]="HeCBench/src/randomAccess-hip"
run_args[randomAccess]="1"
golden_file[randomAccess]="Frontier_HIP_Golden_Outputs/randomAccess.bin"
compare_mode[randomAccess]="exact"
status_pass[randomAccess]="Found[[:space:]]+0[[:space:]]+errors?[[:space:]]+in[[:space:]]+[0-9]+[[:space:]]+locations[[:space:]]+\\(PASS\\)\\."
status_fail[randomAccess]="Found[[:space:]]+[1-9][0-9]*[[:space:]]+errors?[[:space:]]+in[[:space:]]+[0-9]+[[:space:]]+locations[[:space:]]+\\((PASS|FAIL)\\)\\."

for bench in colorwheel randomAccess; do
  bench_raw="$RAW_DIR/$bench"
  bench_tmp="$RAW_DIR/tmp_${bench}_baseline"
  mkdir -p "$bench_raw"
  export REPO_ROOT
  export BENCH="$bench"
  export SITE_ID=0
  export BIT_INDEX=0
  export BITIR_MACHINE_BACKEND=amd
  export BITIR_SOURCE_DIR="${source_dir[$bench]}"
  export BITIR_MACHINE_GOLDEN_ROOT="$(dirname "${golden_file[$bench]}")"
  export BITIR_GOLDEN_FILE="$(basename "${golden_file[$bench]}")"
  export BITIR_RUN_ARGS="${run_args[$bench]}"
  export BITIR_COMPARE_MODE="${compare_mode[$bench]}"
  export BITIR_MACHINE_RUNTIME_HOME="$HIP_HOME"
  export BITIR_MACHINE_HIP_ARCH=gfx90a
  export BITIR_AMD_EXECUTION_MODE=injected_ir
  export TRACE_LEVEL=off
  export CLEAN_RUN_ARTIFACTS=0
  export KEEP_DUMPS=1
  export SUMMARY_INCLUDE_PATHS=1
  export INJECT_TARGET=result
  export INT_FLOAT_ONLY=1
  export INCLUDE_CONSTANTS=0
  export PHASE=float
  if [[ -n "${status_pass[$bench]}" ]]; then
    export BITIR_STATUS_PASS_REGEX="${status_pass[$bench]}"
    export BITIR_STATUS_FAIL_REGEX="${status_fail[$bench]}"
  else
    unset BITIR_STATUS_PASS_REGEX BITIR_STATUS_FAIL_REGEX || true
  fi

  echo "[due-screen] baseline bench=$bench"
  BASELINE=1 RESULTS_DIR="$bench_raw" CSV="$bench_raw/baseline_summary.csv" OUT_DIR="$bench_tmp" bash "$RUNNER"
  dump="$bench_raw/${bench}_baseline.bin"
  if [[ -f "$bench_tmp/${bench}_baseline.bin" ]]; then
    cp -f "$bench_tmp/${bench}_baseline.bin" "$dump"
  fi
  compare_json="$COMPACT_DIR/${bench}_baseline_compare.json"
  python3 "$COMPARE_SCRIPT" --golden "$REPO_ROOT/${golden_file[$bench]}" --candidate "$dump" --out-json "$compare_json" > "$COMPACT_DIR/${bench}_baseline_compare.out"
  append_dump_hash "BASELINE" "$bench" "baseline" "1" "$dump"
  match=$(python3 - "$compare_json" <<'PY'
import json, sys
print("1" if json.load(open(sys.argv[1], encoding="utf-8")).get("sha256_match") else "0")
PY
)
  result=$(awk -F, 'NR==2 {print $4}' "$bench_raw/baseline_summary.csv")
  exit_code=$(awk -F, 'NR==2 {print $5}' "$bench_raw/baseline_summary.csv")
  echo "$bench,$result,$exit_code,$match,$dump" >> "$COMPACT_DIR/baseline_status.csv"
  copy_if_small "$dump" "$COMPACT_DIR/${bench}/${bench}_baseline.bin" 1048576
  if [[ "$match" != "1" ]]; then
    echo "baseline mismatch for existing golden on ${bench}" >&2
    exit 1
  fi
  baseline_ok[$bench]=1
done

python3 - "$WORKLIST_CSV" <<'PY' > "$RUN_ROOT/worklist_rows.tsv"
import csv, sys
rows = list(csv.DictReader(open(sys.argv[1], newline="", encoding="utf-8")))
if len(rows) != 12:
    print(f"expected 12 resolved candidates before submission, got {len(rows)}", file=sys.stderr)
    sys.exit(1)
trials = sum(int(row.get("trials", "2")) for row in rows)
if trials != 24:
    print(f"expected 24 injections before submission, got {trials}", file=sys.stderr)
    sys.exit(1)
for row in rows:
    print("\t".join([
        row["screen_id"],
        row["bench"],
        row["original_site_id"],
        row["fresh_site_id"],
        row["bit_index"],
        row["opcode"],
        row["type_kind"],
        row["bitwidth"],
        row["source_line"],
        row["source_column"],
        row["signature_ordinal"],
        row["function"],
    ]))
PY

while IFS=$'\t' read -r screen_id bench original_site_id fresh_site_id bit_index opcode type_kind bitwidth source_line source_column signature_ordinal function_name; do
  [[ -n "$screen_id" ]] || continue
  bench_raw="$RAW_DIR/$bench"
  out_dir="$RAW_DIR/tmp_${bench}_${screen_id}"
  export REPO_ROOT
  export BENCH="$bench"
  export SITE_ID="$fresh_site_id"
  export BIT_INDEX="$bit_index"
  export BITIR_MACHINE_BACKEND=amd
  export BITIR_SOURCE_DIR="${source_dir[$bench]}"
  export BITIR_MACHINE_GOLDEN_ROOT="$(dirname "${golden_file[$bench]}")"
  export BITIR_GOLDEN_FILE="$(basename "${golden_file[$bench]}")"
  export BITIR_RUN_ARGS="${run_args[$bench]}"
  export BITIR_COMPARE_MODE="${compare_mode[$bench]}"
  export BITIR_MACHINE_RUNTIME_HOME="$HIP_HOME"
  export BITIR_MACHINE_HIP_ARCH=gfx90a
  export BITIR_AMD_EXECUTION_MODE=injected_ir
  export TRACE_LEVEL=off
  export CLEAN_RUN_ARTIFACTS=0
  export KEEP_DUMPS=1
  export SUMMARY_INCLUDE_PATHS=1
  export INJECT_TARGET=result
  export INT_FLOAT_ONLY=1
  export INCLUDE_CONSTANTS=0
  export PHASE=float
  export EXPECT_INJECTION_OPCODE="$opcode"
  export EXPECT_INJECTION_TYPE_KIND="$type_kind"
  export EXPECT_INJECTION_BITWIDTH="$bitwidth"
  export EXPECT_INJECTION_SOURCE_LINE="$source_line"
  export EXPECT_INJECTION_SOURCE_COLUMN="$source_column"
  export EXPECT_INJECTION_SIGNATURE_ORDINAL="$signature_ordinal"
  export EXPECT_INJECTION_FUNCTION="$function_name"
  if [[ -n "${status_pass[$bench]}" ]]; then
    export BITIR_STATUS_PASS_REGEX="${status_pass[$bench]}"
    export BITIR_STATUS_FAIL_REGEX="${status_fail[$bench]}"
  else
    unset BITIR_STATUS_PASS_REGEX BITIR_STATUS_FAIL_REGEX || true
  fi

  echo "[due-screen] screen_id=$screen_id bench=$bench site=$fresh_site_id bit=$bit_index trial=1"
  TRIAL_INDEX=1 RESULTS_DIR="$bench_raw" CSV="$bench_raw/summary.csv" OUT_DIR="$out_dir" bash "$RUNNER"
  echo "[due-screen] screen_id=$screen_id bench=$bench site=$fresh_site_id bit=$bit_index trial=2"
  TRIAL_INDEX=2 RESULTS_DIR="$bench_raw" CSV="$bench_raw/summary.csv" OUT_DIR="$out_dir" bash "$RUNNER"

  trial1_dump="$bench_raw/${bench}_site${fresh_site_id}_bit${bit_index}.bin"
  trial2_dump="$bench_raw/${bench}_site${fresh_site_id}_bit${bit_index}_trial2.bin"
  trial1_json="$COMPACT_DIR/${screen_id}_trial1_compare.json"
  trial2_json="$COMPACT_DIR/${screen_id}_trial2_compare.json"
  python3 "$COMPARE_SCRIPT" --golden "$REPO_ROOT/${golden_file[$bench]}" --candidate "$trial1_dump" --out-json "$trial1_json" > "$COMPACT_DIR/${screen_id}_trial1_compare.out"
  python3 "$COMPARE_SCRIPT" --golden "$REPO_ROOT/${golden_file[$bench]}" --candidate "$trial2_dump" --out-json "$trial2_json" > "$COMPACT_DIR/${screen_id}_trial2_compare.out"
  append_dump_hash "$screen_id" "$bench" "injection" "1" "$trial1_dump"
  append_dump_hash "$screen_id" "$bench" "injection" "2" "$trial2_dump"
  copy_if_small "$trial1_dump" "$COMPACT_DIR/${bench}/$(basename "$trial1_dump")" 1048576
  copy_if_small "$trial2_dump" "$COMPACT_DIR/${bench}/$(basename "$trial2_dump")" 1048576

  python3 - "$bench_raw/summary.csv" "$screen_id" "$bench" "$original_site_id" "$fresh_site_id" "$bit_index" "$trial1_json" "$trial2_json" "$COMPACT_DIR" <<'PY' >> "$COMPACT_DIR/rerun_summary.csv"
import csv
import json
import os
import shutil
import sys

summary_csv, screen_id, bench, original_site_id, site_id, bit_index, trial1_json, trial2_json, compact_dir = sys.argv[1:10]
rows = [r for r in csv.DictReader(open(summary_csv, newline="", encoding="utf-8")) if r["site_id"] == site_id and r["bit_index"] == bit_index]
rows = sorted(rows, key=lambda r: int(r["trial"]))
trial1, trial2 = rows[-2], rows[-1]
cmp1 = json.load(open(trial1_json, encoding="utf-8"))
cmp2 = json.load(open(trial2_json, encoding="utf-8"))

def classify(trial_row, cmp):
    dump_exists = bool(cmp.get("candidate", {}).get("exists"))
    if dump_exists and cmp.get("sha256_match"):
        return "MASKED"
    if dump_exists and not cmp.get("sha256_match"):
        return "SDC"
    out_file = trial_row["stdout"]
    err_file = trial_row["stderr"]
    text = ""
    for path in [out_file, err_file]:
        if os.path.isfile(path):
            try:
                text += open(path, encoding="utf-8", errors="replace").read()
            except OSError:
                pass
    infra_markers = [
        "missing required tool",
        "unsupported BITIR",
        "generated injection metadata mismatch",
        "golden_missing",
        "candidate_missing",
        "llvm-config not found",
        "clang++ not found",
        "missing source file",
        "cannot find HIP runtime",
    ]
    if any(marker.lower() in text.lower() for marker in infra_markers):
        return "INFRA_FAILURE"
    return "RUNTIME_FAILURE"

trial1_result = classify(trial1, cmp1)
trial2_result = classify(trial2, cmp2)

if trial1_result == "MASKED" and trial2_result == "MASKED":
    final = "MASKED"
elif trial1_result == "SDC" or trial2_result == "SDC":
    final = "SDC"
elif trial1_result == "RUNTIME_FAILURE" and trial2_result == "RUNTIME_FAILURE":
    final = "DUE"
else:
    final = "INFRA_FAILURE"

if final == "DUE":
    due_dir = os.path.join(compact_dir, "due_diagnostics", screen_id)
    os.makedirs(due_dir, exist_ok=True)
    for path in [trial1["stdout"], trial1["stderr"], trial2["stdout"], trial2["stderr"]]:
        if os.path.isfile(path):
            shutil.copy2(path, os.path.join(due_dir, os.path.basename(path)))

repro = int(
    trial1_result == trial2_result and
    cmp1.get("candidate", {}).get("sha256") == cmp2.get("candidate", {}).get("sha256")
)
print(",".join([
    screen_id,
    bench,
    original_site_id,
    site_id,
    bit_index,
    trial1_result,
    trial2_result,
    trial1["exit_code"],
    trial2["exit_code"],
    "1" if cmp1.get("sha256_match") else "0",
    "1" if cmp2.get("sha256_match") else "0",
    final,
    str(repro),
]))
PY
done < "$RUN_ROOT/worklist_rows.tsv"

echo "[due-screen] complete"
