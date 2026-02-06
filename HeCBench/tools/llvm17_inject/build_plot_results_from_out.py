#!/usr/bin/env python3
import argparse
import csv
import os


def parse_result(out_path):
    try:
        saw_ok = False
        saw_mismatch = False
        saw_fail = False
        with open(out_path, "r", errors="ignore") as fh:
            for line in fh:
                lower = line.strip().lower()
                if "compare_ok" in lower or lower == "pass":
                    saw_ok = True
                if "compare_mismatch" in lower or "compare_diff" in lower or "mismatch" == lower:
                    saw_mismatch = True
                if "compare_fail" in lower or lower == "fail":
                    saw_fail = True
                if line.startswith("Result:"):
                    parts = line.strip().split()
                    if len(parts) >= 2:
                        return parts[1].upper()
        if saw_ok:
            return "MASKED"
        if saw_mismatch:
            return "SDC"
        if saw_fail:
            return "FAILURE"
    except FileNotFoundError:
        return None
    return None


def main():
    p = argparse.ArgumentParser()
    p.add_argument("--results-dir", required=True)
    p.add_argument("--worklist")
    p.add_argument("--out", required=True)
    p.add_argument("--skip-missing", action="store_true")
    p.add_argument("--scan-only", action="store_true")
    args = p.parse_args()

    results_dir = args.results_dir
    worklist = args.worklist
    out_csv = args.out

    if not args.scan_only and not os.path.exists(worklist):
        raise SystemExit(f"missing worklist: {worklist}")

    rows = []
    if args.scan_only:
        for path in sorted(os.listdir(results_dir)):
            if not path.startswith("site") or "_bit" not in path or not path.endswith(".out"):
                continue
            try:
                site_part, bit_part = path.split("_bit", 1)
                site = int(site_part.replace("site", ""))
                bit = int(bit_part.replace(".out", ""))
            except Exception:
                continue
            res = parse_result(os.path.join(results_dir, path))
            if res is None and args.skip_missing:
                continue
            rows.append((site, bit, res or "UNKNOWN"))
    else:
        with open(worklist, newline="") as fh:
            r = csv.DictReader(fh)
            for row in r:
                try:
                    site = int(row.get("site_id") or row.get("site"))
                    bit = int(row.get("bit_index") or row.get("bit"))
                except Exception:
                    continue
                out_path = os.path.join(results_dir, f"site{site}_bit{bit}.out")
                res = parse_result(out_path)
                if res is None and args.skip_missing:
                    continue
                rows.append((site, bit, res or "UNKNOWN"))

    rows.sort(key=lambda x: (x[0], x[1]))
    os.makedirs(os.path.dirname(out_csv), exist_ok=True)
    with open(out_csv, "w", newline="") as out:
        w = csv.writer(out)
        w.writerow(["site_id", "bit_index", "result"])
        for row in rows:
            w.writerow(row)

    print(f"Wrote {len(rows)} rows to {out_csv}")


if __name__ == "__main__":
    raise SystemExit(main())
