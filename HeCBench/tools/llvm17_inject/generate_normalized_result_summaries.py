#!/usr/bin/env python3
import argparse
import csv
import re
from collections import Counter
from pathlib import Path


BENCH_DIRS = [
    "layout-sycl-debugscale-r1",
    "matrix-rotate-sycl-prod-r1",
    "jacobi-sycl",
    "dense-embedding-sycl",
    "pathfinder-sycl",
    "entropy-sycl",
    "colorwheel-sycl",
    "randomAccess-sycl",
]


def classify_text(text):
    upper = text.upper()
    raw = ""
    for line in reversed(text.splitlines()):
        if "[compare] end" in line and "result=" in line:
            raw = line.split("result=", 1)[1].strip()
            break
        if line.startswith("Result: "):
            raw = line.split("Result: ", 1)[1].strip()
            break
        if "[hang-timeout]" in line and "result=" in line:
            raw = line.split("result=", 1)[1].split()[0].strip()
            break
    raw_upper = raw.upper()
    if raw_upper.startswith("MASKED:FLAG"):
        return raw, "MASKED_FLAGGED"
    if (
        raw_upper.startswith("MASKED:NO-FLAG")
        or raw_upper.startswith("MASKED:NOT-FLAGGED")
        or raw_upper.startswith("MASKED:UNFLAGGED")
    ):
        return raw, "MASKED_UNFLAGGED"
    if raw_upper.startswith("SDC:FLAG"):
        return raw, "SDC_FLAGGED"
    if (
        raw_upper.startswith("SDC:NOT-FLAGGED")
        or raw_upper.startswith("SDC:NO-FLAG")
        or raw_upper.startswith("SDC:UNFLAGGED")
    ):
        return raw, "SDC_NOTFLAGGED"
    if "TIMEOUT" in raw_upper or "HANG" in raw_upper:
        return raw or "DUE:TIMEOUT", "FAILURE_HANG"
    return raw or "FAILURE:NONHANG", "FAILURE_NONHANG"


def output_path(bench_dir, stem, suffix):
    filename = stem if not suffix else "%s_%s" % (stem[:-4], suffix) + ".csv"
    path = bench_dir / filename
    if path.exists():
        raise FileExistsError(str(path))
    return path


def summarize_bench(bench_dir, suffix):
    fieldnames = [
        "site_id",
        "bit_index",
        "raw_result",
        "normalized_result",
        "has_out",
        "has_err",
    ]
    rows = []
    counts = Counter()
    pair_pat = re.compile(r"site(\d+)_bit(\d+)\.out$")
    for out_path in sorted(bench_dir.glob("site*_bit*.out")):
        match = pair_pat.match(out_path.name)
        if not match:
            continue
        site_id, bit_index = match.group(1), match.group(2)
        err_path = bench_dir / ("site%s_bit%s.err" % (site_id, bit_index))
        text = out_path.read_bytes()[-4096:].decode("utf-8", "replace")
        raw_result, normalized_result = classify_text(text)
        counts[normalized_result] += 1
        rows.append(
            {
                "site_id": site_id,
                "bit_index": bit_index,
                "raw_result": raw_result,
                "normalized_result": normalized_result,
                "has_out": "1",
                "has_err": "1" if err_path.exists() else "0",
            }
        )
    results_csv = output_path(bench_dir, "normalized_results.csv", suffix)
    with results_csv.open("w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)

    counts_csv = output_path(bench_dir, "normalized_counts.csv", suffix)
    with counts_csv.open("w", newline="", encoding="utf-8") as f:
        writer = csv.writer(f)
        writer.writerow(["normalized_result", "count"])
        for key in [
            "MASKED_FLAGGED",
            "MASKED_UNFLAGGED",
            "SDC_FLAGGED",
            "SDC_NOTFLAGGED",
            "FAILURE_HANG",
            "FAILURE_NONHANG",
        ]:
            writer.writerow([key, counts[key]])
    return counts


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--results-root",
        default="/home/mdunlavy/GPU_FI/HeCBench/results/llvm17_inject",
    )
    parser.add_argument("--bench-dir", action="append", dest="bench_dirs", default=[])
    parser.add_argument("--suffix", required=True)
    args = parser.parse_args()

    results_root = Path(args.results_root)
    bench_dirs = args.bench_dirs or BENCH_DIRS
    aggregate = Counter()

    for bench_name in bench_dirs:
        bench_dir = results_root / bench_name
        if not bench_dir.exists():
            continue
        counts = summarize_bench(bench_dir, args.suffix)
        aggregate.update(counts)

    aggregate_name = "normalized_campaign_counts_%s.csv" % args.suffix
    aggregate_csv = results_root / aggregate_name
    if aggregate_csv.exists():
        raise FileExistsError(str(aggregate_csv))
    with aggregate_csv.open("w", newline="", encoding="utf-8") as f:
        writer = csv.writer(f)
        writer.writerow(["normalized_result", "count"])
        for key in [
            "MASKED_FLAGGED",
            "MASKED_UNFLAGGED",
            "SDC_FLAGGED",
            "SDC_NOTFLAGGED",
            "FAILURE_HANG",
            "FAILURE_NONHANG",
        ]:
            writer.writerow([key, aggregate[key]])


if __name__ == "__main__":
    main()
