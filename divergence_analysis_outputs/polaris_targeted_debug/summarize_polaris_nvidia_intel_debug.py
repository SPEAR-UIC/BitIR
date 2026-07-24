#!/usr/bin/env python3
import csv
import hashlib
import sys
from pathlib import Path


def sha256_file(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            h.update(chunk)
    return h.hexdigest()


def read_csv(path: Path):
    with path.open(newline="", encoding="utf-8") as handle:
        return list(csv.DictReader(handle))


def trace_manifest_for(result_dir: Path, row: dict) -> Path:
    stdout = Path(row.get("stdout", ""))
    stem = stdout.stem if stdout.name else f"site{row['site_id']}_bit{row['bit_index']}"
    return result_dir / f"{stem}_trace_manifest.txt"


def main() -> int:
    if len(sys.argv) != 3:
        print("usage: summarize_polaris_nvidia_intel_debug.py result_dirs.csv summary.csv", file=sys.stderr)
        return 2

    result_dirs_csv = Path(sys.argv[1])
    output = Path(sys.argv[2])
    run_rows = read_csv(result_dirs_csv)
    rows = []

    for run in run_rows:
        bench = run["bench"]
        result_dir = Path(run["result_dir"])
        summaries = sorted(result_dir.glob(f"{bench}_nvidia_intel_debug_summary.csv"))
        if not summaries:
            summaries = sorted(result_dir.glob("*_summary.csv"))
        for summary in summaries:
            for row in read_csv(summary):
                site = row.get("site_id", "")
                bit = row.get("bit_index", "")
                trial = row.get("trial", "")
                result = row.get("result", "")
                dump = Path(row.get("dump", "")) if row.get("dump") else None
                stdout = Path(row.get("stdout", "")) if row.get("stdout") else None
                stderr = Path(row.get("stderr", "")) if row.get("stderr") else None
                trace_manifest = trace_manifest_for(result_dir, row)
                rows.append({
                    "bench": bench,
                    "site_id": site,
                    "bit_index": bit,
                    "trial": trial,
                    "result": result,
                    "exit_code": row.get("exit_code", ""),
                    "dump": str(dump) if dump else "",
                    "dump_exists": str(bool(dump and dump.is_file())),
                    "dump_sha256": sha256_file(dump) if dump and dump.is_file() else "",
                    "stdout": str(stdout) if stdout else "",
                    "stderr": str(stderr) if stderr else "",
                    "trace_manifest": str(trace_manifest),
                    "trace_exists": str(trace_manifest.is_file()),
                    "summary_csv": str(summary),
                    "result_dir": str(result_dir),
                })

    fields = [
        "bench",
        "site_id",
        "bit_index",
        "trial",
        "result",
        "exit_code",
        "dump_exists",
        "dump_sha256",
        "dump",
        "stdout",
        "stderr",
        "trace_exists",
        "trace_manifest",
        "summary_csv",
        "result_dir",
    ]
    output.parent.mkdir(parents=True, exist_ok=True)
    with output.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields)
        writer.writeheader()
        writer.writerows(rows)
    print(f"wrote {len(rows)} rows to {output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
