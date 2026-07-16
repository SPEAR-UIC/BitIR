#!/usr/bin/env python3
import csv
import json
import sys
from pathlib import Path


def read_kv(path):
    data = {}
    if not path.exists():
        return data
    for line in path.read_text(encoding="utf-8", errors="replace").splitlines():
        if "=" in line:
            key, value = line.split("=", 1)
            data[key] = value
    return data


def read_diag(trace_dir):
    diag_path = trace_dir / "diag.json"
    if not diag_path.exists():
        return {}
    try:
        return json.loads(diag_path.read_text(encoding="utf-8"))
    except json.JSONDecodeError:
        return {}


def main():
    if len(sys.argv) != 2:
        raise SystemExit("usage: summarize_amd_failure_audit.py RESULTS_ROOT")
    root = Path(sys.argv[1])
    rows = []
    for raw_path in sorted(root.glob("*/*/float/trace_site*/raw_outcome.txt")):
        trace_dir = raw_path.parent
        data = read_kv(raw_path)
        diag = read_diag(trace_dir)
        rows.append(
            {
                "mode": data.get("amd_execution_mode", trace_dir.parts[-4]),
                "bench": data.get("bench", trace_dir.parts[-3]),
                "site_id": data.get("site_id", ""),
                "bit_index": data.get("bit_index", ""),
                "trial": data.get("trial", ""),
                "result": data.get("result", ""),
                "process_exit": data.get("process_exit", ""),
                "timeout": data.get("timeout", ""),
                "benchmark_status": data.get("benchmark_status", ""),
                "dump_exists": data.get("dump_exists", ""),
                "dump_compare": data.get("dump_compare", ""),
                "site_class": diag.get("site_class", ""),
                "opcode": diag.get("opcode", ""),
                "type_kind": diag.get("type_kind", ""),
                "bitwidth": diag.get("bitwidth", ""),
                "mutated_ir_instruction": diag.get("mutated_ir_instruction", ""),
                "trace_dir": str(trace_dir),
            }
        )

    out = root / "audit_summary.csv"
    fields = [
        "mode",
        "bench",
        "site_id",
        "bit_index",
        "trial",
        "result",
        "process_exit",
        "timeout",
        "benchmark_status",
        "dump_exists",
        "dump_compare",
        "site_class",
        "opcode",
        "type_kind",
        "bitwidth",
        "mutated_ir_instruction",
        "trace_dir",
    ]
    with out.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        writer.writerows(rows)

    counts = {}
    for row in rows:
        key = (row["mode"], row["result"], row["benchmark_status"], row["process_exit"], row["timeout"])
        counts[key] = counts.get(key, 0) + 1
    with (root / "audit_counts.csv").open("w", newline="", encoding="utf-8") as handle:
        writer = csv.writer(handle)
        writer.writerow(["mode", "result", "benchmark_status", "process_exit", "timeout", "count"])
        for key, count in sorted(counts.items()):
            writer.writerow([*key, count])


if __name__ == "__main__":
    main()
