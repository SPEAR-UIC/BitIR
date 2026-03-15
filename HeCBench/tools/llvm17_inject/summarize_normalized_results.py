#!/usr/bin/env python3
import argparse
from collections import Counter
from pathlib import Path


DEFAULT_DIRS = [
    "layout-sycl-debugscale-r1",
    "layout-sycl-debugscale-r2",
    "layout-sycl-isolate-1gpu",
    "layout-sycl-isolate-6gpu",
    "layout-sycl-isolate-6gpu-r2",
    "layout-sycl-isolate-6gpu-r4",
    "layout-sycl-isolate-6gpu-r5",
    "layout-sycl-nosplit-debug20",
    "layout-sycl-nosplit-debug5",
    "layout-sycl-rerun-fix1",
    "layout-sycl-rerun",
    "matrix-rotate-sycl-prod-r1",
    "jacobi-sycl",
    "dense-embedding-sycl",
    "pathfinder-sycl",
    "entropy-sycl",
    "colorwheel-sycl",
    "randomAccess-sycl",
]


def classify_output(text):
    upper = text.upper()
    if "RESULT=MASKED:FLAG" in upper or "RESULT: MASKED:FLAG" in upper:
        return "MASKED_FLAGGED"
    if (
        "RESULT=MASKED:NO-FLAG" in upper
        or "RESULT: MASKED:NO-FLAG" in upper
        or "RESULT=MASKED:NOT-FLAGGED" in upper
        or "RESULT: MASKED:NOT-FLAGGED" in upper
    ):
        return "MASKED_UNFLAGGED"
    if "RESULT=SDC:FLAG" in upper or "RESULT: SDC:FLAG" in upper:
        return "SDC_FLAGGED"
    if (
        "RESULT=SDC:NOT-FLAGGED" in upper
        or "RESULT: SDC:NOT-FLAGGED" in upper
        or "RESULT=SDC:NO-FLAG" in upper
        or "RESULT: SDC:NO-FLAG" in upper
    ):
        return "SDC_NOTFLAGGED"
    if (
        "DUE:TIMEOUT" in upper
        or "[HANG-TIMEOUT]" in upper
        or "RESULT=FAILURE:HANG" in upper
        or "RESULT: FAILURE:HANG" in upper
    ):
        return "FAILURE_HANG"
    return "FAILURE_NONHANG"


def iter_output_files(results_root, dir_names):
    for name in dir_names:
        directory = results_root / name
        if not directory.exists():
            continue
        for path in directory.glob("site*_bit*.out"):
            yield path


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--results-root",
        default="/home/mdunlavy/GPU_FI/HeCBench/results/llvm17_inject",
    )
    parser.add_argument("--dir", action="append", dest="dirs", default=[])
    args = parser.parse_args()

    results_root = Path(args.results_root)
    dir_names = args.dirs or DEFAULT_DIRS
    counts = Counter()
    total = 0
    for path in iter_output_files(results_root, dir_names):
        total += 1
        tail = path.read_bytes()[-4096:].decode("utf-8", "replace")
        counts[classify_output(tail)] += 1

    print("TOTAL,%d" % total)
    for key in [
        "MASKED_FLAGGED",
        "MASKED_UNFLAGGED",
        "SDC_FLAGGED",
        "SDC_NOTFLAGGED",
        "FAILURE_HANG",
        "FAILURE_NONHANG",
    ]:
        print("%s,%d" % (key, counts[key]))


if __name__ == "__main__":
    main()
