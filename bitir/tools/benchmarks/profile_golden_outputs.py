#!/usr/bin/env python3
import argparse
import re
from pathlib import Path

from benchmark_common import discover_variants, parse_list, read_sources, split_top_level_args


GENERATED_DUMP_MODELS = ("cuda", "hip")
GENERATED_DUMP_CLASSES = ("contiguous_buffer", "scalar", "grid_2d", "multi_buffer", "table_snapshot")


def yaml_quote(value):
    text = str(value)
    if not text:
        return '""'
    if re.match(r"^[A-Za-z0-9_./:+-]+$", text):
        return text
    return '"' + text.replace("\\", "\\\\").replace('"', '\\"') + '"'


def default_adapter_root(benchmark_set):
    bitir_root = Path(__file__).resolve().parents[2]
    return bitir_root / "benchmarks" / benchmark_set / "dump_adapters"


def classify_dump(text):
    lower = text.lower()
    if "dump_path" not in text:
        return None, "no dump_path argument detected"
    if "fwrite" not in text and ".write(" not in text:
        return None, "dump argument exists but no binary write was detected"
    if "tablesize" in lower or "table_size" in lower:
        return "table_snapshot", "detected dump_path with table-sized binary write"
    if re.search(r"\b(width|height|rows|cols)\b", lower) and "fwrite" in text:
        return "grid_2d", "detected dump_path with dimensional metadata"
    writes = len(re.findall(r"\bfwrite\s*\(", text))
    if writes >= 4:
        return "multi_buffer", "detected dump_path with multiple binary writes"
    return "contiguous_buffer", "detected dump_path with binary write"


def find_device_to_host_copies(text):
    calls = []
    pattern = re.compile(r"\b(cudaMemcpy|hipMemcpy|cudaMemcpyAsync|hipMemcpyAsync)\s*\(", re.MULTILINE)
    index = 0
    while True:
        match = pattern.search(text, index)
        if not match:
            break
        pos = match.end()
        depth = 1
        in_string = None
        escape = False
        while pos < len(text) and depth:
            char = text[pos]
            if in_string:
                if escape:
                    escape = False
                elif char == "\\":
                    escape = True
                elif char == in_string:
                    in_string = None
            elif char in ("'", '"'):
                in_string = char
            elif char == "(":
                depth += 1
            elif char == ")":
                depth -= 1
            pos += 1
        args = split_top_level_args(text[match.end(): pos - 1])
        if len(args) >= 4 and args[3].strip() in ("cudaMemcpyDeviceToHost", "hipMemcpyDeviceToHost"):
            calls.append(tuple(args[:4]))
        index = pos
    return calls


def can_generate_dump_adapter(chunks, model):
    if model not in GENERATED_DUMP_MODELS:
        return False
    has_main = False
    has_copy = False
    for _, text in chunks:
        if re.search(r"\bmain\s*\([^)]*\)", text):
            has_main = True
        if find_device_to_host_copies(text):
            has_copy = True
    return has_main and has_copy


def find_sycl_memcopies(text):
    calls = []
    pattern = re.compile(r"\.memcpy\s*\(", re.MULTILINE)
    index = 0
    while True:
        match = pattern.search(text, index)
        if not match:
            break
        pos = match.end()
        depth = 1
        in_string = None
        escape = False
        while pos < len(text) and depth:
            char = text[pos]
            if in_string:
                if escape:
                    escape = False
                elif char == "\\":
                    escape = True
                elif char == in_string:
                    in_string = None
            elif char in ("'", '"'):
                in_string = char
            elif char == "(":
                depth += 1
            elif char == ")":
                depth -= 1
            pos += 1
        args = split_top_level_args(text[match.end(): pos - 1])
        if len(args) >= 3:
            calls.append(tuple(args[:3]))
        index = pos
    return calls


