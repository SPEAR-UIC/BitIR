#!/usr/bin/env python3
import csv
import os
import re
from collections import Counter


BENCHES = [
    "matrix-rotate",
    "jacobi",
    "layout",
    "dense-embedding",
    "pathfinder",
    "bsearch",
    "entropy",
    "colorwheel",
    "randomAccess",
]


RESULT_RE = re.compile(r"^Result:\s+(\S+)\s+\(exit\s+([^)]+)\)")
SITE_RE = re.compile(r"site(\d+)_bit(\d+)\.out$")
GPU_DEBUG_RE = re.compile(r"^\[gpu-debug\].*err=no error$")
TRIVIAL_ERR_RE = re.compile(r".*err=no error.*", re.IGNORECASE)
COMPARE_OK_RE = re.compile(r"^compare_ok$")
COMPARE_EXACT_RE = re.compile(r"^compare_exact$")
COMPARE_MISMATCH_RE = re.compile(r"^compare_mismatch$")
COMPARE_EXACT_MISMATCH_RE = re.compile(r"^mismatch$")
COMPARE_ERR_RE = re.compile(r"^(golden_missing|candidate_missing|size_mismatch|invalid_size|read_mismatch):")
FAIL_HINT_RE = re.compile(r"(error|failed|segmentation|invalid|exception)", re.IGNORECASE)
FAILURE_PATTERNS = [
    ("signal_segv_cuda_illegal_address", re.compile(r"an illegal memory access was encountered|illegal memory access", re.IGNORECASE)),
    ("gpu_misaligned_address", re.compile(r"misaligned address", re.IGNORECASE)),
    ("gpu_unspecified_launch_failure", re.compile(r"unspecified launch failure", re.IGNORECASE)),
    ("gpu_launch_failure", re.compile(r"launch failed|launch failure", re.IGNORECASE)),
    ("gpu_device_assert", re.compile(r"device-side assert|device side assert", re.IGNORECASE)),
    ("gpu_out_of_memory", re.compile(r"out of memory", re.IGNORECASE)),
    ("gpu_invalid_device_function", re.compile(r"invalid device function", re.IGNORECASE)),
    ("gpu_trap", re.compile(r"warp illegal instruction|trap", re.IGNORECASE)),
    ("signal_segv_text", re.compile(r"segmentation fault|sigsegv", re.IGNORECASE)),
    ("signal_abrt_text", re.compile(r"aborted|sigabrt", re.IGNORECASE)),
    ("signal_fpe_text", re.compile(r"floating point exception|sigfpe", re.IGNORECASE)),
    ("kernel_reported_fail", re.compile(r"found \d+ errors in \d+ locations \(FAIL\)|\bFAIL\b", re.IGNORECASE)),
]
RANDACC_ERRCOUNT_RE = re.compile(r"Found\s+(\d+)\s+errors?\s+in\s+\d+\s+locations\s+\((PASS|FAIL)\)\.", re.IGNORECASE)


def benchmark_flagged(bench, out_text, err_text, result, exit_code, failure_kind):
    text = f"{out_text}\n{err_text}"
    exit_code = (exit_code or "").strip()
    failure_kind = (failure_kind or "").strip()
    if result in ("DUE", "FAILURE"):
        return True
    if failure_kind or (exit_code not in ("", "0")):
        return True

    if bench == "randomAccess":
        m = RANDACC_ERRCOUNT_RE.search(text)
        if m:
            return int(m.group(1)) > 0 or m.group(2).upper() == "FAIL"
        return False

    if bench in {"colorwheel", "dense-embedding", "entropy", "jacobi", "layout", "matrix-rotate"}:
        lines = [ln.strip().upper() for ln in out_text.splitlines() if ln.strip()]
        if "FAIL" in lines:
            return True
        if "PASS" in lines:
            return False

    return False


def taxonomy_from_fields(bench, out_text, err_text, result, exit_code, failure_kind):
    flagged = benchmark_flagged(bench, out_text, err_text, result, exit_code, failure_kind)
    if result == "MASKED":
        return "MASKED_FLAGGED" if flagged else "MASKED_UNFLAGGED"
    if result == "SDC":
        return "SDC_FLAGGED" if flagged else "SDC_NOTFLAGGED"
    if result in ("DUE", "FAILURE"):
        if str(exit_code).startswith("timeout_") or failure_kind == "hang_timeout":
            return "FAILURE_HANG"
        return "FAILURE_NONHANG"
    return ""


def is_trivial_err(path):
    try:
        with open(path, "r", errors="ignore") as fh:
            lines = [ln.strip() for ln in fh if ln.strip()]
    except OSError:
        return False
    if not lines:
        return True
    return all(GPU_DEBUG_RE.match(ln) or TRIVIAL_ERR_RE.match(ln) for ln in lines)


