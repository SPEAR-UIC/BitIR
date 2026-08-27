#!/usr/bin/env python3

import argparse
import re
import sys
from pathlib import Path
from typing import Any, Dict, List, Tuple

import yaml

REPO_ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(REPO_ROOT))

from bitir.tools.benchmarks.benchmark_common import HECBENCH_SOURCE_ROOT, discover_variants, hecbench_root, read_sources, split_top_level_args


def call_args(text: str, pattern: str) -> List[List[str]]:
    calls = []  # type: List[List[str]]
    pos = 0
    rx = re.compile(pattern, re.MULTILINE)
    while True:
        match = rx.search(text, pos)
        if not match:
            return calls
        pos = match.end()
        depth = 1
        quote = ""
        escape = False
        while pos < len(text) and depth:
            char = text[pos]
            if quote:
                if escape:
                    escape = False
                elif char == "\\":
                    escape = True
                elif char == quote:
                    quote = ""
            elif char in ("'", '"'):
                quote = char
            elif char == "(":
                depth += 1
            elif char == ")":
                depth -= 1
            pos += 1
        calls.append(split_top_level_args(text[match.end(): pos - 1]))


def output_expr(expr: str) -> bool:
    lower = expr.lower()
    return "input" not in lower and "host" not in lower


def unique_records(rows: List[Dict[str, str]]) -> List[Dict[str, str]]:
    seen = set()
    out = []
    for row in rows:
        key = (row["expr"], row["bytes"], row["backend_hook"])
        if key in seen:
            continue
        seen.add(key)
        out.append(row)
    return out


def copy_candidates(model: str, text: str) -> List[Dict[str, str]]:
    if model in {"cuda", "hip"}:
        api = r"\b(?:cudaMemcpy|cudaMemcpyAsync|hipMemcpy|hipMemcpyAsync)\s*\("
        directions = {"cudaMemcpyDeviceToHost", "hipMemcpyDeviceToHost"}
        return unique_records([
            {"expr": args[0].strip(), "bytes": args[2].strip(), "backend_hook": "after_device_to_host_copy"}
            for args in call_args(text, api)
            if len(args) >= 4 and args[3].strip() in directions and output_expr(args[0])
        ])
    if model == "sycl":
        return unique_records([
            {"expr": args[0].strip(), "bytes": args[2].strip(), "backend_hook": "after_queue_memcpy"}
            for args in call_args(text, r"\.memcpy\s*\(")
            if len(args) >= 3 and output_expr(args[0])
        ])
    return []


def text_signals(text: str) -> List[str]:
    signals = []
    for name, rx in {
        "pass_fail": r"\b(PASS|FAIL|Pass|Fail|passed|failed)\b",
        "checksum": r"\b(checksum|Checksum|hash|Hash)\b",
        "error_metric": r"\b(error|Error|norm|Norm|residual|Residual)\b",
    }.items():
        if re.search(rx, text):
            signals.append(name)
    return signals


def output_kind(records: List[Dict[str, str]], signals: List[str]) -> Dict[str, Any]:
    if records:
        joined = " ".join(f"{r['expr']} {r['bytes']}" for r in records).lower()
        compare = "float" if any(word in joined for word in ["float", "double", "real", "solution"]) else "exact"
        return {
            "compare": compare,
            "format": "binary_records",
            "hook_point": "after_final_result_copy",
            "records": [{"expr": r["expr"], "bytes": r["bytes"]} for r in records],
        }
    return {
        "compare": "text",
        "format": "stdout_signature",
        "signals": signals or ["manual_review"],
    }


def inspect_variant(model: str, root: Path, source_dir: Path) -> Dict[str, Any]:
    chunks = read_sources(source_dir)
    text = "\n".join(chunk for _, chunk in chunks)
    records = copy_candidates(model, text)
    return {
        "source": str(source_dir.relative_to(root)),
        "files_scanned": [name for name, _ in chunks],
        "copy_candidates": records,
        "text_signals": text_signals(text),
    }


def app_contract(evidence: Dict[str, Dict[str, Any]]) -> Dict[str, Any]:
    records_by_expr = {}  # type: Dict[Tuple[str, str], Dict[str, str]]
    signals = []  # type: List[str]
    for item in evidence.values():
        for row in item["copy_candidates"]:
            records_by_expr[(row["expr"], row["bytes"])] = {"expr": row["expr"], "bytes": row["bytes"]}
        signals.extend(item["text_signals"])
    return {
        "review": "needed",
        "output": output_kind(list(records_by_expr.values()), sorted(set(signals))),
        "evidence": evidence,
    }


def main() -> int:
    ap = argparse.ArgumentParser(description="Inspect HeCBench application outputs and write a proposed BitIR manifest.")
    ap.add_argument("--benchmarks", default="")
    ap.add_argument("--output", required=True)
    args = ap.parse_args()

    root = hecbench_root().resolve()
    variants = discover_variants(root, HECBENCH_SOURCE_ROOT, require_cmake=False)
    selected = {item.strip() for item in re.split(r"[;,\s]+", args.benchmarks) if item.strip()}
    manifest = {  # type: Dict[str, Any]
        "benchmark": "hecbench",
        "source_root": HECBENCH_SOURCE_ROOT,
        "schema": "bitir-output-manifest-v1",
        "benchmarks": {},
    }
    for bench in sorted(variants):
        if selected and bench not in selected:
            continue
        evidence = {
            model: inspect_variant(model, root, path)
            for model, path in sorted(variants[bench].items())
        }
        manifest["benchmarks"][bench] = {
            "sources": {model: str(path.relative_to(root)) for model, path in sorted(variants[bench].items())},
            **app_contract(evidence),
        }

    output = Path(args.output)
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(yaml.safe_dump(manifest, sort_keys=False, width=120), encoding="utf-8")
    print(f"wrote {output} ({len(manifest['benchmarks'])} benchmarks)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
