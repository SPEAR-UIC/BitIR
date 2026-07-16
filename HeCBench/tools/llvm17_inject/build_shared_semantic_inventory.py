#!/usr/bin/env python3
"""Build a source-stage shared semantic inventory anchored to NVIDIA.

This treats NVIDIA canonical rows as the reference source inventory, then maps
other backend-local canonical rows onto that inventory using strict or
value-family matching. The goal is to make the shared artifact originate from
one common semantic stage instead of intersecting already-diverged backend-local
site tables.
"""

import argparse
import csv
from pathlib import Path
from typing import Dict, Iterable, List, Tuple

from canonical_site_metadata import BACKEND_SUFFIX


def load_rows(path: Path) -> List[Dict[str, str]]:
    with path.open("r", encoding="utf-8", newline="") as handle:
        return [row for row in csv.DictReader(handle) if row.get("canonical_status", "").strip() == "bench_source_match"]


def row_token(row: Dict[str, str]) -> Tuple[str, str]:
    return (row.get("backend", "").strip(), row.get("local_site_id", "").strip())


def write_csv(path: Path, rows: List[Dict[str, str]]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    if not rows:
        path.write_text("", encoding="utf-8")
        return
    with path.open("w", encoding="utf-8", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=list(rows[0].keys()))
        writer.writeheader()
        writer.writerows(rows)


def index_rows(rows: Iterable[Dict[str, str]], key_name: str) -> Dict[str, List[Dict[str, str]]]:
    indexed: Dict[str, List[Dict[str, str]]] = {}
    for row in rows:
        key = row.get(key_name, "").strip()
        if not key:
            continue
        indexed.setdefault(key, []).append(row)
    return indexed


def choose_candidate(reference: Dict[str, str], candidates: List[Dict[str, str]]) -> Tuple[Dict[str, str], str]:
    def score(row: Dict[str, str]) -> Tuple[int, int, int, int, str]:
        same_class = 1 if row.get("site_class", "").strip() == reference.get("site_class", "").strip() else 0
        same_column = 1 if row.get("source_column", "").strip() == reference.get("source_column", "").strip() else 0
        line_delta = abs(int(row.get("source_line", "0") or 0) - int(reference.get("source_line", "0") or 0))
        col_delta = abs(int(row.get("source_column", "0") or 0) - int(reference.get("source_column", "0") or 0))
        return (-same_class, -same_column, line_delta, col_delta, row.get("local_site_id", ""))

    ordered = sorted(candidates, key=score)
    chosen = ordered[0]
    reason_parts = []
    if chosen.get("site_class", "").strip() == reference.get("site_class", "").strip():
        reason_parts.append("same_site_class")
    else:
        reason_parts.append("site_class_family_fallback")
    if chosen.get("source_column", "").strip() == reference.get("source_column", "").strip():
        reason_parts.append("same_column")
    if chosen.get("source_line", "").strip() == reference.get("source_line", "").strip():
        reason_parts.append("same_line")
    return chosen, ";".join(reason_parts)


def build_inventory_row(bench: str, inventory_id: int, reference: Dict[str, str]) -> Dict[str, str]:
    return {
        "bench": bench,
        "inventory_id": str(inventory_id),
        "reference_backend": "nvidia",
        "canonical_source_anchor": reference.get("canonical_source_anchor", ""),
        "canonical_site_key_strict": reference.get("canonical_site_key_strict", ""),
        "canonical_site_key_class_family": reference.get("canonical_site_key_class_family", ""),
        "site_class": reference.get("site_class", ""),
        "site_class_family": reference.get("site_class_family", ""),
        "opcode": reference.get("opcode", ""),
        "type_kind": reference.get("type_kind", ""),
        "bitwidth": reference.get("bitwidth", ""),
        "operand_index": reference.get("operand_index", ""),
        "function": reference.get("function", ""),
        "source_file": reference.get("source_file", ""),
        "source_line": reference.get("source_line", ""),
        "source_column": reference.get("source_column", ""),
        "signature_ordinal": reference.get("signature_ordinal", ""),
        "canonical_relpath": reference.get("canonical_relpath", ""),
        "canonical_symbol": reference.get("canonical_symbol", ""),
        "canonical_prev_line": reference.get("canonical_prev_line", ""),
        "canonical_line": reference.get("canonical_line", ""),
        "canonical_next_line": reference.get("canonical_next_line", ""),
        "canonical_source_text": reference.get("canonical_source_text", ""),
        "nvidia_site_id": reference.get("local_site_id", ""),
    }


def main() -> int:
    parser = argparse.ArgumentParser(description="Build a source-stage shared semantic inventory anchored to NVIDIA canonical metadata.")
    parser.add_argument("--bench", required=True)
    parser.add_argument("--repo-root", default=".")
    parser.add_argument("--backends", nargs="+", default=["nvidia", "amd", "intel"])
    parser.add_argument("--output-dir", default="")
    args = parser.parse_args()

    repo_root = Path(args.repo_root).resolve()
    bench = args.bench
    ordered_backends: List[str] = []
    for backend in args.backends:
        if backend not in BACKEND_SUFFIX:
            raise SystemExit(f"unsupported backend: {backend}")
        if backend not in ordered_backends:
            ordered_backends.append(backend)
    if "nvidia" not in ordered_backends:
        ordered_backends.insert(0, "nvidia")

    output_dir = Path(args.output_dir) if args.output_dir else repo_root / "HeCBench" / "config" / "semantic_mappings" / "shared" / bench
    rows_by_backend: Dict[str, List[Dict[str, str]]] = {}
    for backend in ordered_backends:
        canonical_path = repo_root / "HeCBench" / "results" / "llvm17_inject" / f"{bench}-{BACKEND_SUFFIX[backend]}" / "sites_canonical.csv"
        if not canonical_path.is_file():
            raise SystemExit(f"missing canonical metadata: {canonical_path}")
        rows_by_backend[backend] = load_rows(canonical_path)

    reference_rows = rows_by_backend.get("nvidia", [])
    if not reference_rows:
        raise SystemExit(f"no NVIDIA canonical rows available for {bench}")

    inventory_rows: List[Dict[str, str]] = []
    mapping_rows: List[Dict[str, str]] = []
    unmapped_rows: List[Dict[str, str]] = []
    consumed = {backend: set() for backend in ordered_backends}

    strict_index = {backend: index_rows(rows, "canonical_site_key_strict") for backend, rows in rows_by_backend.items()}
    family_index = {backend: index_rows(rows, "canonical_site_key_class_family") for backend, rows in rows_by_backend.items()}

    for inventory_id, reference in enumerate(reference_rows, start=1):
        inventory_rows.append(build_inventory_row(bench, inventory_id, reference))
        consumed["nvidia"].add(row_token(reference))
        mapping_rows.append({
            "bench": bench,
            "inventory_id": str(inventory_id),
            "backend": "nvidia",
            "match_mode": "reference",
            "match_reason": "nvidia_reference_row",
            "inventory_site_class": reference.get("site_class", ""),
            "backend_site_id": reference.get("local_site_id", ""),
            "backend_site_class": reference.get("site_class", ""),
            "backend_function": reference.get("function", ""),
            "backend_source_file": reference.get("source_file", ""),
            "backend_source_line": reference.get("source_line", ""),
            "backend_source_column": reference.get("source_column", ""),
        })
        for backend in ordered_backends:
            if backend == "nvidia":
                continue
            strict_key = reference.get("canonical_site_key_strict", "").strip()
            family_key = reference.get("canonical_site_key_class_family", "").strip()
            strict_candidates = [row for row in strict_index.get(backend, {}).get(strict_key, []) if row_token(row) not in consumed[backend]]
            if len(strict_candidates) == 1:
                chosen = strict_candidates[0]
                match_mode = "strict"
                match_reason = "exact_canonical_site_key"
            else:
                family_candidates = [row for row in family_index.get(backend, {}).get(family_key, []) if row_token(row) not in consumed[backend]]
                if len(strict_candidates) > 1:
                    chosen, extra_reason = choose_candidate(reference, strict_candidates)
                    match_mode = "strict_disambiguated"
                    match_reason = f"multiple_strict_candidates;{extra_reason}"
                elif family_candidates:
                    chosen, extra_reason = choose_candidate(reference, family_candidates)
                    match_mode = "class_family"
                    match_reason = f"value_family_fallback;{extra_reason}"
                else:
                    unmapped_rows.append({
                        "bench": bench,
                        "inventory_id": str(inventory_id),
                        "backend": backend,
                        "reason": "no_candidate",
                        "canonical_site_key_strict": strict_key,
                        "canonical_site_key_class_family": family_key,
                        "inventory_site_class": reference.get("site_class", ""),
                        "inventory_opcode": reference.get("opcode", ""),
                        "inventory_type_kind": reference.get("type_kind", ""),
                        "inventory_bitwidth": reference.get("bitwidth", ""),
                        "inventory_function": reference.get("function", ""),
                        "inventory_source_line": reference.get("source_line", ""),
                        "inventory_source_column": reference.get("source_column", ""),
                    })
                    continue
            consumed[backend].add(row_token(chosen))
            mapping_rows.append({
                "bench": bench,
                "inventory_id": str(inventory_id),
                "backend": backend,
                "match_mode": match_mode,
                "match_reason": match_reason,
                "inventory_site_class": reference.get("site_class", ""),
                "backend_site_id": chosen.get("local_site_id", ""),
                "backend_site_class": chosen.get("site_class", ""),
                "backend_function": chosen.get("function", ""),
                "backend_source_file": chosen.get("source_file", ""),
                "backend_source_line": chosen.get("source_line", ""),
                "backend_source_column": chosen.get("source_column", ""),
            })

    for backend in ordered_backends:
        if backend == "nvidia":
            continue
        for row in rows_by_backend.get(backend, []):
            if row_token(row) in consumed[backend]:
                continue
            unmapped_rows.append({
                "bench": bench,
                "inventory_id": "",
                "backend": backend,
                "reason": "backend_row_not_selected_by_nvidia_inventory",
                "canonical_site_key_strict": row.get("canonical_site_key_strict", ""),
                "canonical_site_key_class_family": row.get("canonical_site_key_class_family", ""),
                "inventory_site_class": "",
                "inventory_opcode": row.get("opcode", ""),
                "inventory_type_kind": row.get("type_kind", ""),
                "inventory_bitwidth": row.get("bitwidth", ""),
                "inventory_function": row.get("function", ""),
                "inventory_source_line": row.get("source_line", ""),
                "inventory_source_column": row.get("source_column", ""),
            })

    write_csv(output_dir / "source_inventory_nvidia.csv", inventory_rows)
    write_csv(output_dir / "backend_site_mappings.csv", mapping_rows)
    write_csv(output_dir / "unmapped_backend_sites.csv", unmapped_rows)

    readme_lines = [
        "# Source-stage shared semantic inventory",
        "",
        "This inventory originates from NVIDIA canonical rows and acts as the common semantic stage for cross-backend alignment.",
        "Use this artifact, not raw sites_metadata.csv, as the shared cross-machine inventory.",
        "",
        "Files:",
        "- source_inventory_nvidia.csv: canonical source-stage inventory anchored to NVIDIA",
        "- backend_site_mappings.csv: per-backend mapping from inventory rows to local site ids",
        "- unmapped_backend_sites.csv: rows that could not be mapped cleanly",
        "",
        "Match policy:",
        "- strict: exact canonical site key including site_class",
        "- class_family: fallback that allows result/base within the same value-family key",
        "- NVIDIA is always the reference backend if a canonical choice is needed",
        "",
    ]
    output_dir.mkdir(parents=True, exist_ok=True)
    (output_dir / "README.md").write_text("\n".join(readme_lines), encoding="utf-8")
    print(f"Wrote source-stage shared semantic inventory under {output_dir}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
