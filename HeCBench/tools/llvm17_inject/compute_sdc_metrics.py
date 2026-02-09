#!/usr/bin/env python3
import argparse
import os
import sys
import math
import array


def iter_chunks(path, chunk_bytes):
    with open(path, "rb") as f:
        while True:
            data = f.read(chunk_bytes)
            if not data:
                break
            yield data


def float_metrics(golden, candidate, chunk_elems):
    size_g = os.path.getsize(golden)
    size_c = os.path.getsize(candidate)
    if size_g != size_c or size_g % 4 != 0:
        return None

    max_abs = 0.0
    sum_abs = 0.0
    sum_sq = 0.0
    count = 0

    chunk_bytes = chunk_elems * 4
    for g_chunk, c_chunk in zip(iter_chunks(golden, chunk_bytes),
                                iter_chunks(candidate, chunk_bytes)):
        ga = array.array("f")
        ca = array.array("f")
        ga.frombytes(g_chunk)
        ca.frombytes(c_chunk)
        if len(ga) != len(ca):
            return None
        for gv, cv in zip(ga, ca):
            if math.isnan(gv) and math.isnan(cv):
                count += 1
                continue
            diff = abs(gv - cv)
            if diff > max_abs:
                max_abs = diff
            sum_abs += diff
            sum_sq += diff * diff
            count += 1

    if count == 0:
        return None
    mean_abs = sum_abs / count
    rmse = math.sqrt(sum_sq / count)
    return {
        "abs_max": max_abs,
        "mean_abs": mean_abs,
        "rmse": rmse,
        "count": count,
    }


def hamming_metrics(golden, candidate, chunk_bytes):
    size_g = os.path.getsize(golden)
    size_c = os.path.getsize(candidate)
    if size_g != size_c:
        return None

    bitcount = [bin(i).count("1") for i in range(256)]
    bits = 0
    bytes_diff = 0

    for g_chunk, c_chunk in zip(iter_chunks(golden, chunk_bytes),
                                iter_chunks(candidate, chunk_bytes)):
        if len(g_chunk) != len(c_chunk):
            return None
        for gb, cb in zip(g_chunk, c_chunk):
            x = gb ^ cb
            if x:
                bytes_diff += 1
                bits += bitcount[x]

    return {
        "ham_bytes": bytes_diff,
        "ham_bits": bits,
        "size_bytes": size_g,
    }


def main():
    parser = argparse.ArgumentParser(description="Compute SDC severity metrics.")
    parser.add_argument("golden")
    parser.add_argument("candidate")
    parser.add_argument("--mode", choices=["float", "exact"], required=True)
    parser.add_argument("--chunk-elems", type=int, default=1 << 20)
    parser.add_argument("--chunk-bytes", type=int, default=1024 * 1024)
    args = parser.parse_args()

    if not os.path.isfile(args.golden) or not os.path.isfile(args.candidate):
        return 2

    if args.mode == "float":
        metrics = float_metrics(args.golden, args.candidate, args.chunk_elems)
        if not metrics:
            return 1
        print("metric_abs_max=%g" % metrics["abs_max"])
        print("metric_mean_abs=%g" % metrics["mean_abs"])
        print("metric_rmse=%g" % metrics["rmse"])
        print("metric_count=%d" % metrics["count"])
        return 0

    metrics = hamming_metrics(args.golden, args.candidate, args.chunk_bytes)
    if not metrics:
        return 1
    print("metric_ham_bytes=%d" % metrics["ham_bytes"])
    print("metric_ham_bits=%d" % metrics["ham_bits"])
    print("metric_size_bytes=%d" % metrics["size_bytes"])
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
