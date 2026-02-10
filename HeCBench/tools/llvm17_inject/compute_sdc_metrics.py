#!/usr/bin/env python3
import argparse
import os
import sys
import math
import array
import random
import struct


def iter_chunks(path, chunk_bytes):
    with open(path, "rb") as f:
        while True:
            data = f.read(chunk_bytes)
            if not data:
                break
            yield data


def _float_to_ordered_int(fval):
    # IEEE-754 float to monotonically ordered int for ULP distance.
    bits = struct.unpack("<I", struct.pack("<f", fval))[0]
    if bits & 0x80000000:
        return 0x80000000 - bits
    return bits + 0x80000000


def _reservoir_sample(sample, x, seen, max_sample):
    if max_sample <= 0:
        return
    if len(sample) < max_sample:
        sample.append(x)
        return
    j = random.randint(1, seen)
    if j <= max_sample:
        sample[j - 1] = x


def float_metrics(golden, candidate, chunk_elems, rel_eps, bad_threshold, max_sample):
    size_g = os.path.getsize(golden)
    size_c = os.path.getsize(candidate)
    if size_g != size_c or size_g % 4 != 0:
        return None

    max_abs = 0.0
    sum_abs = 0.0
    sum_sq = 0.0
    max_rel = 0.0
    sum_rel = 0.0
    max_ulp = 0
    sum_ulp = 0
    num_bad = 0
    count = 0
    sample = []

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
            denom = max(abs(gv), rel_eps)
            rel = diff / denom
            if rel > max_rel:
                max_rel = rel
            sum_rel += rel
            if diff > bad_threshold:
                num_bad += 1
            og = _float_to_ordered_int(gv)
            oc = _float_to_ordered_int(cv)
            ulp = abs(og - oc)
            if ulp > max_ulp:
                max_ulp = ulp
            sum_ulp += ulp
            count += 1
            _reservoir_sample(sample, diff, count, max_sample)

    if count == 0:
        return None
    mean_abs = sum_abs / count
    rmse = math.sqrt(sum_sq / count)
    mean_rel = sum_rel / count
    mean_ulp = sum_ulp / count
    frac_bad = num_bad / count
    p95 = None
    p99 = None
    if sample:
        sample.sort()
        idx95 = int(0.95 * (len(sample) - 1))
        idx99 = int(0.99 * (len(sample) - 1))
        p95 = sample[idx95]
        p99 = sample[idx99]
    return {
        "abs_max": max_abs,
        "mean_abs": mean_abs,
        "rmse": rmse,
        "max_rel": max_rel,
        "mean_rel": mean_rel,
        "p95_abs": p95,
        "p99_abs": p99,
        "num_bad": num_bad,
        "frac_bad": frac_bad,
        "max_ulp": max_ulp,
        "mean_ulp": mean_ulp,
        "count": count,
        "size_bytes": size_g,
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
    parser.add_argument("--rel-eps", type=float, default=1e-12)
    parser.add_argument("--bad-threshold", type=float, default=1e-3)
    parser.add_argument("--sample-size", type=int, default=200000)
    args = parser.parse_args()

    if not os.path.isfile(args.golden) or not os.path.isfile(args.candidate):
        return 2

    if args.mode == "float":
        metrics = float_metrics(
            args.golden,
            args.candidate,
            args.chunk_elems,
            args.rel_eps,
            args.bad_threshold,
            args.sample_size,
        )
        if not metrics:
            return 1
        print("metric_abs_max=%g" % metrics["abs_max"])
        print("metric_mean_abs=%g" % metrics["mean_abs"])
        print("metric_rmse=%g" % metrics["rmse"])
        print("metric_max_rel=%g" % metrics["max_rel"])
        print("metric_mean_rel=%g" % metrics["mean_rel"])
        if metrics["p95_abs"] is not None:
            print("metric_p95_abs=%g" % metrics["p95_abs"])
        if metrics["p99_abs"] is not None:
            print("metric_p99_abs=%g" % metrics["p99_abs"])
        print("metric_num_bad=%d" % metrics["num_bad"])
        print("metric_frac_bad=%g" % metrics["frac_bad"])
        print("metric_max_ulp=%d" % metrics["max_ulp"])
        print("metric_mean_ulp=%g" % metrics["mean_ulp"])
        print("metric_count=%d" % metrics["count"])
        print("metric_size_bytes=%d" % metrics["size_bytes"])
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
