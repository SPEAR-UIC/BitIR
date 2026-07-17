#!/bin/bash
set -euo pipefail

REPO_ROOT="${REPO_ROOT:-$HOME/GPU_FI}"
WORKLIST="${WORKLIST:-$REPO_ROOT/divergence_analysis_outputs/amd_rerun_worklist.csv}"
ANCHOR_CANDIDATES="${ANCHOR_CANDIDATES:-$REPO_ROOT/divergence_analysis_outputs/expanded_pairwise_anchor_rerun_candidates.csv}"
RUN_CONFIG="${RUN_CONFIG:-$REPO_ROOT/HeCBench/config/runs/frontier_amd_rerun.yml}"
TIMESTAMP="${RERUN_TIMESTAMP:-$(date -u +%Y%m%d_%H%M%S)}"
RESULTS_ROOT="${RESULTS_ROOT:-$REPO_ROOT/divergence_cases/rerun_results/frontier_amd_rerun_${TIMESTAMP}}"
METADATA_ROOT="${METADATA_ROOT:-$REPO_ROOT/HeCBench/results/llvm17_inject_amd}"
GOLDEN_ROOT="${GOLDEN_ROOT:-$REPO_ROOT/Frontier_HIP_Golden_Outputs}"
BUILD_ROOT="${BUILD_ROOT:-$REPO_ROOT/HeCBench/build-hip}"
TMP_ROOT="${TMPDIR:-/tmp}"

mkdir -p "$RESULTS_ROOT" "$RESULTS_ROOT/benchmarks" "$RESULTS_ROOT/tmp"
exec > >(tee -a "$RESULTS_ROOT/job.stdout") 2> >(tee -a "$RESULTS_ROOT/job.stderr" >&2)

cd "$REPO_ROOT"

echo "[rerun] start $(date -u +%Y-%m-%dT%H:%M:%SZ)"
echo "[rerun] repo_root=$REPO_ROOT"
echo "[rerun] results_root=$RESULTS_ROOT"
echo "[rerun] worklist=$WORKLIST"
echo "[rerun] anchor_candidates=$ANCHOR_CANDIDATES"
echo "[rerun] config=$RUN_CONFIG"
echo "[rerun] git_head=$(git rev-parse HEAD)"
echo "[rerun] host=$(hostname)"

cp -f "$WORKLIST" "$RESULTS_ROOT/amd_rerun_worklist.csv"
cp -f "$ANCHOR_CANDIDATES" "$RESULTS_ROOT/expanded_pairwise_anchor_rerun_candidates.csv"
cp -f "$RUN_CONFIG" "$RESULTS_ROOT/frontier_amd_rerun.yml"
cp -f "$0" "$RESULTS_ROOT/frontier_amd_rerun_driver.sh"
if [[ -n "${SLURM_JOB_SCRIPT:-}" && -f "${SLURM_JOB_SCRIPT}" ]]; then
  cp -f "${SLURM_JOB_SCRIPT}" "$RESULTS_ROOT/$(basename "${SLURM_JOB_SCRIPT}")"
fi

export BITIR_MACHINE=amd
export BITIR_MACHINE_BACKEND=amd
export BITIR_MACHINE_BUILD_DIR="HeCBench/build-hip"
export BITIR_MACHINE_BINARY_SUBDIR="hip"
export BITIR_MACHINE_GOLDEN_ROOT="Frontier_HIP_Golden_Outputs"
export BITIR_MACHINE_RUNTIME_HOME="/opt/rocm-6.4.2"
export BITIR_MACHINE_HIP_ARCH="gfx90a"
export BITIR_MACHINE_LLVM_SEARCH_ROOT="/opt/rocm-6.4.2/lib/llvm"
export BITIR_MACHINE_TOOL_SEARCH_ROOTS="/opt/rocm-6.4.2/lib/llvm/bin"
export BITIR_MACHINE_MODULES="rocm/6.4.2 rocm-llvm-toolchain"