def classify_inferred(text):
    lower = text.lower()
    copies = find_device_to_host_copies(text) + find_sycl_memcopies(text)
    copy_text = " ".join(" ".join(part for part in copy) for copy in copies)
    copy_lower = copy_text.lower()
    if copies:
        if any(token in copy_lower for token in ("tablesize", "table_size", "table size")):
            return "table_snapshot", f"inferred from {len(copies)} device-to-host copy operation(s) involving a table"
        if any(token in copy_lower for token in ("width", "height", "rows", "cols", "nrows", "ncols")):
            return "grid_2d", f"inferred from {len(copies)} device-to-host copy operation(s) with dimensional metadata"
        scalar_copies = [
            copy for copy in copies
            if "&" in copy[0] or re.search(r"sizeof\s*\(\s*(int|float|double|long|size_t|uint\w*)\s*\)", copy[2])
        ]
        if len(copies) == 1 and scalar_copies:
            return "scalar", "inferred from scalar device-to-host copy"
        output_names = re.findall(
            r"\b(?:output|result|res|dst|out|data|table|count|checksum)[A-Za-z0-9_]*\b",
            copy_lower,
        )
        if len(copies) > 1 and len(set(output_names)) > 1:
            return "multi_buffer", f"inferred from {len(copies)} device-to-host copy operations"
        return "contiguous_buffer", f"inferred from {len(copies)} device-to-host copy operation(s)"
    if re.search(r"\b(fwrite|ofstream|fprintf|fopen)\b", text):
        if re.search(r"\b(PASS|FAIL|Checksum|checksum|hash|Final error norm|Structural Similarity Index Measure)\b", text):
            return "text_signature", "inferred from stable stdout signature in file-output benchmark"
        return "external_file", "inferred from file output calls"
    if re.search(r"\b(PASS|FAIL|Checksum|checksum|verify|verification|error)\b", text):
        return "text_signature", "inferred from validation/status text output"
    if re.search(r"\b(printf|std::cout|cout\s*<<)\b", text):
        return "text_signature", "inferred from stdout output"
    return "manual", "no safe output or validation signal detected"


def profile_variant(bench, model, source_dir, text_benchmarks, adapter_root):
    if bench in text_benchmarks or f"{bench}-{model}" in text_benchmarks:
        return {
            "benchmark": bench,
            "model": model,
            "source_dir": str(source_dir),
            "status": "supported",
            "output_class": "text_signature",
            "strategy": "stdout_text",
            "support": "ready",
            "reason": "benchmark configured with compare_mode=text",
        }
    adapter_dir = adapter_root / f"{bench}-{model}"
    scan_dir = adapter_dir if adapter_dir.is_dir() else source_dir
    chunks = read_sources(scan_dir)
    combined = "\n".join(text for _, text in chunks)
    output_class, reason = classify_dump(combined)
    if output_class:
        strategy = "dump_adapter" if adapter_dir.is_dir() else "existing_dump_arg"
        return {
            "benchmark": bench,
            "model": model,
            "source_dir": str(source_dir),
            "adapter_dir": str(adapter_dir) if adapter_dir.is_dir() else "",
            "status": "supported",
            "output_class": output_class,
            "strategy": strategy,
            "support": "ready",
            "dump_arg": "append",
            "reason": reason,
        }
    output_class, reason = classify_inferred(combined)
    if output_class != "manual":
        if output_class == "text_signature":
            return {
                "benchmark": bench,
                "model": model,
                "source_dir": str(source_dir),
                "adapter_dir": "",
                "status": "supported",
                "output_class": output_class,
                "strategy": "stdout_text",
                "support": "ready",
                "reason": reason,
            }
        if output_class in GENERATED_DUMP_CLASSES and can_generate_dump_adapter(chunks, model):
            return {
                "benchmark": bench,
                "model": model,
                "source_dir": str(source_dir),
                "adapter_dir": "",
                "status": "supported",
                "output_class": output_class,
                "strategy": "generated_dump_adapter",
                "support": "generated",
                "dump_arg": "append",
                "reason": reason,
            }
        return {
            "benchmark": bench,
            "model": model,
            "source_dir": str(source_dir),
            "adapter_dir": "",
            "status": "inferred",
            "output_class": output_class,
            "strategy": "needs_dump_adapter",
            "support": "needs_adapter",
            "reason": reason,
        }
    return {
        "benchmark": bench,
        "model": model,
        "source_dir": str(source_dir),
        "adapter_dir": "",
        "status": "unsupported_manual",
        "output_class": "manual",
        "strategy": "none",
        "support": "manual_required",
        "reason": reason,
    }


