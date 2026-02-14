#!/usr/bin/env python3
import csv
import glob
import io
import os
import re
from collections import defaultdict


ROOT = "HeCBench/results/llvm17_inject"
BENCHES = [
    "colorwheel",
    "dense-embedding",
    "entropy",
    "jacobi",
    "layout",
    "matrix-rotate",
    "pathfinder",
    "randomAccess",
]
PHASES = [
    ("float", "worklist_sycl_aligned.csv"),
    ("operand", "worklist_operand_sycl_aligned.csv"),
    ("pointer", "worklist_pointer_sycl_aligned.csv"),
]

SITE_RE = re.compile(r"site(\d+)_bit(\d+)\.out$")
RESULT_RE = re.compile(r"^Result:\s+(\S+)\s+\(exit\s+([^)]+)\)", re.MULTILINE)
PLUGIN_RE = re.compile(r"plugin.*too short|corrupt plugin|plugin load", re.IGNORECASE)
FAIL_HINT_RE = re.compile(r"(error|failed|segmentation|invalid|exception)", re.IGNORECASE)

METRIC_KEYS = [
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
    "metric_ham_bits",
    "metric_ham_bytes",
    "metric_size_bytes",
]


def parse_pair(out_path, err_path):
    site_bit = SITE_RE.search(os.path.basename(out_path))
    if not site_bit:
        return None
    site_id = int(site_bit.group(1))
    bit_index = int(site_bit.group(2))

    out_text = ""
    err_text = ""
    if os.path.exists(out_path):
        with open(out_path, "r", errors="ignore") as f:
            out_text = f.read()
    if os.path.exists(err_path):
        with open(err_path, "r", errors="ignore") as f:
            err_text = f.read()

    err_lines = [ln.strip() for ln in err_text.splitlines() if ln.strip()]
    err_nontrivial = False
    if err_lines:
        err_nontrivial = not all("err=no error" in ln.lower() for ln in err_lines)

    plugin_corrupt = bool(PLUGIN_RE.search(out_text) or PLUGIN_RE.search(err_text))

    outcome = "FAILURE"
    exit_code = ""
    m = RESULT_RE.search(out_text)
    if err_nontrivial:
        outcome = "FAILURE"
        exit_code = "stderr_nontrivial"
    elif m:
        outcome = m.group(1).upper()
        exit_code = m.group(2).strip()
    elif "compare_ok" in out_text or "compare_exact" in out_text:
        outcome = "MASKED"
    elif "compare_mismatch" in out_text or "mismatch" in out_text:
        outcome = "SDC"
    elif FAIL_HINT_RE.search(out_text) or FAIL_HINT_RE.search(err_text):
        outcome = "FAILURE"
    elif not out_text.strip():
        outcome = "FAILURE"
        exit_code = "empty_out"
    else:
        outcome = "FAILURE"
        exit_code = "parse_unknown"

    metrics = {k: "" for k in METRIC_KEYS}
    for line in out_text.splitlines():
        for key in METRIC_KEYS:
            prefix = key + "="
            if line.startswith(prefix):
                metrics[key] = line[len(prefix) :].strip()
                break

    return {
        "site_id": site_id,
        "bit_index": bit_index,
        "result": outcome,
        "exit_code": exit_code,
        "stdout": out_path,
        "stderr": err_path if os.path.exists(err_path) and os.path.getsize(err_path) > 0 else "",
        "dump": "",
        "plugin_corrupt": plugin_corrupt,
        **metrics,
    }


def read_worklist_pairs(path):
    pairs = []
    if not os.path.exists(path):
        return pairs
    with open(path, "rb") as f:
        raw = f.read().replace(b"\x00", b"")
    r = csv.DictReader(io.StringIO(raw.decode("utf-8", errors="replace")))
    for row in r:
        try:
            s = int(row["site_id"])
            b = int(row["bit_index"])
        except Exception:
            continue
        pairs.append((s, b, row))
    return pairs


