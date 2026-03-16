#!/usr/bin/env python3
import argparse
import csv
import re
from collections import Counter
from pathlib import Path


BENCH_DIRS = [
    "layout-sycl-debugscale-r1",
    "matrix-rotate-sycl-prod-r1",
    "jacobi-sycl",
    "dense-embedding-sycl",
    "pathfinder-sycl",
    "entropy-sycl",
    "colorwheel-sycl",
    "randomAccess-sycl",
]

METRIC_PAT = re.compile(r"^METRIC\s+(\S+?)=(.+)$")
RUN_STATUS_PAT = re.compile(r"\[run\] end .* status=(\d+)")
TIMEOUT_STATUS_PAT = re.compile(r"\[timeout\].*status=(\d+)")
HANG_RESULT_PAT = re.compile(r"\[hang-timeout\].*result=([^\s]+)")


def output_path(directory, stem, suffix):
    filename = "%s_%s.csv" % (stem[:-4], suffix)
    path = directory / filename
    if path.exists():
        raise FileExistsError(str(path))
    return path


def canonical_bench_dir(results_root, bench_dir):
    name = bench_dir.name
    if name.endswith("-sycl"):
        return bench_dir
    if "-sycl-" in name:
        candidate = results_root / (name.split("-sycl-", 1)[0] + "-sycl")
        if candidate.exists():
            return candidate
    return bench_dir


def load_csv_by_key(path, key_field):
    if not path.exists():
        return {}
    with path.open(newline="", encoding="utf-8", errors="replace") as handle:
        reader = csv.DictReader(handle)
        return {row[key_field]: row for row in reader}


def load_worklist_by_pair(path):
    with path.open(newline="", encoding="utf-8", errors="replace") as handle:
        reader = csv.DictReader(handle)
        return {(row["site_id"], row["bit_index"]): row for row in reader}


def classify_raw(raw_result):
    raw_upper = raw_result.upper()
    if raw_upper.startswith("MASKED:FLAG"):
        return "MASKED_FLAGGED"
    if (
        raw_upper.startswith("MASKED:NO-FLAG")
        or raw_upper.startswith("MASKED:NOT-FLAGGED")
        or raw_upper.startswith("MASKED:UNFLAGGED")
    ):
        return "MASKED_UNFLAGGED"
    if raw_upper.startswith("SDC:FLAG"):
        return "SDC_FLAGGED"
    if (
        raw_upper.startswith("SDC:NOT-FLAGGED")
        or raw_upper.startswith("SDC:NO-FLAG")
        or raw_upper.startswith("SDC:UNFLAGGED")
    ):
        return "SDC_NOTFLAGGED"
    if "TIMEOUT" in raw_upper or "HANG" in raw_upper:
        return "FAILURE_HANG"
    return "FAILURE_NONHANG"


def parse_output(out_path, err_path):
    out_text = out_path.read_text(errors="replace")
    err_text = err_path.read_text(errors="replace") if err_path.exists() else ""
    raw_result = ""
    metrics = {}
    exit_code = ""
    for line in out_text.splitlines():
        metric_match = METRIC_PAT.match(line)
        if metric_match:
            metrics[metric_match.group(1)] = metric_match.group(2)
            continue
        if "[compare] end" in line and "result=" in line:
            raw_result = line.split("result=", 1)[1].strip()
        elif line.startswith("Result: "):
            raw_result = line.split("Result: ", 1)[1].strip()
        else:
            run_match = RUN_STATUS_PAT.search(line)
            if run_match:
                exit_code = run_match.group(1)
            timeout_match = TIMEOUT_STATUS_PAT.search(line)
            if timeout_match and not exit_code:
                exit_code = timeout_match.group(1)
            hang_match = HANG_RESULT_PAT.search(line)
            if hang_match:
                raw_result = hang_match.group(1)
    if not raw_result:
        raw_result = "FAILURE:NONHANG"
    normalized_result = classify_raw(raw_result)
    dump_present = "snapshot written" in out_text.lower()
    failure_kind = ""
    failure_signal = ""
    raw_upper = raw_result.upper()
    err_upper = err_text.upper()
    if normalized_result == "FAILURE_HANG":
        failure_kind = "hang"
        failure_signal = "timeout"
    elif normalized_result == "FAILURE_NONHANG":
        if "SEGMENTATION FAULT FROM GPU" in out_text.upper() or "ABORTING" in out_text.upper():
            failure_kind = "gpu_abort"
            failure_signal = "gpu_segmentation_fault"
        elif "COULD NOT LOAD ZE LIBRARY" in err_upper or "COULD NOT LOAD ZE LIBRARY" in out_text.upper():
            failure_kind = "due_no_output"
            failure_signal = "ze_loader"
        elif exit_code:
            failure_kind = "due_no_output" if not dump_present else "other"
            failure_signal = "exit_%s" % exit_code
        else:
            failure_kind = "other"
            failure_signal = "no_result_marker"
    return {
        "raw_result": raw_result,
        "normalized_result": normalized_result,
        "exit_code": exit_code,
        "dump_present": "1" if dump_present else "0",
        "failure_kind": failure_kind,
        "failure_signal": failure_signal,
        "metrics": metrics,
    }


