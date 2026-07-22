#!/usr/bin/env python3
import argparse
import csv
import json
from pathlib import Path


EXPECTED = {
    "site_class": "result",
    "opcode": "sub",
    "type_kind": "int",
    "bitwidth": "32",
    "operand_index": "-1",
    "source_file": "/ccs/home/mdunlavy/GPU_FI/HeCBench/src/pathfinder-hip/main.cu",
    "source_line": "66",
    "source_column": "37",
}


def load_rows(path: Path):
    with path.open(newline="", encoding="utf-8") as f:
        return list(csv.DictReader(f))


def derive_sites_rows(metadata_rows):
    sites_rows = []
    for row in metadata_rows:
        sites_rows.append(
            {
                "site_id": row["site_id"],
                "opcode": row["opcode"],
                "type_kind": row["type_kind"],
                "bitwidth": row["bitwidth"],
                "operand_index": row["operand_index"],
                "function": row["function"],
            }
        )
    return sites_rows


def write_csv(path: Path, rows):
    path.parent.mkdir(parents=True, exist_ok=True)
    if not rows:
        raise SystemExit(f"no rows to write for {path}")
    with path.open("w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=list(rows[0].keys()))
        writer.writeheader()
        writer.writerows(rows)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--metadata-csv", required=True)
    ap.add_argument("--sites-csv")
    ap.add_argument("--bit-index", required=True)
    ap.add_argument("--selected-metadata-out", required=True)
    ap.add_argument("--selected-sites-out", required=True)
    ap.add_argument("--validation-site-list-out", required=True)
    ap.add_argument("--summary-json-out", required=True)
    args = ap.parse_args()

    metadata_rows = load_rows(Path(args.metadata_csv))
    matches = []
    for row in metadata_rows:
        function_name = str(row.get("function", "")).strip()
        if (
            function_name.startswith("_Z10pathfinder")
            and all(str(row.get(key, "")).strip() == value for key, value in EXPECTED.items())
        ):
            matches.append(row)

    if len(matches) != 1:
        raise SystemExit(
            f"expected exactly one semantic TRACE029 site match in {args.metadata_csv}, found {len(matches)}"
        )

    selected = matches[0]
    site_id = str(selected["site_id"])

    if args.sites_csv:
        sites_rows = load_rows(Path(args.sites_csv))
    else:
        sites_rows = derive_sites_rows(metadata_rows)
    selected_sites = [row for row in sites_rows if str(row.get("site_id", "")).strip() == site_id]
    if len(selected_sites) != 1:
        raise SystemExit(
            f"expected exactly one sites.csv row for site_id={site_id} in {args.sites_csv}, found {len(selected_sites)}"
        )

    write_csv(Path(args.selected_metadata_out), [selected])
    write_csv(Path(args.selected_sites_out), selected_sites)

    validation_row = {
        "site_id": site_id,
        "bit_index": str(args.bit_index),
        "opcode": selected["opcode"],
        "source_line": selected["source_line"],
        "source_column": selected["source_column"],
        "function": selected["function"],
        "site_class": selected["site_class"],
        "type_kind": selected["type_kind"],
        "bitwidth": selected["bitwidth"],
        "signature_ordinal": selected["signature_ordinal"],
    }
    write_csv(Path(args.validation_site_list_out), [validation_row])

    summary = {
        "selected_site_id": int(site_id),
        "selected_row": selected,
        "match_count": len(matches),
    }
    Path(args.summary_json_out).write_text(json.dumps(summary, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps(summary, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
