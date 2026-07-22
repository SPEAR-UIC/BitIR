#!/usr/bin/env python3
import argparse
import hashlib
import json
from pathlib import Path


def sha256(path):
    h = hashlib.sha256()
    with path.open("rb") as fh:
        while True:
            chunk = fh.read(1024 * 1024)
            if not chunk:
                break
            h.update(chunk)
    return h.hexdigest()


def read_bytes(path):
    return path.read_bytes()


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--golden", required=True)
    parser.add_argument("--candidate", required=True)
    parser.add_argument("--out-json", required=True)
    args = parser.parse_args()

    golden = Path(args.golden)
    candidate = Path(args.candidate)
    result = {
        "golden": {"path": str(golden), "exists": golden.is_file()},
        "candidate": {"path": str(candidate), "exists": candidate.is_file()},
        "sha256_match": False,
        "mismatch_count": None,
        "first_differing_byte_offset": None,
        "sample_differing_byte_offsets": [],
    }

    if golden.is_file():
        result["golden"]["bytes"] = golden.stat().st_size
        result["golden"]["sha256"] = sha256(golden)
    if candidate.is_file():
        result["candidate"]["bytes"] = candidate.stat().st_size
        result["candidate"]["sha256"] = sha256(candidate)

    if golden.is_file() and candidate.is_file():
        gb = read_bytes(golden)
        cb = read_bytes(candidate)
        if gb == cb:
            result["sha256_match"] = True
            result["mismatch_count"] = 0
        else:
            mismatches = [idx for idx, (g, c) in enumerate(zip(gb, cb)) if g != c]
            if len(gb) != len(cb):
                mismatches.extend(range(min(len(gb), len(cb)), max(len(gb), len(cb))))
            result["mismatch_count"] = len(mismatches)
            if mismatches:
                result["first_differing_byte_offset"] = mismatches[0]
                result["sample_differing_byte_offsets"] = mismatches[:32]

    out_path = Path(args.out_json)
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
