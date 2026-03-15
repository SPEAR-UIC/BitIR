#!/usr/bin/env python3
import csv
import glob
import os
from collections import defaultdict


SOURCE_ROOT = os.path.join("HeCBench", "results", "llvm17_inject")
RERUN_ROOT = os.path.join("HeCBench", "results", "llvm17_inject_failure_rerun")
NEXT_ROOT = os.path.join("HeCBench", "results", "llvm17_inject_failure_resample_next")
PHASE_TO_WL = {
    "float": "worklist_sycl_aligned.csv",
    "operand": "worklist_operand_sycl_aligned.csv",
    "pointer": "worklist_pointer_sycl_aligned.csv",
}
TARGETS = {
    ("FAILURE", "1"),
    ("FAILURE", "255"),
    ("FAILURE", "0"),
    ("FAILURE", "missing_out"),
}


def read_csv_rows(path):
    with open(path, newline="") as fh:
        return list(csv.DictReader(fh))


def ensure_dir(path):
    os.makedirs(path, exist_ok=True)


def main():
    emitted = []
    completed_reruns = defaultdict(set)
    for p in glob.glob(os.path.join(RERUN_ROOT, "*", "*", "summary_node*_gpu*.csv")):
        parts = p.split(os.sep)
        bench, phase = parts[-3], parts[-2]
        for row in read_csv_rows(p):
            completed_reruns[(bench, phase)].add((row["site_id"], row["bit_index"]))

    for bench in sorted(os.listdir(SOURCE_ROOT)):
        bench_dir = os.path.join(SOURCE_ROOT, bench)
        if not os.path.isdir(bench_dir) or bench.endswith("-sycl"):
            continue
        for phase, wl_name in PHASE_TO_WL.items():
            summary_path = os.path.join(bench_dir, phase, "summary.csv")
            if not os.path.isfile(summary_path):
                continue
            wanted = set()
            for row in read_csv_rows(summary_path):
                if (row.get("result"), row.get("exit_code")) in TARGETS:
                    pair = (row["site_id"], row["bit_index"])
                    if pair not in completed_reruns[(bench, phase)]:
                        wanted.add(pair)
            if not wanted:
                continue
            aligned_path = os.path.join(SOURCE_ROOT, f"{bench}-sycl", wl_name)
            if not os.path.isfile(aligned_path):
                continue
            aligned_rows = [row for row in read_csv_rows(aligned_path) if (row["site_id"], row["bit_index"]) in wanted]
            aligned_rows.sort(key=lambda r: (int(r["site_id"]), int(r["bit_index"])))
            if not aligned_rows:
                continue
            out_dir = os.path.join(NEXT_ROOT, bench, phase)
            ensure_dir(out_dir)
            wl_out = os.path.join(out_dir, "worklist_remaining_legacy_failures.csv")
            with open(wl_out, "w", newline="") as fh:
                w = csv.DictWriter(fh, fieldnames=list(aligned_rows[0].keys()))
                w.writeheader()
                for idx, row in enumerate(aligned_rows, start=1):
                    row = dict(row)
                    if "index" in row:
                        row["index"] = str(idx)
                    w.writerow(row)
            emitted.append((bench, phase, len(aligned_rows), wl_out))

    manifest = os.path.join(NEXT_ROOT, "remaining_legacy_failure_resample_manifest.csv")
    ensure_dir(NEXT_ROOT)
    with open(manifest, "w", newline="") as fh:
        w = csv.writer(fh)
        w.writerow(["bench", "phase", "pairs", "worklist"])
        for row in emitted:
            w.writerow(row)
    for row in emitted:
        print(",".join(map(str, row)))
    print(f"manifest={manifest}")


if __name__ == "__main__":
    main()
