# BitIR Pipeline

The pipeline is driven by a user YAML. Build, golden, baseline, and deploy runs render one scheduler script for the selected benchmark set. `inject-one` remains a targeted single benchmark/site helper. Deploy baselines use the injected-build path with no bit flip before real injections start.

Written and submitted scheduler scripts are compact wrappers. They keep only the
PBS/SLURM resource header, module setup, repository `cd`, and a `bitir_pipeline.py
--local` call. The detailed shell body is generated inside the allocation.
Scheduler stdout and stderr are merged into the generated `OUT_*.out` file.

```bash
python3 bitir/tools/llvm17_inject/bitir_pipeline.py <task> <config.yml>
```

Supported tasks:

- `build`
- `deploy`
- `golden`
- `baseline`
- `inject-one`

## What the repo ships

The base config at `bitir/config/bitir.yml` only defines empty top level sections

It does not ship benchmark selections, a benchmark catalog, or machine presets

The repo ships these run configs in `bitir/config/runs`:

- `polaris_toy.yml`
- `aurora_toy.yml`
- `frontier_toy.yml`
- `polaris_template.yml`
- `aurora_template.yml`
- `frontier_template.yml`
- `run_template.yml`

You are expected to copy that file and fill in your own:

- `run.machine`
- `run.task`
- `run.bench` or `run.campaign`
- `fault_models`
- `machines`
- `campaigns`
- `benchmarks`

Each machine entry should define at least:

- `submit_command`
- `script_extension`
- `jobs.<task>.header`

For `build` and `golden`, each machine also needs:

- `build_dir`
- `binary_subdir`
- `golden_root`
- `build_configure`

For `deploy`, `baseline`, and `inject-one`, each machine also needs:

- `results_root`
- `golden_root`
- `source_file`
- either `inject_build`
- or both `inject_build_baseline` and `inject_build_injected`

For `deploy`, each machine also needs:

- `worklist_build_ir`

If the LLVM pass is not already on your `PATH`, also define search roots used by `bitir/tools/llvm17_inject/build.sh`, such as:

- `tool_search_roots`
- `llvm_search_root`

## Minimal workflow

1. Copy the template YAML for your machine or copy `run_template.yml`
2. Edit the scheduler header lines for your account, queue or partition, and walltime
3. Define your benchmark list and fault model in that YAML
4. Define the required machine fields for the task you will run
5. Make sure `llvm-config` and the backend compiler tools are discoverable
6. Build

```bash
python3 bitir/tools/llvm17_inject/bitir_pipeline.py \
  build <config.yml>
```

7. Submit the generated `*_all_*` script from `.bitir_jobs/` with the submit command defined in your machine YAML

8. Deploy with a fault model defined in your YAML

```bash
python3 bitir/tools/llvm17_inject/bitir_pipeline.py \
  deploy <config.yml> \
  --fault-model <model>
```

9. Submit the generated `*_all_*` deploy script with the submit command defined in your machine YAML

## Worklist selection

Deploy fault models can either use an explicit `site_list` CSV or ask the pipeline to generate a worklist from a preset mode.

Supported `selection_mode` values:

- `instruction_result`: instruction result sites only
- `all`: all valid instruction result, operand, and pointer sites
- `random`: generate all valid sites, shuffle them deterministically, and keep `random_sample` rows
- `pointer_only`: pointer sites only
- `int_only`: integer sites only
- `float_only`: floating point sites only
- `operand_only`: operand sites only
- instruction families: `add`, `sub`, `mul`, `div`, `rem`, `shift`, `bitwise`, `compare`, `cast`
- individual opcodes: `zext`, `sext`, `trunc`, `bitcast`, `select`, `load`, `store`, `getelementptr`, `gep`, `call`, `phi`

Examples:

```yaml
fault_models:
  all_sites:
    selection_mode: all
    max_injections: 0

  random100:
    selection_mode: random
    random_sample: 100
    random_seed: 42
    max_injections: 100

  pointer_only:
    selection_mode: pointer_only
    max_injections: 50

  integer_only:
    selection_mode: int_only
    max_injections: 50

  add_only:
    selection_mode: add_instructions
    max_injections: 50

  custom_opcodes:
    selection_mode: all
    opcodes: add,fadd,mul,fmul
    type_kind: float
    max_injections: 50
```

`site_list` remains supported and takes precedence at deploy time. It should point to a CSV with `site_id,bit_index` or generated-worklist-style columns.
`type_kind` and `opcodes` can also be combined with `random` when you want a random subset of a narrower modality.

## Toy commands

Polaris:

```bash
python3 bitir/tools/llvm17_inject/bitir_pipeline.py \
  build bitir/config/runs/polaris_toy.yml

python3 bitir/tools/llvm17_inject/bitir_pipeline.py \
  deploy bitir/config/runs/polaris_toy.yml \
  --fault-model smoke8
```

Inspect and edit generated `.pbs` account/resource lines before submitting with
`qsub`.

