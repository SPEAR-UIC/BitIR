#!/usr/bin/env python3
import argparse
import csv
import re
from pathlib import Path


def unquote(value):
    value = value.strip()
    if len(value) >= 2 and value[0] == '"' and value[-1] == '"':
        return value[1:-1].replace('\\"', '"').replace("\\\\", "\\")
    return value


def load_golden_key(path):
    items = {}
    current = None
    for raw in path.read_text(encoding="utf-8").splitlines():
        stripped = raw.strip()
        if stripped.startswith("- "):
            if current:
                items[current["benchmark"]] = current
            current = {}
            stripped = stripped[2:]
        if current is not None and ":" in stripped:
            key, value = stripped.split(":", 1)
            current[key.strip()] = unquote(value)
    if current:
        items[current["benchmark"]] = current
    return items


def collect_logs(log_root):
    text = []
    for path in sorted(Path(log_root).glob("OUT_*")):
        try:
            text.append(path.read_text(encoding="utf-8", errors="replace"))
        except OSError:
            continue
    return "\n".join(text)


def collect_result_status(results_root):
    status = {}
    for path in sorted(Path(results_root).glob("*/**/*_summary.csv")):
        try:
            with path.open(newline="", encoding="utf-8") as handle:
                reader = csv.DictReader(handle)
                for row in reader:
                    if row.get("site_id") == "-1":
                        bench = path.name.split("_", 1)[0]
                        status[bench] = row.get("result", "")
        except OSError:
            continue
    return status


def main():
    parser = argparse.ArgumentParser(description="Summarize qualification logs into a support matrix")
    parser.add_argument("--golden-key", required=True)
    parser.add_argument("--logs", default=".")
    parser.add_argument("--results", default="results")
    parser.add_argument("--output", required=True)
    args = parser.parse_args()

    profiles = load_golden_key(Path(args.golden_key))
    logs = collect_logs(args.logs)
    baseline = collect_result_status(args.results)

    rows = []
    for bench, item in sorted(profiles.items()):
        model = item.get("model", "")
        target = f"{bench}-{model}"
        built = "yes" if re.search(rf"Built target {re.escape(target)}\b", logs) else ""
        build_failed = "yes" if re.search(rf"{re.escape(target)}.*(?:Error|error)|{re.escape(bench)}.*gmake.*Error", logs) else ""
        rows.append(
            {
                "benchmark": bench,
                "model": model,
                "profile_status": item.get("status", ""),
                "output_class": item.get("output_class", ""),
                "strategy": item.get("strategy", ""),
                "support": item.get("support", ""),
                "build_passed": built,
                "build_failed": build_failed,
                "baseline_result": baseline.get(bench, ""),
                "reason": item.get("reason", ""),
            }
        )

    output = Path(args.output)
    output.parent.mkdir(parents=True, exist_ok=True)
    with output.open("w", newline="", encoding="utf-8") as handle:
        fieldnames = [
            "benchmark",
            "model",
            "profile_status",
            "output_class",
            "strategy",
            "support",
            "build_passed",
            "build_failed",
            "baseline_result",
            "reason",
        ]
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)
    print(output)


if __name__ == "__main__":
    main()
