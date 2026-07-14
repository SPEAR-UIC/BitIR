# BitIR GPU Fault-Injection Pipeline

BitIR is a YAML-driven pipeline for building selected HeCBench GPU benchmarks,
generating golden outputs, building BitIR worklists, and launching injection
campaigns as single scheduler jobs.

The supported workflow has two scheduler-facing phases:

1. `build`: builds all selected benchmarks in one PBS/SLURM job and generates
   golden outputs on the target machine.
2. `deploy`: builds worklists, runs baseline checks, and launches injections
   for all selected benchmarks in one PBS/SLURM job.

Build and deploy jobs are not split per benchmark.

## Repository Layout

| Path | Purpose |
| --- | --- |
| `bitir/config/bitir.yml` | Base config shape |
| `bitir/config/runs/*_toy.yml` | Small hardware smoke tests for Polaris, Aurora, and Frontier |
| `bitir/config/runs/*_template.yml` | Machine-specific campaign templates |
| `bitir/config/runs/run_template.yml` | Blank template for a new machine |
| `bitir/tools/llvm17_inject/` | Pipeline launcher, LLVM pass, worklist builder, runner, and comparators |
| `HeCBench/` | Upstream ORNL/HeCBench checkout, tracked as a git submodule |
| `<benchmark_set>/src/` | Supported benchmark sources; the default checkout is `HeCBench` |

BitIR-owned code lives under `bitir/`. The `HeCBench/` directory is treated as
the selected benchmark checkout, not as a place for BitIR pipeline code.

## Local Prerequisite

Clone with submodules, or initialize the HeCBench submodule after cloning:

```bash
git clone --recurse-submodules git@github.com:mdunlavy/GPU_FI.git
cd GPU_FI
```

For an existing checkout:

```bash
git submodule update --init --recursive
```

The launcher needs PyYAML:

```bash
python3 -m pip install -r requirements.txt
```

On each target machine, the selected YAML must also load working CMake, compiler,
LLVM, and GPU runtime tools through its `modules`, `module_use`, and tool path
fields.

## Quickstart

These toy demos are the first hardware tests to run on each supported machine.
Before submitting, edit the `#PBS -A {ADD ACCOUNT HERE}` or
`#SBATCH -A {ADD ACCOUNT HERE}` lines in the matching toy YAML.

Each toy config builds the `layout` benchmark for that machine backend,
generates a golden output, creates an instruction-result worklist, runs a
baseline check, and injects up to 8 site/bit pairs.

### Polaris

Run from the repository root on Polaris:

```bash
python3 bitir/tools/llvm17_inject/bitir_pipeline.py \
  build bitir/config/runs/polaris_toy.yml

qsub "$(ls -t .bitir_jobs/polaris_build_*.pbs | head -n 1)"
```

After the build/golden job finishes:

```bash
python3 bitir/tools/llvm17_inject/bitir_pipeline.py \
  deploy bitir/config/runs/polaris_toy.yml

qsub "$(ls -t .bitir_jobs/polaris_deploy_*.pbs | head -n 1)"
```

Expected backend: `layout-cuda`.

### Aurora

Run from the repository root on Aurora:

```bash
python3 bitir/tools/llvm17_inject/bitir_pipeline.py \
  build bitir/config/runs/aurora_toy.yml

qsub "$(ls -t .bitir_jobs/aurora_build_*.pbs | head -n 1)"
```

After the build/golden job finishes:

```bash
python3 bitir/tools/llvm17_inject/bitir_pipeline.py \
  deploy bitir/config/runs/aurora_toy.yml

qsub "$(ls -t .bitir_jobs/aurora_deploy_*.pbs | head -n 1)"
```

Expected backend: `layout-sycl`.

### Frontier

Run from the repository root on Frontier:

```bash
python3 bitir/tools/llvm17_inject/bitir_pipeline.py \
  build bitir/config/runs/frontier_toy.yml

sbatch "$(ls -t .bitir_jobs/frontier_build_*.sbatch | head -n 1)"
```

After the build/golden job finishes:

```bash
python3 bitir/tools/llvm17_inject/bitir_pipeline.py \
  deploy bitir/config/runs/frontier_toy.yml

sbatch "$(ls -t .bitir_jobs/frontier_deploy_*.sbatch | head -n 1)"
```

Expected backend: `layout-hip`.

## Supported-Machine Campaign Templates

For a real campaign on Polaris, Aurora, or Frontier, copy the matching template:

```bash
cp bitir/config/runs/polaris_template.yml my_polaris_campaign.yml
cp bitir/config/runs/aurora_template.yml my_aurora_campaign.yml
cp bitir/config/runs/frontier_template.yml my_frontier_campaign.yml
```

Edit the copied YAML rather than the template. At minimum, update:

- scheduler account, queue/partition, walltime, node/GPU shape
- `run.campaign`
- `run.fault_model`
- `campaigns.<name>.benchmarks`
- `fault_models.<name>`
- output directories: `build_dir`, `golden_root`, `results_root`
- benchmark args, golden file names, and compare mode under `benchmarks`

Generate and submit the build job:

```bash
python3 bitir/tools/llvm17_inject/bitir_pipeline.py build my_polaris_campaign.yml
qsub "$(ls -t .bitir_jobs/polaris_build_*.pbs | head -n 1)"
```

For Aurora, use the same shape with `my_aurora_campaign.yml` and
`.bitir_jobs/aurora_build_*.pbs`. For Frontier, use `sbatch` and
`.bitir_jobs/frontier_build_*.sbatch`.

After the build/golden job finishes, generate and submit deploy:

