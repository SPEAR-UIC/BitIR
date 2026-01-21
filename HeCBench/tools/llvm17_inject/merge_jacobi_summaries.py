#!/usr/bin/env python3
import csv
import glob
import os
from collections import Counter


def main():
    repo_root = os.getcwd()
    results_dir = os.path.join(repo_root, "HeCBench/results/llvm17_inject/jacobi")
    pattern = os.path.join(results_dir, "summary_node*_gpu*.csv")
    files = sorted(glob.glob(pattern))
    if not files:
        print("no summary_node*_gpu*.csv files found")
        return 1

    summary_path = os.path.join(results_dir, "summary.csv")
    counts_path = os.path.join(results_dir, "summary_counts.txt")

    with open(summary_path, "w", newline="") as out:
        writer = csv.writer(out)
        writer.writerow(["site_id", "bit_index", "result", "exit_code", "stdout", "stderr", "dump"])
        for path in files:
            with open(path, newline="") as fh:
                reader = csv.reader(fh)
                header = next(reader, None)
                for row in reader:
                    if not row:
                        continue
                    writer.writerow(row)

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

    print(f"merged {len(files)} files into {summary_path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
