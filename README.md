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

Generated PBS/SLURM files are intentionally thin scheduler scripts: they contain the
resource header, direct module commands from the YAML, then call the BitIR
controller in local mode inside the allocation. The detailed build/deploy shell
is fed directly to `bash` internally so submitted scheduler scripts stay
readable. Scheduler stdout and stderr are merged into the generated `OUT_*.out`
file; the templates do not create separate `ERROR_*.err` files.

## Repository Layout

| Path | Purpose |
| --- | --- |
| `bitir/config/bitir.yml` | Base config shape |
| `bitir/config/fault_models.yml` | Reusable fault model definitions |
| `bitir/config/machines/*.yml` | Shared scheduler/toolchain/backend definitions for supported systems |
| `bitir/config/runs/*_toy.yml` | Small hardware smoke tests that extend shared machine configs |
| `bitir/config/runs/*_template.yml` | Minimal campaign templates that extend shared machine configs |
| `bitir/config/runs/run_template.yml` | Blank template for a new machine or campaign |
| `bitir/tools/llvm17_inject/controller.py` | Minimal CLI controller for build/deploy/baseline/golden/inject-one |
| `bitir/tools/llvm17_inject/pipeline_*.py` | Small controller support modules for config and shell rendering |
| `bitir/tools/llvm17_inject/task_bodies.py` | Backend shell task bodies used only for local execution inside allocations |
| `bitir/tools/llvm17_inject/` | LLVM injection pass, worklist builder, runner, and comparators |
| `bitir/tools/benchmarks/` | Runtime benchmark overlay and golden-output profiling tools |
| `bitir/benchmarks/hecbench/` | Runtime HeCBench assets used by campaigns, such as dump adapters |
| `dev/` | Development-only inspection tools, review manifests, notes, and research analysis |
| `HeCBench/` | Upstream ORNL/HeCBench checkout, tracked as a git submodule |
| `<benchmark_set>/src/` | Supported benchmark sources; the default checkout is `HeCBench` |

User-facing campaign code lives under `bitir/`. Development and research work
lives under `dev/`. The `HeCBench/` directory is treated as the selected
benchmark checkout, not as a place for BitIR pipeline code.

## Development Principles

Project coding rules live in [AGENTS.md](AGENTS.md). In short:

- Do not add legacy compatibility paths. Update callers to the current workflow and remove old paths.
- Do not add wrappers, facades, adapters, or forwarding helpers unless they remove real duplication or isolate an external boundary.
- Keep symbols scarce and domain-specific. Prefer inline logic over new names when the logic is local and simple.
- Prefer deleting obsolete behavior over preserving every previous edge case.

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

The controller needs PyYAML:

```bash
python3 -m pip install -r requirements.txt
```

On each target machine, the selected YAML must also load working CMake, compiler,
LLVM, and GPU runtime tools through its `modules`, `module_use`, and tool path
fields.

## Quickstart

These toy demos are the first hardware tests to run on each supported machine.
Pass your scheduler project/account with `--account <account>`. If omitted, the
generated script keeps an editable `{ADD ACCOUNT HERE}` placeholder in the `-A`
line.

Each toy config builds the `layout` benchmark for that machine backend,
generates a golden output, creates an instruction-result worklist, runs a
baseline check, and injects up to 8 site/bit pairs.

### Polaris

Run from the repository root on Polaris:

```bash
python3 bitir/tools/llvm17_inject/controller.py \
  build bitir/config/runs/polaris_toy.yml \
  --account <account>
```

Inspect the generated `.bitir_jobs/polaris_build_*.pbs` file, edit resource
lines if needed, then submit it with `qsub`.

After the build/golden job finishes:

```bash
python3 bitir/tools/llvm17_inject/controller.py \
  deploy bitir/config/runs/polaris_toy.yml \
  --account <account>
```

Inspect the generated `.bitir_jobs/polaris_deploy_*.pbs` file, edit resource
lines if needed, then submit it with `qsub`.

Expected backend: `layout-cuda`.

### Aurora

Run from the repository root on Aurora:

```bash
python3 bitir/tools/llvm17_inject/controller.py \
  build bitir/config/runs/aurora_toy.yml \
  --account <account>
```

