#!/usr/bin/env python3

import csv
import json
import re
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


def read_key_values(path: Path):
    data = {}
    if not path.exists():
        return data
    for raw in path.read_text(encoding="utf-8", errors="replace").splitlines():
        if "=" not in raw:
            continue
        key, value = raw.split("=", 1)
        data[key.strip()] = value.strip()
    return data


def collect_mutated_lines(path: Path):
    if not path.exists():
        return []
    matches = []
    for line in path.read_text(encoding="utf-8", errors="replace").splitlines():
        stripped = line.strip()
        if "fi_" in stripped:
            matches.append(stripped)
    return matches


def classify_consumer(line: str, value_name: str, lines=None):
    stripped = line.strip()
    if stripped.startswith("br "):
        return "branch"
    defined_value = ""
    define_match = re.match(r"(%[-A-Za-z0-9_.$]+)\s*=", stripped)
    if define_match:
        defined_value = define_match.group(1)
    if ("icmp " in stripped or "fcmp " in stripped) and defined_value and lines:
        use_re = re.compile(r"(?<![-A-Za-z0-9_.$])" + re.escape(defined_value) + r"(?![-A-Za-z0-9_.$])")
        for later in lines:
            later_stripped = later.strip()
            if use_re.search(later_stripped) and (
                later_stripped.startswith("br ") or later_stripped.startswith("switch ")
            ):
                return "branch"
    if "getelementptr" in stripped:
        return "address_calc"
    if stripped.startswith("load ") and value_name in stripped:
        return "address_calc"
    if stripped.startswith("store "):
        operands = stripped.split(",", 1)
        if operands and value_name in operands[0]:
            return "store_data"
        if value_name in stripped:
            return "address_calc"
    if stripped.startswith("switch ") or stripped.startswith("indirectbr "):
        return "branch"
    return "other"


def derive_fault_path(path: Path):
    if not path.exists():
        return {
            "mutated_instruction": "",
            "mutated_value": "",
            "first_direct_consumer": "",
            "consumer_class": "",
        }

    lines = path.read_text(encoding="utf-8", errors="replace").splitlines()
    first_fi_idx = -1
    last_chain_idx = -1
    mutated_instruction = ""
    mutated_value = ""
    for idx, line in enumerate(lines):
        stripped = line.strip()
        if "fi_" not in stripped:
            continue
        match = re.match(r"(%[-A-Za-z0-9_.$]+)\s*=", stripped)
        if not match:
            continue
        first_fi_idx = idx
        break

    if first_fi_idx >= 0:
        for idx in range(first_fi_idx, len(lines)):
            stripped = lines[idx].strip()
            match = re.match(r"(%fi[-A-Za-z0-9_.$]*)\s*=", stripped)
            if not match:
                break
            last_chain_idx = idx
            mutated_value = match.group(1)
            if " xor " in stripped:
                mutated_instruction = stripped
        if not mutated_instruction and last_chain_idx >= 0:
            mutated_instruction = lines[first_fi_idx].strip()
            match = re.match(r"(%[-A-Za-z0-9_.$]+)\s*=", mutated_instruction)
            if match:
                mutated_value = match.group(1)

    if not mutated_value:
        for idx, line in enumerate(lines):
            stripped = line.strip()
            if "fi_" not in stripped:
                continue
            match = re.match(r"(%[-A-Za-z0-9_.$]+)\s*=", stripped)
            if not match:
                continue
            last_chain_idx = idx
            mutated_instruction = stripped
            mutated_value = match.group(1)
            break

    first_consumer = ""
    consumer_class = ""
    if mutated_value:
        value_re = re.compile(r"(?<![-A-Za-z0-9_.$])" + re.escape(mutated_value) + r"(?![-A-Za-z0-9_.$])")
        for offset, line in enumerate(lines[last_chain_idx + 1 :], start=last_chain_idx + 1):
            stripped = line.strip()
            if not stripped or stripped.startswith(";"):
                continue
            if re.match(r"\s*" + re.escape(mutated_value) + r"\s*=", line):
                continue
            if value_re.search(stripped):
                first_consumer = stripped
                consumer_class = classify_consumer(stripped, mutated_value, lines[offset + 1 :])
                break

    return {
        "mutated_instruction": mutated_instruction,
        "mutated_value": mutated_value,
        "first_direct_consumer": first_consumer,
        "consumer_class": consumer_class,
    }


