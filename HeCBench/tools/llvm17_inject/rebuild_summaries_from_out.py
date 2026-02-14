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
    saw_ok = False
    saw_mismatch = False
    saw_compare_err = False
    saw_fail_hint = False
    saw_any = False
    err_nontrivial = False
    if err_path and os.path.exists(err_path):
        try:
            with open(err_path, "r", errors="ignore") as ef:
                lines = [ln.strip() for ln in ef if ln.strip()]
            if lines:
                err_nontrivial = not all("err=no error" in ln.lower() for ln in lines)
        except OSError:
            err_nontrivial = False

    try:
        with open(out_path, "r", errors="ignore") as fh:
            for line in fh:
                line = line.strip()
                if line:
                    saw_any = True
                m = RESULT_RE.match(line)
                if m:
                    result = m.group(1)
                    exit_code = m.group(2).strip()
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
        return "UNKNOWN", ""
    if err_nontrivial:
        return "FAILURE", "stderr_nontrivial"
    if result:
        return result, exit_code
    if saw_ok:
        return "MASKED", exit_code
    if saw_mismatch or saw_compare_err:
        return "SDC", exit_code
    if saw_fail_hint:
        return "FAILURE", exit_code
    if not saw_any:
        return "FAILURE", "empty_out"
    return "FAILURE", "parse_unknown"


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
        result, exit_code = parse_result(out_path, err_path)
        err_keep = ""
        if os.path.exists(err_path) and os.path.getsize(err_path) > 0:
            err_keep = err_path
        if result == "FAILURE" and exit_code in ("parse_unknown", "empty_out"):
            dst = os.path.join(review_dir, name)
            try:
                if not os.path.exists(dst):
                    with open(out_path, "rb") as src_fh, open(dst, "wb") as dst_fh:
                        dst_fh.write(src_fh.read())
                    review_paths.append(dst)
            except OSError:
                pass
        rows.append([site, bit, result, exit_code, out_path, err_keep, ""])

    rows.sort(key=lambda r: (r[0], r[1]))

    summary_path = os.path.join(results_dir, "summary.csv")
    with open(summary_path, "w", newline="") as fh:
        w = csv.writer(fh)
        w.writerow(["site_id", "bit_index", "result", "exit_code", "stdout", "stderr", "dump"])
        for row in rows:
            w.writerow(row)

    counts = Counter()
    for row in rows:
        counts[row[2]] += 1
    counts_path = os.path.join(results_dir, "summary_counts.txt")
    with open(counts_path, "w") as fh:
        total = sum(counts.values())
        fh.write(f"total={total}\n")
        for key in ("MASKED", "SDC", "FAILURE", "UNKNOWN"):
            fh.write(f"{key}={counts.get(key, 0)}\n")
        others = total - sum(counts.get(k, 0) for k in ("MASKED", "SDC", "FAILURE", "UNKNOWN"))
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
