#!/usr/bin/env python3
import csv
import os
import re
from collections import Counter


BENCHES = [
    "matrix-rotate",
    "jacobi",
    "layout",
    "atomicCost",
    "dense-embedding",
    "pathfinder",
    "bsearch",
    "entropy",
    "colorwheel",
    "randomAccess",
]


RESULT_RE = re.compile(r"^Result:\s+(\S+)\s+\(exit\s+(-?\d+)\)")
SITE_RE = re.compile(r"site(\d+)_bit(\d+)\.out$")
GPU_DEBUG_RE = re.compile(r"^\[gpu-debug\].*err=no error$")


def is_gpu_debug_only_err(path):
    try:
        with open(path, "r", errors="ignore") as fh:
            lines = [ln.strip() for ln in fh if ln.strip()]
    except OSError:
        return False
    if not lines:
        return False
    return all(GPU_DEBUG_RE.match(ln) for ln in lines)


def parse_result(out_path):
    result = None
    exit_code = ""
    try:
        with open(out_path, "r", errors="ignore") as fh:
            for line in fh:
                line = line.strip()
                m = RESULT_RE.match(line)
                if m:
                    result = m.group(1)
                    exit_code = m.group(2)
    except OSError:
        return "UNKNOWN", ""
    if not result:
        return "UNKNOWN", ""
    return result, exit_code


def rebuild_for_bench(repo_root, bench):
    results_dir = os.path.join(repo_root, "HeCBench", "results", "llvm17_inject", bench)
    if not os.path.isdir(results_dir):
        return 0, 0

    # Remove GPU-only debug err files.
    removed_err = 0
    for name in os.listdir(results_dir):
        if not name.endswith(".err"):
            continue
        path = os.path.join(results_dir, name)
        if is_gpu_debug_only_err(path):
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
        result, exit_code = parse_result(out_path)
        err_keep = ""
        if os.path.exists(err_path) and os.path.getsize(err_path) > 0:
            err_keep = err_path
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
