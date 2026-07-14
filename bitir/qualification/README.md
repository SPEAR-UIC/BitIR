# BitIR Benchmark Qualification

This directory is a temporary harness for qualifying benchmark output hooks
across machines. It is intentionally separate from the production pipeline so it
can be removed after Polaris, Aurora, and Frontier support matrices are stable.

The goal is to turn source-level inference into a reviewed support matrix:

- discover registered benchmark variants for a backend
- split them into scheduler-sized chunks
- generate temporary campaign YAMLs for those chunks
- run build/golden and deploy baseline probes
- summarize profile, build, and baseline status into CSV

## 1. Discover Benchmarks

Run on the target machine from the repository root:

```bash
python3 bitir/qualification/discover_benchmarks.py \
  --benchmark-root HeCBench \
  --model cuda \
  --output-dir bitir/qualification/work/polaris_cuda \
  --chunk-size 25
```

Use `--model sycl` on Aurora and `--model hip` on Frontier.

## 2. Generate Chunk Configs

```bash
python3 bitir/qualification/make_qualification_configs.py \
  --base-config bitir/config/runs/polaris_template.yml \
  --chunks-dir bitir/qualification/work/polaris_cuda/chunks \
  --output-dir bitir/qualification/work/polaris_cuda/configs
```

Each generated YAML extends the machine template and selects one benchmark
chunk. The temporary fault model runs a baseline first and then at most one
injection. Until the production pipeline has a true baseline-only deploy mode,
baseline failures still stop before injection.

## 3. Generate Scripts

For each generated config:

```bash
python3 bitir/tools/llvm17_inject/bitir_pipeline.py \
  build bitir/qualification/work/polaris_cuda/configs/qual_000.yml \
  --account <account>

python3 bitir/tools/llvm17_inject/bitir_pipeline.py \
  deploy bitir/qualification/work/polaris_cuda/configs/qual_000.yml \
  --account <account>
```

Inspect and submit the generated scheduler scripts as usual.

## 4. Summarize

After jobs finish:

```bash
python3 bitir/qualification/summarize_qualification.py \
  --golden-key bitir/build/golden_keys/hecbench/cuda/golden_outputs.yml \
  --logs . \
  --results results \
  --output bitir/qualification/work/polaris_cuda/support_matrix.csv
```

The support matrix is the artifact to review. Benchmarks should only be treated
as campaign-ready once build and no-flip baseline checks pass on the target
machine.
