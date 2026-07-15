#!/usr/bin/env python3

import csv
import json
import sys
from pathlib import Path


def read_trace_manifest(path: Path):
    data = {}
    if not path.exists():
        return data
    for raw in path.read_text(encoding="utf-8").splitlines():
        if "=" not in raw:
            continue
        key, value = raw.split("=", 1)
        data[key.strip()] = value.strip()
    return data


def read_single_csv_row(path: Path):
    if not path.exists():
        return {}
    with path.open(encoding="utf-8", newline="") as handle:
        rows = list(csv.DictReader(handle))
    return rows[0] if rows else {}


def collect_mutated_lines(path: Path):
    if not path.exists():
        return []
    matches = []
    for line in path.read_text(encoding="utf-8", errors="replace").splitlines():
        stripped = line.strip()
        if "fi_" in stripped:
            matches.append(stripped)
    return matches


def first_nonempty(*values):
    for value in values:
        if value not in (None, ""):
            return value
    return ""


def main():
    if len(sys.argv) != 2:
        raise SystemExit("usage: write_trace_diagnostics.py TRACE_DIR")

    trace_dir = Path(sys.argv[1]).resolve()
    manifest = read_trace_manifest(trace_dir / "trace_manifest.txt")
    site_row = read_single_csv_row(trace_dir / "site_metadata.csv")
    worklist_row = read_single_csv_row(trace_dir / "worklist_row.csv")
    mutated_lines = collect_mutated_lines(trace_dir / "device.injected.ll")

    record = {
        "benchmark": manifest.get("bench", ""),
        "backend": manifest.get("backend", ""),
        "site_id": manifest.get("site_id", ""),
        "bit_index": manifest.get("bit_index", ""),
        "site_class": first_nonempty(site_row.get("site_class"), worklist_row.get("site_class"), "result"),
        "opcode": first_nonempty(site_row.get("opcode"), worklist_row.get("opcode")),
        "type_kind": first_nonempty(site_row.get("type_kind"), worklist_row.get("type_kind")),
        "bitwidth": first_nonempty(site_row.get("bitwidth"), worklist_row.get("bitwidth")),
        "function": first_nonempty(site_row.get("function"), worklist_row.get("function")),
        "source_line": first_nonempty(site_row.get("source_line"), ""),
        "source_column": first_nonempty(site_row.get("source_column"), ""),
        "signature_ordinal": first_nonempty(site_row.get("signature_ordinal"), ""),
        "semantic_key": first_nonempty(site_row.get("semantic_key"), ""),
        "compare_mode": manifest.get("compare_mode", ""),
        "inject_target": manifest.get("inject_target", ""),
        "mutated_ir_instruction": " || ".join(mutated_lines),
        "device_ir_path": "device.ll" if (trace_dir / "device.ll").exists() else "",
        "device_injected_bc_path": "device.injected.bc" if (trace_dir / "device.injected.bc").exists() else "",
        "device_injected_ll_path": "device.injected.ll" if (trace_dir / "device.injected.ll").exists() else "",
        "pre_injection_ll_path": "pre_injection.ll" if (trace_dir / "pre_injection.ll").exists() else "",
        "post_injection_ll_path": "post_injection.ll" if (trace_dir / "post_injection.ll").exists() else "",
        "stdout_path": manifest.get("run_out", ""),
        "stderr_path": manifest.get("run_err", ""),
    }

    csv_path = trace_dir / "diag_records.csv"
    with csv_path.open("w", encoding="utf-8", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=list(record.keys()))
        writer.writeheader()
        writer.writerow(record)

    json_path = trace_dir / "diag.json"
    json_path.write_text(json.dumps(record, indent=2, sort_keys=True) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
