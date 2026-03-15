#!/usr/bin/env python3
import argparse
import csv
import os
from collections import Counter, defaultdict
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
    ("result", "", "sites_metadata.csv", "worklist_aligned.csv", "worklist_sycl_aligned.csv"),
    (
        "operand",
        "_operand",
        "sites_operand_metadata.csv",
        "worklist_operand_aligned.csv",
        "worklist_operand_sycl_aligned.csv",
    ),
    (
        "pointer",
        "_pointer",
        "sites_pointer_metadata.csv",
        "worklist_pointer_aligned.csv",
        "worklist_pointer_sycl_aligned.csv",
    ),
]


def read_csv_rows(path):
    with open(path, newline="", encoding="utf-8") as fh:
        return list(csv.DictReader(fh))


def int_field(row, key, default=-1):
    try:
        return int(str(row.get(key, "")).strip())
    except Exception:
        return default


def normalize_row(row):
    return {
        "site_id": int_field(row, "site_id"),
        "site_class": (row.get("site_class", "") or "").strip(),
        "opcode": (row.get("opcode", "") or "").strip(),
        "type_kind": (row.get("type_kind", "") or "").strip(),
        "bitwidth": int_field(row, "bitwidth", 0),
        "operand_index": int_field(row, "operand_index", -1),
        "function": (row.get("function", "") or "").strip(),
        "source_file": (row.get("source_file", "") or "").strip(),
        "source_line": int_field(row, "source_line", 0),
        "source_column": int_field(row, "source_column", 0),
        "signature_ordinal": int_field(row, "signature_ordinal", 0),
        "semantic_key": (row.get("semantic_key", "") or "").strip(),
    }


def exact_key(r):
    return (
        r["site_class"],
        r["opcode"],
        r["type_kind"],
        r["bitwidth"],
        r["operand_index"],
        r["function"],
        r["source_file"],
        r["source_line"],
        r["source_column"],
        r["signature_ordinal"],
    )


def no_col_key(r):
    return (
        r["site_class"],
        r["opcode"],
        r["type_kind"],
        r["bitwidth"],
        r["operand_index"],
        r["function"],
        r["source_file"],
        r["source_line"],
        r["signature_ordinal"],
    )


def no_ord_key(r):
    return (
        r["site_class"],
        r["opcode"],
        r["type_kind"],
        r["bitwidth"],
        r["operand_index"],
        r["function"],
        r["source_file"],
        r["source_line"],
    )


def nearby_key(r):
    return (
        r["site_class"],
        r["opcode"],
        r["type_kind"],
        r["bitwidth"],
        r["operand_index"],
        r["function"],
        r["source_file"],
    )


def shape_key(r):
    return (
        r["site_class"],
        r["opcode"],
        r["type_kind"],
        r["bitwidth"],
        r["operand_index"],
    )


def build_ref_rows(align_rows, nvidia_meta):
    refs = []
    for row in align_rows:
        nvidia_site_id = int_field(row, "nvidia_site_id")
        sycl_site_id = int_field(row, "sycl_site_id")
        meta = nvidia_meta.get(nvidia_site_id)
        if not meta:
            continue
        ref = dict(meta)
        ref["old_nvidia_site_id"] = nvidia_site_id
        ref["sycl_site_id"] = sycl_site_id
        ref["old_match_tier"] = (row.get("match_tier", "") or "").strip()
        refs.append(ref)
    refs.sort(key=lambda r: (r["sycl_site_id"], r["old_nvidia_site_id"]))
    return refs


def choose_best(ref, candidates, used_ids, stage_name):
    best = None
    best_score = None
    for cand in candidates:
        sid = cand["site_id"]
        if sid in used_ids:
            continue
        if stage_name == "nearby_source_line":
            score = (
                abs(cand["source_line"] - ref["source_line"]),
                abs(cand["source_column"] - ref["source_column"]),
                abs(cand["signature_ordinal"] - ref["signature_ordinal"]),
                0 if sid == ref["old_nvidia_site_id"] else 1,
                sid,
            )
        elif stage_name == "shape_only":
            score = (
                0 if cand["function"] == ref["function"] else 1,
                0 if cand["source_file"] == ref["source_file"] else 1,
                abs(cand["source_line"] - ref["source_line"]),
                abs(cand["signature_ordinal"] - ref["signature_ordinal"]),
                0 if sid == ref["old_nvidia_site_id"] else 1,
                sid,
            )
        else:
            score = (
                abs(cand["source_line"] - ref["source_line"]),
                abs(cand["source_column"] - ref["source_column"]),
                abs(cand["signature_ordinal"] - ref["signature_ordinal"]),
                0 if sid == ref["old_nvidia_site_id"] else 1,
                sid,
            )
        if best_score is None or score < best_score:
            best = cand
            best_score = score
    return best


