#!/usr/bin/env python3
import csv
import glob
import io
import os
import sys
from collections import Counter


def read_csv_rows(path):
    with open(path, "rb") as fh:
        text = fh.read().replace(b"\x00", b"").decode("utf-8", errors="replace")
    reader = csv.DictReader(io.StringIO(text))
    fieldnames = list(reader.fieldnames or [])
    rows = [row for row in reader if row]
    return fieldnames, rows


def main():
    bench = os.environ.get("BENCH")
    if not bench:
        print("BENCH not set")
        return 2

    repo_root = os.getcwd()
    results_dir = os.environ.get("RESULTS_DIR", "").strip()
    if not results_dir:
        results_subdir = os.environ.get("RESULTS_SUBDIR", "llvm17_inject").strip() or "llvm17_inject"
        phase = os.environ.get("PHASE", "").strip()
        results_dir = os.path.join(repo_root, "bitir", "results", results_subdir, bench)
        if phase:
          results_dir = os.path.join(results_dir, phase)
    pattern = os.path.join(results_dir, "summary_node*_gpu*.csv")
    files = sorted(glob.glob(pattern))
    if not files:
        print("no summary_node*_gpu*.csv files found")
        return 0

    summary_path = os.path.join(results_dir, "summary.csv")
    counts_path = os.path.join(results_dir, "summary_counts.txt")
    conflicts_path = os.path.join(results_dir, "summary_conflicts.csv")

    key_to_row = {}
    all_fieldnames = []

    def remember_fields(fieldnames):
        for name in fieldnames:
            if name and name not in all_fieldnames:
                all_fieldnames.append(name)

    # Load existing summary to avoid overwriting previously recorded results.
    if os.path.exists(summary_path):
        fieldnames, rows = read_csv_rows(summary_path)
        remember_fields(fieldnames)
        for row in rows:
            site = row.get("site_id")
            bit = row.get("bit_index")
            if not site or not bit:
                continue
            key_to_row[(site, bit)] = row
    conflicts = []
    for path in files:
        fieldnames, rows = read_csv_rows(path)
        remember_fields(fieldnames)
        for row in rows:
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

    if not all_fieldnames:
        all_fieldnames = ["site_id", "bit_index", "result", "taxonomy", "exit_code", "stdout", "stderr", "dump"]
    else:
        for required in ("site_id", "bit_index", "result", "taxonomy", "exit_code", "stdout", "stderr", "dump"):
            if required not in all_fieldnames:
                all_fieldnames.insert(0, required)

    with open(summary_path, "w", newline="") as out:
        writer = csv.DictWriter(out, fieldnames=all_fieldnames, extrasaction="ignore")
        writer.writeheader()
        for site, bit in sorted(key_to_row.keys(), key=lambda x: (int(x[0]), int(x[1]))):
            row = key_to_row[(site, bit)]
            writer.writerow(row)

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
    for row in key_to_row.values():
        total += 1
        counts[row.get("result", "UNKNOWN")] += 1
        tax = row.get("taxonomy", "")
        if tax:
            counts[tax] += 1

    with open(counts_path, "w") as out:
        out.write(f"total={total}\n")
        for key in ("MASKED", "SDC", "DUE", "FAILURE"):
            out.write(f"{key}={counts.get(key,0)}\n")
        for key in ("MASKED_FLAGGED", "MASKED_UNFLAGGED", "SDC_FLAGGED", "SDC_NOTFLAGGED", "FAILURE_HANG", "FAILURE_NONHANG"):
            out.write(f"{key}={counts.get(key,0)}\n")
        others = total - sum(counts.get(k, 0) for k in ("MASKED", "SDC", "DUE", "FAILURE"))
        out.write(f"OTHER={others}\n")
        out.write(f"CONFLICTS={len(conflicts)}\n")

    print(f"merged {len(files)} files into {summary_path}")
    if conflicts:
        print(f"conflicts written to {conflicts_path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
