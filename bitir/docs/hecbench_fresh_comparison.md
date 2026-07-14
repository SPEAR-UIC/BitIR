# Fresh HeCBench Comparison

Comparison target: `ORNL/HeCBench` cloned at `3cdcf08` into `/private/tmp/HeCBench_clean`.

## Summary

The pipeline can render build and deploy scripts with `benchmark_sets.hecbench.root`
pointing at the fresh checkout, so the new BitIR path plumbing works.

The fresh checkout is not ready to run as a drop-in replacement yet. The original
breakage was concentrated in two areas:

- HeCBench CMake behavior: upstream config still visits many benchmark directories
  when a small benchmark list is requested, and some directories execute configure
  steps that fail when optional data archives are absent.
- Benchmark golden-output hooks: local benchmark sources accept an extra dump path
  argument and write binary snapshots; fresh upstream sources do not.

## Inventory

- Current local HeCBench subset: 74 files at max depth 3.
- Fresh upstream checkout: 10,939 files at max depth 3.
- Local-only files after moving BitIR code out:
  - `cmake/modules/FIGPUIntegration.cmake`
  - `cmake/scripts/fi_nvcc_wrapper.sh.in`
- Overlapping files with content differences include:
  - `CMakeLists.txt`
  - `cmake/modules/BenchmarkMacros.cmake`
  - `cmake/modules/FindSYCL.cmake`
  - `src/CMakeLists.txt`
  - selected benchmark `main.*` files for layout, entropy, jacobi, pathfinder,
    randomAccess, colorwheel, dense-embedding, matrix-rotate, and wordcount.

## CMake Probe

Command shape tested:

```bash
cmake -S /private/tmp/HeCBench_clean \
  -B /private/tmp/hecbench_clean_cmake_probe \
  -DHECBENCH_ENABLE_CUDA=OFF \
  -DHECBENCH_ENABLE_HIP=OFF \
  -DHECBENCH_ENABLE_SYCL=OFF \
  -DHECBENCH_ENABLE_OPENMP=OFF \
  -DHECBENCH_ENABLE_TESTING=OFF
```

Result: failed. Upstream `src/CMakeLists.txt` iterates a large internal benchmark
list and calls `add_subdirectory` for every listed benchmark/model directory that
exists. Some of those directories attempt data extraction at configure time and
fail when archives are missing, even though the selected BitIR benchmark was only
`layout`.

The current local HeCBench subset configured successfully with the same backends
disabled because its local CMake tree adds only the present subset and
`BenchmarkMacros.cmake` returns early for unselected benchmarks.

Follow-up: BitIR now generates an external CMake overlay with
`bitir/tools/benchmark_sets/prepare_benchmark_set.py`. The overlay discovers
available `*-cuda`, `*-hip`, and `*-sycl` variants, writes a selected-only
`CMakeLists.txt`, and avoids running upstream `src/CMakeLists.txt`. A disabled
backend configure against the fresh checkout succeeded through this overlay.

## Script Render Probe

Temporary configs extended the shipped toy YAMLs and overrode:

```yaml
benchmark_sets:
  hecbench:
    root: /private/tmp/HeCBench_clean
    source_root: src
    build_system: cmake
```

Rendered successfully:

- Polaris build and deploy scripts
- Aurora build and deploy scripts
- Frontier build and deploy scripts

This validates BitIR-owned paths and benchmark set roots at script-generation
time only. It does not validate CMake compilation or golden-output generation on
the target systems.

## Required Migration Work

1. CMake selection behavior has been moved out of the HeCBench checkout.
   The generated overlay configures only requested benchmark variants before
   invoking their benchmark CMake files.

2. Move golden-output snapshot behavior out of edited benchmark files.
   Options to evaluate:
   - maintain benchmark source patches under `bitir/patches/hecbench`
   - generate patched benchmark overlays into `bitir/build/benchmark_sets`
   - add external wrappers only where stdout/text comparison is sufficient

3. Remove or isolate old FI-GPU CMake integration.
   `FIGPUIntegration.cmake` and `fi_nvcc_wrapper.sh.in` are local-only and not
   part of the current LLVM BitIR injection path.

4. Re-run the toy render and CMake probes after each migration step.