def match_stage(refs, unmatched_ref_ids, candidates, used_ids, stage_name, buckets):
    matches = {}
    for ref in refs:
        ref_id = ref["sycl_site_id"]
        if ref_id not in unmatched_ref_ids:
            continue
        if stage_name == "exact":
            cand_list = buckets["exact"].get(exact_key(ref), [])
        elif stage_name == "drop_source_column":
            cand_list = buckets["no_col"].get(no_col_key(ref), [])
        elif stage_name == "drop_signature_ordinal":
            cand_list = buckets["no_ord"].get(no_ord_key(ref), [])
        elif stage_name == "nearby_source_line":
            cand_list = [
                c
                for c in buckets["nearby"].get(nearby_key(ref), [])
                if abs(c["source_line"] - ref["source_line"]) <= 2
            ]
        elif stage_name == "shape_only":
            cand_list = buckets["shape"].get(shape_key(ref), [])
        else:
            cand_list = []
        best = choose_best(ref, cand_list, used_ids, stage_name)
        if best:
            matches[ref_id] = best
            used_ids.add(best["site_id"])
    return matches


def semantic_match(refs, candidates):
    used_ids = set()
    unmatched_ref_ids = {r["sycl_site_id"] for r in refs}
    stage_order = [
        "exact",
        "drop_source_column",
        "drop_signature_ordinal",
        "nearby_source_line",
        "shape_only",
    ]
    buckets = {
        "exact": defaultdict(list),
        "no_col": defaultdict(list),
        "no_ord": defaultdict(list),
        "nearby": defaultdict(list),
        "shape": defaultdict(list),
    }
    for cand in candidates:
        buckets["exact"][exact_key(cand)].append(cand)
        buckets["no_col"][no_col_key(cand)].append(cand)
        buckets["no_ord"][no_ord_key(cand)].append(cand)
        buckets["nearby"][nearby_key(cand)].append(cand)
        buckets["shape"][shape_key(cand)].append(cand)

    ref_by_id = {r["sycl_site_id"]: r for r in refs}
    final = {}
    stage_counts = Counter()
    for stage in stage_order:
        stage_matches = match_stage(refs, unmatched_ref_ids, candidates, used_ids, stage, buckets)
        for ref_id, cand in stage_matches.items():
            ref = ref_by_id[ref_id]
            final[ref_id] = {
                "ref": ref,
                "candidate": cand,
                "stage": stage,
                "changed": cand["site_id"] != ref["old_nvidia_site_id"],
            }
            stage_counts[stage] += 1
        unmatched_ref_ids -= set(stage_matches.keys())
    return final, unmatched_ref_ids, stage_counts


def read_worklist_rows(path):
    return read_csv_rows(path)


def filter_worklist_by_site_order(worklist_rows, ordered_site_ids):
    grouped = defaultdict(list)
    for row in worklist_rows:
        grouped[int_field(row, "site_id")].append(row)
    out = []
    index = 0
    for site_id in ordered_site_ids:
        for row in grouped.get(site_id, []):
            index += 1
            new_row = dict(row)
            new_row["index"] = str(index)
            out.append(new_row)
    return out


def write_csv(path, fieldnames, rows):
    path.parent.mkdir(parents=True, exist_ok=True)
    with open(path, "w", newline="", encoding="utf-8") as fh:
        writer = csv.DictWriter(fh, fieldnames=fieldnames)
        writer.writeheader()
        for row in rows:
            writer.writerow(row)