Inspect the generated `.bitir_jobs/aurora_build_*.pbs` file, edit resource
lines if needed, then submit it with `qsub`.

After the build/golden job finishes:

```bash
python3 bitir/tools/llvm17_inject/controller.py \
  deploy bitir/config/runs/aurora_toy.yml \
  --account <account>
```

Inspect the generated `.bitir_jobs/aurora_deploy_*.pbs` file, edit resource
lines if needed, then submit it with `qsub`.

Expected backend: `layout-sycl`.

### Frontier

Run from the repository root on Frontier:

```bash
python3 bitir/tools/llvm17_inject/controller.py \
  build bitir/config/runs/frontier_toy.yml \
  --account <account>
```

Inspect the generated `.bitir_jobs/frontier_build_*.sbatch` file, edit resource
lines if needed, then submit it with `sbatch`.

After the build/golden job finishes:

```bash
python3 bitir/tools/llvm17_inject/controller.py \
  deploy bitir/config/runs/frontier_toy.yml \
  --account <account>
```

Inspect the generated `.bitir_jobs/frontier_deploy_*.sbatch` file, edit resource
lines if needed, then submit it with `sbatch`.

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

Generate the build job:

```bash
python3 bitir/tools/llvm17_inject/controller.py build my_polaris_campaign.yml
```

Inspect the generated scheduler script, edit the account/resource lines if
needed, then submit it with the scheduler command for that machine. For Aurora,
use the same generation command shape with `my_aurora_campaign.yml`; for
Frontier, use `my_frontier_campaign.yml`.

After the build/golden job finishes, generate deploy:

```bash
python3 bitir/tools/llvm17_inject/controller.py deploy my_polaris_campaign.yml
```

Again, inspect/edit the generated scheduler script before submitting it.

### Fault Models And Worklists

Reusable fault models live in [bitir/config/fault_models.yml](bitir/config/fault_models.yml).
Run YAMLs can use those models by extending that file:

```yaml
extends:
  - ../bitir.yml
  - ../fault_models.yml
```

Machine-specific or campaign-specific models can still be defined under
`fault_models` in the run YAML:

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
- `pointer_only`, `instruction_pointer`
- `int_only`
- `float_only`
- `operand_only`, `instruction_operand`
- instruction families: `add`, `sub`, `mul`, `div`, `rem`, `shift`, `bitwise`, `compare`, `cast`
- individual LLVM opcodes such as `add`, `fadd`, `mul`, `fmul`, `zext`,
  `sext`, `trunc`, `bitcast`, `select`, `load`, `store`, `getelementptr`,
  `gep`, `call`, or `phi`
- opcode aliases of the form `<opcode>_instruction` or
  `<opcode>_instructions`, such as `zext_instructions`

For comma-separated opcode sets, use an explicit opcode list:

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

## Options Reference

This section lists the predefined options accepted by the current pipeline.
Prefer changing YAML values over editing BitIR source code.

### Launcher Tasks And Execution Modes

Tasks:

- `build`: configure and build all benchmarks in the selected campaign, then
  generate golden outputs in one scheduler job
- `golden`: same build/golden path as `build`
- `deploy`: generate worklists, optionally run no-flip baseline checks through
  the injected-build path, then run the selected injections in one scheduler job
- `baseline`: run baseline checks without a full deploy campaign
- `inject-one`: run one benchmark/site/bit pair

Execution modes:

- `write-script`: default; write a PBS/SLURM script under `.bitir_jobs/`
- `submit`: write and submit the generated scheduler script with `submit_command`
- `local`: run immediately in the current shell; intended for inside scheduler
  allocations or local debugging
- `print-script`: print the generated script to stdout

CLI overrides:

- `--machine`: override `run.machine`
- `--campaign`: override `run.campaign`
- `--bench`: run one benchmark instead of the campaign list
- `--benches-file`: read benchmark names from a text file
- `--fault-model`: override `run.fault_model`
- `--account`: render scheduler `-A` account/project fields in generated
  PBS/SLURM headers
- `--site-id` and `--bit-index`: required for `inject-one`
- `--repo-root`: use a repository root other than the parent of `bitir/`
- `--submit`, `--local`, `--print-script`: force the execution mode

### Fault Model Fields

Common fields under `fault_models.<name>`:

