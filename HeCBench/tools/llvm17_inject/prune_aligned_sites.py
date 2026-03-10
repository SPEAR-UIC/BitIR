#!/usr/bin/env python3
import argparse
import csv
from pathlib import Path


PRUNES = {
    ("jacobi", "result"): {125, 142, 145, 162, 165, 167, 169, 181, 191, 192},
    ("jacobi", "operand"): {155, 174, 190, 192},
    ("entropy", "operand"): {73},
}

TARGET_INFO = {
    "result": {
        "suffix": "",
        "nvidia_aligned": "worklist_aligned.csv",
        "sycl_aligned": "worklist_sycl_aligned.csv",
        "nvidia_semantic": "worklist_semantic_aligned.csv",
        "sycl_semantic": "worklist_semantic_aligned.csv",
        "meta": "sites_sycl_aligned_metadata.csv",
        "align": "align_result.csv",
        "semantic_align": "semantic_align_result.csv",
        "semantic_report": "semantic_report_result.csv",
    },
    "operand": {
        "suffix": "_operand",
        "nvidia_aligned": "worklist_operand_aligned.csv",
        "sycl_aligned": "worklist_operand_sycl_aligned.csv",
        "nvidia_semantic": "worklist_operand_semantic_aligned.csv",
        "sycl_semantic": "worklist_operand_semantic_aligned.csv",
        "meta": "sites_operand_sycl_aligned_metadata.csv",
        "align": "align_operand.csv",
        "semantic_align": "semantic_align_operand.csv",
        "semantic_report": "semantic_report_operand.csv",
    },
    "pointer": {
        "suffix": "_pointer",
        "nvidia_aligned": "worklist_pointer_aligned.csv",
        "sycl_aligned": "worklist_pointer_sycl_aligned.csv",
        "nvidia_semantic": "worklist_pointer_semantic_aligned.csv",
        "sycl_semantic": "worklist_pointer_semantic_aligned.csv",
        "meta": "sites_pointer_sycl_aligned_metadata.csv",
        "align": "align_pointer.csv",
        "semantic_align": "semantic_align_pointer.csv",
        "semantic_report": "semantic_report_pointer.csv",
    },
}


def read_csv(path):
    with open(path, newline="", encoding="utf-8") as fh:
        reader = csv.DictReader(fh)
        return list(reader), list(reader.fieldnames or [])


def write_csv(path, fieldnames, rows):
    path.parent.mkdir(parents=True, exist_ok=True)
    with open(path, "w", newline="", encoding="utf-8") as fh:
        writer = csv.DictWriter(fh, fieldnames=fieldnames)
        writer.writeheader()
        for row in rows:
            writer.writerow(row)


def reindex_worklist(rows):
    out = []
    for idx, row in enumerate(rows, start=1):
        row = dict(row)
        row["index"] = str(idx)
        out.append(row)
    return out


def int_field(row, key, default=-1):
    try:
        return int(str(row.get(key, "")).strip())
    except Exception:
        return default


def filter_worklist(path, keep_site_ids):
    rows, fields = read_csv(path)
    kept = [r for r in rows if int_field(r, "site_id") in keep_site_ids]
    write_csv(path, fields, reindex_worklist(kept))
    return len(rows), len(kept)


def filter_metadata(path, keep_site_ids):
    rows, fields = read_csv(path)
    kept = [r for r in rows if int_field(r, "site_id") in keep_site_ids]
    write_csv(path, fields, kept)
    return len(rows), len(kept)


def update_alignments(path, pruned_site_ids):
    rows, fields = read_csv(path)
    kept = [r for r in rows if int_field(r, "nvidia_site_id") not in pruned_site_ids]
    removed_sycl_ids = [int_field(r, "sycl_site_id") for r in rows if int_field(r, "nvidia_site_id") in pruned_site_ids]
    write_csv(path, fields, kept)
    return removed_sycl_ids, len(rows), len(kept)


