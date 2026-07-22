#!/usr/bin/env python3
import argparse
import csv
from collections import defaultdict
from pathlib import Path


OLD_METADATA = {
    "colorwheel": "divergence_cases/original_campaign/amd/colorwheel/fixed_refresh_2026-07-08/llvm17_inject_amd/colorwheel/sites_metadata.csv",
    "randomAccess": "divergence_cases/original_campaign/amd/randomAccess/fixed_refresh_2026-07-08/llvm17_inject_amd/randomAccess/sites_metadata.csv",
}

TUPLE_FIELDS = [
    "function",
    "site_class",
    "opcode",
    "type_kind",
    "bitwidth",
    "operand_index",
    "source_line",
    "source_column",
    "signature_ordinal",
]


def read_csv(path):
    with open(path, newline="", encoding="utf-8") as fh:
        return list(csv.DictReader(fh))


def tuple_key(row):
    return tuple((row.get(field, "") or "").strip() for field in TUPLE_FIELDS)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--repo-root", required=True)
    parser.add_argument("--worklist", required=True)
    parser.add_argument("--fresh-colorwheel", required=True)
    parser.add_argument("--fresh-randomaccess", required=True)
    parser.add_argument("--out-crosswalk", required=True)
    parser.add_argument("--out-resolved-worklist", required=True)
    args = parser.parse_args()

    repo_root = Path(args.repo_root)
    worklist_rows = read_csv(repo_root / args.worklist)

    old_rows = {bench: read_csv(repo_root / rel) for bench, rel in OLD_METADATA.items()}
    old_by_site = {
        bench: {(row.get("site_id") or "").strip(): row for row in rows}
        for bench, rows in old_rows.items()
    }

    fresh_paths = {
        "colorwheel": Path(args.fresh_colorwheel),
        "randomAccess": Path(args.fresh_randomaccess),
    }
    fresh_rows = {bench: read_csv(path) for bench, path in fresh_paths.items()}
    fresh_by_tuple = {}
    for bench, rows in fresh_rows.items():
        index = defaultdict(list)
        for row in rows:
            index[tuple_key(row)].append(row)
        fresh_by_tuple[bench] = index

    crosswalk_fields = [
        "screen_id",
        "bench",
        "original_site_id",
        "fresh_site_id",
        "bit_index",
        "trials",
        "original_result",
        "match_count",
        "status",
        "function",
        "site_class",
        "opcode",
        "type_kind",
        "bitwidth",
        "operand_index",
        "source_line",
        "source_column",
        "signature_ordinal",
        "old_semantic_key",
        "fresh_semantic_key",
        "canonical_line",
    ]
    resolved_fields = [
        "screen_id",
        "bench",
        "original_site_id",
        "fresh_site_id",
        "bit_index",
        "trials",
        "original_result",
        "function",
        "site_class",
        "opcode",
        "type_kind",
        "bitwidth",
        "operand_index",
        "source_line",
        "source_column",
        "signature_ordinal",
        "canonical_line",
    ]

    crosswalk_rows = []
    resolved_rows = []
    for row in worklist_rows:
        bench = (row.get("bench") or row.get("benchmark") or "").strip()
        original_site_id = (row.get("original_site_id") or "").strip()
        old_row = old_by_site.get(bench, {}).get(original_site_id)
        out = {
            "screen_id": row.get("screen_id", ""),
            "bench": bench,
            "original_site_id": original_site_id,
            "fresh_site_id": "",
            "bit_index": (row.get("bit_index") or "").strip(),
            "trials": (row.get("trials") or "2").strip(),
            "original_result": (row.get("original_result") or "").strip(),
            "match_count": "0",
            "status": "UNRESOLVED_OLD_SITE_MISSING",
            "function": "",
            "site_class": (row.get("site_class") or "").strip(),
            "opcode": (row.get("opcode") or "").strip(),
            "type_kind": "",
            "bitwidth": (row.get("value_bitwidth") or "").strip(),
            "operand_index": "",
            "source_line": "",
            "source_column": "",
            "signature_ordinal": "",
            "old_semantic_key": "",
            "fresh_semantic_key": "",
            "canonical_line": row.get("canonical_line", ""),
        }
        if old_row is not None:
            tk = tuple_key(old_row)
            matches = fresh_by_tuple.get(bench, {}).get(tk, [])
            out.update({
                "function": old_row.get("function", ""),
                "site_class": old_row.get("site_class", ""),
                "opcode": old_row.get("opcode", ""),
                "type_kind": old_row.get("type_kind", ""),
                "bitwidth": old_row.get("bitwidth", ""),
                "operand_index": old_row.get("operand_index", ""),
                "source_line": old_row.get("source_line", ""),
                "source_column": old_row.get("source_column", ""),
                "signature_ordinal": old_row.get("signature_ordinal", ""),
                "old_semantic_key": old_row.get("semantic_key", ""),
                "match_count": str(len(matches)),
            })
            if len(matches) == 1:
                match = matches[0]
                out["fresh_site_id"] = match.get("site_id", "")
                out["fresh_semantic_key"] = match.get("semantic_key", "")
                out["status"] = "RESOLVED"
                resolved_rows.append({
                    key: out[key] for key in resolved_fields
                })
            elif len(matches) == 0:
                out["status"] = "UNRESOLVED_ZERO_MATCH"
            else:
                out["status"] = "UNRESOLVED_MULTI_MATCH"
        crosswalk_rows.append(out)

    out_crosswalk = Path(args.out_crosswalk)
    out_crosswalk.parent.mkdir(parents=True, exist_ok=True)
    with open(out_crosswalk, "w", newline="", encoding="utf-8") as fh:
        writer = csv.DictWriter(fh, fieldnames=crosswalk_fields)
        writer.writeheader()
        writer.writerows(crosswalk_rows)

    out_resolved = Path(args.out_resolved_worklist)
    out_resolved.parent.mkdir(parents=True, exist_ok=True)
    with open(out_resolved, "w", newline="", encoding="utf-8") as fh:
        writer = csv.DictWriter(fh, fieldnames=resolved_fields)
        writer.writeheader()
        writer.writerows(resolved_rows)

    resolved = sum(1 for row in crosswalk_rows if row["status"] == "RESOLVED")
    unresolved = len(crosswalk_rows) - resolved
    print(f"candidates={len(crosswalk_rows)}")
    print(f"resolved={resolved}")
    print(f"unresolved={unresolved}")
    print(f"planned_injections={sum(int(row['trials']) for row in resolved_rows)}")


if __name__ == "__main__":
    main()
