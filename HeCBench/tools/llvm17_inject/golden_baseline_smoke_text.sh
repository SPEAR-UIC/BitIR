#!/usr/bin/env bash
set -euo pipefail

if command -v module >/dev/null 2>&1; then
  module use /soft/modulefiles || true
  module load llvm/release-17.0.0 || true
fi

REPO_ROOT="${REPO_ROOT:-$(pwd)}"
CUDA_HOME="${CUDA_HOME:-/soft/compilers/cudatoolkit/cuda-11.8.0}"
export CUDA_HOME
export PATH="${CUDA_HOME}/bin:${PATH:-}"
export LD_LIBRARY_PATH="${CUDA_HOME}/lib64:${LD_LIBRARY_PATH:-}"
export CUDA_DEVICE_ORDER="${CUDA_DEVICE_ORDER:-PCI_BUS_ID}"
export CUDA_VISIBLE_DEVICES="${CUDA_VISIBLE_DEVICES:-0}"

BTREE_BIN="${BTREE_BIN:-${REPO_ROOT}/HeCBench/build/llvm17-inject-validation-btree/btree}"
CRC64_BIN="${CRC64_BIN:-${REPO_ROOT}/HeCBench/build/llvm17-inject-validation-crc64/crc64}"

BTREE_NUM_KEYS="${BTREE_NUM_KEYS:-65536}"
BTREE_NUM_QUERIES="${BTREE_NUM_QUERIES:-65536}"
BTREE_SEED="${BTREE_SEED:-12345}"
CRC64_NTESTS="${CRC64_NTESTS:-200}"
CRC64_SEED="${CRC64_SEED:-5}"
CRC64_MAX_LEN="${CRC64_MAX_LEN:-65536}"
SMOKE_COUNT="${SMOKE_COUNT:-3}"
HEARTBEAT_SEC="${HEARTBEAT_SEC:-20}"
STAGE_TIMEOUT_SEC="${STAGE_TIMEOUT_SEC:-0}"
ENABLE_BTREE="${ENABLE_BTREE:-0}"

GOLDEN_DIR="${GOLDEN_DIR:-${REPO_ROOT}/Polaris_Golden_Outputs}"
VALIDATION_ROOT="${VALIDATION_ROOT:-${REPO_ROOT}/HeCBench/results/llvm17_text_validation}"
mkdir -p "${GOLDEN_DIR}" "${VALIDATION_ROOT}"

timestamp() {
  date +"%Y-%m-%d %H:%M:%S"
}

log_gpu_snapshot() {
  if command -v nvidia-smi >/dev/null 2>&1; then
    nvidia-smi --query-gpu=index,uuid,utilization.gpu,utilization.memory,memory.used,memory.total --format=csv,noheader 2>/dev/null || true
  fi
}

run_with_heartbeat() {
  local stage="$1"
  local out_file="$2"
  local err_file="$3"
  shift 3

  local start_ts now_ts elapsed
  start_ts="$(date +%s)"
  echo "[stage] ${stage} start $(timestamp)"
  log_gpu_snapshot | sed "s/^/[gpu] /"

  set +e
  "$@" >"${out_file}" 2>"${err_file}" &
  local pid=$!
  set -e

  while kill -0 "${pid}" 2>/dev/null; do
    sleep "${HEARTBEAT_SEC}"
    now_ts="$(date +%s)"
    elapsed=$((now_ts - start_ts))
    echo "[stage] ${stage} heartbeat elapsed_s=${elapsed} pid=${pid} out_bytes=$(wc -c <"${out_file}" 2>/dev/null || echo 0) err_bytes=$(wc -c <"${err_file}" 2>/dev/null || echo 0)"
    log_gpu_snapshot | sed "s/^/[gpu] /"
    if [[ "${STAGE_TIMEOUT_SEC}" -gt 0 && "${elapsed}" -ge "${STAGE_TIMEOUT_SEC}" ]]; then
      echo "[stage] ${stage} timeout reached (${STAGE_TIMEOUT_SEC}s), terminating pid=${pid}" >&2
      kill "${pid}" 2>/dev/null || true
      wait "${pid}" 2>/dev/null || true
      return 124
    fi
  done

  wait "${pid}"
  local rc=$?
  now_ts="$(date +%s)"
  elapsed=$((now_ts - start_ts))
  echo "[stage] ${stage} end $(timestamp) rc=${rc} elapsed_s=${elapsed}"
  return "${rc}"
}

ensure_exe() {
  local path="$1"
  if [[ ! -x "${path}" ]]; then
    echo "Missing executable: ${path}" >&2
    exit 1
  fi
}

run_golden() {
  local bench="$1"
  local out_txt="$2"
  shift 2
  local log="${VALIDATION_ROOT}/${bench}_golden.log"
  echo "[golden] ${bench} -> ${out_txt}"
  run_with_heartbeat "golden_${bench}" "${out_txt}" "${log}" "$@"
}

