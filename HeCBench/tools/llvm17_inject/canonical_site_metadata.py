#!/usr/bin/env python3
"""Build canonical source-context metadata from backend-local site dumps."""

import csv
import hashlib
import re
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, Iterable, List, Tuple


BACKEND_SUFFIX = {"nvidia": "cuda", "amd": "hip", "intel": "sycl"}
SOURCE_EXTENSIONS = {".c", ".cc", ".cpp", ".cxx", ".cu", ".cuh", ".h", ".hh", ".hpp", ".sycl"}
CONTROL_KEYWORDS = ("if", "for", "while", "switch", "catch")
QUALIFIER_PATTERNS = (
    "__global__",
    "__device__",
    "__host__",
    "__shared__",
    "__forceinline__",
    "__restrict__",
    "__restrict",
    "inline",
    "static",
    "constexpr",
)


@dataclass
class SourceIndex:
    relpath: str
    stem_relpath: str
    lines: List[str]
    normalized_lines: List[str]
    symbol_by_line: List[str]


def sha12(parts: Iterable[str]) -> str:
    joined = "||".join(parts)
    return hashlib.sha256(joined.encode("utf-8")).hexdigest()[:12]


def normalize_line(line: str) -> str:
    line = line.split("//", 1)[0].strip()
    if not line:
        return ""
    for token in QUALIFIER_PATTERNS:
        line = line.replace(token, " ")
    line = line.replace("std::", "")
    line = line.replace("sycl::", "")
    line = re.sub(r"\bconst\b", " ", line)
    line = re.sub(r"\bvolatile\b", " ", line)
    line = re.sub(r"\s+", " ", line).strip()
    return line


def stem_relpath(path: Path) -> str:
    suffix = path.suffix
    if suffix in {".cu", ".cpp", ".cc", ".cxx", ".c"}:
        return str(path.with_suffix(".src")).replace("\\", "/")
    return str(path).replace("\\", "/")


def extract_declared_symbol(line: str) -> str:
    stripped = line.strip()
    if not stripped or stripped.startswith("#"):
        return ""
    if "(" not in stripped or ")" not in stripped:
        return ""
    if any(stripped.startswith(keyword + " ") for keyword in CONTROL_KEYWORDS):
        return ""
    if stripped.startswith("return "):
        return ""
    head = stripped.split("(", 1)[0].strip()
    if not head:
        return ""
    token = head.split()[-1]
    token = token.lstrip("*&")
    token = token.replace("::operator", "operator")
    return token


def index_source_tree(root: Path) -> Dict[str, SourceIndex]:
    indexed: Dict[str, SourceIndex] = {}
    for path in sorted(root.rglob("*")):
        if not path.is_file() or path.suffix not in SOURCE_EXTENSIONS:
            continue
        rel = path.relative_to(root)
        raw_lines = path.read_text(encoding="utf-8", errors="replace").splitlines()
        normalized = [normalize_line(line) for line in raw_lines]
        current_symbol = "<global>"
        symbols: List[str] = []
        for line in raw_lines:
            declared = extract_declared_symbol(line)
            if declared:
                current_symbol = declared
            symbols.append(current_symbol)
        relpath = str(rel).replace("\\", "/")
        indexed[relpath] = SourceIndex(
            relpath=relpath,
            stem_relpath=stem_relpath(rel),
            lines=raw_lines,
            normalized_lines=normalized,
            symbol_by_line=symbols,
        )
    return indexed


def nearest_nonblank(normalized_lines: List[str], start: int, step: int) -> str:
    idx = start
    while 0 <= idx < len(normalized_lines):
        line = normalized_lines[idx]
        if line:
            return line
        idx += step
    return ""


def parse_int(value: str) -> int:
    try:
        return int(str(value).strip())
    except (TypeError, ValueError):
        return 0


def site_class_family(site_class: str) -> str:
    cls = str(site_class).strip().lower()
    if cls in ("result", "base"):
        return "value"
    return cls or "unknown"


def relative_source_path(source_file: str, source_root: Path, indexed: Dict[str, SourceIndex]) -> Tuple[str, bool]:
    raw = str(source_file).strip()
    if not raw:
        return ("", False)
    source_path = Path(raw)
    if source_path.is_absolute():
        try:
            rel = source_path.relative_to(source_root)
            return (str(rel).replace("\\", "/"), True)
        except ValueError:
            return ("", False)
    normalized = str(source_path).replace("\\", "/")
    if normalized in indexed:
        return (normalized, True)
    name_matches = [item for item in indexed.keys() if item.endswith("/" + source_path.name) or item == source_path.name]
    if len(name_matches) == 1:
        return (name_matches[0], True)
    return ("", False)


