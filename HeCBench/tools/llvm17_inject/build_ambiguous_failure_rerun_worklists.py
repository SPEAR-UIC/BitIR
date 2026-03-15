#!/usr/bin/env python3
import csv
import os
from collections import defaultdict


ROOT = os.path.join("HeCBench", "results")
SOURCE_SUBDIR = "llvm17_inject"
RERUN_SUBDIR = "llvm17_inject_failure_rerun"
AMBIGUOUS_EXIT_CODES = {"1", "255"}
PHASE_TO_WORKLIST = {
    "float": "worklist_sycl_aligned.csv",
    "operand": "worklist_operand_sycl_aligned.csv",
    "pointer": "worklist_pointer_sycl_aligned.csv",
}


def read_csv_rows(path):
    with open(path, newline="") as fh:
        return list(csv.DictReader(fh))


def ensure_dir(path):
    os.makedirs(path, exist_ok=True)


def main():
    source_root = os.path.join(ROOT, SOURCE_SUBDIR)
    rerun_root = os.path.join(ROOT, RERUN_SUBDIR)
    emitted = []

    for bench in sorted(os.listdir(source_root)):
        bench_dir = os.path.join(source_root, bench)
        if not os.path.isdir(bench_dir) or bench.endswith("-sycl"):
            continue
        for phase, wl_name in PHASE_TO_WORKLIST.items():
            summary_path = os.path.join(bench_dir, phase, "summary.csv")
            if not os.path.isfile(summary_path):
                continue

            wanted_pairs = set()
            for row in read_csv_rows(summary_path):
                if row.get("result") == "FAILURE" and row.get("exit_code") in AMBIGUOUS_EXIT_CODES:
                    wanted_pairs.add((row["site_id"], row["bit_index"]))
            if not wanted_pairs:
                continue

            aligned_path = os.path.join(source_root, f"{bench}-sycl", wl_name)
            if not os.path.isfile(aligned_path):
                raise FileNotFoundError(aligned_path)

            aligned_rows = read_csv_rows(aligned_path)
            selected = [row for row in aligned_rows if (row.get("site_id"), row.get("bit_index")) in wanted_pairs]
            selected.sort(key=lambda r: (int(r["site_id"]), int(r["bit_index"])))
            if not selected:
                continue

            out_dir = os.path.join(rerun_root, bench, phase)
            ensure_dir(out_dir)
            out_path = os.path.join(out_dir, "worklist_ambiguous_failures.csv")
            head_path = os.path.join(out_dir, "worklist_ambiguous_failures_head16.csv")

            fieldnames = list(selected[0].keys())
            with open(out_path, "w", newline="") as fh:
                writer = csv.DictWriter(fh, fieldnames=fieldnames)
                writer.writeheader()
                for index, row in enumerate(selected, start=1):
                    row = dict(row)
                    if "index" in row:
                        row["index"] = str(index)
                    writer.writerow(row)

            with open(head_path, "w", newline="") as fh:
                writer = csv.DictWriter(fh, fieldnames=fieldnames)
                writer.writeheader()
                for index, row in enumerate(selected[:16], start=1):
                    row = dict(row)
                    if "index" in row:
                        row["index"] = str(index)
                    writer.writerow(row)

            emitted.append((bench, phase, len(selected), out_path, head_path))

    manifest_path = os.path.join(rerun_root, "ambiguous_failure_rerun_manifest.csv")
    ensure_dir(rerun_root)
    with open(manifest_path, "w", newline="") as fh:
        writer = csv.writer(fh)
        writer.writerow(["bench", "phase", "pairs", "worklist", "debug_worklist"])
        for row in emitted:
            writer.writerow(row)

    for bench, phase, count, out_path, head_path in emitted:
        print(f"{bench}/{phase}: pairs={count} worklist={out_path} debug={head_path}")
    print(f"manifest={manifest_path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