- `selection_mode`: predefined worklist modality; see below
- `site_list`: CSV of exact sites/bits; takes precedence over generated
  worklists when set
- `phase`: result subdirectory label, usually `float`, `int`, or another
  campaign-specific name
- `max_injections`: maximum injections per benchmark; `0` means no explicit
  limit
- `max_pairs`: older alias used as a fallback when `max_injections` is absent
- `run_baseline`: `1` runs a no-flip baseline through the injected-build path
  before injections
- `skip_existing`: `1` skips site/bit runs with existing stdout/stderr files
- `keep_dumps`: `1` preserves candidate dump files for non-baseline runs
- `missing_only`: exported for custom run logic; use when a campaign should
  only fill missing results
- `runtime_env`: map of extra environment variables exported during deploy

Worklist filter fields:

- `inject_target`: low-level target, one of `result`, `operand`, `pointer`,
  or `all`; normally inferred from `selection_mode`
- `int_float_only`: `1` limits result/operand sites to int/float typed values
- `include_constants`: `1` allows constant operands where supported
- `type_kind`: optional type filter such as `int`, `float`, or `ptr`
- `opcodes`: comma-separated opcode filter such as `add,fadd,zext`
- `random_sample`: number of generated rows to keep for `selection_mode: random`
- `random_seed`: deterministic shuffle seed for random sampling

### Worklist Selection Modes

Predefined `selection_mode` values:

- `instruction_result`, `instruction_results`, `result`: LLVM instruction
  result sites only
- `all`, `all_bits`, `all_sites`: valid result, operand, and pointer sites
- `random`: deterministic random subset of all valid sites; use with
  `random_sample` and `random_seed`
- `pointer`, `pointer_only`, `instruction_pointer`: pointer sites only
- `int`, `int_only`: integer typed sites
- `float`, `float_only`: floating point typed sites
- `operand`, `operand_only`, `instruction_operand`: instruction operand sites
- `add`, `add_instructions`: `add,fadd`
- `sub`, `sub_instructions`: `sub,fsub`
- `mul`, `mul_instructions`: `mul,fmul`
- `div`, `div_instructions`: `udiv,sdiv,fdiv`
- `rem`, `remainder_instructions`: `urem,srem,frem`
- `shift`, `shift_instructions`: `shl,lshr,ashr`
- `bitwise`, `bitwise_instructions`: `and,or,xor`
- `compare`, `compare_instructions`: `icmp,fcmp`
- `cast`, `cast_instructions`: `trunc,zext,sext,fptrunc,fpext,fptoui,fptosi,uitofp,sitofp,ptrtoint,inttoptr,bitcast,addrspacecast`
- individual LLVM opcode modes such as `add`, `fadd`, `mul`, `fmul`, `zext`,
  `sext`, `trunc`, `bitcast`, `select`, `load`, `store`, `getelementptr`,
  `gep`, `call`, or `phi`
- opcode aliases of the form `<opcode>_instruction` or
  `<opcode>_instructions`

For comma-separated opcode sets, use `selection_mode: all` plus `opcodes`.

### Debug And Trace Options

`trace_level` controls how much per-site diagnostic data is saved under each
result directory:

- `off`: default; no trace directory is created
- `basic`: saves manifest, command records, runtime environment, selected site
  metadata, matching worklist row, source window, stdout/stderr, dumps, and
  relevant IR/binary files
- `machine`: includes `basic` data plus rendered injected LLVM IR,
  `ldd` output, GPU query output when `gpu_query_command` is configured, and
  files matching `trace_copy_globs`
- `full`: includes `machine` data plus every regular file from the injection
  scratch directory; use only for small targeted reruns because it can be large

Recommended use:

- Use `off` for normal campaigns.
- Use `basic` when a site/bit gives an unexpected result and you need enough
  context to inspect the run.
- Use `machine` when the issue may depend on GPU state, dynamic libraries, or
  generated IR.
- Use `full` only for one or a few sites when lower levels are insufficient.

Related trace fields:

- `trace_repeats`: repeat each non-baseline injection N times; baseline always
  runs once
- `trace_source_window`: source lines to save before and after the selected
  metadata line; default is `6`
- `trace_metadata_dir`: directory containing site metadata and worklists;
  defaults to the current results directory

