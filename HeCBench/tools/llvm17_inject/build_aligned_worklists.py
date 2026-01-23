#!/usr/bin/env python3
import argparse
import csv
from pathlib import Path


def read_mapping(path):
    mapping = []
    with path.open(newline="", encoding="utf-8") as fh:
        reader = csv.DictReader(fh)
        for row in reader:
            try:
                nvidia_site = int(row["nvidia_site_id"])
                sycl_site = int(row["sycl_site_id"])
            except (KeyError, ValueError):
                continue
            mapping.append((nvidia_site, sycl_site))
    return mapping


def read_sites(path):
    rows = {}
    with path.open(newline="", encoding="utf-8") as fh:
        reader = csv.DictReader(fh)
        for row in reader:
            try:
                site_id = int(row.get("site_id", "").strip())
            except ValueError:
                continue
            opcode = row.get("opcode", "").strip()
            kind = row.get("type_kind", "").strip()
            try:
                bitwidth = int(row.get("bitwidth", "").strip())
            except ValueError:
                bitwidth = 0
            rows[site_id] = {
                "site_id": site_id,
                "opcode": opcode,
                "type_kind": kind,
                "bitwidth": bitwidth,
            }
    return rows


def read_worklist(path):
    rows = []
    with path.open(newline="", encoding="utf-8") as fh:
        reader = csv.DictReader(fh)
        for row in reader:
            rows.append(row)
    return rows


def write_worklist(path, rows):
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="", encoding="utf-8") as fh:
        writer = csv.DictWriter(
            fh,
            fieldnames=["index", "site_id", "bit_index", "bitwidth", "type_kind", "opcode"],
        )
        writer.writeheader()
        for row in rows:
            writer.writerow(row)


def filter_nvidia_worklist(worklist_rows, allowed_sites):
    out = []
    index = 0
    for row in worklist_rows:
        try:
            site_id = int(row.get("site_id", "").strip())
        except ValueError:
            continue
        if site_id not in allowed_sites:
            continue
        index += 1
        out.append(
            {
                "index": index,
                "site_id": site_id,
                "bit_index": row.get("bit_index", ""),
                "bitwidth": row.get("bitwidth", ""),
                "type_kind": row.get("type_kind", ""),
                "opcode": row.get("opcode", ""),
            }
        )
    return out


def build_sycl_worklist(sycl_sites, allowed_sites):
    out = []
    index = 0
    for site_id in sorted(allowed_sites):
        site = sycl_sites.get(site_id)
        if not site:
            continue
        bitwidth = site["bitwidth"]
        if bitwidth <= 0:
            continue
        for bit in range(bitwidth):
            index += 1
            out.append(
                {
                    "index": index,
                    "site_id": site_id,
                    "bit_index": bit,
                    "bitwidth": bitwidth,
                    "type_kind": site["type_kind"],
                    "opcode": site["opcode"],
                }
            )
    return out


def target_suffix(target):
    if target == "result":
        return ""
    return f"_{target}"


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--bench", required=True)
    parser.add_argument("--target", choices=["result", "operand", "pointer"], default="result")
    parser.add_argument(
        "--align-root",
        default="HeCBench/results/llvm17_inject/alignments",
    )
    parser.add_argument(
        "--results-root",
        default="HeCBench/results/llvm17_inject",
    )
    args = parser.parse_args()

    suffix = target_suffix(args.target)
    align_path = Path(args.align_root) / args.bench / f"align_{args.target}.csv"
    if not align_path.exists():
        print(f"missing alignment file: {align_path}")
        return 2

    mapping = read_mapping(align_path)
    nvidia_sites = {n for n, _ in mapping}
    sycl_sites = {s for _, s in mapping}

    results_root = Path(args.results_root)
    nvidia_dir = results_root / args.bench
    sycl_dir = results_root / f"{args.bench}-sycl"

    nvidia_worklist = nvidia_dir / f"worklist{suffix}.csv"
    if not nvidia_worklist.exists():
        print(f"missing NVIDIA worklist: {nvidia_worklist}")
        return 2

    nvidia_rows = read_worklist(nvidia_worklist)
    nvidia_aligned = filter_nvidia_worklist(nvidia_rows, nvidia_sites)
    nvidia_out = nvidia_dir / f"worklist{suffix}_aligned.csv"
    write_worklist(nvidia_out, nvidia_aligned)

    sycl_sites_path = sycl_dir / f"sites{suffix}.csv"
    if not sycl_sites_path.exists():
        print(f"missing SYCL sites: {sycl_sites_path}")
        return 2
    sycl_sites_rows = read_sites(sycl_sites_path)
    sycl_aligned = build_sycl_worklist(sycl_sites_rows, sycl_sites)
    sycl_out = sycl_dir / f"worklist{suffix}_aligned.csv"
    write_worklist(sycl_out, sycl_aligned)

    print(
        f"{args.bench} {args.target}: "
        f"NVIDIA_aligned={len(nvidia_aligned)} SYCL_aligned={len(sycl_aligned)}"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
