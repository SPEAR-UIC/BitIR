#!/usr/bin/env python3
import argparse
from pathlib import Path


def unquote(value):
    value = value.strip()
    if len(value) >= 2 and value[0] == '"' and value[-1] == '"':
        return value[1:-1].replace('\\"', '"').replace("\\\\", "\\")
    return value


def load_outputs(path):
    outputs = []
    current = None
    for raw in path.read_text(encoding="utf-8").splitlines():
        line = raw.rstrip()
        stripped = line.strip()
        if stripped.startswith("- "):
            if current:
                outputs.append(current)
            current = {}
            stripped = stripped[2:]
            if ":" in stripped:
                key, value = stripped.split(":", 1)
                current[key.strip()] = unquote(value)
        elif current is not None and ":" in stripped:
            key, value = stripped.split(":", 1)
            current[key.strip()] = unquote(value)
    if current:
        outputs.append(current)
    return outputs


def main():
    parser = argparse.ArgumentParser(description="Query a BitIR golden-output key")
    parser.add_argument("--key", required=True)
    parser.add_argument("--benchmark", required=True)
    parser.add_argument("--model", required=True)
    parser.add_argument("--field", choices=["compare_mode", "strategy", "status"], required=True)
    args = parser.parse_args()

    key_path = Path(args.key)
    for item in load_outputs(key_path):
        if item.get("benchmark") == args.benchmark and item.get("model") == args.model:
            if args.field == "compare_mode":
                print("text" if item.get("strategy") == "stdout_text" else "exact")
            else:
                print(item.get(args.field, ""))
            return 0
    raise SystemExit(f"missing golden-output key entry for {args.benchmark}-{args.model}")


if __name__ == "__main__":
    raise SystemExit(main())
