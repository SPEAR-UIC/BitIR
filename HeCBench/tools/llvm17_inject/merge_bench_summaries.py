#!/usr/bin/env python3
import csv
import glob
import os
import sys
from collections import Counter


def main():
    bench = os.environ.get("BENCH")
    if not bench:
        print("BENCH not set")
        return 2

    repo_root = os.getcwd()
    results_dir = os.path.join(repo_root, "HeCBench/results/llvm17_inject", bench)
    pattern = os.path.join(results_dir, "summary_node*_gpu*.csv")
    files = sorted(glob.glob(pattern))
    if not files:
        print("no summary_node*_gpu*.csv files found")
        return 1

    summary_path = os.path.join(results_dir, "summary.csv")
    counts_path = os.path.join(results_dir, "summary_counts.txt")
    conflicts_path = os.path.join(results_dir, "summary_conflicts.csv")

    key_to_row = {}
    # Load existing summary to avoid overwriting previously recorded results.
    if os.path.exists(summary_path):
        with open(summary_path, newline="") as fh:
            reader = csv.DictReader(fh)
            for row in reader:
                site = row.get("site_id")
                bit = row.get("bit_index")
                if not site or not bit:
                    continue
                key_to_row[(site, bit)] = row
    conflicts = []
    for path in files:
        with open(path, newline="") as fh:
            reader = csv.DictReader(fh)
            for row in reader:
                if not row:
                    continue
                site = row.get("site_id")
                bit = row.get("bit_index")
                if not site or not bit:
                    continue
                key = (site, bit)
                if key not in key_to_row:
                    key_to_row[key] = row
                    continue
                if row.get("result") != key_to_row[key].get("result"):
                    conflicts.append((key_to_row[key], row))

    with open(summary_path, "w", newline="") as out:
        writer = csv.writer(out)
        writer.writerow(["site_id", "bit_index", "result", "exit_code", "stdout", "stderr", "dump"])
        for site, bit in sorted(key_to_row.keys(), key=lambda x: (int(x[0]), int(x[1]))):
            row = key_to_row[(site, bit)]
            writer.writerow([
                row.get("site_id"),
                row.get("bit_index"),
                row.get("result"),
                row.get("exit_code"),
                row.get("stdout"),
                row.get("stderr"),
                row.get("dump"),
            ])

    if conflicts:
        with open(conflicts_path, "w", newline="") as out:
            writer = csv.writer(out)
            writer.writerow([
                "site_id",
                "bit_index",
                "result_a",
                "exit_code_a",
                "stdout_a",
                "stderr_a",
                "dump_a",
                "result_b",
                "exit_code_b",
                "stdout_b",
                "stderr_b",
                "dump_b",
            ])
            for a, b in conflicts:
                writer.writerow([
                    a.get("site_id"),
                    a.get("bit_index"),
                    a.get("result"),
                    a.get("exit_code"),
                    a.get("stdout"),
                    a.get("stderr"),
                    a.get("dump"),
                    b.get("result"),
                    b.get("exit_code"),
                    b.get("stdout"),
                    b.get("stderr"),
                    b.get("dump"),
                ])
    elif os.path.exists(conflicts_path):
        os.remove(conflicts_path)

    counts = Counter()
    total = 0
    with open(summary_path, newline="") as fh:
        reader = csv.DictReader(fh)
        for row in reader:
            total += 1
            counts[row.get("result", "UNKNOWN")] += 1

    with open(counts_path, "w") as out:
        out.write(f"total={total}\n")
        for key in ("MASKED", "SDC", "FAILURE"):
            out.write(f"{key}={counts.get(key,0)}\n")
        others = total - sum(counts.get(k, 0) for k in ("MASKED", "SDC", "FAILURE"))
        out.write(f"OTHER={others}\n")
        out.write(f"CONFLICTS={len(conflicts)}\n")

    print(f"merged {len(files)} files into {summary_path}")
    if conflicts:
        print(f"conflicts written to {conflicts_path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