def collect_use_chain(path: Path, root_value: str, max_depth: int = 3, max_uses: int = 40):
    if not path.exists() or not root_value:
        return []
    lines = path.read_text(encoding="utf-8", errors="replace").splitlines()
    seen = set([root_value])
    frontier = [(root_value, 0)]
    records = []
    while frontier and len(records) < max_uses:
        value, depth = frontier.pop(0)
        value_re = re.compile(r"(?<![-A-Za-z0-9_.$])" + re.escape(value) + r"(?![-A-Za-z0-9_.$])")
        for idx, line in enumerate(lines, start=1):
            stripped = line.strip()
            if not stripped or stripped.startswith(";"):
                continue
            define_match = re.match(r"(%[-A-Za-z0-9_.$]+)\s*=", stripped)
            if define_match and define_match.group(1) == value:
                continue
            if not value_re.search(stripped):
                continue
            defined = define_match.group(1) if define_match else ""
            cclass = classify_consumer(stripped, value, [])
            records.append({
                "depth": str(depth + 1),
                "input_value": value,
                "defined_value": defined,
                "line_number": str(idx),
                "consumer_class": cclass,
                "instruction": stripped,
            })
            if defined and defined not in seen and depth + 1 < max_depth:
                seen.add(defined)
                frontier.append((defined, depth + 1))
            if len(records) >= max_uses:
                break
    return records


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
    injection_row = read_single_csv_row(trace_dir / "injection_metadata_row.csv")
    worklist_row = read_single_csv_row(trace_dir / "worklist_row.csv")
    raw_outcome = read_key_values(trace_dir / "raw_outcome.txt")
    mutated_lines = collect_mutated_lines(trace_dir / "device.injected.ll")
    fault_path = derive_fault_path(trace_dir / "device.injected.ll")
    use_chain = collect_use_chain(trace_dir / "device.injected.ll", fault_path["mutated_value"])

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
        "injection_site_class": injection_row.get("site_class", ""),
        "injection_opcode": injection_row.get("opcode", ""),
        "injection_type_kind": injection_row.get("type_kind", ""),
        "injection_bitwidth": injection_row.get("bitwidth", ""),
        "injection_function": injection_row.get("function", ""),
        "injection_source_line": injection_row.get("source_line", ""),
        "injection_source_column": injection_row.get("source_column", ""),
        "injection_signature_ordinal": injection_row.get("signature_ordinal", ""),
        "mutated_ir_instruction": " || ".join(mutated_lines),
        "mutated_value": fault_path["mutated_value"],
        "first_direct_consumer": fault_path["first_direct_consumer"],
        "consumer_class": fault_path["consumer_class"],
        "final_observed_outcome": raw_outcome.get("result", ""),
        "device_ir_path": "device.ll" if (trace_dir / "device.ll").exists() else "",
        "device_injected_bc_path": "device.injected.bc" if (trace_dir / "device.injected.bc").exists() else "",
        "device_injected_ll_path": "device.injected.ll" if (trace_dir / "device.injected.ll").exists() else "",
        "pre_injection_ll_path": "pre_injection.ll" if (trace_dir / "pre_injection.ll").exists() else "",
        "post_injection_ll_path": "post_injection.ll" if (trace_dir / "post_injection.ll").exists() else "",
        "amdgpu_objdump_path": "device.amdgpu.objdump.txt" if (trace_dir / "device.amdgpu.objdump.txt").exists() else "",
        "amdgpu_code_object_objdump_path": "device.amdgpu.code-object-objdump.txt"
        if (trace_dir / "device.amdgpu.code-object-objdump.txt").exists()
        else "",
        "stdout_path": manifest.get("run_out", ""),
        "stderr_path": manifest.get("run_err", ""),
        "use_chain_path": "use_chain.csv" if use_chain else "",
    }

    if use_chain:
        with (trace_dir / "use_chain.csv").open("w", encoding="utf-8", newline="") as handle:
            writer = csv.DictWriter(handle, fieldnames=["depth", "input_value", "defined_value", "line_number", "consumer_class", "instruction"])
            writer.writeheader()
            writer.writerows(use_chain)

    csv_path = trace_dir / "diag_records.csv"
    with csv_path.open("w", encoding="utf-8", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=list(record.keys()))
        writer.writeheader()
        writer.writerow(record)

    json_path = trace_dir / "diag.json"
    json_path.write_text(json.dumps(record, indent=2, sort_keys=True) + "\n", encoding="utf-8")

    fault_path_txt = trace_dir / "fault_path.txt"
    fault_path_txt.write_text(
        "\n".join(
            [
                f"bench={record['benchmark']}",
                f"site_id={record['site_id']}",
                f"bit_index={record['bit_index']}",
                f"selected_site={record['site_class']},{record['opcode']},{record['type_kind']},{record['bitwidth']},{record['function']},{record['source_line']},{record['source_column']},{record['signature_ordinal']}",
                f"injection_site={record['injection_site_class']},{record['injection_opcode']},{record['injection_type_kind']},{record['injection_bitwidth']},{record['injection_function']},{record['injection_source_line']},{record['injection_source_column']},{record['injection_signature_ordinal']}",
                f"mutated_instruction={fault_path['mutated_instruction']}",
                f"mutated_value={record['mutated_value']}",
                f"flipped_bit={record['bit_index']}",
                f"first_direct_consumer={record['first_direct_consumer']}",
                f"consumer_class={record['consumer_class']}",
                f"use_chain_path={record['use_chain_path']}",
                f"final_observed_outcome={record['final_observed_outcome']}",
            ]
        )
        + "\n",
        encoding="utf-8",
    )


if __name__ == "__main__":
    main()