baseline_csv="$RESULTS_ROOT/baseline_status.csv"
runner_failures_csv="$RESULTS_ROOT/runner_failures.csv"
master_summary_csv="$RESULTS_ROOT/rerun_summary.csv"

cat > "$baseline_csv" <<'EOF'
bench,status,result,site_id,bit_index,summary_csv,notes
EOF

cat > "$runner_failures_csv" <<'EOF'
bench,site_id,bit_index,return_code,notes
EOF

cat > "$master_summary_csv" <<'EOF'
worklist_id,bench,site_id,bit_index,comparison,expected_original_result,nvidia_site_id,amd_site_id,intel_site_id,nvidia_result,amd_result,intel_result,match_tier,notes,rerun_trial,rerun_result,rerun_exit_code,rerun_stdout,rerun_stderr,rerun_dump
EOF

bench_args() {
  local bench="$1"
  case "$bench" in
    colorwheel) echo "10000 8 1" ;;
    dense-embedding) echo "10000 8 1" ;;
    entropy) echo "10000 1024 1" ;;
    pathfinder) echo "10000 1000 1000" ;;
    randomAccess) echo "1" ;;
    *) return 1 ;;
  esac
}

golden_name() {
  local bench="$1"
  case "$bench" in
    colorwheel) echo "colorwheel.bin" ;;
    dense-embedding) echo "dense-embedding.bin" ;;
    entropy) echo "entropy.bin" ;;
    pathfinder) echo "pathfinder.bin" ;;
    randomAccess) echo "randomAccess.bin" ;;
    *) return 1 ;;
  esac
}

source_dir() {
  local bench="$1"
  echo "HeCBench/src/${bench}-hip"
}

extra_includes() {
  local bench="$1"
  case "$bench" in
    entropy) echo "HeCBench/src/entropy-cuda" ;;
    *) echo "" ;;
  esac
}

ensure_worklist() {
  local bench="$1"
  local wl="$METADATA_ROOT/$bench/float/worklist.csv"
  if [[ -f "$wl" ]]; then
    echo "[rerun] existing worklist $wl"
    return 0
  fi
  echo "[rerun] generating missing worklist $wl"
  mkdir -p "$(dirname "$wl")"
  local extra
  extra="$(extra_includes "$bench")"
  export BITIR_EXTRA_INCLUDES="$extra"
  python3 HeCBench/tools/llvm17_inject/build_bench_worklist.py \
    --bench "$bench" \
    --source-dir "$(source_dir "$bench")" \
    --backend amd \
    --target result \
    --int-float-only 1 \
    --include-constants 0 \
    --out-dir "$RESULTS_ROOT/tmp/worklist_build" \
    --worklist "HeCBench/results/llvm17_inject_amd/$bench/float/worklist.csv" \
    --sites "HeCBench/results/llvm17_inject_amd/$bench/sites.csv" \
    --sites-rich "HeCBench/results/llvm17_inject_amd/$bench/sites_metadata.csv"
  unset BITIR_EXTRA_INCLUDES
}

ensure_golden() {
  local bench="$1"
  local golden="$GOLDEN_ROOT/$(golden_name "$bench")"
  if [[ -f "$golden" ]]; then
    echo "[rerun] existing golden $golden"
    return 0
  fi
  echo "[rerun] generating missing golden $golden"
  BENCH_ONLY="$bench" REPO_ROOT="$REPO_ROOT" BUILD_DIR="$BUILD_ROOT" bash HeCBench/build.sh
  mkdir -p "$GOLDEN_ROOT"
  local bin="$BUILD_ROOT/bin/hip/$bench"
  local logdir="$RESULTS_ROOT/golden_generation/$bench"
  mkdir -p "$logdir"
  read -r -a args <<< "$(bench_args "$bench")"
  HECBENCH_GPU_DEBUG=1 HECBENCH_FI_FORCE_DUMP=1 "$bin" "${args[@]}" "$golden" \
    > "$logdir/golden.out" 2> "$logdir/golden.err"
}

