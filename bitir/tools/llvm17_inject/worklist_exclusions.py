#!/usr/bin/env python3
import csv
import io
import os
import subprocess
import sys


def summary_names_for_target(target):
    if target == "all":
        return ["summary.csv", "summary_operand.csv", "summary_pointer.csv"]
    if target == "operand":
        return ["summary_operand.csv"]
    if target == "pointer":
        return ["summary_pointer.csv"]
    return ["summary.csv"]


def _normalize_pair(row):
    site_id = row.get("site_id", "").strip()
    bit_index = row.get("bit_index", "").strip()
    if not site_id or not bit_index:
        return None
    try:
        return str(int(site_id)), str(int(bit_index))
    except ValueError:
        return None


def _load_pairs_from_text(text, source_label):
    pairs = set()
    reader = csv.DictReader(io.StringIO(text))
    if not reader.fieldnames or "site_id" not in reader.fieldnames or "bit_index" not in reader.fieldnames:
        print(f"[worklist] warning: summary missing site/bit columns: {source_label}", file=sys.stderr)
        return pairs
    for row in reader:
        pair = _normalize_pair(row)
        if pair is not None:
            pairs.add(pair)
    return pairs


def load_excluded_pairs(repo_root, bench, target, summary_paths=None, git_refs=None):
    excluded = set()
    loaded_sources = []
    summary_paths = summary_paths or []
    git_refs = git_refs or []

    for summary_path in summary_paths:
        path = summary_path
        if not os.path.isabs(path):
            path = os.path.join(repo_root, path)
        if not os.path.exists(path):
            print(f"[worklist] warning: exclude summary not found: {path}", file=sys.stderr)
            continue
        with open(path, "r", encoding="utf-8", errors="replace") as fh:
            excluded.update(_load_pairs_from_text(fh.read(), path))
        loaded_sources.append(path)

    summary_names = summary_names_for_target(target)
    for git_ref in git_refs:
        found_any = False
        for summary_name in summary_names:
            rel_path = f"bitir/results/llvm17_inject/{bench}/{summary_name}"
            cmd = ["git", "-C", repo_root, "show", f"{git_ref}:{rel_path}"]
            proc = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            if proc.returncode != 0:
                continue
            stdout = proc.stdout.decode("utf-8", errors="replace") if proc.stdout else ""
            excluded.update(_load_pairs_from_text(stdout, f"{git_ref}:{rel_path}"))
            loaded_sources.append(f"{git_ref}:{rel_path}")
            found_any = True
        if not found_any:
            print(
                f"[worklist] warning: could not load exclude summary from {git_ref} "
                f"for any of {', '.join(summary_names)}",
                file=sys.stderr,
            )

    return excluded, loaded_sources