def parse_result(out_path, err_path=None):
    result = None
    exit_code = ""
    failure_kind = ""
    failure_signal = ""
    saw_ok = False
    saw_mismatch = False
    saw_compare_err = False
    saw_fail_hint = False
    saw_any = False
    err_nontrivial = False
    out_text = ""
    err_text = ""
    if err_path and os.path.exists(err_path):
        try:
            with open(err_path, "r", errors="ignore") as ef:
                err_text = ef.read()
            lines = [ln.strip() for ln in err_text.splitlines() if ln.strip()]
            if lines:
                err_nontrivial = not all("err=no error" in ln.lower() for ln in lines)
        except OSError:
            err_nontrivial = False

    try:
        with open(out_path, "r", errors="ignore") as fh:
            out_text = fh.read()
            for line in out_text.splitlines():
                line = line.strip()
                if line:
                    saw_any = True
                m = RESULT_RE.match(line)
                if m:
                    result = m.group(1)
                    exit_code = m.group(2).strip()
                if line.startswith("failure_kind="):
                    failure_kind = line.split("=", 1)[1].strip()
                if line.startswith("failure_signal="):
                    failure_signal = line.split("=", 1)[1].strip()
                if COMPARE_OK_RE.match(line):
                    saw_ok = True
                if COMPARE_MISMATCH_RE.match(line) or COMPARE_EXACT_MISMATCH_RE.match(line) or line.startswith("idx="):
                    saw_mismatch = True
                if COMPARE_ERR_RE.match(line):
                    saw_compare_err = True
                if FAIL_HINT_RE.search(line):
                    saw_fail_hint = True
                if COMPARE_EXACT_RE.match(line):
                    saw_ok = True
    except OSError:
        return "UNKNOWN", "", "", ""
    if not failure_kind:
        text = out_text + "\n" + err_text
        for label, pattern in FAILURE_PATTERNS:
            if pattern.search(text):
                failure_kind = label
                break
    if not failure_signal and failure_kind in ("signal_segv", "signal_segv_text", "signal_segv_cuda_illegal_address"):
        failure_signal = "SIGSEGV"
    elif not failure_signal and failure_kind in ("signal_abrt", "signal_abrt_text"):
        failure_signal = "SIGABRT"
    elif not failure_signal and failure_kind in ("signal_fpe", "signal_fpe_text"):
        failure_signal = "SIGFPE"
    if err_nontrivial:
        return "DUE", "stderr_nontrivial", failure_kind, failure_signal
    if result:
        return result, exit_code, failure_kind, failure_signal
    if saw_ok:
        return "MASKED", exit_code, failure_kind, failure_signal
    if saw_mismatch or saw_compare_err:
        return "SDC", exit_code, failure_kind, failure_signal
    if saw_fail_hint:
        return "DUE", exit_code, failure_kind, failure_signal
    if not saw_any:
        return "DUE", "empty_out", failure_kind, failure_signal
    return "DUE", "parse_unknown", failure_kind, failure_signal


def rebuild_for_bench(repo_root, bench):
    results_dir = os.path.join(repo_root, "HeCBench", "results", "llvm17_inject", bench)
    if not os.path.isdir(results_dir):
        return 0, 0
    review_dir = os.path.join(results_dir, "unknown_review")
    os.makedirs(review_dir, exist_ok=True)
    review_paths = []

    # Remove trivial err files (empty or only "no error" lines).
    removed_err = 0
    for name in os.listdir(results_dir):
        if not name.endswith(".err"):
            continue
        path = os.path.join(results_dir, name)
        if is_trivial_err(path):
            os.remove(path)
            removed_err += 1

    rows = []
    for name in os.listdir(results_dir):
        m = SITE_RE.search(name)
        if not m:
            continue
        site = int(m.group(1))
        bit = int(m.group(2))
        out_path = os.path.join(results_dir, name)
        err_path = os.path.join(results_dir, f"site{site}_bit{bit}.err")
        result, exit_code, failure_kind, failure_signal = parse_result(out_path, err_path)
        err_keep = ""
        if os.path.exists(err_path) and os.path.getsize(err_path) > 0:
            err_keep = err_path
        if result in ("DUE", "FAILURE") and exit_code in ("parse_unknown", "empty_out"):
            dst = os.path.join(review_dir, name)
            try:
                if not os.path.exists(dst):
                    with open(out_path, "rb") as src_fh, open(dst, "wb") as dst_fh:
                        dst_fh.write(src_fh.read())
                    review_paths.append(dst)
            except OSError:
                pass
        taxonomy = taxonomy_from_fields(bench, out_text, err_text, result, exit_code, failure_kind)
        rows.append([site, bit, result, taxonomy, exit_code, failure_kind, failure_signal, out_path, err_keep, ""])

    rows.sort(key=lambda r: (r[0], r[1]))

    summary_path = os.path.join(results_dir, "summary.csv")
    with open(summary_path, "w", newline="") as fh:
        w = csv.writer(fh)
        w.writerow(["site_id", "bit_index", "result", "taxonomy", "exit_code", "failure_kind", "failure_signal", "stdout", "stderr", "dump"])
        for row in rows:
            w.writerow(row)

    counts = Counter()
    for row in rows:
        counts[row[2]] += 1
        if row[3]:
            counts[row[3]] += 1
    counts_path = os.path.join(results_dir, "summary_counts.txt")
    with open(counts_path, "w") as fh:
        total = sum(counts.values())
        fh.write(f"total={total}\n")
        for key in ("MASKED", "SDC", "DUE", "TIMEOUT", "FAILURE", "UNKNOWN"):
            fh.write(f"{key}={counts.get(key, 0)}\n")
        for key in ("MASKED_FLAGGED", "MASKED_UNFLAGGED", "SDC_FLAGGED", "SDC_NOTFLAGGED", "FAILURE_HANG", "FAILURE_NONHANG"):
            fh.write(f"{key}={counts.get(key, 0)}\n")
        others = total - sum(counts.get(k, 0) for k in ("MASKED", "SDC", "DUE", "TIMEOUT", "FAILURE", "UNKNOWN"))
        fh.write(f"OTHER={others}\n")

    conflicts_path = os.path.join(results_dir, "summary_conflicts.csv")
    if os.path.exists(conflicts_path):
        os.remove(conflicts_path)

    return removed_err, len(rows)


def main():
    repo_root = os.getcwd()
    total_removed = 0
    total_rows = 0
    for bench in BENCHES:
        removed, rows = rebuild_for_bench(repo_root, bench)
        total_removed += removed
        total_rows += rows
        print(f"{bench}: rebuilt {rows} rows, removed {removed} gpu-debug err files")
    print(f"total_rows={total_rows} total_removed_err={total_removed}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