first_site_bit() {
  local bench="$1"
  python3 - "$WORKLIST" "$bench" <<'PY'
import csv
import sys
path, bench = sys.argv[1], sys.argv[2]
with open(path, newline="", encoding="utf-8") as fh:
    for row in csv.DictReader(fh):
        if row["bench"] == bench:
            print(row["site_id"], row["bit_index"])
            raise SystemExit(0)
raise SystemExit(1)
PY
}

append_master_summary() {
  local bench="$1"
  local benchdir="$2"
  python3 - "$WORKLIST" "$bench" "$benchdir/summary.csv" "$master_summary_csv" <<'PY'
import csv
import sys
worklist_path, bench, summary_path, out_path = sys.argv[1:5]
summary_rows = {}
with open(summary_path, newline="", encoding="utf-8") as fh:
    for row in csv.DictReader(fh):
        summary_rows[(row["site_id"], row["bit_index"])] = row
with open(worklist_path, newline="", encoding="utf-8") as infh, open(out_path, "a", newline="", encoding="utf-8") as outfh:
    writer = csv.writer(outfh)
    for row in csv.DictReader(infh):
        if row["bench"] != bench:
            continue
        match = summary_rows.get((row["site_id"], row["bit_index"]))
        if match is None:
            writer.writerow([
                row["worklist_id"], row["bench"], row["site_id"], row["bit_index"],
                row["comparison"], row["expected_original_result"], row["nvidia_site_id"],
                row["amd_site_id"], row["intel_site_id"], row["nvidia_result"],
                row["amd_result"], row["intel_result"], row["match_tier"], row["notes"],
                "", "MISSING_SUMMARY_ROW", "", "", "", "",
            ])
            continue
        writer.writerow([
            row["worklist_id"], row["bench"], row["site_id"], row["bit_index"],
            row["comparison"], row["expected_original_result"], row["nvidia_site_id"],
            row["amd_site_id"], row["intel_site_id"], row["nvidia_result"],
            row["amd_result"], row["intel_result"], row["match_tier"], row["notes"],
            match.get("trial", ""), match.get("result", ""), match.get("exit_code", ""),
            match.get("stdout", ""), match.get("stderr", ""), match.get("dump", ""),
        ])
PY
}

mapfile -t benches < <(python3 - "$WORKLIST" <<'PY'
import csv
import sys
seen = []
with open(sys.argv[1], newline="", encoding="utf-8") as fh:
    for row in csv.DictReader(fh):
        bench = row["bench"]
        if bench not in seen:
            seen.append(bench)
for bench in seen:
    print(bench)
PY
)

echo "[rerun] benches=${benches[*]}"

for bench in "${benches[@]}"; do
  benchdir="$RESULTS_ROOT/benchmarks/$bench"
  mkdir -p "$benchdir"
  ensure_golden "$bench"

  read -r baseline_site baseline_bit <<< "$(first_site_bit "$bench")"
  echo "[rerun] baseline bench=$bench site=$baseline_site bit=$baseline_bit"

  set +e
  BASELINE=1 \
  RESULTS_DIR="$benchdir" \
  CSV="$benchdir/baseline_summary.csv" \
  OUT_DIR="$RESULTS_ROOT/tmp/${bench}_baseline" \
  BITIR_TRACE_METADATA_DIR="$METADATA_ROOT/$bench" \
  python3 HeCBench/tools/llvm17_inject/bitir_pipeline.py \
    inject-one HeCBench/config/runs/frontier_amd_rerun.yml \
    --repo-root "$REPO_ROOT" \
    --machine amd \
    --bench "$bench" \
    --site-id "$baseline_site" \
    --bit-index "$baseline_bit" \
    --fault-model amd_rerun_result \
    --local
  baseline_rc=$?
  set -e

  baseline_result="$(python3 - "$benchdir/baseline_summary.csv" <<'PY'
