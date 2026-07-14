#!/usr/bin/env python3
import argparse
import os
import re
import sys
from pathlib import Path


def read_text(path: Path) -> str:
    return path.read_text(errors="replace")


def env_text(name: str, default: str = "") -> str:
    return str(os.environ.get(name, default))


def token_stream(text: str, token_regex: str, ignore_case: bool):
    flags = re.IGNORECASE if ignore_case else 0
    return re.findall(token_regex, text, flags)


def compare_token_stream(baseline: str, candidate: str, token_regex: str, ignore_case: bool):
    baseline_tokens = token_stream(baseline, token_regex, ignore_case)
    candidate_tokens = token_stream(candidate, token_regex, ignore_case)
    if not baseline_tokens:
        return False, "missing_tokens_baseline", 1, 1.0
    if not candidate_tokens:
        return False, "missing_tokens_candidate", 1, 1.0
    if baseline_tokens == candidate_tokens:
        return True, "token_stream_equal", 0, 0.0
    common = min(len(baseline_tokens), len(candidate_tokens))
    mismatches = sum(1 for i in range(common) if baseline_tokens[i] != candidate_tokens[i])
    mismatches += abs(len(baseline_tokens) - len(candidate_tokens))
    return False, f"token_stream_diff baseline={baseline_tokens} candidate={candidate_tokens}", mismatches, float(mismatches) / float(max(len(baseline_tokens), 1))


def compare_capture_stream(baseline: str, candidate: str, capture_regex: str, ignore_case: bool):
    flags = re.IGNORECASE if ignore_case else 0
    baseline_values = re.findall(capture_regex, baseline, flags)
    candidate_values = re.findall(capture_regex, candidate, flags)
    if not baseline_values:
        return False, "missing_capture_baseline", 1, 1.0
    if not candidate_values:
        return False, "missing_capture_candidate", 1, 1.0
    if baseline_values == candidate_values:
        return True, "capture_stream_equal", 0, 0.0
    common = min(len(baseline_values), len(candidate_values))
    mismatches = sum(1 for i in range(common) if baseline_values[i] != candidate_values[i])
    mismatches += abs(len(baseline_values) - len(candidate_values))
    return False, f"capture_stream_diff baseline={baseline_values} candidate={candidate_values}", mismatches, float(mismatches) / float(max(len(baseline_values), 1))


def compare_required_patterns(baseline: str, candidate: str, pass_regex: str, fail_regex: str, ignore_case: bool):
    flags = re.IGNORECASE if ignore_case else 0
    if pass_regex and not re.search(pass_regex, baseline, flags):
        return False, "missing_pass_pattern_baseline", 1, 1.0
    if pass_regex and not re.search(pass_regex, candidate, flags):
        return False, "missing_pass_pattern_candidate", 1, 1.0
    if fail_regex and re.search(fail_regex, candidate, flags):
        return False, "fail_pattern_present_candidate", 1, 1.0
    return True, "required_patterns_ok", 0, 0.0


def main() -> int:
    ap = argparse.ArgumentParser(description="Compare text signatures for non-dump outputs.")
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
    pass_regex = env_text("BITIR_STATUS_PASS_REGEX")
    fail_regex = env_text("BITIR_STATUS_FAIL_REGEX")
    token_regex = env_text(
        "BITIR_STATUS_TOKEN_REGEX",
        r"\b(pass|fail|ok|error)\b|"
        r"(?:checksum|hash)\s*[=:]?\s*0?x?[0-9a-fA-F]+|"
        r"Final error norm\s*=\s*[-+0-9.eE]+|"
        r"Structural Similarity Index Measure:\s*[-+0-9.eE]+",
    )
    capture_regex = env_text("BITIR_STATUS_CAPTURE_REGEX")
    ignore_case = env_text("BITIR_STATUS_IGNORE_CASE", "1").strip() != "0"

    if capture_regex:
        ok, reason, num_bad, frac_bad = compare_capture_stream(baseline, candidate, capture_regex, ignore_case)
    elif pass_regex or fail_regex:
        ok, reason, num_bad, frac_bad = compare_required_patterns(baseline, candidate, pass_regex, fail_regex, ignore_case)
    else:
        ok, reason, num_bad, frac_bad = compare_token_stream(baseline, candidate, token_regex, ignore_case)

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