def update_semantic(path, report_path, pruned_site_ids, bench, target):
    rows, fields = read_csv(path)
    kept = [r for r in rows if int_field(r, "old_nvidia_site_id") not in pruned_site_ids]
    write_csv(path, fields, kept)

    summary_fields = [
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
    ]
    if kept:
        stage_counts = {
            "exact": 0,
            "drop_source_column": 0,
            "drop_signature_ordinal": 0,
            "nearby_source_line": 0,
            "shape_only": 0,
        }
        changed = 0
        reintroduced = 0
        unmatched = 0
        for row in kept:
            stage = row.get("stage", "")
            if stage in stage_counts:
                stage_counts[stage] += 1
            elif stage == "unmatched":
                unmatched += 1
            changed += int_field(row, "changed", 0)
            reintroduced += int_field(row, "reintroduced", 0)
        summary_rows = [
            {
                "bench": bench,
                "target": target,
                "ref_sites": len(kept),
                "matched": len(kept) - unmatched,
                "unmatched": unmatched,
                "changed_assignments": changed,
                "reintroduced_sites": reintroduced,
                "stage_exact": stage_counts["exact"],
                "stage_drop_source_column": stage_counts["drop_source_column"],
                "stage_drop_signature_ordinal": stage_counts["drop_signature_ordinal"],
                "stage_nearby_source_line": stage_counts["nearby_source_line"],
                "stage_shape_only": stage_counts["shape_only"],
            }
        ]
    else:
        summary_rows = []
    write_csv(report_path, summary_fields, summary_rows)
    return len(rows), len(kept)


def total_counts(results_root, benches):
    total_sites = 0
    total_bits = 0
    for bench in benches:
        for target, info in TARGET_INFO.items():
            meta_path = results_root / bench / info["meta"]
            if meta_path.exists():
                rows, _ = read_csv(meta_path)
                total_sites += len(rows)
            wl_path = results_root / bench / info["nvidia_aligned"]
            if wl_path.exists():
                rows, _ = read_csv(wl_path)
                total_bits += len(rows)
    return total_sites, total_bits


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--results-root", default="HeCBench/results/llvm17_inject")
    parser.add_argument("--align-root", default="HeCBench/results/llvm17_inject/alignments")
    parser.add_argument("--semantic-root", default="HeCBench/results/llvm17_inject/semantic_alignments")
    args = parser.parse_args()

    results_root = Path(args.results_root)
    align_root = Path(args.align_root)
    semantic_root = Path(args.semantic_root)

    for (bench, target), pruned in PRUNES.items():
        info = TARGET_INFO[target]
        align_path = align_root / bench / info["align"]
        removed_sycl_ids, _old_align, _new_align = update_alignments(align_path, pruned)
        keep_nvidia = None

        meta_path = results_root / bench / info["meta"]
        meta_rows, _ = read_csv(meta_path)
        keep_nvidia = {int_field(r, "site_id") for r in meta_rows if int_field(r, "site_id") not in pruned}
        filter_metadata(meta_path, keep_nvidia)

        nvidia_wl = results_root / bench / info["nvidia_aligned"]
        filter_worklist(nvidia_wl, keep_nvidia)
        nvidia_sem = results_root / bench / info["nvidia_semantic"]
        if nvidia_sem.exists():
            filter_worklist(nvidia_sem, keep_nvidia)

        sycl_keep = None
        sycl_wl = results_root / f"{bench}-sycl" / info["sycl_aligned"]
        sycl_rows, _ = read_csv(sycl_wl)
        sycl_keep = {int_field(r, "site_id") for r in sycl_rows if int_field(r, "site_id") not in set(removed_sycl_ids)}
        filter_worklist(sycl_wl, sycl_keep)
        sycl_sem = results_root / f"{bench}-sycl" / info["sycl_semantic"]
        if sycl_sem.exists():
            filter_worklist(sycl_sem, sycl_keep)

        semantic_map = semantic_root / bench / info["semantic_align"]
        semantic_report = semantic_root / bench / info["semantic_report"]
        if semantic_map.exists():
            update_semantic(semantic_map, semantic_report, pruned, bench, target)
        print(f"Pruned {bench}/{target}: removed {len(pruned)} sites")

    benches = sorted({bench for bench, _ in PRUNES})
    total_sites, total_bits = total_counts(results_root, ["matrix-rotate", "jacobi", "layout", "dense-embedding", "pathfinder", "bsearch", "entropy", "randomAccess"])
    print(f"TOTAL sites={total_sites} bits={total_bits}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
