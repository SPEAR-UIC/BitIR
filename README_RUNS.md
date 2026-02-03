# GPU-FI Generic Run Workflow

This repo now uses **one generic PBS script** for all injection runs:

`HeCBench/llvm17_inject_bench_sweep.pbs`

You select the benchmark and mode via environment variables.

## 1) Golden outputs

Generate golden outputs:

```
qsub HeCBench/target_golden_outputs.pbs
```

Verify golden outputs:

```
qsub HeCBench/verify_golden_outputs.pbs
```

## 2) Baseline sanity check (GPU node)

```
qsub HeCBench/baseline_check_all_debug.pbs
```

Baseline results go to:
`HeCBench/results/baseline_checks/<bench>/baseline_<bench>.cmp`

Any **compare_mismatch** means that benchmark’s injections are invalid until fixed.

## 3) Float/Int injection runs

```
qsub -v "BENCH=matrix-rotate,RESULTS_SUBDIR=llvm17_inject,INJECT_TARGET=result,WORKLIST_QUEUE=1,WORKLIST=/home/mdunlavy/GPU_FI/HeCBench/results/llvm17_inject/matrix-rotate/worklist_missing.csv" HeCBench/llvm17_inject_bench_sweep.pbs
```

## 4) Operand injection runs

```
qsub -v "BENCH=jacobi,RESULTS_SUBDIR=fi_inject_operand,INJECT_TARGET=operand,WORKLIST_QUEUE=1,WORKLIST=/home/mdunlavy/GPU_FI/HeCBench/results/llvm17_inject/jacobi-sycl/worklist_operand_sycl_aligned.csv" HeCBench/llvm17_inject_bench_sweep.pbs
```

## 5) Pointer injection runs

```
qsub -v "BENCH=layout,RESULTS_SUBDIR=fi_inject_pointer,INJECT_TARGET=pointer,WORKLIST_QUEUE=1,WORKLIST=/home/mdunlavy/GPU_FI/HeCBench/results/llvm17_inject/layout-sycl/worklist_pointer_sycl_aligned.csv" HeCBench/llvm17_inject_bench_sweep.pbs
```

## 6) Caching flags (speed)

The generic script supports caching:

- `CACHE_DEVICE_IR=1`  
- `GENERATE_IR_LL=0`

Example:

```
qsub -v "BENCH=matrix-rotate,RESULTS_SUBDIR=llvm17_inject,INJECT_TARGET=result,WORKLIST_QUEUE=1,WORKLIST=/home/mdunlavy/GPU_FI/HeCBench/results/llvm17_inject/matrix-rotate/worklist_missing.csv,CACHE_DEVICE_IR=1,GENERATE_IR_LL=0" HeCBench/llvm17_inject_bench_sweep.pbs
```

## 7) Plots / analysis

Heatmaps:
```
OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 MKL_NUM_THREADS=1 python3 plot_heatmaps.py --bench matrix-rotate \
  --results-dir HeCBench/results/llvm17_inject/matrix-rotate \
  --pruned-worklist HeCBench/results/llvm17_inject/matrix-rotate-sycl/worklist_sycl_aligned.csv \
  --out-dir plots --mode grid --dpi 400 --dense-widths 64,128,256
```

Analysis plots:
```
OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 MKL_NUM_THREADS=1 python3 plot_analysis.py \
  --bench matrix-rotate \
  --summary HeCBench/results/llvm17_inject/matrix-rotate/summary.csv \
  --worklist HeCBench/results/llvm17_inject/matrix-rotate-sycl/worklist_sycl_aligned.csv \
  --out-dir plots/analysis/matrix-rotate --k 20 --fine-cluster
```