def canonicalize_metadata_rows(repo_root: Path, bench: str, backend: str, metadata_rows: List[Dict[str, str]]) -> List[Dict[str, str]]:
    if backend not in BACKEND_SUFFIX:
        raise ValueError("unsupported backend: {}".format(backend))
    source_root = repo_root / "HeCBench" / "src" / "{}-{}".format(bench, BACKEND_SUFFIX[backend])
    indexed = index_source_tree(source_root)
    relpath_cache: Dict[str, Tuple[str, bool]] = {}
    rows: List[Dict[str, str]] = []

    for row in metadata_rows:
        source_file = row.get("source_file", "").strip()
        if source_file not in relpath_cache:
            relpath_cache[source_file] = relative_source_path(source_file, source_root, indexed)
        relpath_str, bench_local_source = relpath_cache[source_file]
        source = indexed.get(relpath_str)
        source_line = parse_int(row.get("source_line", "0"))
        line_idx = max(source_line - 1, 0)

        if not bench_local_source:
            status = "external_source"
            reason = "source_file_not_in_bench_tree"
            current_norm = ""
            prev_norm = ""
            next_norm = ""
            source_symbol = "<external>"
            source_text = ""
            canonical_relpath = ""
        elif source is None:
            status = "missing_source_index"
            reason = "source_file_missing_from_index"
            current_norm = ""
            prev_norm = ""
            next_norm = ""
            source_symbol = "<missing>"
            source_text = ""
            canonical_relpath = stem_relpath(Path(relpath_str))
        elif line_idx >= len(source.lines):
            status = "line_out_of_range"
            reason = "source_line_out_of_range"
            current_norm = ""
            prev_norm = ""
            next_norm = ""
            source_symbol = "<out_of_range>"
            source_text = ""
            canonical_relpath = source.stem_relpath
        else:
            current_norm = source.normalized_lines[line_idx]
            prev_norm = nearest_nonblank(source.normalized_lines, line_idx - 1, -1)
            next_norm = nearest_nonblank(source.normalized_lines, line_idx + 1, 1)
            source_symbol = source.symbol_by_line[line_idx]
            source_text = source.lines[line_idx].strip()
            canonical_relpath = source.stem_relpath
            if not current_norm:
                status = "blank_source_line"
                reason = "no_normalized_source_text"
            else:
                status = "bench_source_match"
                reason = ""

        operand_index = row.get("operand_index", "").strip() or "-1"
        site_class = row.get("site_class", "").strip()
        source_anchor = ""
        strict_key = ""
        family_key = ""
        anchor_parts = [
            bench,
            canonical_relpath,
            source_symbol,
            prev_norm,
            current_norm,
            next_norm,
        ]
        if status == "bench_source_match":
            source_anchor = sha12(anchor_parts)
            strict_key = sha12(
                anchor_parts
                + [
                    site_class,
                    row.get("opcode", "").strip(),
                    row.get("type_kind", "").strip(),
                    row.get("bitwidth", "").strip(),
                    operand_index,
                    row.get("signature_ordinal", "").strip(),
                ]
            )
            family_key = sha12(
                anchor_parts
                + [
                    site_class_family(site_class),
                    row.get("opcode", "").strip(),
                    row.get("type_kind", "").strip(),
                    row.get("bitwidth", "").strip(),
                    operand_index,
                    row.get("signature_ordinal", "").strip(),
                ]
            )

        rows.append(
            {
                "bench": bench,
                "backend": backend,
                "local_site_id": row.get("site_id", "").strip(),
                "site_class": site_class,
                "site_class_family": site_class_family(site_class),
                "opcode": row.get("opcode", "").strip(),
                "type_kind": row.get("type_kind", "").strip(),
                "bitwidth": row.get("bitwidth", "").strip(),
                "operand_index": operand_index,
                "function": row.get("function", "").strip(),
                "source_file": source_file,
                "source_line": row.get("source_line", "").strip(),
                "source_column": row.get("source_column", "").strip(),
                "signature_ordinal": row.get("signature_ordinal", "").strip(),
                "local_semantic_key": row.get("semantic_key", "").strip(),
                "canonical_status": status,
                "canonical_status_reason": reason,
                "canonical_relpath": canonical_relpath,
                "canonical_symbol": source_symbol,
                "canonical_prev_line": prev_norm,
                "canonical_line": current_norm,
                "canonical_next_line": next_norm,
                "canonical_source_text": source_text,
                "canonical_source_anchor": source_anchor,
                "canonical_site_key_strict": strict_key,
                "canonical_site_key_class_family": family_key,
            }
        )
    return rows


def load_metadata_csv(path: Path) -> List[Dict[str, str]]:
    with path.open("r", encoding="utf-8", newline="") as handle:
        return list(csv.DictReader(handle))


def write_canonical_metadata(repo_root: Path, bench: str, backend: str, metadata_path: Path, output_path: Path) -> int:
    rows = canonicalize_metadata_rows(repo_root, bench, backend, load_metadata_csv(metadata_path))
    output_path.parent.mkdir(parents=True, exist_ok=True)
    with output_path.open("w", encoding="utf-8", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=list(rows[0].keys()) if rows else [])
        if rows:
            writer.writeheader()
            writer.writerows(rows)
    return len(rows)


def main() -> int:
    import argparse

    parser = argparse.ArgumentParser(description="Build canonical source-context metadata from backend-local site dumps.")
    parser.add_argument("--bench", required=True)
    parser.add_argument("--backend", required=True, choices=sorted(BACKEND_SUFFIX.keys()))
    parser.add_argument("--metadata", required=True)
    parser.add_argument("--output", required=True)
    args = parser.parse_args()

    repo_root = Path.cwd()
    count = write_canonical_metadata(
        repo_root,
        args.bench,
        args.backend,
        Path(args.metadata),
        Path(args.output),
    )
    print("Wrote {} canonical site rows to {}".format(count, args.output))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