def main():
    totals = defaultdict(int)
    for bench in BENCHES:
        for phase, sycl_wl_name in PHASES:
            phase_dir = os.path.join(ROOT, bench, phase)
            if not os.path.isdir(phase_dir):
                continue

            out_files = sorted(glob.glob(os.path.join(phase_dir, "site*_bit*.out")))
            rows = []
            done_pairs = set()
            plugin_pairs = set()

            sycl_wl = os.path.join(ROOT, f"{bench}-sycl", sycl_wl_name)
            wl_rows = read_worklist_pairs(sycl_wl)
            wl_pairs = {(s, b) for s, b, _ in wl_rows}
            if not wl_pairs:
                print(f"{bench}/{phase}: missing worklist {sycl_wl}, skipping")
                continue
            extras_outside_worklist = 0

            for out_path in out_files:
                base = os.path.basename(out_path)
                err_path = os.path.join(phase_dir, base.replace(".out", ".err"))
                parsed = parse_pair(out_path, err_path)
                if not parsed:
                    continue
                pair = (parsed["site_id"], parsed["bit_index"])
                if pair not in wl_pairs:
                    extras_outside_worklist += 1
                    continue
                done_pairs.add(pair)
                if parsed["plugin_corrupt"]:
                    plugin_pairs.add(pair)
                rows.append(parsed)

            rows.sort(key=lambda r: (r["site_id"], r["bit_index"]))
            summary_path = os.path.join(phase_dir, "summary.csv")
            with open(summary_path, "w", newline="") as f:
                w = csv.writer(f)
                w.writerow(
                    [
                        "site_id",
                        "bit_index",
                        "result",
                        "exit_code",
                        "stdout",
                        "stderr",
                        "dump",
                        *METRIC_KEYS,
                    ]
                )
                for r in rows:
                    w.writerow(
                        [
                            r["site_id"],
                            r["bit_index"],
                            r["result"],
                            r["exit_code"],
                            r["stdout"],
                            r["stderr"],
                            r["dump"],
                            *[r[k] for k in METRIC_KEYS],
                        ]
                    )

            counts = defaultdict(int)
            for r in rows:
                counts[r["result"]] += 1
            counts_path = os.path.join(phase_dir, "summary_counts.txt")
            with open(counts_path, "w") as f:
                f.write(f"total={len(rows)}\n")
                f.write(f"worklist_total={len(wl_pairs)}\n")
                for k in ("MASKED", "SDC", "FAILURE", "UNKNOWN"):
                    f.write(f"{k}={counts[k]}\n")
                f.write(f"PLUGIN_CORRUPT={len(plugin_pairs)}\n")
                f.write(f"EXTRA_OUTSIDE_WORKLIST={extras_outside_worklist}\n")

            missing_rows = []
            for s, b, row in wl_rows:
                pair = (s, b)
                # Do not requeue plugin-corrupt pairs.
                if pair in plugin_pairs:
                    continue
                if pair not in done_pairs:
                    missing_rows.append(row)

            missing_path = os.path.join(phase_dir, "worklist_missing.csv")
            with open(missing_path, "w", newline="") as f:
                if wl_rows:
                    fieldnames = list(wl_rows[0][2].keys())
                else:
                    fieldnames = ["index", "site_id", "bit_index", "bitwidth", "type_kind", "opcode"]
                w = csv.DictWriter(f, fieldnames=fieldnames)
                w.writeheader()
                for i, row in enumerate(missing_rows, start=1):
                    row = dict(row)
                    if "index" in row:
                        row["index"] = str(i)
                    w.writerow(row)

            print(
                f"{bench}/{phase}: rebuilt={len(rows)}/{len(wl_pairs)} missing={len(missing_rows)} "
                f"plugin_corrupt_excluded={len(plugin_pairs)} extras_outside_worklist={extras_outside_worklist}"
            )
            totals["rebuilt"] += len(rows)
            totals["missing"] += len(missing_rows)
            totals["plugin"] += len(plugin_pairs)

    print(
        f"TOTAL rebuilt={totals['rebuilt']} missing={totals['missing']} "
        f"plugin_corrupt_excluded={totals['plugin']}"
    )


if __name__ == "__main__":
    main()
