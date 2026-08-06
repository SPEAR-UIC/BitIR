#!/usr/bin/env python3
from __future__ import annotations

import argparse
import csv
from pathlib import Path
from typing import Any

import yaml


def load_yaml(path: Path) -> dict[str, Any]:
    return yaml.safe_load(path.read_text(encoding="utf-8")) or {}


def machine_backends(config_dir: Path) -> dict[str, str]:
    out = {}
    for path in sorted(config_dir.glob("*.yml")):
        for name, cfg in load_yaml(path).get("machines", {}).items():
            backend = str(cfg.get("source_key") or cfg.get("binary_subdir") or "").strip()
            if backend:
                out[name] = backend
    return out


def record_keys(rows: list[dict[str, Any]]) -> set[tuple[str, str]]:
    return {(str(row.get("expr", "")).strip(), str(row.get("bytes", "")).strip()) for row in rows}


def review_entry(entry: dict[str, Any], backends: set[str]) -> tuple[str, list[str]]:
    output = entry.get("output", {})
    fmt = output.get("format")
    sources = entry.get("sources", {})
    evidence = entry.get("evidence", {})
    reasons = []

    for backend in sorted(backends):
        if backend not in sources:
            reasons.append(f"missing_source:{backend}")
            continue
        if backend not in evidence:
            reasons.append(f"missing_evidence:{backend}")
            continue
        if fmt == "binary_records":
            expected = record_keys(output.get("records", []))
            seen = record_keys(evidence[backend].get("copy_candidates", []))
            if not expected:
                reasons.append("missing_output_records")
            elif not seen:
                reasons.append(f"missing_copy_candidates:{backend}")
            elif not expected & seen:
                reasons.append(f"record_mismatch:{backend}")
        elif fmt == "stdout_signature":
            if not evidence[backend].get("text_signals"):
                reasons.append(f"missing_text_signal:{backend}")
        else:
            reasons.append(f"unknown_format:{fmt}")

    compare = output.get("compare")
    if compare not in {"exact", "float", "text"}:
        reasons.append(f"unknown_compare:{compare}")
    if fmt == "stdout_signature" and compare != "text":
        reasons.append("text_format_compare_mismatch")
    if fmt == "binary_records" and compare == "text":
        reasons.append("binary_format_compare_mismatch")
    return ("static_candidate" if not reasons else "manual_review", reasons)


def main() -> int:
    ap = argparse.ArgumentParser(description="Review a proposed HeCBench output manifest against configured BitIR machines.")
    ap.add_argument("--manifest", default="dev/manifests/hecbench/output_manifest.proposed.yml")
    ap.add_argument("--machines", default="bitir/config/machines")
    ap.add_argument("--out-csv", default="dev/manifests/hecbench/static_review.csv")
    ap.add_argument("--out-summary", default="dev/manifests/hecbench/static_review_summary.yml")
    args = ap.parse_args()

    manifest = load_yaml(Path(args.manifest))
    machines = machine_backends(Path(args.machines))
    backends = set(machines.values())
    rows = []
    counts = {"static_candidate": 0, "manual_review": 0}
    reason_counts: dict[str, int] = {}

    for bench, entry in sorted(manifest.get("benchmarks", {}).items()):
        status, reasons = review_entry(entry, backends)
        counts[status] += 1
        for reason in reasons:
            reason_counts[reason] = reason_counts.get(reason, 0) + 1
        rows.append({
            "benchmark": bench,
            "status": status,
            "compare": entry.get("output", {}).get("compare", ""),
            "format": entry.get("output", {}).get("format", ""),
            "records": len(entry.get("output", {}).get("records", [])),
            "sources": ";".join(sorted(entry.get("sources", {}))),
            "reasons": ";".join(reasons),
        })

    out_csv = Path(args.out_csv)
    out_csv.parent.mkdir(parents=True, exist_ok=True)
    with out_csv.open("w", encoding="utf-8", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=list(rows[0]))
        writer.writeheader()
        writer.writerows(rows)

    summary = {
        "manifest": args.manifest,
        "machines": machines,
        "backends_reviewed": sorted(backends),
        "benchmarks": len(rows),
        "counts": counts,
        "top_reasons": dict(sorted(reason_counts.items(), key=lambda item: (-item[1], item[0]))[:30]),
    }
    Path(args.out_summary).write_text(yaml.safe_dump(summary, sort_keys=False), encoding="utf-8")
    print(f"wrote {out_csv}")
    print(f"wrote {args.out_summary}")
    print(yaml.safe_dump(summary, sort_keys=False))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
