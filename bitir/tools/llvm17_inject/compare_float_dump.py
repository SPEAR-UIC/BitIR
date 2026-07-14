#!/usr/bin/env python3
import argparse
import array
import math
import os


def iter_chunks(path, chunk_elems):
    with open(path, "rb") as handle:
        while True:
            data = handle.read(chunk_elems * 4)
            if not data:
                break
            values = array.array("f")
            values.frombytes(data)
            yield values


def compare_files(golden, candidate, abs_tol, rel_tol, max_report, chunk_elems):
    size_g = os.path.getsize(golden)
    size_c = os.path.getsize(candidate)
    if size_g != size_c:
        return False, ["size_mismatch: golden=%d candidate=%d" % (size_g, size_c)]
    if size_g % 4 != 0:
        return False, ["invalid_size: file_size=%d not divisible by 4" % size_g]

    mismatches = 0
    reports = []
    index = 0
    for golden_chunk, candidate_chunk in zip(iter_chunks(golden, chunk_elems), iter_chunks(candidate, chunk_elems)):
        if len(golden_chunk) != len(candidate_chunk):
            return False, ["read_mismatch: chunk lengths differ at index %d" % index]
        for item_index in range(len(golden_chunk)):
            golden_value = golden_chunk[item_index]
            candidate_value = candidate_chunk[item_index]
            if math.isnan(golden_value) and math.isnan(candidate_value):
                index += 1
                continue
            diff = abs(golden_value - candidate_value)
            tol = max(abs_tol, rel_tol * max(abs(golden_value), abs(candidate_value)))
            if diff > tol:
                mismatches += 1
                if len(reports) < max_report:
                    reports.append(
                        "idx=%d golden=%g candidate=%g diff=%g tol=%g"
                        % (index, golden_value, candidate_value, diff, tol)
                    )
            index += 1
    return mismatches == 0, reports


def main():
    parser = argparse.ArgumentParser(description="Compare binary float dumps with tolerance")
    parser.add_argument("golden")
    parser.add_argument("candidate")
    parser.add_argument("--abs-tol", type=float, default=0.0)
    parser.add_argument("--rel-tol", type=float, default=0.0)
    parser.add_argument("--max-report", type=int, default=10)
    parser.add_argument("--chunk-elems", type=int, default=1 << 20)
    args = parser.parse_args()

    if not os.path.isfile(args.golden):
        print("golden_missing: %s" % args.golden)
        return 2
    if not os.path.isfile(args.candidate):
        print("candidate_missing: %s" % args.candidate)
        return 2

    ok, reports = compare_files(args.golden, args.candidate, args.abs_tol, args.rel_tol, args.max_report, args.chunk_elems)
    if ok:
        print("compare_ok")
        return 0
    print("compare_mismatch")
    for line in reports:
        print(line)
    return 1


if __name__ == "__main__":
    raise SystemExit(main())
