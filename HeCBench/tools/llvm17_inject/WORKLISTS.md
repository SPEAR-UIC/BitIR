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

## Regenerating worklists and site inventories

Run these from the repo root.

Matrix rotate:
```bash
python3 HeCBench/tools/llvm17_inject/build_matrix_rotate_worklist.py
python3 HeCBench/tools/llvm17_inject/build_matrix_rotate_worklist.py --target operand --sites-only
python3 HeCBench/tools/llvm17_inject/build_matrix_rotate_worklist.py --target pointer --sites-only
```

Jacobi:
```bash
python3 HeCBench/tools/llvm17_inject/build_bench_worklist.py --bench jacobi
python3 HeCBench/tools/llvm17_inject/build_bench_worklist.py --bench jacobi --target operand --sites-only
python3 HeCBench/tools/llvm17_inject/build_bench_worklist.py --bench jacobi --target pointer --sites-only
```

All other benchmarks:
```bash
python3 HeCBench/tools/llvm17_inject/build_bench_worklist.py --bench <bench>
python3 HeCBench/tools/llvm17_inject/build_bench_worklist.py --bench <bench> --target operand --sites-only
python3 HeCBench/tools/llvm17_inject/build_bench_worklist.py --bench <bench> --target pointer --sites-only
```

Optional flags:
- `--include-constants` to include constant operands
- `--int-float-only 0` to include non-float/int result bits

## Notes

- These scripts require the FI LLVM pass built by `HeCBench/tools/llvm17_inject/build.sh`.
- Worklists are deterministic for a given toolchain and benchmark source.
