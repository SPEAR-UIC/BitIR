#!/usr/bin/env python3
import argparse
import ctypes
import hashlib
import json
import struct
from pathlib import Path


def sha256sum(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b""):
            h.update(chunk)
    return h.hexdigest()


def load_dump(path: Path, cols: int):
    data = path.read_bytes()
    size = len(data)
    raw_size = cols * 4
    header_size = (cols + 1) * 4
    if size == raw_size:
        values = list(struct.unpack("<{}i".format(cols), data))
        return {
            "format": "raw_int32_values",
            "header_present": False,
            "header_cols": None,
            "values": values,
            "byte_count": size,
        }
    if size == header_size:
        header_cols = struct.unpack("<i", data[:4])[0]
        values = list(struct.unpack("<{}i".format(cols), data[4:]))
        return {
            "format": "int32_header_plus_values",
            "header_present": True,
            "header_cols": header_cols,
            "values": values,
            "byte_count": size,
        }
    raise ValueError("unexpected dump size {} for cols={}".format(size, cols))


def compute_reference(cols: int, rows: int, seed: int):
    libc = ctypes.CDLL(None)
    libc.srand.argtypes = [ctypes.c_uint]
    libc.rand.restype = ctypes.c_int
    libc.srand(seed)

    prev = [libc.rand() % 10 for _ in range(cols)]
    nxt = [0] * cols
    for _row in range(1, rows):
        for col in range(cols):
            weight = libc.rand() % 10
            best = prev[col]
            if col > 0 and prev[col - 1] < best:
                best = prev[col - 1]
            if col + 1 < cols and prev[col + 1] < best:
                best = prev[col + 1]
            nxt[col] = best + weight
        prev, nxt = nxt, prev
    return prev


def compare(candidate, reference):
    mismatch_count = 0
    first_idx = None
    max_abs_diff = 0
    first_vals = None
    for idx, (cand, ref) in enumerate(zip(candidate, reference)):
        if cand != ref:
            mismatch_count += 1
            if first_idx is None:
                first_idx = idx
                first_vals = {"candidate": cand, "reference": ref}
            diff = cand - ref
            if diff < 0:
                diff = -diff
            if diff > max_abs_diff:
                max_abs_diff = diff
    return {
        "reference_match": mismatch_count == 0,
        "mismatch_count": mismatch_count,
        "first_differing_index": first_idx,
        "first_values": first_vals,
        "max_absolute_difference": max_abs_diff,
    }


def main():
    ap = argparse.ArgumentParser(description="Compare a pathfinder dump against a CPU reference.")
    ap.add_argument("--dump", required=True)
    ap.add_argument("--cols", type=int, required=True)
    ap.add_argument("--rows", type=int, required=True)
    ap.add_argument("--pyramid-height", type=int, required=True)
    ap.add_argument("--seed", type=int, default=9)
    ap.add_argument("--output-json", required=True)
    ap.add_argument("--label", required=True)
    args = ap.parse_args()

    dump_path = Path(args.dump)
    loaded = load_dump(dump_path, args.cols)
    reference = compute_reference(args.cols, args.rows, args.seed)
    comparison = compare(loaded["values"], reference)
    result = {
        "label": args.label,
        "dump_path": str(dump_path),
        "dump_sha256": sha256sum(dump_path),
        "cols": args.cols,
        "rows": args.rows,
        "pyramid_height": args.pyramid_height,
        "seed": args.seed,
        "detected_format": loaded["format"],
        "header_present": loaded["header_present"],
        "header_cols": loaded["header_cols"],
        "byte_count": loaded["byte_count"],
        "format_note": (
            "AMD pathfinder dumps store raw int32 result values only; "
            "CUDA/SYCL pathfinder dumps store a leading cols header plus int32 values."
        ),
    }
    result.update(comparison)

    out_path = Path(args.output_json)
    out_path.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0 if result["reference_match"] else 1


if __name__ == "__main__":
    raise SystemExit(main())
