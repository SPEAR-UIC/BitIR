# BitIR Pipeline

The BitIR control path uses one command shape:

```bash
python3 HeCBench/tools/llvm17_inject/bitir_pipeline.py <task> <config.yml> [options]
```

The main tasks are:

- `build`: build the selected HeCBench binaries and generate golden outputs
- `deploy`: queue a fault-injection campaign for the selected benchmark set

The pipeline reads machine, benchmark, campaign, scheduler, and runtime settings
from YAML. The deploy stage also requires a fault-model name on the command line.

## Commands

Run these from the repository root.

Build the default campaign:

```bash
python3 HeCBench/tools/llvm17_inject/bitir_pipeline.py \
  build HeCBench/config/runs/build_default.yml
```

Build a smoke campaign and write the PBS script:

```bash
python3 HeCBench/tools/llvm17_inject/bitir_pipeline.py \
  build HeCBench/config/runs/nvidia_smoke.yml
```

Then submit the generated build script:

```bash
qsub .bitir_jobs/nvidia_build_layout_<timestamp>_00.pbs
```

Deploy a smoke test and write the PBS script:

```bash
python3 HeCBench/tools/llvm17_inject/bitir_pipeline.py \
  deploy HeCBench/config/runs/nvidia_smoke.yml \
  --fault-model smoke
```

Then submit the generated deploy script:

```bash
qsub .bitir_jobs/nvidia_deploy_layout_<timestamp>_00.pbs
```

Deploy a full operand campaign:

```bash
python3 HeCBench/tools/llvm17_inject/bitir_pipeline.py \
  deploy HeCBench/config/runs/deploy_default.yml \
  --fault-model operand
```

Toy NVIDIA campaign:

```bash
python3 HeCBench/tools/llvm17_inject/bitir_pipeline.py \
  build HeCBench/config/runs/toy_nvidia.yml

python3 HeCBench/tools/llvm17_inject/bitir_pipeline.py \
  deploy HeCBench/config/runs/toy_nvidia.yml
```

By default the example run YAMLs use `execution_mode: write-script`. Change the
YAML to use one of:

- `print-script`: print the generated job script
- `write-script`: write the script under `.bitir_jobs/`
- `submit`: submit the generated job
- `local`: execute through the task runner without scheduler submission

## YAML layout

The main configuration file is:

```text
HeCBench/config/bitir.yml
```

The pipeline reads:

- `machines`: scheduler, modules, toolchain paths, runtime settings, task scripts
- `campaigns`: named benchmark sets
- `benchmarks`: benchmark arguments, source directories, compare mode, golden naming
- `fault_models`: named deployment presets
- `run`: the default machine, task, benchmark or campaign, and execution mode

Small run-specific configs can extend the main config:

```yaml
extends: ../bitir.yml

run:
  machine: nvidia
  task: deploy
  campaign: smoke
  execution_mode: write-script
```

The toy NVIDIA config is:

```text
HeCBench/config/runs/toy_nvidia.yml
```

It defines:

- the toy benchmark set `ace` and `wordcount`
- the `toy50` fault model with 50 injections per benchmark
- debug queue settings for one node and one GPU
- text-mode golden generation for benchmarks that report `PASS` or `FAIL`

## Fault models

Fault models are named presets under `fault_models:` in the YAML. The deploy
command requires a model name with `--fault-model`.

Current built-in models:

- `result`: result-value injections
- `operand`: operand-value injections
- `pointer`: pointer/address injections
- `all`: broad target mode for backends that support it
- `smoke`: small result-only debug campaign

Each model can set the following keys:

- `inject_target`: fault target class passed to the LLVM pass or worklist builder
- `phase`: result directory/worklist phase label such as `float`, `operand`, or `pointer`
- `int_float_only`: whether to limit injections to integer and floating-point values
- `include_constants`: whether constant operands are eligible
- `max_pairs`: CUDA deploy subset size
- `max_injections`: SYCL deploy subset size
- `run_baseline`: whether deploy should run the baseline check first
- `skip_existing`: whether to skip already completed pairs
- `missing_only`: whether to rebuild and run only missing worklist entries
- `worklist_queue`: whether to use the queue-based missing-worklist mode
- `results_subdir_base`: result root override for the campaign
- `keep_dumps`: whether to keep candidate dump files in the results directory
- `trace_level`: trace granularity for disagreement studies
- `trace_source_window`: number of source lines to save around the matched site
- `trace_metadata_dir`: optional override for the site metadata and worklist directory
- `trace_repeats`: number of repeated reruns per selected site and bit
- `site_list`: optional curated `site_id,bit_index` CSV for targeted reruns

Trace levels:

- `off`: normal run with no extra trace packet
- `basic`: save manifest, matched site row, worklist row, source window, stdout, stderr, and dumps
- `backend`: add injected IR text and backend lowering artifacts such as PTX or SPIR-V wrappers
- `full`: keep the full temporary backend build directory for the rerun

The `smoke` model is the recommended first test. It runs only a small subset of
injection points so you can validate that worklist generation, compilation,
execution, and classification are working before launching a full campaign.

## How build and deploy map to scripts

`build` generates a runnable scheduler script directly. That script configures
the selected backend, builds the selected benchmarks, and writes golden outputs.

`deploy` dispatches to the machine's configured campaign script:

- NVIDIA: `HeCBench/llvm17_inject_bench_sweep.pbs`
- Intel: `HeCBench/llvm17_inject_bench_sweep.pbs`

For deploy, the pipeline expands a campaign into one queued job per benchmark.
If `run.bench` is set, only that benchmark is queued. If `run.campaign` is set,
every benchmark in the campaign is queued separately.

## Toy workflow

Run these from the repository root:

```bash
python3 HeCBench/tools/llvm17_inject/bitir_pipeline.py \
  build HeCBench/config/runs/toy_nvidia.yml --print-script
```

This renders one build script per benchmark under `.bitir_jobs/`

```bash
python3 HeCBench/tools/llvm17_inject/bitir_pipeline.py \
  deploy HeCBench/config/runs/toy_nvidia.yml --print-script
```

This renders one deploy script per benchmark under `.bitir_jobs/`

```bash
python3 HeCBench/tools/llvm17_inject/bitir_pipeline.py \
  build HeCBench/config/runs/toy_nvidia.yml
```

This writes one build script per benchmark under `.bitir_jobs/`

```bash
qsub .bitir_jobs/nvidia_build_ace_<timestamp>_00.pbs
```

```bash
python3 HeCBench/tools/llvm17_inject/bitir_pipeline.py \
  deploy HeCBench/config/runs/toy_nvidia.yml --fault-model toy50
```

This writes one deploy script per benchmark under `.bitir_jobs/`

Expected outputs for the toy build:

- `Polaris_Golden_Outputs_toy/ace.txt`
- `Polaris_Golden_Outputs_toy/wordcount.txt`

Expected outputs for the toy deploy:

- `HeCBench/results/llvm17_inject_toy/ace/float/`
- `HeCBench/results/llvm17_inject_toy/wordcount/float/`

## Current notes

- The toy campaign uses text comparison because `ace` and `wordcount` do not take a dump-file argument
- The shared NVIDIA runner already supports this text path
- The launcher submits one PBS job per benchmark, if the scheduler blocks one submission the launcher now prints that scheduler error instead of crashing with a traceback