def summarize_bench(results_root, bench_dir, suffix):
    canonical_dir = canonical_bench_dir(results_root, bench_dir)
    worklist = load_worklist_by_pair(bench_dir / "worklist.csv")
    metadata = load_csv_by_key(canonical_dir / "sites_metadata.csv", "site_id")
    metric_keys = [
        "metric_abs_max",
        "metric_mean_abs",
        "metric_rmse",
        "metric_max_rel",
        "metric_mean_rel",
        "metric_p95_abs",
        "metric_p99_abs",
        "metric_num_bad",
        "metric_frac_bad",
        "metric_max_ulp",
        "metric_mean_ulp",
        "metric_size_bytes",
    ]
    fieldnames = [
        "site_id",
        "bit_index",
        "raw_result",
        "normalized_result",
        "exit_code",
        "dump_present",
        "failure_kind",
        "failure_signal",
        "site_class",
        "operand_index",
        "opcode",
        "type_kind",
        "bitwidth",
        "function",
        "source_file",
        "source_line",
        "source_column",
        "signature_ordinal",
        "semantic_key",
        "phase",
        "has_out",
        "has_err",
    ] + metric_keys
    counts = Counter()
    rows = []
    pair_pat = re.compile(r"site(\d+)_bit(\d+)\.out$")
    for out_path in sorted(bench_dir.glob("site*_bit*.out")):
        match = pair_pat.match(out_path.name)
        if not match:
            continue
        site_id, bit_index = match.group(1), match.group(2)
        err_path = bench_dir / ("site%s_bit%s.err" % (site_id, bit_index))
        parsed = parse_output(out_path, err_path)
        wl = worklist.get((site_id, bit_index), {})
        meta = metadata.get(site_id, {})
        phase = bench_dir.name
        row = {
            "site_id": site_id,
            "bit_index": bit_index,
            "raw_result": parsed["raw_result"],
            "normalized_result": parsed["normalized_result"],
            "exit_code": parsed["exit_code"],
            "dump_present": parsed["dump_present"],
            "failure_kind": parsed["failure_kind"],
            "failure_signal": parsed["failure_signal"],
            "site_class": wl.get("site_class", meta.get("site_class", "")),
            "operand_index": wl.get("operand_index", meta.get("operand_index", "")),
            "opcode": wl.get("opcode", meta.get("opcode", "")),
            "type_kind": wl.get("type_kind", meta.get("type_kind", "")),
            "bitwidth": wl.get("bitwidth", meta.get("bitwidth", "")),
            "function": meta.get("function", ""),
            "source_file": meta.get("source_file", ""),
            "source_line": meta.get("source_line", ""),
            "source_column": meta.get("source_column", ""),
            "signature_ordinal": meta.get("signature_ordinal", ""),
            "semantic_key": meta.get("semantic_key", ""),
            "phase": phase,
            "has_out": "1",
            "has_err": "1" if err_path.exists() else "0",
        }
        for key in metric_keys:
            row[key] = parsed["metrics"].get(key, "")
        counts[parsed["normalized_result"]] += 1
        rows.append(row)

    results_csv = output_path(bench_dir, "normalized_results.csv", suffix)
    with results_csv.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)

    counts_csv = output_path(bench_dir, "normalized_counts.csv", suffix)
    with counts_csv.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.writer(handle)
        writer.writerow(["normalized_result", "count"])
        for key in [
            "MASKED_FLAGGED",
            "MASKED_UNFLAGGED",
            "SDC_FLAGGED",
            "SDC_NOTFLAGGED",
            "FAILURE_HANG",
            "FAILURE_NONHANG",
        ]:
            writer.writerow([key, counts[key]])
    return counts


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--results-root",
        default="/home/mdunlavy/GPU_FI/HeCBench/results/llvm17_inject",
    )
    parser.add_argument("--bench-dir", action="append", dest="bench_dirs", default=[])
    parser.add_argument("--suffix", required=True)
    args = parser.parse_args()

    results_root = Path(args.results_root)
    bench_names = args.bench_dirs or BENCH_DIRS
    aggregate = Counter()
    for bench_name in bench_names:
        bench_dir = results_root / bench_name
        if not bench_dir.exists():
            continue
        aggregate.update(summarize_bench(results_root, bench_dir, args.suffix))

    aggregate_path = results_root / ("normalized_campaign_counts_%s.csv" % args.suffix)
    if aggregate_path.exists():
        raise FileExistsError(str(aggregate_path))
    with aggregate_path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.writer(handle)
        writer.writerow(["normalized_result", "count"])
        for key in [
            "MASKED_FLAGGED",
            "MASKED_UNFLAGGED",
            "SDC_FLAGGED",
            "SDC_NOTFLAGGED",
            "FAILURE_HANG",
            "FAILURE_NONHANG",
        ]:
            writer.writerow([key, aggregate[key]])


if __name__ == "__main__":
    main()