run_baseline_check() {
  local bench="$1"
  local out_dir="$2"
  local results_dir="$3"
  local golden_txt="$4"

  echo "[baseline] ${bench}"
  run_with_heartbeat "baseline_${bench}" \
    "${results_dir}/baseline_stage.out" \
    "${results_dir}/baseline_stage.err" \
    env \
      BASELINE=1 \
      SITE_ID=0 \
      BIT_INDEX=0 \
      BENCH="${bench}" \
      COMPARE_MODE=text \
      REPO_ROOT="${REPO_ROOT}" \
      CUDA_HOME="${CUDA_HOME}" \
      GOLDEN_TEXT="${golden_txt}" \
      OUT_DIR="${out_dir}" \
      RESULTS_DIR="${results_dir}" \
      INJECT_TARGET="result" \
      CACHE_DEVICE_IR=1 \
      bash "${REPO_ROOT}/HeCBench/tools/llvm17_inject/run_benchmark_injection.sh"

  local meta="${results_dir}/baseline/baseline_meta.txt"
  if [[ ! -f "${meta}" ]]; then
    echo "[baseline] missing meta: ${meta}" >&2
    exit 1
  fi
  local result
  result="$(awk -F= '$1=="result"{print $2}' "${meta}" | tail -n1)"
  if [[ "${result}" != "BASELINE" ]]; then
    echo "[baseline] failed for ${bench}: result=${result}" >&2
    exit 1
  fi
}

run_smoke_injections() {
  local bench="$1"
  local out_dir="$2"
  local results_dir="$3"

  local wl="${REPO_ROOT}/HeCBench/results/llvm17_inject/${bench}/worklist.csv"
  mkdir -p "$(dirname "${wl}")"
  if [[ ! -s "${wl}" ]]; then
    python3 "${REPO_ROOT}/HeCBench/tools/llvm17_inject/build_bench_worklist.py" --bench "${bench}"
  fi
  if [[ ! -s "${wl}" ]]; then
    echo "[smoke] missing worklist for ${bench}: ${wl}" >&2
    exit 1
  fi

  echo "[smoke] ${bench} count=${SMOKE_COUNT}"
  mapfile -t pairs < <(python3 - "${wl}" "${SMOKE_COUNT}" <<'PY'
import csv,sys
wl = sys.argv[1]
count = int(sys.argv[2])
rows = []
with open(wl, newline='') as f:
    r = csv.DictReader(f)
    for row in r:
        s = row.get('site_id') or row.get('site') or row.get('Site')
        b = row.get('bit_index') or row.get('bit') or row.get('BIT_INDEX')
        if s is None or b is None:
            continue
        try:
            rows.append((int(s), int(b)))
        except Exception:
            continue
        if len(rows) >= count:
            break
for s,b in rows:
    print(f"{s},{b}")
PY
)

  if [[ "${#pairs[@]}" -eq 0 ]]; then
    echo "[smoke] no valid site/bit pairs found for ${bench}" >&2
    exit 1
  fi

  local csv="${results_dir}/summary.csv"
  for pair in "${pairs[@]}"; do
    local site bit
    IFS=, read -r site bit <<< "${pair}"
    run_with_heartbeat "smoke_${bench}_site${site}_bit${bit}" \
      "${results_dir}/smoke_site${site}_bit${bit}.stage.out" \
      "${results_dir}/smoke_site${site}_bit${bit}.stage.err" \
      env \
        SITE_ID="${site}" \
        BIT_INDEX="${bit}" \
        BENCH="${bench}" \
        COMPARE_MODE=text \
        REPO_ROOT="${REPO_ROOT}" \
        CUDA_HOME="${CUDA_HOME}" \
        OUT_DIR="${out_dir}" \
        RESULTS_DIR="${results_dir}" \
        CSV="${csv}" \
        SKIP_EXISTING=0 \
        INJECT_TARGET="result" \
        CACHE_DEVICE_IR=1 \
        bash "${REPO_ROOT}/HeCBench/tools/llvm17_inject/run_benchmark_injection.sh"
  done

  python3 - "${csv}" <<'PY'
import csv,sys
path = sys.argv[1]
with open(path, newline='') as f:
    r = csv.DictReader(f)
    req = ['metric_num_bad','metric_frac_bad']
    missing = [c for c in req if c not in (r.fieldnames or [])]
    if missing:
        raise SystemExit(f"missing metrics columns in {path}: {missing}")
    rows = list(r)
    if not rows:
        raise SystemExit(f"no rows in {path}")
print(f"[smoke] metrics columns verified in {path}")
PY
}

ensure_exe "${CRC64_BIN}"
if [[ "${ENABLE_BTREE}" -eq 1 ]]; then
  ensure_exe "${BTREE_BIN}"
fi

BTREE_GOLDEN="${GOLDEN_DIR}/btree.txt"
CRC64_GOLDEN="${GOLDEN_DIR}/crc64.txt"

run_golden "crc64" "${CRC64_GOLDEN}" "${CRC64_BIN}" "${CRC64_NTESTS}" "${CRC64_SEED}" "${CRC64_MAX_LEN}"
if [[ "${ENABLE_BTREE}" -eq 1 ]]; then
  run_golden "btree" "${BTREE_GOLDEN}" "${BTREE_BIN}" "${BTREE_NUM_KEYS}" "${BTREE_NUM_QUERIES}" "${BTREE_SEED}"
fi

BENCH_LIST=(crc64)
if [[ "${ENABLE_BTREE}" -eq 1 ]]; then
  BENCH_LIST=(btree crc64)
fi

for bench in "${BENCH_LIST[@]}"; do
  out_dir="${REPO_ROOT}/HeCBench/build/llvm17-inject-validation-${bench}"
  results_dir="${VALIDATION_ROOT}/${bench}"
  mkdir -p "${results_dir}"
  golden_txt="${GOLDEN_DIR}/${bench}.txt"
  run_baseline_check "${bench}" "${out_dir}" "${results_dir}" "${golden_txt}"
  run_smoke_injections "${bench}" "${out_dir}" "${results_dir}"

done

if [[ "${ENABLE_BTREE}" -eq 1 ]]; then
  echo "[done] golden+baseline+smoke complete for btree+crc64"
else
  echo "[done] golden+baseline+smoke complete for crc64"
fi
