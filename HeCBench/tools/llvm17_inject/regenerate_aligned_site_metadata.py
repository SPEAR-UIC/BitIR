#!/usr/bin/env python3
import argparse
import csv
import os
import subprocess
from pathlib import Path


BENCHES = [
    "matrix-rotate",
    "jacobi",
    "layout",
    "dense-embedding",
    "pathfinder",
    "bsearch",
    "entropy",
    "randomAccess",
]

TARGETS = [
    ("result", "", "base"),
    ("operand", "_operand", "operand"),
    ("pointer", "_pointer", "pointer"),
]


def run_cmd(cmd, env=None):
    proc = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, env=env)
    out = proc.stdout.decode("utf-8", errors="replace") if proc.stdout else ""
    if proc.returncode != 0:
        raise RuntimeError(f"command failed ({proc.returncode}): {' '.join(cmd)}\n{out}")
    return out


def builder_for(bench):
    if bench == "matrix-rotate":
        return "HeCBench/tools/llvm17_inject/build_matrix_rotate_worklist.py", []
    return "HeCBench/tools/llvm17_inject/build_bench_worklist.py", ["--bench", bench]


def read_aligned_site_ids(path):
    site_ids = []
    seen = set()
    with open(path, newline="", encoding="utf-8") as fh:
        reader = csv.DictReader(fh)
        for row in reader:
            try:
                site_id = int(row["site_id"])
            except Exception:
                continue
            if site_id in seen:
                continue
            seen.add(site_id)
            site_ids.append(site_id)
    return site_ids


def read_metadata_rows(path):
    rows = {}
    with open(path, newline="", encoding="utf-8") as fh:
        reader = csv.DictReader(fh)
        for row in reader:
            try:
                site_id = int(row["site_id"])
            except Exception:
                continue
            rows[site_id] = row
    return rows


def write_filtered_metadata(out_path, site_ids, metadata_rows):
    fieldnames = [
        "site_id",
        "site_class",
        "opcode",
        "type_kind",
        "bitwidth",
        "operand_index",
        "function",
        "source_file",
        "source_line",
        "source_column",
        "signature_ordinal",
        "semantic_key",
    ]
    out_path.parent.mkdir(parents=True, exist_ok=True)
    with out_path.open("w", newline="", encoding="utf-8") as fh:
        writer = csv.DictWriter(fh, fieldnames=fieldnames)
        writer.writeheader()
        for site_id in site_ids:
            row = metadata_rows.get(site_id)
            if not row:
                continue
            writer.writerow({k: row.get(k, "") for k in fieldnames})


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--repo-root", default=".")
    parser.add_argument("--benches", default=",".join(BENCHES))
    args = parser.parse_args()

    repo_root = Path(args.repo_root).resolve()
    benches = [b.strip() for b in args.benches.split(",") if b.strip()]

    build_env = os.environ.copy()
    build_env["FORCE_REBUILD"] = "1"
    run_cmd(["bash", str(repo_root / "HeCBench/tools/llvm17_inject/build.sh")], env=build_env)

    for bench in benches:
        script_rel, extra_args = builder_for(bench)
        for target, suffix, _site_class in TARGETS:
            meta_rel = f"HeCBench/results/llvm17_inject/{bench}/sites{suffix}_metadata.csv"
            cmd = [
                "python3",
                str(repo_root / script_rel),
                *extra_args,
                "--target",
                target,
                "--metadata-only",
                "--sites-rich",
                meta_rel,
            ]
            run_cmd(cmd, env=os.environ.copy())

            aligned_wl = repo_root / f"HeCBench/results/llvm17_inject/{bench}/worklist{suffix}_aligned.csv"
            meta_csv = repo_root / meta_rel
            out_csv = repo_root / f"HeCBench/results/llvm17_inject/{bench}/sites{suffix}_sycl_aligned_metadata.csv"
            if not aligned_wl.exists():
                raise RuntimeError(f"missing aligned worklist: {aligned_wl}")
            if not meta_csv.exists():
                raise RuntimeError(f"missing metadata csv: {meta_csv}")
            site_ids = read_aligned_site_ids(aligned_wl)
            metadata_rows = read_metadata_rows(meta_csv)
            write_filtered_metadata(out_csv, site_ids, metadata_rows)
            print(f"{bench} {target}: wrote {out_csv}")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
