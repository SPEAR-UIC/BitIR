#!/usr/bin/env python3
import argparse
import csv
import os
from collections import defaultdict, deque
from difflib import SequenceMatcher
from pathlib import Path


def read_sites(path, operand_index_default=-1):
    rows = []
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
            operand_index = row.get("operand_index", "").strip()
            if operand_index == "":
                op_idx = operand_index_default
            else:
                try:
                    op_idx = int(operand_index)
                except ValueError:
                    op_idx = operand_index_default
            rows.append(
                {
                    "site_id": site_id,
                    "opcode": opcode,
                    "type_kind": kind,
                    "bitwidth": bitwidth,
                    "operand_index": op_idx,
                }
            )
    return rows


def read_sites_from_worklist(path):
    rows = []
    seen = set()
    with path.open(newline="", encoding="utf-8") as fh:
        reader = csv.DictReader(fh)
        for row in reader:
            try:
                site_id = int(row.get("site_id", "").strip())
            except ValueError:
                continue
            if site_id in seen:
                continue
            seen.add(site_id)
            opcode = row.get("opcode", "").strip()
            kind = row.get("type_kind", "").strip()
            try:
                bitwidth = int(row.get("bitwidth", "").strip())
            except ValueError:
                bitwidth = 0
            rows.append(
                {
                    "site_id": site_id,
                    "opcode": opcode,
                    "type_kind": kind,
                    "bitwidth": bitwidth,
                    "operand_index": -1,
                }
            )
    return rows


def signature(row):
    return (
        row["opcode"],
        row["type_kind"],
        row["bitwidth"],
        row["operand_index"],
    )


def signature_no_operand(row):
    return (
        row["opcode"],
        row["type_kind"],
        row["bitwidth"],
    )


def signature_no_bitwidth(row):
    return (
        row["opcode"],
        row["type_kind"],
    )


def align_sequences(nvidia_rows, sycl_rows):
    nvidia_seq = [signature(r) for r in nvidia_rows]
    sycl_seq = [signature(r) for r in sycl_rows]
    matcher = SequenceMatcher(a=nvidia_seq, b=sycl_seq, autojunk=False)
    mapping = []
    for a0, b0, size in matcher.get_matching_blocks():
        for i in range(size):
            n_row = nvidia_rows[a0 + i]
            s_row = sycl_rows[b0 + i]
            mapping.append((n_row, s_row))
    return [(n, s, "sequence") for n, s in mapping]


def align_tiered(nvidia_rows, sycl_rows):
    by_sig = defaultdict(deque)
    by_sig_no_op = defaultdict(deque)
    by_sig_no_bw = defaultdict(deque)

    for row in sycl_rows:
        by_sig[signature(row)].append(row)
        by_sig_no_op[signature_no_operand(row)].append(row)
        by_sig_no_bw[signature_no_bitwidth(row)].append(row)

    mapped_sycl_ids = set()
    mapping = []

    def pop_first(queue_map, key):
        dq = queue_map.get(key)
        while dq:
            row = dq.popleft()
            if row["site_id"] in mapped_sycl_ids:
                continue
            return row
        return None

    for n_row in nvidia_rows:
        s_row = pop_first(by_sig, signature(n_row))
        if s_row:
            mapped_sycl_ids.add(s_row["site_id"])
            mapping.append((n_row, s_row, "exact"))
            continue
        s_row = pop_first(by_sig_no_op, signature_no_operand(n_row))
        if s_row:
            mapped_sycl_ids.add(s_row["site_id"])
            mapping.append((n_row, s_row, "no_operand"))
            continue
        s_row = pop_first(by_sig_no_bw, signature_no_bitwidth(n_row))
        if s_row:
            mapped_sycl_ids.add(s_row["site_id"])
            mapping.append((n_row, s_row, "no_bitwidth"))
            continue

    return mapping


def write_alignment(out_path, mapping):
    out_path.parent.mkdir(parents=True, exist_ok=True)
    with out_path.open("w", newline="", encoding="utf-8") as fh:
        writer = csv.writer(fh)
        writer.writerow(
            [
                "nvidia_site_id",
                "sycl_site_id",
                "match_tier",
                "opcode",
                "type_kind",
                "bitwidth",
                "operand_index",
            ]
        )
        for n_row, s_row, tier in mapping:
            writer.writerow(
                [
                    n_row["site_id"],
                    s_row["site_id"],
                    tier,
                    n_row["opcode"],
                    n_row["type_kind"],
                    n_row["bitwidth"],
                    n_row["operand_index"],
                ]
            )


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--bench", required=True)
    parser.add_argument("--target", choices=["result", "operand", "pointer"], default="result")
    parser.add_argument(
        "--nvidia-root",
        default="HeCBench/results/llvm17_inject",
    )
    parser.add_argument(
        "--sycl-root",
        default="HeCBench/results/llvm17_inject",
    )
    parser.add_argument(
        "--out-dir",
        default="HeCBench/results/llvm17_inject/alignments",
    )
    parser.add_argument(
        "--mode",
        choices=["tiered", "sequence"],
        default="tiered",
    )
    args = parser.parse_args()

    bench = args.bench
    nvidia_dir = Path(args.nvidia_root) / bench
    sycl_dir = Path(args.sycl_root) / f"{bench}-sycl"
    if not nvidia_dir.exists():
        print(f"missing NVIDIA dir: {nvidia_dir}")
        return 2
    if not sycl_dir.exists():
        print(f"missing SYCL dir: {sycl_dir}")
        return 2

    if args.target == "result":
        nvidia_sites = nvidia_dir / "sites.csv"
        if nvidia_sites.exists():
            n_rows = read_sites(nvidia_sites)
        else:
            worklist = nvidia_dir / "worklist.csv"
            if not worklist.exists():
                print(f"missing NVIDIA worklist: {worklist}")
                return 2
            n_rows = read_sites_from_worklist(worklist)
        sycl_sites = sycl_dir / "sites.csv"
        s_rows = read_sites(sycl_sites)
    else:
        suffix = "operand" if args.target == "operand" else "pointer"
        n_rows = read_sites(nvidia_dir / f"sites_{suffix}.csv")
        s_rows = read_sites(sycl_dir / f"sites_{suffix}.csv")

    if args.mode == "sequence":
        mapping = align_sequences(n_rows, s_rows)
    else:
        mapping = align_tiered(n_rows, s_rows)
    out_path = Path(args.out_dir) / bench / f"align_{args.target}.csv"
    write_alignment(out_path, mapping)

    n_ids = {r["site_id"] for r in n_rows}
    s_ids = {r["site_id"] for r in s_rows}
    mapped_n = {n["site_id"] for n, _, _ in mapping}
    mapped_s = {s["site_id"] for _, s, _ in mapping}
    print(
        f"{bench} {args.target} ({args.mode}): "
        f"NVIDIA={len(n_rows)} SYCL={len(s_rows)} "
        f"matched={len(mapping)} "
        f"nvidia_unmatched={len(n_ids - mapped_n)} "
        f"sycl_unmatched={len(s_ids - mapped_s)} "
        f"-> {out_path}"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
