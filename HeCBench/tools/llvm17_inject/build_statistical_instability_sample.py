#!/usr/bin/env python3
import argparse
import csv
import math
import os
import random
from collections import defaultdict


ROOT = os.path.join("HeCBench", "results", "llvm17_inject")
DEFAULT_OUT_ROOT = os.path.join("HeCBench", "results", "llvm17_inject_statistical_stability")
DEFAULT_SAMPLE_SIZE = 1200
DEFAULT_ROUNDS = 3
DEFAULT_MIN_PER_STRATUM = 25
DEFAULT_SEED = 20260314
PHASE_TO_WL = {
    "float": "worklist_sycl_aligned.csv",
    "operand": "worklist_operand_sycl_aligned.csv",
    "pointer": "worklist_pointer_sycl_aligned.csv",
}
VALID_PHASES = {"float", "operand", "pointer"}
VALID_RESULTS = {"MASKED", "SDC", "DUE"}


def parse_args():
    p = argparse.ArgumentParser()
    p.add_argument("--out-root", default=DEFAULT_OUT_ROOT)
    p.add_argument("--sample-size", type=int, default=DEFAULT_SAMPLE_SIZE)
    p.add_argument("--rounds", type=int, default=DEFAULT_ROUNDS)
    p.add_argument("--min-per-stratum", type=int, default=DEFAULT_MIN_PER_STRATUM)
    p.add_argument("--seed", type=int, default=DEFAULT_SEED)
    return p.parse_args()


def read_csv(path):
    with open(path, newline="") as fh:
        return list(csv.DictReader(fh))


def ensure_dir(path):
    os.makedirs(path, exist_ok=True)


def compare_mode_for(bench, phase):
    if bench == "colorwheel":
        return "float"
    if bench == "jacobi" and phase == "float":
        return "float"
    return "exact"


def largest_remainder_alloc(weights, total, mins):
    keys = list(weights)
    alloc = {k: mins.get(k, 0) for k in keys}
    remaining = total - sum(alloc.values())
    if remaining < 0:
        raise ValueError("sample_size smaller than minimum allocation")
    weight_sum = sum(weights.values())
    if remaining == 0 or weight_sum == 0:
        return alloc
    exact = {k: remaining * (weights[k] / weight_sum) for k in keys}
    floor = {k: math.floor(v) for k, v in exact.items()}
    for k, v in floor.items():
        alloc[k] += v
    leftover = remaining - sum(floor.values())
    order = sorted(keys, key=lambda k: (- (exact[k] - floor[k]), k))
    for k in order[:leftover]:
        alloc[k] += 1
    return alloc