Each trace directory contains `trace_results.txt`, a compact summary of the
result, exit code, stdout/stderr paths, scratch directory, dump path, and failure
tails when applicable.

Deploy, baseline, and targeted injection results write to a top-level
timestamped directory such as
`results/YYYYMMDD_HHMMSS/`. Files inside that directory are flat and prefixed by
benchmark/fault-model tag, for example `layout_pointer_summary.csv`,
`layout_pointer_worklist.csv`, and `layout_pointer_site1_bit0.out`.

Runtime debug environment variables can be set under `runtime_env` or machine
dump env fields. Current HeCBench layout adapters recognize:

- `HECBENCH_GPU_DEBUG=1`: print GPU/device diagnostics from layout adapters
- `HECBENCH_LLFI_FORCE_DUMP=1`: force dump adapters to write outputs

Scheduler debug queues, such as Polaris/Aurora `#PBS -q debug`, are configured
in `machines.<name>.jobs.<task>.header` and are separate from `trace_level`.

### HeCBench Output Manifest

HeCBench output handling is moving to an application-level manifest. The manifest describes what final program state should be dumped and how it should be compared; it does not define separate correctness contracts for CUDA, HIP, SYCL, or OMP.

Generate the proposed inventory with:

```bash
python3 dev/tools/inspect_hecbench_outputs.py \
  --benchmark-root HeCBench \
  --output dev/manifests/hecbench/output_manifest.proposed.yml
```

The proposed file groups backend implementations under each application and marks every entry `review: needed`. Review turns proposed output contracts into exact benchmark contracts. Once reviewed, normal pipeline operation should treat a missing manifest entry as a repository completeness error, not as an unsupported benchmark category.

### Benchmark Output Options

Benchmark fields under `benchmarks.<name>`:

- `source_dirs`: map from backend key (`cuda`, `hip`, `sycl`) to source path
  relative to the benchmark set root
- `args`: command-line arguments passed to the benchmark
- `env`: values used to format benchmark args and golden file names
- `extra_includes`: backend-specific include paths for injection builds
- `golden_file`: expected golden output name; defaults to `<benchmark>.bin`
- `compare_mode`: `exact`, `float`, or `text`
- `status`: free-form benchmark notes exported as `BITIR_STATUS_*`

Compare modes:

- `exact`: byte-for-byte binary comparison
- `float`: floating point dump comparison using `methodology.float_abs_tol` and
  `methodology.float_rel_tol`
- `text`: compare normalized text signatures

### Machine Options

Common fields under `machines.<name>`:

- `submit_command`: scheduler command, usually `qsub` or `sbatch`
- `script_extension`: generated script extension, such as `.pbs` or `.sbatch`
- `module_use`: module search paths
- `modules`: modules loaded by generated scripts
- `jobs.<task>.header`: literal PBS/SLURM header lines for each task
- `source_key`: backend key used to select benchmark source directories
- `binary_subdir`: backend binary directory, usually `cuda`, `hip`, or `sycl`
- `source_file`: benchmark source filename or glob
- `cuda_host_compiler`: optional host C++ compiler for nvcc/CMake CUDA builds
- `build_dir`, `golden_root`, `results_root`: run output locations
- `build_configure`, `build_prepare`: build-stage shell commands
- `build_run_dump_env`, `run_dump_env`: environment assignments used while
  generating or comparing dumps
- `worklist_build_ir`: command used to emit LLVM IR for site enumeration
- `inject_build_baseline`, `inject_build_injected`: commands used for baseline
  and injected binaries
- `inject_build`: optional shared injection build command
- `inject_prepare`: optional command run before injection builds
- `gpu_query_command`: command captured by `trace_level: machine` or `full`
- `trace_copy_globs`: files copied into trace directories at machine/full trace
  levels

Polaris currently uses CUDA 11.8. Its normal `gcc-native` modules expose GCC
12+, which is not reliable for all CUDA 11.8 benchmarks, so the Polaris YAMLs
set `cuda_host_compiler: /usr/bin/g++`.

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

Treat benchmarks as campaign-ready only after the target machine passes build,
golden-output generation, and no-flip baseline validation.

### Common Issues

- `ModuleNotFoundError: No module named 'yaml'`

  Install PyYAML in the Python environment used to run the controller:

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
