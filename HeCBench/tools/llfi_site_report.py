#!/usr/bin/env python3
"""
Summarize LLFI-GPU injection sites for a HeCBench benchmark.

Inputs:
  - bamboo.profile.txt (dynamic per-thread instruction counts)
  - LLVM IR with bamboo_index metadata (static injectable sites)

Outputs:
  - site_summary.json: totals and breakdowns
  - static_sites.csv: per-site location/opcode/memory-space metadata
"""

from __future__ import annotations

import argparse
import csv
import json
import re
from collections import Counter, defaultdict
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, Iterable, List, Optional, Tuple


PROFILE_FIELDS = {"threadIndex", "instCount", "dynamicKernelIndex", "staticKernelIndex"}

# NVPTX address space conventions used by LLVM.
ADDRSPACE_MAP = {
    0: "generic",
    1: "global",
    2: "param",
    3: "shared",
    4: "constant",
    5: "local",
}


@dataclass
class DebugLocation:
    line: Optional[int]
    col: Optional[int]
    file_path: Optional[str]


@dataclass
class StaticSite:
    bamboo_index: int
    function: str
    opcode: str
    ir: str
    dbg: DebugLocation
    memory_space: Optional[str]


def load_profile(path: Path) -> List[Dict[str, int]]:
    entries: List[Dict[str, int]] = []
    with path.open("r", encoding="utf-8") as profile_file:
        for line in profile_file:
            segments = [segment.strip() for segment in line.split("--") if segment.strip()]
            record: Dict[str, int] = {}
            for segment in segments:
                parts = segment.split()
                if len(parts) >= 2:
                    key = parts[0]
                    try:
                        record[key] = int(parts[1])
                    except ValueError:
                        continue
            if PROFILE_FIELDS <= record.keys() and record["instCount"] > 0:
                entries.append(record)
    if not entries:
        raise RuntimeError(f"No valid profile entries found in {path}")
    return entries


def parse_ir_metadata(lines: Iterable[str]) -> Tuple[Dict[str, str], Dict[str, int], Dict[str, Tuple[int, int, str]]]:
    """Return (file_id -> path), (scope_id -> file_id), (loc_id -> (line,col,scope_id))."""
    file_map: Dict[str, str] = {}
    scope_file_map: Dict[str, int] = {}
    loc_map: Dict[str, Tuple[int, int, str]] = {}

    file_re = re.compile(r'^!(\d+)\s*=\s*!DIFile\(filename:\s*"([^"]+)",\s*directory:\s*"([^"]*)"\)')
    scope_re = re.compile(r'^!(\d+)\s*=\s*!DI\w+\(.*\bfile:\s*!(\d+)\b')
    loc_re = re.compile(r'^!(\d+)\s*=\s*!DILocation\(line:\s*(\d+),\s*column:\s*(\d+),\s*scope:\s*!(\d+)\b')

    for line in lines:
        line = line.strip()
        if not line.startswith("!"):
            continue
        match = file_re.match(line)
        if match:
            file_id, filename, directory = match.groups()
            file_path = f"{directory}/{filename}" if directory else filename
            file_map[file_id] = file_path
            continue
        match = scope_re.match(line)
        if match:
            scope_id, file_id = match.groups()
            scope_file_map[scope_id] = int(file_id)
            continue
        match = loc_re.match(line)
        if match:
            loc_id, line_no, col_no, scope_id = match.groups()
            loc_map[loc_id] = (int(line_no), int(col_no), scope_id)

    return file_map, scope_file_map, loc_map


def resolve_dbg(
    dbg_id: Optional[str],
    file_map: Dict[str, str],
    scope_file_map: Dict[str, int],
    loc_map: Dict[str, Tuple[int, int, str]],
) -> DebugLocation:
    if not dbg_id or dbg_id not in loc_map:
        return DebugLocation(None, None, None)
    line_no, col_no, scope_id = loc_map[dbg_id]
    file_path = None
    if scope_id in scope_file_map:
        file_id = str(scope_file_map[scope_id])
        file_path = file_map.get(file_id)
    return DebugLocation(line_no, col_no, file_path)


