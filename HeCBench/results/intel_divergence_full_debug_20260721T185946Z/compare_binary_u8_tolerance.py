#!/usr/bin/env python3
import argparse
import os


def main():
    parser = argparse.ArgumentParser(description="Compare byte dumps with an absolute per-byte tolerance.")
    parser.add_argument("golden")
    parser.add_argument("candidate")
    parser.add_argument("--abs-tol", type=int, default=0)
    parser.add_argument("--max-report", type=int, default=10)
    args = parser.parse_args()

    if not os.path.isfile(args.golden):
        print(f"golden_missing: {args.golden}")
        return 2
    if not os.path.isfile(args.candidate):
        print(f"candidate_missing: {args.candidate}")
        return 2

    size_g = os.path.getsize(args.golden)
    size_c = os.path.getsize(args.candidate)
    if size_g != size_c:
        print(f"size_mismatch: golden={size_g} candidate={size_c}")
        return 1

    reports = []
    max_diff = 0
    mismatches = 0
    offset = 0
    bufsize = 1024 * 1024
    with open(args.golden, "rb") as fg, open(args.candidate, "rb") as fc:
        while True:
            gb = fg.read(bufsize)
            cb = fc.read(bufsize)
            if not gb and not cb:
                break
            if len(gb) != len(cb):
                print(f"read_mismatch: golden_chunk={len(gb)} candidate_chunk={len(cb)}")
                return 1
            for i, (g, c) in enumerate(zip(gb, cb)):
                diff = abs(g - c)
                if diff > max_diff:
                    max_diff = diff
                if diff > args.abs_tol:
                    mismatches += 1
                    if len(reports) < args.max_report:
                        reports.append(
                            f"idx={offset + i} golden={g} candidate={c} diff={diff} tol={args.abs_tol}"
                        )
            offset += len(gb)

    if mismatches == 0:
        print(f"compare_ok max_diff={max_diff}")
        return 0

    print(f"compare_mismatch mismatches={mismatches} max_diff={max_diff}")
    for line in reports:
        print(line)
    return 1


if __name__ == "__main__":
    raise SystemExit(main())
