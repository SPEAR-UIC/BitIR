#!/usr/bin/env python3
import argparse
import hashlib
import json
from pathlib import Path


def sha256sum(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b""):
            h.update(chunk)
    return h.hexdigest()


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--golden", required=True)
    ap.add_argument("--candidate", required=True)
    ap.add_argument("--out-json", required=True)
    args = ap.parse_args()

    golden = Path(args.golden)
    candidate = Path(args.candidate)
    report = {
        "golden": {"path": str(golden), "exists": golden.exists()},
        "candidate": {"path": str(candidate), "exists": candidate.exists()},
        "size_match": False,
        "mismatch_count": None,
        "first_differing_byte_offset": None,
        "sha256_match": False,
    }

    if golden.exists():
        report["golden"]["bytes"] = golden.stat().st_size
        report["golden"]["sha256"] = sha256sum(golden)
    if candidate.exists():
        report["candidate"]["bytes"] = candidate.stat().st_size
        report["candidate"]["sha256"] = sha256sum(candidate)

    if golden.exists() and candidate.exists():
        golden_bytes = golden.read_bytes()
        candidate_bytes = candidate.read_bytes()
        report["size_match"] = len(golden_bytes) == len(candidate_bytes)
        report["sha256_match"] = report["golden"]["sha256"] == report["candidate"]["sha256"]
        mismatch_count = 0
        first_diff = None
        for idx, (ga, ca) in enumerate(zip(golden_bytes, candidate_bytes)):
            if ga != ca:
                mismatch_count += 1
                if first_diff is None:
                    first_diff = idx
        if len(golden_bytes) != len(candidate_bytes):
            mismatch_count += abs(len(golden_bytes) - len(candidate_bytes))
            if first_diff is None:
                first_diff = min(len(golden_bytes), len(candidate_bytes))
        report["mismatch_count"] = mismatch_count
        report["first_differing_byte_offset"] = first_diff

    Path(args.out_json).write_text(json.dumps(report, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps(report, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