def parse_static_sites(ir_path: Path) -> List[StaticSite]:
    lines = ir_path.read_text(encoding="utf-8", errors="replace").splitlines()
    file_map, scope_file_map, loc_map = parse_ir_metadata(lines)

    sites: List[StaticSite] = []
    current_function = "<unknown>"

    func_re = re.compile(r'^define\s+.*@([^(]+)\(')
    bamboo_re = re.compile(r'!bamboo_index\s+!(\d+)')
    dbg_re = re.compile(r'!dbg\s+!(\d+)')
    metadata_value_re = re.compile(r'^!(\d+)\s*=\s*!{!"(\d+)"\s*}')
    bamboo_index_map: Dict[str, int] = {}

    for line in lines:
        func_match = func_re.match(line.strip())
        if func_match:
            current_function = func_match.group(1)
            continue

        meta_match = metadata_value_re.match(line.strip())
        if meta_match:
            meta_id, value = meta_match.groups()
            bamboo_index_map[meta_id] = int(value)
            continue

        if "!bamboo_index" not in line:
            continue

        bamboo_match = bamboo_re.search(line)
        if not bamboo_match:
            continue

        bamboo_meta_id = bamboo_match.group(1)
        bamboo_index = bamboo_index_map.get(bamboo_meta_id)
        if bamboo_index is None:
            # If metadata isn't resolved, skip to avoid mislabeling.
            continue

        dbg_match = dbg_re.search(line)
        dbg_id = dbg_match.group(1) if dbg_match else None
        dbg = resolve_dbg(dbg_id, file_map, scope_file_map, loc_map)

        opcode = extract_opcode(line)
        memory_space = extract_memory_space(line, opcode)
        sites.append(
            StaticSite(
                bamboo_index=bamboo_index,
                function=current_function,
                opcode=opcode,
                ir=line.strip(),
                dbg=dbg,
                memory_space=memory_space,
            )
        )

    if not sites:
        raise RuntimeError(f"No bamboo_index sites found in {ir_path}")
    return sites


def extract_opcode(line: str) -> str:
    stripped = line.strip()
    if "=" in stripped:
        _, rhs = stripped.split("=", 1)
        opcode = rhs.strip().split()[0]
    else:
        opcode = stripped.split()[0]
    return opcode


def extract_memory_space(line: str, opcode: str) -> Optional[str]:
    if opcode not in {"load", "store"}:
        return None
    match = re.search(r"addrspace\((\d+)\)", line)
    if not match:
        return None
    space = int(match.group(1))
    return ADDRSPACE_MAP.get(space, f"addrspace({space})")


def summarize_profile(entries: List[Dict[str, int]]) -> Dict[str, object]:
    total_dynamic_sites = sum(entry["instCount"] for entry in entries)
    per_dyn_kernel = defaultdict(lambda: {"threads": 0, "instCount": 0})
    per_static_kernel = defaultdict(lambda: {"threads": 0, "instCount": 0})

    for entry in entries:
        dyn = entry["dynamicKernelIndex"]
        stat = entry["staticKernelIndex"]
        per_dyn_kernel[dyn]["threads"] += 1
        per_dyn_kernel[dyn]["instCount"] += entry["instCount"]
        per_static_kernel[stat]["threads"] += 1
        per_static_kernel[stat]["instCount"] += entry["instCount"]

    return {
        "total_dynamic_sites": total_dynamic_sites,
        "dynamic_kernel_groups": dict(per_dyn_kernel),
        "static_kernel_groups": dict(per_static_kernel),
    }


def summarize_static_sites(sites: List[StaticSite]) -> Dict[str, object]:
    memory_counts = Counter(site.memory_space or "unknown" for site in sites)
    opcode_counts = Counter(site.opcode for site in sites)
    function_counts = Counter(site.function for site in sites)

    return {
        "total_static_sites": len(sites),
        "opcode_counts": dict(opcode_counts),
        "memory_space_counts": dict(memory_counts),
        "function_counts": dict(function_counts),
    }


def write_static_csv(path: Path, sites: List[StaticSite]) -> None:
    with path.open("w", newline="", encoding="utf-8") as csvfile:
        writer = csv.writer(csvfile)
        writer.writerow(
            [
                "bambooIndex",
                "function",
                "opcode",
                "memorySpace",
                "file",
                "line",
                "column",
                "ir",
            ]
        )
        for site in sorted(sites, key=lambda s: s.bamboo_index):
            writer.writerow(
                [
                    site.bamboo_index,
                    site.function,
                    site.opcode,
                    site.memory_space or "",
                    site.dbg.file_path or "",
                    site.dbg.line or "",
                    site.dbg.col or "",
                    site.ir,
                ]
            )


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Report LLFI injection sites for a benchmark.")
    parser.add_argument("--profile", required=True, help="Path to bamboo.profile.txt")
    parser.add_argument("--ir", required=True, help="Path to LLVM IR with bamboo_index metadata")
    parser.add_argument("--output-dir", required=True, help="Directory for reports")
    parser.add_argument("--benchmark", default="", help="Benchmark name (optional)")
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    profile_path = Path(args.profile)
    ir_path = Path(args.ir)
    output_dir = Path(args.output_dir)
    output_dir.mkdir(parents=True, exist_ok=True)

    entries = load_profile(profile_path)
    static_sites = parse_static_sites(ir_path)

    summary = {}
    if args.benchmark:
        summary["benchmark"] = args.benchmark
    summary.update(summarize_profile(entries))
    summary.update(summarize_static_sites(static_sites))

    summary_path = output_dir / "site_summary.json"
    summary_path.write_text(json.dumps(summary, indent=2), encoding="utf-8")
    write_static_csv(output_dir / "static_sites.csv", static_sites)

    print(f"Wrote {summary_path}")
    print(f"Wrote {output_dir / 'static_sites.csv'}")


if __name__ == "__main__":
    main()
