#!/usr/bin/env python3
import argparse
import csv
import hashlib
import json
import os
import struct
from pathlib import Path
from typing import Optional


def sha256sum(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b""):
            h.update(chunk)
    return h.hexdigest()


def file_info(path_str: Optional[str]):
    if not path_str:
        return {"exists": False, "path": ""}
    path = Path(path_str)
    info = {"exists": path.is_file(), "path": str(path)}
    if path.is_file():
        info["bytes"] = path.stat().st_size
        info["sha256"] = sha256sum(path)
    return info


def read_csv_row(csv_path: Path, predicate):
    if not csv_path.is_file():
        return None, None
    with csv_path.open(newline="", encoding="utf-8") as f:
        reader = csv.DictReader(f)
        fieldnames = reader.fieldnames
        for row in reader:
            if predicate(row):
                return fieldnames, row
    return fieldnames, None


def write_single_row_csv(out_path: Path, fieldnames, row):
    if not fieldnames or row is None:
        return False
    with out_path.open("w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerow(row)
    return True


def load_bytes(path_str: Optional[str]):
    path = Path(path_str) if path_str else None
    if not path or not path.is_file():
        return None
    return path.read_bytes()


def compare_bytes(golden_path: Optional[str], candidate_path: Optional[str], numeric_type: str):
    golden = load_bytes(golden_path)
    candidate = load_bytes(candidate_path)
    report = {
        "golden": file_info(golden_path),
        "candidate": file_info(candidate_path),
        "dump_exists": candidate is not None,
        "byte_count": len(candidate) if candidate is not None else 0,
        "mismatch_count": None,
        "first_differing_byte_offset": None,
        "size_match": None,
        "numeric_compare_applicable": False,
        "element_count": None,
        "element_mismatch_count": None,
        "first_differing_index": None,
        "max_absolute_difference": None,
    }
    if golden is None or candidate is None:
        return report

    report["size_match"] = len(golden) == len(candidate)
    compare_len = min(len(golden), len(candidate))
    mismatch_count = 0
    first_diff = None
    for idx in range(compare_len):
        if golden[idx] != candidate[idx]:
            mismatch_count += 1
            if first_diff is None:
                first_diff = idx
    mismatch_count += abs(len(golden) - len(candidate))
    report["mismatch_count"] = mismatch_count
    report["first_differing_byte_offset"] = first_diff
    report["byte_count"] = len(candidate)

    if numeric_type == "int32" and len(golden) == len(candidate) and len(candidate) % 4 == 0:
        report["numeric_compare_applicable"] = True
        values_g = struct.iter_unpack("<i", golden)
        values_c = struct.iter_unpack("<i", candidate)
        element_mismatch_count = 0
        first_idx = None
        max_abs_diff = 0
        count = 0
        for count, (gv, cv) in enumerate(zip(values_g, values_c), start=1):
            gv = gv[0]
            cv = cv[0]
            if gv != cv:
                element_mismatch_count += 1
                if first_idx is None:
                    first_idx = count - 1
                diff = abs(gv - cv)
                if diff > max_abs_diff:
                    max_abs_diff = diff
        report["element_count"] = len(candidate) // 4
        report["element_mismatch_count"] = element_mismatch_count
        report["first_differing_index"] = first_idx
        report["max_absolute_difference"] = max_abs_diff
    return report


def maybe_write_source_context(out_path: Path, source_file: Optional[str], source_line: Optional[str], radius: int = 3):
    if not source_file or not source_line:
        return False
    try:
        line_no = int(source_line)
    except ValueError:
        return False
    src = Path(source_file)
    if not src.is_file():
        return False
    lines = src.read_text(encoding="utf-8", errors="replace").splitlines()
    start = max(1, line_no - radius)
    end = min(len(lines), line_no + radius)
    with out_path.open("w", encoding="utf-8") as f:
        for idx in range(start, end + 1):
            marker = ">" if idx == line_no else " "
            f.write(f"{marker} {idx}: {lines[idx - 1]}\n")
    return True


def write_json(path: Path, data):
    with path.open("w", encoding="utf-8") as f:
        json.dump(data, f, indent=2, sort_keys=True)
        f.write("\n")


def write_text_summary(path: Path, summary: dict):
    with path.open("w", encoding="utf-8") as f:
        for key, value in summary.items():
            if isinstance(value, dict):
                f.write(f"[{key}]\n")
                for subk, subv in value.items():
                    f.write(f"{subk}={subv}\n")
            else:
                f.write(f"{key}={value}\n")
            f.write("\n")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--results-root", required=True)
    ap.add_argument("--trace-results-dir", required=True)
    ap.add_argument("--bench", required=True)
    ap.add_argument("--site-id", required=True)
    ap.add_argument("--bit-index", required=True)
    ap.add_argument("--trace-case-id", required=True)
    ap.add_argument("--worklist", required=True)
    ap.add_argument("--case-csv", required=True)
    ap.add_argument("--metadata-csv", required=True)
    ap.add_argument("--sites-csv", required=True)
    ap.add_argument("--alignment-csv", required=True)
    ap.add_argument("--pairwise-csv", required=True)
    ap.add_argument("--golden", required=True)
    ap.add_argument("--baseline-dump", required=True)
    ap.add_argument("--injected-dump", required=True)
    ap.add_argument("--baseline-trace-dir", required=True)
    ap.add_argument("--injected-trace-dir", required=True)
    ap.add_argument("--numeric-type", default="int32")
    args = ap.parse_args()

    results_root = Path(args.results_root)
    trace_results_dir = Path(args.trace_results_dir)
    evidence_dir = results_root / "evidence"
    evidence_dir.mkdir(parents=True, exist_ok=True)

    worklist_fields, worklist_row = read_csv_row(
        Path(args.worklist), lambda row: row.get("trace_case_id") == args.trace_case_id
    )
    write_single_row_csv(evidence_dir / "selected_worklist_row.csv", worklist_fields, worklist_row)

    case_fields, case_row = read_csv_row(
        Path(args.case_csv), lambda row: row.get("trace_case_id") == args.trace_case_id
    )
    write_single_row_csv(evidence_dir / "selected_trace_case_row.csv", case_fields, case_row)

    metadata_fields, metadata_row = read_csv_row(
        Path(args.metadata_csv), lambda row: row.get("site_id") == args.site_id
    )
    write_single_row_csv(evidence_dir / "selected_sites_metadata_row.csv", metadata_fields, metadata_row)

    sites_fields, sites_row = read_csv_row(
        Path(args.sites_csv), lambda row: row.get("site_id") == args.site_id
    )
    write_single_row_csv(evidence_dir / "selected_sites_row.csv", sites_fields, sites_row)

    alignment_fields, alignment_row = read_csv_row(
        Path(args.alignment_csv),
        lambda row: row.get("bench") == args.bench
        and row.get("amd_site_id") == args.site_id
        and row.get("nvidia_site_id") == "9"
        and row.get("intel_site_id") == "25",
    )
    write_single_row_csv(evidence_dir / "selected_alignment_row.csv", alignment_fields, alignment_row)

    pairwise_fields, pairwise_row = read_csv_row(
        Path(args.pairwise_csv),
        lambda row: row.get("bench") == args.bench
        and row.get("amd_site_id") == args.site_id
        and row.get("bit_index") == args.bit_index,
    )
    write_single_row_csv(evidence_dir / "selected_pairwise_candidate_row.csv", pairwise_fields, pairwise_row)

    maybe_write_source_context(
        evidence_dir / "site_source_context.txt",
        metadata_row.get("source_file") if metadata_row else None,
        metadata_row.get("source_line") if metadata_row else None,
        radius=4,
    )

    injected_compare = compare_bytes(args.golden, args.injected_dump, args.numeric_type)
    baseline_compare = compare_bytes(args.golden, args.baseline_dump, args.numeric_type)

    write_json(evidence_dir / "injected_dump_compare.json", injected_compare)
    write_json(evidence_dir / "baseline_dump_compare.json", baseline_compare)

    key_paths = {
        "results_root": str(results_root),
        "trace_results_dir": str(trace_results_dir),
        "golden": file_info(args.golden),
        "baseline_dump": file_info(args.baseline_dump),
        "injected_dump": file_info(args.injected_dump),
        "baseline_trace_dir": file_info(args.baseline_trace_dir),
        "injected_trace_dir": file_info(args.injected_trace_dir),
        "summary_csv": file_info(str(trace_results_dir / "summary.csv")),
        "baseline_summary_csv": file_info(str(trace_results_dir / "baseline_summary.csv")),
        "baseline_stdout": file_info(str(trace_results_dir / "baseline.out")),
        "baseline_stderr": file_info(str(trace_results_dir / "baseline.err")),
        "injected_stdout": file_info(str(trace_results_dir / f"site{args.site_id}_bit{args.bit_index}.out")),
        "injected_stderr": file_info(str(trace_results_dir / f"site{args.site_id}_bit{args.bit_index}.err")),
    }
    write_json(evidence_dir / "artifact_index.json", key_paths)

    summary = {
        "trace_case_id": args.trace_case_id,
        "bench": args.bench,
        "site_id": args.site_id,
        "bit_index": args.bit_index,
        "golden_path": args.golden,
        "baseline_dump_path": args.baseline_dump,
        "injected_dump_path": args.injected_dump,
        "metadata_row_found": bool(metadata_row),
        "sites_row_found": bool(sites_row),
        "alignment_row_found": bool(alignment_row),
        "pairwise_row_found": bool(pairwise_row),
        "injected_compare": injected_compare,
        "baseline_compare": baseline_compare,
    }
    if metadata_row:
        summary["site_semantics"] = {
            "opcode": metadata_row.get("opcode", ""),
            "type_kind": metadata_row.get("type_kind", ""),
            "bitwidth": metadata_row.get("bitwidth", ""),
            "function": metadata_row.get("function", ""),
            "source_file": metadata_row.get("source_file", ""),
            "source_line": metadata_row.get("source_line", ""),
            "source_column": metadata_row.get("source_column", ""),
        }
    if alignment_row:
        summary["aligned_sites"] = {
            "nvidia_site_id": alignment_row.get("nvidia_site_id", ""),
            "intel_site_id": alignment_row.get("intel_site_id", ""),
            "amd_site_id": alignment_row.get("amd_site_id", ""),
            "match_tier": alignment_row.get("match_tier", ""),
            "canonical_line": alignment_row.get("amd_canonical_line", ""),
        }
    write_json(evidence_dir / "trace029_evidence_summary.json", summary)
    write_text_summary(evidence_dir / "trace029_evidence_summary.txt", summary)


if __name__ == "__main__":
    raise SystemExit(main())