import csv
import sys
path = sys.argv[1]
try:
    rows = list(csv.DictReader(open(path, newline="", encoding="utf-8")))
except FileNotFoundError:
    print("MISSING")
    raise SystemExit(0)
print(rows[-1]["result"] if rows else "EMPTY")
PY
)"

  if [[ "$baseline_rc" -ne 0 || "$baseline_result" != "BASELINE" ]]; then
    echo "[rerun] baseline failed for $bench rc=$baseline_rc result=$baseline_result"
    echo "$bench,failed,$baseline_result,$baseline_site,$baseline_bit,$benchdir/baseline_summary.csv,benchmark_skipped_after_baseline_failure" >> "$baseline_csv"
    continue
  fi

  echo "$bench,passed,$baseline_result,$baseline_site,$baseline_bit,$benchdir/baseline_summary.csv," >> "$baseline_csv"

  : > "$benchdir/summary.csv"
  echo "site_id,bit_index,trial,result,exit_code,stdout,stderr,dump" > "$benchdir/summary.csv"

  python3 - "$WORKLIST" "$bench" <<'PY' > "$benchdir/work_items.csv"
import csv
import sys
worklist, bench = sys.argv[1], sys.argv[2]
with open(worklist, newline="", encoding="utf-8") as fh:
    rows = [r for r in csv.DictReader(fh) if r["bench"] == bench]
with open("/dev/stdout", "w", newline="", encoding="utf-8") as out:
    writer = csv.DictWriter(out, fieldnames=rows[0].keys())
    writer.writeheader()
    writer.writerows(rows)
PY

  tail -n +2 "$benchdir/work_items.csv" | while IFS=, read -r worklist_id bench_name site_id bit_index comparison expected_original_result nvidia_site_id amd_site_id intel_site_id nvidia_result amd_result intel_result match_tier notes; do
    echo "[rerun] inject bench=$bench_name site=$site_id bit=$bit_index worklist_id=$worklist_id"
    set +e
    RESULTS_DIR="$benchdir" \
    CSV="$benchdir/summary.csv" \
    OUT_DIR="$RESULTS_ROOT/tmp/${bench_name}_site${site_id}_bit${bit_index}" \
    BITIR_TRACE_METADATA_DIR="$METADATA_ROOT/$bench_name" \
    python3 HeCBench/tools/llvm17_inject/bitir_pipeline.py \
      inject-one HeCBench/config/runs/frontier_amd_rerun.yml \
      --repo-root "$REPO_ROOT" \
      --machine amd \
      --bench "$bench_name" \
      --site-id "$site_id" \
      --bit-index "$bit_index" \
      --fault-model amd_rerun_result \
      --local
    row_rc=$?
    set -e
    if [[ "$row_rc" -ne 0 ]]; then
      echo "$bench_name,$site_id,$bit_index,$row_rc,inject_one_returned_nonzero" >> "$runner_failures_csv"
    fi
  done

  append_master_summary "$bench" "$benchdir"
done

python3 - "$master_summary_csv" "$RESULTS_ROOT/rerun_result_counts.csv" <<'PY'
import csv
import sys
from collections import Counter, defaultdict

summary_path, out_path = sys.argv[1:3]
rows = list(csv.DictReader(open(summary_path, newline="", encoding="utf-8")))
by_bench = defaultdict(Counter)
for row in rows:
    by_bench[row["bench"]][row["rerun_result"]] += 1

with open(out_path, "w", newline="", encoding="utf-8") as fh:
    writer = csv.writer(fh)
    writer.writerow(["bench", "rerun_result", "count"])
    for bench in sorted(by_bench):
        for result, count in sorted(by_bench[bench].items()):
            writer.writerow([bench, result, count])
PY

echo "[rerun] finish $(date -u +%Y-%m-%dT%H:%M:%SZ)"
echo "[rerun] results_root=$RESULTS_ROOT"
