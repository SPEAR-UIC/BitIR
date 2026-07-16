# Worklists and Site Inventories

This directory contains the scripts used to generate per-benchmark worklists and
site/bit inventories for the FI pipeline. The generated CSVs are stored under:

`HeCBench/results/llvm17_inject/<benchmark>/`

Files:
- `worklist.csv`: float/int result-bit injections
- `worklist_operand.csv`: operand-bit injections
- `worklist_pointer.csv`: pointer-bit injections
- `sites_operand.csv`: operand-site inventory
- `sites_pointer.csv`: pointer-site inventory
- `sites_canonical.csv`: canonical source-context metadata companion for cross-backend alignment

## Regenerating worklists and site inventories

Run these from the repo root.

CUDA/NVIDIA:
```bash
python3 HeCBench/tools/llvm17_inject/build_bench_worklist.py --bench <bench>
python3 HeCBench/tools/llvm17_inject/build_bench_worklist.py --bench <bench> --target operand --sites-only
python3 HeCBench/tools/llvm17_inject/build_bench_worklist.py --bench <bench> --target pointer --sites-only
```

SYCL/Intel:
```bash
python3 HeCBench/tools/llvm17_inject/build_bench_worklist.py --bench <bench> --backend intel
python3 HeCBench/tools/llvm17_inject/build_bench_worklist.py --bench <bench> --backend intel --target operand --sites-only
python3 HeCBench/tools/llvm17_inject/build_bench_worklist.py --bench <bench> --backend intel --target pointer --sites-only
```

Optional flags:
- `--include-constants` to include constant operands
- `--int-float-only 0` to include non-float/int result bits
- `--sites-canonical <path>` to override the canonical metadata companion output path

Canonical metadata:
- Every fresh metadata rebuild now emits `sites*_canonical.csv` alongside the raw `sites*.csv` and `sites*_metadata.csv` files.
- The canonical file records source-context anchors and both strict and class-family keys.
- Treat raw `sites_metadata.csv` as backend-local. Use the canonical companion for backend mapping, not as the shared inventory itself.
- Build the shared source-stage inventory from NVIDIA canonical rows, then map AMD and Intel onto it.
- When a cross-backend fallback must choose a reference method, prefer NVIDIA/CUDA conventions over AMD.

## Notes

- These scripts require the FI LLVM pass built by `HeCBench/tools/llvm17_inject/build.sh`.
- Worklists are deterministic for a given toolchain and benchmark source.