```bash
python3 bitir/tools/llvm17_inject/bitir_pipeline.py deploy my_polaris_campaign.yml
qsub "$(ls -t .bitir_jobs/polaris_deploy_*.pbs | head -n 1)"
```

For Aurora, use the matching Aurora PBS path. For Frontier, use `sbatch` and
the Frontier SLURM path.

### Fault Models And Worklists

Fault models live under `fault_models`:

```yaml
fault_models:
  random100:
    selection_mode: random
    random_sample: 100
    random_seed: 42
    phase: float
    max_injections: 100
    run_baseline: 1
    skip_existing: 0
```

Supported `selection_mode` values:

- `instruction_result`: SSA values produced by LLVM instructions
- `all`: valid instruction result, operand, and pointer sites
- `random`: deterministic random subset of all valid sites
- `pointer_only`
- `int_only`
- `float_only`
- `operand_only`
- instruction families: `add`, `sub`, `mul`, `div`, `rem`, `shift`, `bitwise`, `compare`, `cast`
- individual opcodes: `zext`, `sext`, `trunc`, `bitcast`, `select`, `load`, `store`, `getelementptr`, `gep`, `call`, `phi`

For opcodes not listed above, use an explicit opcode list:

```yaml
fault_models:
  custom_ops:
    selection_mode: all
    opcodes: add,fadd,mul,fmul,zext
    type_kind: int
    max_injections: 50
```

Use `site_list` when you want exact site/bit pairs instead of a generated
worklist.

## Expanding To Other Machines

Start from `bitir/config/runs/run_template.yml` when adding a new machine.
Do not change pipeline source code for normal machine bring-up; encode machine
differences in YAML.

Required YAML sections:

- `benchmark_sets`: benchmark checkout roots, such as `hecbench.root: HeCBench`
- `run`: selected machine, campaign, fault model, execution mode
- `campaigns`: benchmark list
- `fault_models`: selection mode, baseline behavior, run limit
- `benchmarks`: source dirs, args, golden file, compare mode
- `machines`: scheduler, modules, compilers, build directories, golden/results roots

Each machine must define:

- `submit_command`: usually `qsub` or `sbatch`
- `script_extension`: `.pbs` or `.sbatch`
- `jobs.build.header` and `jobs.deploy.header`
- `source_key`, `binary_subdir`, `source_file`
- `build_dir`, `golden_root`, `results_root`
- `build_configure`
- `worklist_build_ir`
- `inject_build`, or both `inject_build_baseline` and `inject_build_injected`

Use the existing Polaris, Aurora, and Frontier templates as references for CUDA,
SYCL, and HIP command shape.

### Benchmark Sets

Benchmark source paths are configured through `benchmark_sets`:

```yaml
benchmark_sets:
  hecbench:
    root: HeCBench
    source_root: src
    build_system: cmake

run:
  benchmark_set: hecbench
```

Benchmark `source_dirs` are relative to that benchmark set root:

```yaml
benchmarks:
  layout:
    source_dirs:
      cuda: src/layout-cuda
```

For a different benchmark repository, add another entry under
`benchmark_sets`, point `run.benchmark_set` at it, and keep machine-specific
build commands in YAML.

During the build phase, BitIR scans the selected benchmark set and writes a
small CMake overlay under `bitir/build/benchmark_sets/`. Machine
`build_configure` commands should configure `${BITIR_CMAKE_SOURCE_ROOT}` so only
the requested benchmark variants are added to the build.

BitIR also profiles the selected benchmark variants and writes a golden-output
key under `bitir/build/golden_keys/`. The key records the output class and dump
strategy for each requested benchmark/model pair. If a benchmark cannot be
classified as a safe binary dump or text signature, build and deploy stop before
submitting work that cannot produce or compare golden outputs. Add a reviewed
dump adapter before continuing with that benchmark.

Golden-output profiling uses three statuses: `supported` means BitIR can
proceed now, `inferred` means BitIR found a likely output class but still needs a
generated or reviewed dump adapter, and `unsupported_manual` means the output
contract could not be inferred safely. The profiler is intentionally broad for
classification, but conservative about allowing campaigns to continue without an
adapter.

### Common Issues

- `ModuleNotFoundError: No module named 'yaml'`

  Install PyYAML in the Python environment used to run the launcher:

  ```bash
  python3 -m pip install -r requirements.txt
  ```

- `missing machines.<name> field(s) in YAML`

  The YAML is missing a required machine field. Add the named field to
  `machines.<name>`; do not edit source code.

- Scheduler rejects the generated script

  Fix the YAML scheduler header under `machines.<name>.jobs.<task>.header`.
  Common causes are account, queue/partition, filesystem, walltime, or GPU
  resource syntax.

- CMake cannot find CUDA, HIP, SYCL, or compiler tools

  Fix `module_use`, `modules`, runtime paths, compiler names, or architecture
  fields in the YAML. The pipeline exports these as `BITIR_MACHINE_*`.

- `missing opt` or LLVM tool errors during deploy

  Make sure the YAML loads the intended LLVM module and sets `opt_bin`,
  `llvm_config`, `llvm_search_root`, or `tool_search_roots` as needed.

- Empty worklist

  The selected benchmark/source/backend may not expose matching sites for the
  chosen `selection_mode`, `type_kind`, or `opcodes`. Try `selection_mode: all`
  first, then narrow the selection.

- Baseline mismatch

  Re-run the build phase to refresh golden outputs, check benchmark args in
  `benchmarks.<name>.args`, and confirm `compare_mode` matches the output type.

## Generated Files

Generated job scripts, build trees, golden outputs, results, scheduler logs,
Python caches, and LLVM plugin binaries are ignored by git.
