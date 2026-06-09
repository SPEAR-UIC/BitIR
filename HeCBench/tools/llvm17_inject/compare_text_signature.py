#!/usr/bin/env python3
import argparse
import re
import sys
from typing import Tuple
from pathlib import Path


def read_text(path: Path) -> str:
    return path.read_text(errors="replace")


def compare_match(baseline: str, candidate: str) -> Tuple[bool, str, int, float]:
    patt = re.compile(r"Number of incorrect matches:\s*(\d+)")
    b_vals = [int(x) for x in patt.findall(baseline)]
    c_vals = [int(x) for x in patt.findall(candidate)]
    if not b_vals:
        return False, "missing_match_signature_baseline", 1, 1.0
    if not c_vals:
        return False, "missing_match_signature_candidate", 1, 1.0
    if b_vals == c_vals:
        return True, "match_signature_equal", 0, 0.0
    mismatches = sum(1 for i, b in enumerate(b_vals[: len(c_vals)]) if c_vals[i] != b)
    mismatches += abs(len(b_vals) - len(c_vals))
    denom = max(len(b_vals), 1)
    return (
        False,
        f"match_signature_diff baseline={b_vals} candidate={c_vals}",
        mismatches,
        float(mismatches) / float(denom),
    )


def compare_crc64(baseline: str, candidate: str) -> Tuple[bool, str, int, float]:
    token = re.compile(r"\b(pass|fail)\b", re.IGNORECASE)
    b_tokens = [t.lower() for t in token.findall(baseline)]
    c_tokens = [t.lower() for t in token.findall(candidate)]
    if not b_tokens:
        return False, "missing_crc64_tokens_baseline", 1, 1.0
    if not c_tokens:
        return False, "missing_crc64_tokens_candidate", 1, 1.0
    if b_tokens == c_tokens:
        return True, "crc64_token_stream_equal", 0, 0.0
    common = min(len(b_tokens), len(c_tokens))
    mismatches = sum(1 for i in range(common) if b_tokens[i] != c_tokens[i]) + abs(len(b_tokens) - len(c_tokens))
    denom = max(len(b_tokens), 1)
    return (
        False,
        f"crc64_token_stream_diff baseline_pass={b_tokens.count('pass')} "
        f"baseline_fail={b_tokens.count('fail')} "
        f"candidate_pass={c_tokens.count('pass')} "
        f"candidate_fail={c_tokens.count('fail')}",
        mismatches,
        float(mismatches) / float(denom),
    )


def compare_btree(baseline: str, candidate: str) -> Tuple[bool, str, int, float]:
    pass_pat = re.compile(r"PASS\.\s*\(\[[0-9.]+%\]\s*queries exist in search\.\)")
    if not pass_pat.search(baseline):
        return False, "missing_btree_pass_baseline", 1, 1.0
    if not pass_pat.search(candidate):
        return False, "missing_btree_pass_candidate", 1, 1.0
    return True, "btree_pass_present", 0, 0.0


def compare_passfail(baseline: str, candidate: str) -> Tuple[bool, str, int, float]:
    token = re.compile(r"\b(pass|fail)\b", re.IGNORECASE)
    b_tokens = [t.lower() for t in token.findall(baseline)]
    c_tokens = [t.lower() for t in token.findall(candidate)]
    if not b_tokens:
        return False, "missing_passfail_tokens_baseline", 1, 1.0
    if not c_tokens:
        return False, "missing_passfail_tokens_candidate", 1, 1.0
    if b_tokens == c_tokens:
        return True, "passfail_token_stream_equal", 0, 0.0
    common = min(len(b_tokens), len(c_tokens))
    mismatches = sum(1 for i in range(common) if b_tokens[i] != c_tokens[i]) + abs(len(b_tokens) - len(c_tokens))
    denom = max(len(b_tokens), 1)
    return (
        False,
        f"passfail_token_stream_diff baseline={b_tokens} candidate={c_tokens}",
        mismatches,
        float(mismatches) / float(denom),
    )


def main() -> int:
    ap = argparse.ArgumentParser(description="Compare text signatures for non-dump benchmarks.")
    ap.add_argument("--bench", required=True)
    ap.add_argument("--baseline", required=True)
    ap.add_argument("--candidate", required=True)
    args = ap.parse_args()

    baseline_path = Path(args.baseline)
    candidate_path = Path(args.candidate)
    if not baseline_path.exists():
        print(f"compare_fail baseline_missing: {baseline_path}")
        return 2
    if not candidate_path.exists():
        print(f"compare_fail candidate_missing: {candidate_path}")
        return 2

    baseline = read_text(baseline_path)
    candidate = read_text(candidate_path)

    if args.bench == "match":
        ok, reason, num_bad, frac_bad = compare_match(baseline, candidate)
    elif args.bench == "crc64":
        ok, reason, num_bad, frac_bad = compare_crc64(baseline, candidate)
    elif args.bench == "btree":
        ok, reason, num_bad, frac_bad = compare_btree(baseline, candidate)
    else:
        ok, reason, num_bad, frac_bad = compare_passfail(baseline, candidate)

    if ok:
        print("compare_ok")
        print(f"compare_note: {reason}")
        print(f"metric_num_bad={num_bad}")
        print(f"metric_frac_bad={frac_bad:.12g}")
        return 0

    print("compare_mismatch")
    print(f"compare_note: {reason}")
    print(f"metric_num_bad={num_bad}")
    print(f"metric_frac_bad={frac_bad:.12g}")
    return 1


if __name__ == "__main__":
    sys.exit(main())
