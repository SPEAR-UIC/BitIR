#!/usr/bin/env python3
import argparse
import os
from pathlib import Path


def yaml_quote(value):
    text = str(value)
    return '"' + text.replace("\\", "\\\\").replace('"', '\\"') + '"'


def read_benches(path):
    return [line.strip() for line in path.read_text(encoding="utf-8").splitlines() if line.strip() and not line.startswith("#")]


def write_config(path, base_config, campaign, benches, fault_model, max_injections):
    lines = [
        "extends:",
        f"  - {yaml_quote(base_config)}",
        "",
        "run:",
        f"  campaign: {yaml_quote(campaign)}",
        f"  fault_model: {yaml_quote(fault_model)}",
        "  execution_mode: write-script",
        "",
        "campaigns:",
        f"  {campaign}:",
        "    benchmarks:",
    ]
    lines.extend(f"      - {yaml_quote(bench)}" for bench in benches)
    lines.extend(
        [
            "",
            "fault_models:",
            f"  {fault_model}:",
            "    selection_mode: instruction_pointer",
            "    phase: qualification",
            f"    max_injections: {max_injections}",
            "    run_baseline: 1",
            "    skip_existing: 0",
            "    trace_level: summary",
            "    trace_source_window: 4",
            "",
        ]
    )
    path.write_text("\n".join(lines), encoding="utf-8")


def main():
    parser = argparse.ArgumentParser(description="Generate temporary benchmark qualification YAMLs from chunk files")
    parser.add_argument("--base-config", required=True)
    parser.add_argument("--chunks-dir", required=True)
    parser.add_argument("--output-dir", required=True)
    parser.add_argument("--campaign-prefix", default="qual")
    parser.add_argument("--fault-model", default="qualification_probe")
    parser.add_argument("--max-injections", type=int, default=1)
    args = parser.parse_args()

    base_config = Path(args.base_config).resolve()
    chunks_dir = Path(args.chunks_dir)
    output_dir = Path(args.output_dir)
    output_dir.mkdir(parents=True, exist_ok=True)
    base_config_ref = os.path.relpath(base_config, output_dir.resolve())

    for index, chunk in enumerate(sorted(chunks_dir.glob("*.txt"))):
        benches = read_benches(chunk)
        if not benches:
            continue
        campaign = f"{args.campaign_prefix}_{index:03d}"
        path = output_dir / f"{campaign}.yml"
        write_config(path, base_config_ref, campaign, benches, args.fault_model, args.max_injections)
        print(path)


if __name__ == "__main__":
    main()