def write_report(base_dir, bench, target, refs, match_map, unmatched_ref_ids, stage_counts):
    rows = []
    changed = 0
    reintroduced = 0
    old_site_ids = {r["old_nvidia_site_id"] for r in refs}
    new_site_ids = set()
    for ref in refs:
        ref_id = ref["sycl_site_id"]
        match = match_map.get(ref_id)
        if not match:
            rows.append(
                {
                    "sycl_site_id": ref_id,
                    "old_nvidia_site_id": ref["old_nvidia_site_id"],
                    "new_nvidia_site_id": "",
                    "stage": "unmatched",
                    "changed": "0",
                    "reintroduced": "0",
                    "site_class": ref["site_class"],
                    "opcode": ref["opcode"],
                    "type_kind": ref["type_kind"],
                    "bitwidth": ref["bitwidth"],
                    "operand_index": ref["operand_index"],
                    "function": ref["function"],
                    "source_file": ref["source_file"],
                    "source_line": ref["source_line"],
                    "source_column": ref["source_column"],
                    "signature_ordinal": ref["signature_ordinal"],
                    "semantic_key": ref["semantic_key"],
                }
            )
            continue
        cand = match["candidate"]
        changed_flag = 1 if match["changed"] else 0
        rein_flag = 1 if cand["site_id"] not in old_site_ids else 0
        changed += changed_flag
        reintroduced += rein_flag
        new_site_ids.add(cand["site_id"])
        rows.append(
            {
                "sycl_site_id": ref_id,
                "old_nvidia_site_id": ref["old_nvidia_site_id"],
                "new_nvidia_site_id": cand["site_id"],
                "stage": match["stage"],
                "changed": changed_flag,
                "reintroduced": rein_flag,
                "site_class": cand["site_class"],
                "opcode": cand["opcode"],
                "type_kind": cand["type_kind"],
                "bitwidth": cand["bitwidth"],
                "operand_index": cand["operand_index"],
                "function": cand["function"],
                "source_file": cand["source_file"],
                "source_line": cand["source_line"],
                "source_column": cand["source_column"],
                "signature_ordinal": cand["signature_ordinal"],
                "semantic_key": cand["semantic_key"],
            }
        )
    map_path = base_dir / bench / f"semantic_align_{target}.csv"
    write_csv(
        map_path,
        [
            "sycl_site_id",
            "old_nvidia_site_id",
            "new_nvidia_site_id",
            "stage",
            "changed",
            "reintroduced",
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
        ],
        rows,
    )
    summary_path = base_dir / bench / f"semantic_report_{target}.csv"
    summary_rows = [
        {
            "bench": bench,
            "target": target,
            "ref_sites": len(refs),
            "matched": len(match_map),
            "unmatched": len(unmatched_ref_ids),
            "changed_assignments": changed,
            "reintroduced_sites": reintroduced,
            "stage_exact": stage_counts["exact"],
            "stage_drop_source_column": stage_counts["drop_source_column"],
            "stage_drop_signature_ordinal": stage_counts["drop_signature_ordinal"],
            "stage_nearby_source_line": stage_counts["nearby_source_line"],
            "stage_shape_only": stage_counts["shape_only"],
        }
    ]
    write_csv(
        summary_path,
        [
            "bench",
            "target",
            "ref_sites",
            "matched",
            "unmatched",
            "changed_assignments",
            "reintroduced_sites",
            "stage_exact",
            "stage_drop_source_column",
            "stage_drop_signature_ordinal",
            "stage_nearby_source_line",
            "stage_shape_only",
        ],
        summary_rows,
    )
    return map_path, summary_path


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--results-root", default="HeCBench/results/llvm17_inject")
    parser.add_argument("--align-root", default="HeCBench/results/llvm17_inject/alignments")
    parser.add_argument("--out-root", default="HeCBench/results/llvm17_inject/semantic_alignments")
    parser.add_argument("--benches", default=",".join(BENCHES))
    args = parser.parse_args()

    results_root = Path(args.results_root)
    align_root = Path(args.align_root)
    out_root = Path(args.out_root)
    benches = [b.strip() for b in args.benches.split(",") if b.strip()]

    for bench in benches:
        for target, suffix, meta_name, nvidia_aligned_name, sycl_aligned_name in TARGETS:
            bench_dir = results_root / bench
            sycl_dir = results_root / f"{bench}-sycl"
            meta_path = bench_dir / meta_name
            align_path = align_root / bench / f"align_{target}.csv"
            nvidia_worklist = bench_dir / f"worklist{suffix}.csv"
            sycl_worklist = sycl_dir / sycl_aligned_name
            if not meta_path.exists():
                raise RuntimeError(f"missing metadata: {meta_path}")
            if not align_path.exists():
                raise RuntimeError(f"missing prior alignment: {align_path}")
            if not nvidia_worklist.exists():
                raise RuntimeError(f"missing nvidia worklist: {nvidia_worklist}")
            if not sycl_worklist.exists():
                raise RuntimeError(f"missing sycl aligned worklist: {sycl_worklist}")

            nvidia_meta = {r["site_id"]: r for r in map(normalize_row, read_csv_rows(meta_path))}
            refs = build_ref_rows(read_csv_rows(align_path), nvidia_meta)
            candidates = list(nvidia_meta.values())
            match_map, unmatched_ref_ids, stage_counts = semantic_match(refs, candidates)
            map_path, summary_path = write_report(out_root, bench, target, refs, match_map, unmatched_ref_ids, stage_counts)

            ordered_new_site_ids = [match_map[r["sycl_site_id"]]["candidate"]["site_id"] for r in refs if r["sycl_site_id"] in match_map]
            ordered_sycl_site_ids = [r["sycl_site_id"] for r in refs if r["sycl_site_id"] in match_map]
            nvidia_rows = filter_worklist_by_site_order(read_worklist_rows(nvidia_worklist), ordered_new_site_ids)
            sycl_rows = filter_worklist_by_site_order(read_worklist_rows(sycl_worklist), ordered_sycl_site_ids)
            nvidia_out = bench_dir / f"worklist{suffix}_semantic_aligned.csv"
            sycl_out = sycl_dir / f"worklist{suffix}_semantic_aligned.csv"
            write_csv(
                nvidia_out,
                ["index", "site_id", "bit_index", "bitwidth", "type_kind", "opcode"],
                nvidia_rows,
            )
            write_csv(
                sycl_out,
                ["index", "site_id", "bit_index", "bitwidth", "type_kind", "opcode"],
                sycl_rows,
            )
            print(
                f"{bench} {target}: ref_sites={len(refs)} matched={len(match_map)} unmatched={len(unmatched_ref_ids)} "
                f"stages={dict(stage_counts)} map={map_path} report={summary_path}"
            )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
