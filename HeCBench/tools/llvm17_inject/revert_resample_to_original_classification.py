#!/usr/bin/env python3
import csv
import glob
import os
import re


ORIG_ROOT = os.path.join("HeCBench", "results", "llvm17_inject")
TARGET_ROOTS = [
    os.path.join("HeCBench", "results", "llvm17_inject_failure_rerun"),
    os.path.join("HeCBench", "results", "llvm17_inject_failure_resample_next"),
]
RESULT_RE = re.compile(r"^Result:\s+\S+\s+\(exit\s+[^)]+\)$")


def load_original_maps():
    lookup = {}
    for summary_path in glob.glob(os.path.join(ORIG_ROOT, "*", "*", "summary.csv")):
        parts = summary_path.split(os.sep)
        bench, phase = parts[-3], parts[-2]
        phase_map = {}
        with open(summary_path, newline="") as fh:
            for row in csv.DictReader(fh):
                key = (row.get("site_id", ""), row.get("bit_index", ""))
                phase_map[key] = row
        lookup[(bench, phase)] = phase_map
    return lookup


def rewrite_out_file(out_path, result, exit_code):
    if not out_path or not os.path.isfile(out_path):
        return
    try:
        with open(out_path, "r", errors="ignore") as fh:
            lines = fh.readlines()
    except OSError:
        return
    replacement = f"Result: {result} (exit {exit_code})\n"
    replaced = False
    for idx, line in enumerate(lines):
        if RESULT_RE.match(line.strip()):
            lines[idx] = replacement
            replaced = True
    if not replaced:
        lines.append(replacement)
    if not any("[revert] restored original classification\n" == ln for ln in lines):
        lines.append("[revert] restored original classification from base summary\n")
    with open(out_path, "w") as fh:
        fh.writelines(lines)


def process_summary(summary_path, original_map):
    with open(summary_path, newline="") as fh:
        rows = list(csv.DictReader(fh))
        fieldnames = list(rows[0].keys()) if rows else []
    if not rows:
        return 0
    changed = 0
    for row in rows:
        if row.get("result") == "BASELINE":
            continue
        key = (row.get("site_id", ""), row.get("bit_index", ""))
        orig = original_map.get(key)
        if not orig:
            continue
        new_result = orig.get("result", row.get("result", ""))
        new_exit = orig.get("exit_code", row.get("exit_code", ""))
        if row.get("result") == new_result and row.get("exit_code") == new_exit:
            continue
        row["result"] = new_result
        row["exit_code"] = new_exit
        if "failure_kind" in row:
          row["failure_kind"] = orig.get("failure_kind", "")
        if "failure_signal" in row:
          row["failure_signal"] = orig.get("failure_signal", "")
        rewrite_out_file(row.get("stdout", ""), new_result, new_exit)
        changed += 1
    with open(summary_path, "w", newline="") as fh:
        writer = csv.DictWriter(fh, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)
    return changed


def main():
    original_lookup = load_original_maps()
    total_changed = 0
    for root in TARGET_ROOTS:
        for summary_path in glob.glob(os.path.join(root, "*", "*", "summary*.csv")):
            parts = summary_path.split(os.sep)
            bench, phase = parts[-3], parts[-2]
            original_map = original_lookup.get((bench, phase))
            if not original_map:
                continue
            changed = process_summary(summary_path, original_map)
            if changed:
                total_changed += changed
                print(f"{summary_path}: reverted={changed}")
    print(f"total_reverted={total_changed}")


if __name__ == "__main__":
    raise SystemExit(main())