def main():
    args = parse_args()
    out_root = args.out_root
    sample_size = args.sample_size
    rounds = args.rounds
    min_per = args.min_per_stratum
    seed = args.seed

    ensure_dir(out_root)

    aligned_lookup = {}
    for bench_dir in sorted(os.listdir(ROOT)):
        if bench_dir.endswith("-sycl"):
            continue
        bench_path = os.path.join(ROOT, bench_dir)
        if not os.path.isdir(bench_path):
            continue
        sycl_dir = os.path.join(ROOT, f"{bench_dir}-sycl")
        if not os.path.isdir(sycl_dir):
            continue
        for phase, wl_name in PHASE_TO_WL.items():
            aligned_wl = os.path.join(sycl_dir, wl_name)
            if not os.path.exists(aligned_wl):
                continue
            aligned_lookup[(bench_dir, phase)] = {
                (r["site_id"], r["bit_index"]): r for r in read_csv(aligned_wl)
            }

    strata = defaultdict(list)
    population_rows = []
    for bench in sorted(os.listdir(ROOT)):
        if bench.endswith("-sycl"):
            continue
        bench_path = os.path.join(ROOT, bench)
        if not os.path.isdir(bench_path):
            continue
        for phase in sorted(os.listdir(bench_path)):
            if phase not in VALID_PHASES:
                continue
            summary_path = os.path.join(bench_path, phase, "summary.csv")
            if not os.path.exists(summary_path):
                continue
            aligned_rows = aligned_lookup.get((bench, phase), {})
            if not aligned_rows:
                continue
            for row in read_csv(summary_path):
                result = row.get("result", "")
                key = (row.get("site_id", ""), row.get("bit_index", ""))
                if result not in VALID_RESULTS:
                    continue
                if key not in aligned_rows:
                    continue
                rec = {
                    "bench": bench,
                    "phase": phase,
                    "site_id": row["site_id"],
                    "bit_index": row["bit_index"],
                    "original_result": result,
                    "original_exit_code": row.get("exit_code", ""),
                }
                strata[(bench, phase)].append(rec)
                population_rows.append(rec)

    if not population_rows:
        raise SystemExit("no eligible population rows found")

    mins = {k: min(min_per, len(v)) for k, v in strata.items()}
    min_total = sum(mins.values())
    if sample_size < min_total:
        raise SystemExit(f"sample_size={sample_size} smaller than min allocation total={min_total}")

    weights = {k: len(v) for k, v in strata.items()}
    alloc = largest_remainder_alloc(weights, sample_size, mins)
    for k, v in alloc.items():
        if v > len(strata[k]):
            alloc[k] = len(strata[k])

    manifest_rows = []
    all_chosen = []
    design_path = os.path.join(out_root, "sampling_design.csv")
    with open(design_path, "w", newline="") as fh:
        w = csv.DictWriter(
            fh,
            fieldnames=["bench", "phase", "population", "per_round_sample", "sampling_weight"],
        )
        w.writeheader()
        for (bench, phase), rows in sorted(strata.items()):
            n = alloc[(bench, phase)]
            weight = (len(rows) / n) if n else 0.0
            w.writerow(
                {
                    "bench": bench,
                    "phase": phase,
                    "population": len(rows),
                    "per_round_sample": n,
                    "sampling_weight": f"{weight:.6f}",
                }
            )

    for round_idx in range(1, rounds + 1):
        rng = random.Random(seed + round_idx)
        round_root = os.path.join(out_root, f"round{round_idx}")
        ensure_dir(round_root)
        round_manifest = os.path.join(round_root, f"manifest_round{round_idx}.csv")
        round_pairs = os.path.join(round_root, f"pairs_round{round_idx}.csv")
        round_manifest_rows = []
        round_chosen = []

        for (bench, phase), rows in sorted(strata.items()):
            n = alloc[(bench, phase)]
            if n == 0:
                continue
            chosen = rng.sample(rows, n)
            aligned_rows = aligned_lookup[(bench, phase)]
            out_dir = os.path.join(round_root, bench, phase)
            ensure_dir(out_dir)
            out_wl = os.path.join(out_dir, "worklist_statistical_sample.csv")
            fieldnames = list(next(iter(aligned_rows.values())).keys())
            with open(out_wl, "w", newline="") as fh:
                w = csv.DictWriter(fh, fieldnames=fieldnames)
                w.writeheader()
                for idx, row in enumerate(sorted(chosen, key=lambda r: (int(r["site_id"]), int(r["bit_index"]))), start=1):
                    base = dict(aligned_rows[(row["site_id"], row["bit_index"])])
                    if "index" in base:
                        base["index"] = str(idx)
                    w.writerow(base)
            round_manifest_rows.append(
                {
                    "bench": bench,
                    "phase": phase,
                    "pairs": str(len(chosen)),
                    "compare_mode": compare_mode_for(bench, phase),
                    "worklist": out_wl,
                }
            )
            for row in chosen:
                tagged = dict(row)
                tagged["round"] = str(round_idx)
                round_chosen.append(tagged)
                all_chosen.append(tagged)

        with open(round_manifest, "w", newline="") as fh:
            w = csv.DictWriter(fh, fieldnames=["bench", "phase", "pairs", "compare_mode", "worklist"])
            w.writeheader()
            for row in round_manifest_rows:
                w.writerow(row)

        with open(round_pairs, "w", newline="") as fh:
            w = csv.DictWriter(
                fh,
                fieldnames=["round", "bench", "phase", "site_id", "bit_index", "original_result", "original_exit_code"],
            )
            w.writeheader()
            for row in sorted(round_chosen, key=lambda r: (r["bench"], r["phase"], int(r["site_id"]), int(r["bit_index"]))):
                w.writerow(row)

        manifest_rows.extend({"round": round_idx, **row} for row in round_manifest_rows)

    campaign_manifest = os.path.join(out_root, "campaign_manifest.csv")
    with open(campaign_manifest, "w", newline="") as fh:
        w = csv.DictWriter(fh, fieldnames=["bench", "phase", "pairs", "compare_mode", "worklist"])
        w.writeheader()
        for row in manifest_rows:
            w.writerow({k: row[k] for k in ["bench", "phase", "pairs", "compare_mode", "worklist"]})

    all_pairs = os.path.join(out_root, "all_sampled_pairs.csv")
    with open(all_pairs, "w", newline="") as fh:
        w = csv.DictWriter(
            fh,
            fieldnames=["round", "bench", "phase", "site_id", "bit_index", "original_result", "original_exit_code"],
        )
        w.writeheader()
        for row in sorted(
            all_chosen,
            key=lambda r: (int(r["round"]), r["bench"], r["phase"], int(r["site_id"]), int(r["bit_index"])),
        ):
            w.writerow(row)

    print(f"population={len(population_rows)}")
    print(f"sample_size_per_round={sample_size}")
    print(f"rounds={rounds}")
    for (bench, phase), rows in sorted(strata.items()):
        print(
            f"{bench},{phase},population={len(rows)},per_round_sample={alloc[(bench, phase)]}"
        )
    print(f"campaign_manifest={campaign_manifest}")
    print(f"design={design_path}")
    print(f"pairs={all_pairs}")


if __name__ == "__main__":
    main()
