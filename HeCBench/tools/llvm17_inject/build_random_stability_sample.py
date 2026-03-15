#!/usr/bin/env python3
import argparse
import csv
import glob
import os
import random
from collections import defaultdict


ROOT = os.path.join("HeCBench", "results", "llvm17_inject")
DEFAULT_OUT_ROOT = os.path.join("HeCBench", "results", "llvm17_inject_stability_sample")
DEFAULT_SAMPLE_SIZE = 100
DEFAULT_SEED = 20260312
PHASE_TO_WL = {
    "float": "worklist_sycl_aligned.csv",
    "operand": "worklist_operand_sycl_aligned.csv",
    "pointer": "worklist_pointer_sycl_aligned.csv",
}


def compare_mode_for(bench, phase):
    if bench == "colorwheel":
        return "float"
    if bench == "jacobi" and phase == "float":
        return "float"
    return "exact"


def read_csv(path):
    with open(path, newline="") as fh:
        return list(csv.DictReader(fh))


def ensure_dir(path):
    os.makedirs(path, exist_ok=True)


def parse_args():
    p = argparse.ArgumentParser()
    p.add_argument("--out-root", default=DEFAULT_OUT_ROOT)
    p.add_argument("--sample-size", type=int, default=DEFAULT_SAMPLE_SIZE)
    p.add_argument("--seed", type=int, default=DEFAULT_SEED)
    return p.parse_args()


def main():
    args = parse_args()
    out_root = args.out_root
    sample_size = args.sample_size
    seed = args.seed
    rng = random.Random(seed)
    aligned_lookup = {}
    for phase, wl_name in PHASE_TO_WL.items():
        for aligned_wl in glob.glob(os.path.join(ROOT, f"*-sycl", wl_name)):
            parts = aligned_wl.split(os.sep)
            bench = parts[-2][:-5]
            aligned_lookup[(bench, phase)] = {
                (r["site_id"], r["bit_index"]): r for r in read_csv(aligned_wl)
            }

    population = []
    for summary_path in glob.glob(os.path.join(ROOT, "*", "*", "summary.csv")):
        parts = summary_path.split(os.sep)
        bench, phase = parts[-3], parts[-2]
        if bench.endswith("-sycl"):
            continue
        aligned_rows = aligned_lookup.get((bench, phase), {})
        if not aligned_rows:
            continue
        for row in read_csv(summary_path):
            if row.get("result") not in ("MASKED", "SDC"):
                continue
            if (row["site_id"], row["bit_index"]) not in aligned_rows:
                continue
            population.append(
                {
                    "bench": bench,
                    "phase": phase,
                    "site_id": row["site_id"],
                    "bit_index": row["bit_index"],
                    "original_result": row["result"],
                    "original_exit_code": row.get("exit_code", ""),
                }
            )

    if len(population) < sample_size:
        raise SystemExit(f"population too small: {len(population)}")

    chosen = rng.sample(population, sample_size)
    grouped = defaultdict(list)
    for row in chosen:
        grouped[(row["bench"], row["phase"])].append(row)

    manifest_rows = []
    for (bench, phase), rows in sorted(grouped.items()):
        wl_name = PHASE_TO_WL[phase]
        aligned_rows = aligned_lookup[(bench, phase)]
        out_dir = os.path.join(out_root, bench, phase)
        ensure_dir(out_dir)
        out_wl = os.path.join(out_dir, "worklist_random_sample.csv")
        fieldnames = list(next(iter(aligned_rows.values())).keys())
        with open(out_wl, "w", newline="") as fh:
            w = csv.DictWriter(fh, fieldnames=fieldnames)
            w.writeheader()
            for idx, row in enumerate(sorted(rows, key=lambda r: (int(r["site_id"]), int(r["bit_index"]))), start=1):
                base = dict(aligned_rows[(row["site_id"], row["bit_index"])])
                if "index" in base:
                    base["index"] = str(idx)
                w.writerow(base)
        manifest_rows.append(
            {
                "bench": bench,
                "phase": phase,
                "pairs": str(len(rows)),
                "compare_mode": compare_mode_for(bench, phase),
                "worklist": out_wl,
            }
        )

    ensure_dir(out_root)
    manifest = os.path.join(out_root, "random100_manifest.csv")
    with open(manifest, "w", newline="") as fh:
        w = csv.DictWriter(fh, fieldnames=["bench", "phase", "pairs", "compare_mode", "worklist"])
        w.writeheader()
        for row in manifest_rows:
            w.writerow(row)

    sample_csv = os.path.join(out_root, "random100_pairs.csv")
    with open(sample_csv, "w", newline="") as fh:
        w = csv.DictWriter(
            fh,
            fieldnames=["bench", "phase", "site_id", "bit_index", "original_result", "original_exit_code"],
        )
        w.writeheader()
        for row in sorted(chosen, key=lambda r: (r["bench"], r["phase"], int(r["site_id"]), int(r["bit_index"]))):
            w.writerow(row)

    print(f"population={len(population)} sample={sample_size} seed={seed}")
    for row in manifest_rows:
        print(f"{row['bench']},{row['phase']},{row['pairs']},{row['compare_mode']},{row['worklist']}")
    print(f"manifest={manifest}")
    print(f"pairs={sample_csv}")


if __name__ == "__main__":
    main()