def write_key(path, benchmark_set, profiles):
    lines = [
        f"benchmark_set: {yaml_quote(benchmark_set)}",
        "generated_by: bitir/tools/benchmarks/profile_golden_outputs.py",
        "outputs:",
    ]
    for item in profiles:
        lines.extend(
            [
                f"  - benchmark: {yaml_quote(item['benchmark'])}",
                f"    model: {yaml_quote(item['model'])}",
                f"    status: {yaml_quote(item['status'])}",
                f"    output_class: {yaml_quote(item['output_class'])}",
                f"    strategy: {yaml_quote(item['strategy'])}",
                f"    support: {yaml_quote(item.get('support', ''))}",
                f"    source_dir: {yaml_quote(item['source_dir'])}",
                f"    adapter_dir: {yaml_quote(item.get('adapter_dir', ''))}",
                f"    reason: {yaml_quote(item['reason'])}",
            ]
        )
        if "dump_arg" in item:
            lines.append(f"    dump_arg: {yaml_quote(item['dump_arg'])}")
    path.write_text("\n".join(lines) + "\n", encoding="utf-8")


def main():
    parser = argparse.ArgumentParser(description="Profile requested benchmark outputs and write a golden-output key")
    parser.add_argument("--benchmark-set", required=True)
    parser.add_argument("--benchmark-root", required=True)
    parser.add_argument("--source-root", default="src")
    parser.add_argument("--benchmarks", required=True)
    parser.add_argument("--models", required=True)
    parser.add_argument("--text-benchmarks", default="")
    parser.add_argument("--output-key", required=True)
    parser.add_argument("--adapter-root")
    parser.add_argument("--allow-unsupported", action="store_true")
    parser.add_argument("--summary", action="store_true")
    args = parser.parse_args()

    benchmark_root = Path(args.benchmark_root).resolve()
    variants = discover_variants(benchmark_root, args.source_root)
    adapter_root = Path(args.adapter_root).resolve() if args.adapter_root else default_adapter_root(args.benchmark_set)
    benches = sorted(variants) if args.benchmarks.strip().lower() == "all" else parse_list(args.benchmarks)
    models = parse_list(args.models)
    text_benchmarks = set(parse_list(args.text_benchmarks))
    profiles = []
    missing = []
    for bench in benches:
        bench_models = sorted(variants.get(bench, {})) if "all" in [m.lower() for m in models] else models
        if not bench_models:
            missing.append(f"{bench}-unknown")
            continue
        for model in bench_models:
            source_dir = variants.get(bench, {}).get(model)
            if not source_dir:
                missing.append(f"{bench}-{model}")
                continue
            profiles.append(profile_variant(bench, model, source_dir, text_benchmarks, adapter_root))

    output_key = Path(args.output_key)
    output_key.parent.mkdir(parents=True, exist_ok=True)
    if missing:
        for variant in missing:
            profiles.append(
                {
                    "benchmark": variant.rsplit("-", 1)[0],
                    "model": variant.rsplit("-", 1)[1],
                    "source_dir": "",
                    "adapter_dir": "",
                    "status": "unsupported_manual",
                    "output_class": "manual",
                    "strategy": "none",
                    "support": "manual_required",
                    "reason": "requested benchmark variant does not exist",
                }
            )
    write_key(output_key, args.benchmark_set, profiles)

    unsupported = [item for item in profiles if item["status"] != "supported"]
    print(f"[golden-key] wrote {output_key}")
    for item in profiles:
        print(
            f"[golden-key] {item['benchmark']}-{item['model']}: "
            f"{item['status']} {item['output_class']} ({item['reason']})"
        )
    if args.summary:
        total = len(profiles)
        non_manual = sum(1 for item in profiles if item["output_class"] != "manual")
        ready = sum(1 for item in profiles if item["status"] == "supported")
        inferred = sum(1 for item in profiles if item["status"] == "inferred")
        manual = total - non_manual
        coverage = (100.0 * non_manual / total) if total else 0.0
        print(
            f"[golden-key] summary total={total} non_manual={non_manual} "
            f"coverage={coverage:.1f}% ready={ready} inferred={inferred} manual={manual}"
        )
    if unsupported and not args.allow_unsupported:
        print("[golden-key] non-ready benchmark output(s) require a generated/reviewed dump adapter or manual key before build/deploy")
        return 2
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
