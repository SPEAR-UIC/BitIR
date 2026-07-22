#!/usr/bin/env python3
import argparse
import csv
from pathlib import Path


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--metadata", required=True)
    parser.add_argument("--source", required=True)
    parser.add_argument("--bit-index", default="31")
    parser.add_argument("--output", required=True)
    args = parser.parse_args()
    source_lines = Path(args.source).read_text(encoding="utf-8").splitlines()
    matches = []
    with open(args.metadata, newline="", encoding="utf-8") as handle:
        reader = csv.DictReader(handle)
        fields = reader.fieldnames or []
        for row in reader:
            try:
                line = source_lines[int(row.get("source_line", "0")) - 1]
            except (ValueError, IndexError):
                continue
            if (row.get("site_class") == "result" and row.get("opcode") == "sub" and
                    row.get("type_kind") == "int" and row.get("bitwidth") == "32" and
                    "small_block_cols = BLOCK_SIZE -" in line):
                matches.append(row)
    if len(matches) != 1:
        raise SystemExit("expected one semantic small_block_cols result site, found %d" % len(matches))
    row = matches[0]
    out_fields = ["worklist_id", "bench", "site_id", "bit_index", "opcode", "type_kind",
                  "bitwidth", "site_class", "function", "source_line", "source_column",
                  "signature_ordinal", "original_nvidia_site_id", "original_bit_index"]
    out_row = {key: row.get(key, "") for key in out_fields}
    out_row.update({"worklist_id": "TRACE029", "bench": "pathfinder", "bit_index": args.bit_index,
                    "original_nvidia_site_id": "9", "original_bit_index": "31"})
    with open(args.output, "w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=out_fields, lineterminator="\n")
        writer.writeheader()
        writer.writerow(out_row)
    print(row["site_id"])


if __name__ == "__main__":
    main()
