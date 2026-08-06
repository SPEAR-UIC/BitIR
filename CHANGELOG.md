# Changelog

## Unreleased

### Removed

- Removed the deleted `progress_journal.docx` research artifact from version control.
- Removed the temporary `bitir/qualification/` harness. Benchmark qualification should be handled through normal build/golden/baseline campaigns instead of a separate temporary pipeline.
- Removed untracked local-only clutter from the working tree: `.vscode/` and `divergence_analysis_outputs/`.

### Moved

- Moved post-processing helpers out of the injection toolchain:
  - `bitir/tools/llvm17_inject/compute_sdc_metrics.py` -> `bitir/analysis/compute_sdc_metrics.py`
  - `bitir/tools/llvm17_inject/merge_bench_summaries.py` -> `bitir/analysis/merge_bench_summaries.py`

### Refactored

- Replaced the monolithic `bitir/tools/llvm17_inject/bitir_pipeline.py` implementation with a smaller controller:
  - `bitir/tools/llvm17_inject/controller.py` owns CLI orchestration.
  - `bitir/tools/llvm17_inject/pipeline_config.py` owns YAML loading, merge, mode resolution, and machine validation.
  - `bitir/tools/llvm17_inject/pipeline_shell.py` owns scheduler/local shell rendering.
  - `bitir/tools/llvm17_inject/task_bodies.py` owns the backend shell task bodies.
  - `bitir/tools/llvm17_inject/bitir_pipeline.py` is now only an 8-line compatibility shim.
- Reduced controller work in wrapper modes: `write-script`, `submit`, and `print-script` now generate compact scheduler wrappers directly instead of constructing the full local execution environment first.
- Moved shared benchmark-set helper logic into `bitir/tools/benchmark_sets/benchmark_common.py` and removed duplicated parsing/discovery code from `prepare_benchmark_set.py` and `profile_golden_outputs.py`.
- Extracted shared machine/toolchain/backend definitions into:
  - `bitir/config/machines/polaris.yml`
  - `bitir/config/machines/aurora.yml`
  - `bitir/config/machines/frontier.yml`
- Slimmed machine run configs in `bitir/config/runs/` so toy/template YAMLs extend shared machine configs instead of duplicating entire scheduler/toolchain definitions.
- Kept toy YAMLs focused on smoke-test choices: campaign benchmarks, toy fault models, output directories, and debug scheduler overrides.
- Kept template YAMLs focused on campaign defaults and benchmark selections.

### Documentation

- Updated `README.md` repository layout to reflect the new config structure and analysis location.
- Updated `bitir/tools/llvm17_inject/PIPELINE.md` to describe shared machine configs and the cleaner run-config workflow.

### Validation

- Verified Python syntax with `python3 -m py_compile` across BitIR Python tools.
- Verified no exact duplicate top-level Python functions remain.
- Verified all concrete machine run configs render build scripts with `--print-script`:
  - `aurora_template.yml`
  - `frontier_template.yml`
  - `polaris_template.yml`
  - `aurora_toy.yml`
  - `frontier_toy.yml`
  - `polaris_toy.yml`