Aurora:

```bash
python3 bitir/tools/llvm17_inject/bitir_pipeline.py \
  build bitir/config/runs/aurora_toy.yml

python3 bitir/tools/llvm17_inject/bitir_pipeline.py \
  deploy bitir/config/runs/aurora_toy.yml \
  --fault-model smoke8
```

Inspect and edit generated `.pbs` account/resource lines before submitting with
`qsub`.

Frontier:

```bash
python3 bitir/tools/llvm17_inject/bitir_pipeline.py \
  build bitir/config/runs/frontier_toy.yml

python3 bitir/tools/llvm17_inject/bitir_pipeline.py \
  deploy bitir/config/runs/frontier_toy.yml \
  --fault-model smoke8
```

Inspect and edit generated `.sbatch` account/resource lines before submitting
with `sbatch`.

## New machine checklist

To start a campaign on a new system, you need to know these machine details and encode them in one YAML

- scheduler submit command such as `qsub` or `sbatch`
- script extension such as `.pbs` or `.sbatch`
- scheduler header lines for `build`, `deploy`, `baseline`, and `inject_one`
- module setup needed to load the compiler and LLVM tools
- backend type through `source_key` and `binary_subdir`
- benchmark source file pattern such as `main.cu` or `main.cpp`
- build directory, golden output directory, and results directory
- compiler tool names or paths such as `clang++`, `icpx`, `llvm-as`, `opt`, `llc`, `llvm-spirv`
- runtime path and device architecture such as CUDA home plus `sm_80` or ROCm plus `gfx90a`
- CMake configure command for the build stage
- device IR build command for `worklist_build_ir`
- binary rebuild command for `inject_build` or for `inject_build_baseline` and `inject_build_injected`
- runtime dump env for golden and injection runs
- optional GPU query command for trace capture

If any required machine value is missing, the pipeline fails fast with a YAML error instead of generating a broken job script

## Minimal Example

This is the smallest useful shape for a PBS machine YAML, values here are placeholders and must be replaced for your machine

```yaml
extends: ../bitir.yml

methodology:
  float_abs_tol: 1e-5
  float_rel_tol: 0.0

run:
  machine: polaris
  campaign: quick
  execution_mode: write-script

fault_models:
  random50:
    selection_mode: instruction_result
    phase: float
    int_float_only: 1
    include_constants: 0
    max_injections: 50
    run_baseline: 1
    skip_existing: 0

campaigns:
  quick:
    benchmarks:
      - my_benchmark

machines:
  polaris:
    submit_command: qsub
    script_extension: .pbs
    binary_subdir: cuda
    source_key: cuda
    build_dir: bitir/build/cuda
    golden_root: my_golden_outputs
    results_root: bitir/results/my_results
    source_file: main.cu
    build_configure: >
      cmake -S "${BITIR_CMAKE_SOURCE_ROOT}" -B bitir/build/cuda
      -DHECBENCH_ENABLE_CUDA=ON
      -DHECBENCH_ENABLE_HIP=OFF
      -DHECBENCH_ENABLE_SYCL=OFF
      -DHECBENCH_ENABLE_OPENMP=OFF
      -DHECBENCH_CUDA_ARCH=80
    worklist_build_ir: >
      cmake --build "${REPO_ROOT}/bitir/build/cuda" --target "${BENCH}-cuda"
    inject_build: >
      cmake --build "${REPO_ROOT}/bitir/build/cuda" --target "${BENCH}-cuda"
      && cp "${REPO_ROOT}/bitir/build/cuda/bin/cuda/${BENCH}" "${BIN_PATH}"
    jobs:
      build:
        header:
          - "#PBS -N bitir_{machine}_{task}"
      deploy:
        header:
          - "#PBS -N bitir_{machine}_{task}"

benchmarks:
  my_benchmark:
    source_dirs:
      cuda: src/my_benchmark-cuda
    compare_mode: exact
```

## Debug studies

Debug studies use the same deploy path. Put a small benchmark set, `site_list`,
and trace fields in the selected fault model; no separate debug runner is
required.

Supported `trace_level` values:

- `off`: default; no per-site trace directory
- `basic`: manifest, command records, runtime environment, selected metadata,
  source window, worklist row, run stdout/stderr, dumps, and relevant IR/binary
  files
- `machine`: `basic` plus rendered injected LLVM IR, dynamic library listing,
  configured GPU query output, and `trace_copy_globs`
- `full`: `machine` plus all regular files from the injection scratch
  directory; use only for small targeted reruns

Each trace directory includes `trace_results.txt` with the result, exit code,
stdout/stderr paths, scratch path, dump path, and failure tails when applicable.

Related options:

- `trace_repeats`: repeat non-baseline injections
- `trace_source_window`: source lines saved around the selected metadata line
- `trace_metadata_dir`: alternate directory for `sites_metadata.csv` and
  worklists
- `runtime_env`: extra environment variables for the run
