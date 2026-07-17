# Frontier AMD Original Campaign Inventory

This bundle was assembled on July 17, 2026 on branch `divergence_cases`.

Provenance layers:

- `original/`: copied from `origin/amd-hip-llvm17-injection-pipeline`
- `fixed_refresh_2026-07-08/`: copied from commit `a6325c20` (`Refresh Frontier AMD metadata and comparable study summaries`, July 8, 2026)
- `fixed_comparable_summaries_2026-07-17/`: copied from the current `debug-trace` worktree state on July 17, 2026
- `generated_fill_2026-07-17/`: July 17, 2026 gap-fill copies created from the fixed July 8, 2026 site inventories and the fixed July 17, 2026 comparable summary tables

No FI injections were rerun.
No debug-trace rerun outputs, selected-case bundles, fault-path bundles, top10 outputs, or paper-derived case lists were copied into this bundle.

All benchmark requirements are now populated in this bundle.
Some required artifacts still do not exist as original-source files on `origin/amd-hip-llvm17-injection-pipeline`; those cases are filled under `generated_fill_2026-07-17/`.

## Per-benchmark status

### matrix-rotate

- Original found:
  - `original/llvm17_inject_amd/matrix-rotate/sites.csv`
  - `original/llvm17_inject_amd/matrix-rotate/sites_metadata.csv`
  - `original/llvm17_inject_amd/matrix-rotate/summary.csv`
  - `original/llvm17_inject_amd_aligned_srun/matrix-rotate/summary.csv`
  - `original/llvm17_inject_amd_aligned_srun/matrix-rotate/summary_counts.txt`
- Fixed carried forward:
  - `fixed_refresh_2026-07-08/llvm17_inject_amd/matrix-rotate/sites.csv`
  - `fixed_refresh_2026-07-08/llvm17_inject_amd/matrix-rotate/sites_metadata.csv`
  - `fixed_comparable_summaries_2026-07-17/llvm17_inject_amd/matrix-rotate/float/summary.csv`
  - `fixed_comparable_summaries_2026-07-17/llvm17_inject_amd/matrix-rotate/float/summary_counts.txt`
- Generated fill:
  - `generated_fill_2026-07-17/llvm17_inject_amd/matrix-rotate/summary_counts.txt`
- Irreducible provenance gap:
  - No original-source `llvm17_inject_amd/matrix-rotate/summary_counts.txt` exists on `origin/amd-hip-llvm17-injection-pipeline`

### jacobi

- Original found:
  - `original/llvm17_inject_amd_aligned_srun/jacobi/summary.csv`
  - `original/llvm17_inject_amd_aligned_srun/jacobi/summary_counts.txt`
- Fixed carried forward:
  - `fixed_refresh_2026-07-08/llvm17_inject_amd/jacobi/sites.csv`
  - `fixed_refresh_2026-07-08/llvm17_inject_amd/jacobi/sites_metadata.csv`
  - `fixed_comparable_summaries_2026-07-17/llvm17_inject_amd/jacobi/float/summary.csv`
  - `fixed_comparable_summaries_2026-07-17/llvm17_inject_amd/jacobi/float/summary_counts.txt`
- Generated fill:
  - `generated_fill_2026-07-17/llvm17_inject_amd/jacobi/sites.csv`
  - `generated_fill_2026-07-17/llvm17_inject_amd/jacobi/sites_metadata.csv`
  - `generated_fill_2026-07-17/llvm17_inject_amd/jacobi/summary.csv`
  - `generated_fill_2026-07-17/llvm17_inject_amd/jacobi/summary_counts.txt`
- Irreducible provenance gaps:
  - No original-source `llvm17_inject_amd/jacobi/sites.csv`
  - No original-source `llvm17_inject_amd/jacobi/sites_metadata.csv`
  - No original-source `llvm17_inject_amd/jacobi/summary.csv`
  - No original-source `llvm17_inject_amd/jacobi/summary_counts.txt`

### layout

- Original found:
  - `original/llvm17_inject_amd/layout/sites.csv`
  - `original/llvm17_inject_amd/layout/sites_metadata.csv`
  - `original/llvm17_inject_amd/layout/summary.csv`
  - `original/llvm17_inject_amd_aligned_srun/layout/summary.csv`
  - `original/llvm17_inject_amd_aligned_srun/layout/summary_counts.txt`
- Fixed carried forward:
  - `fixed_refresh_2026-07-08/llvm17_inject_amd/layout/sites.csv`
  - `fixed_refresh_2026-07-08/llvm17_inject_amd/layout/sites_metadata.csv`
  - `fixed_comparable_summaries_2026-07-17/llvm17_inject_amd/layout/float/summary.csv`
  - `fixed_comparable_summaries_2026-07-17/llvm17_inject_amd/layout/float/summary_counts.txt`
- Generated fill:
  - `generated_fill_2026-07-17/llvm17_inject_amd/layout/summary_counts.txt`
- Irreducible provenance gap:
  - No original-source `llvm17_inject_amd/layout/summary_counts.txt`

### dense-embedding

- Original found:
  - `original/llvm17_inject_amd_aligned_srun/dense-embedding/summary.csv`
  - `original/llvm17_inject_amd_aligned_srun/dense-embedding/summary_counts.txt`
- Fixed carried forward:
  - `fixed_refresh_2026-07-08/llvm17_inject_amd/dense-embedding/sites.csv`
  - `fixed_refresh_2026-07-08/llvm17_inject_amd/dense-embedding/sites_metadata.csv`
  - `fixed_comparable_summaries_2026-07-17/llvm17_inject_amd/dense-embedding/float/summary.csv`
  - `fixed_comparable_summaries_2026-07-17/llvm17_inject_amd/dense-embedding/float/summary_counts.txt`
- Generated fill:
  - `generated_fill_2026-07-17/llvm17_inject_amd/dense-embedding/sites.csv`
  - `generated_fill_2026-07-17/llvm17_inject_amd/dense-embedding/sites_metadata.csv`
  - `generated_fill_2026-07-17/llvm17_inject_amd/dense-embedding/summary.csv`
  - `generated_fill_2026-07-17/llvm17_inject_amd/dense-embedding/summary_counts.txt`
- Irreducible provenance gaps:
  - No original-source `llvm17_inject_amd/dense-embedding/sites.csv`
  - No original-source `llvm17_inject_amd/dense-embedding/sites_metadata.csv`
  - No original-source `llvm17_inject_amd/dense-embedding/summary.csv`
  - No original-source `llvm17_inject_amd/dense-embedding/summary_counts.txt`

### pathfinder

- Original found:
  - `original/llvm17_inject_amd_aligned_srun/pathfinder/summary.csv`
  - `original/llvm17_inject_amd_aligned_srun/pathfinder/summary_counts.txt`
- Fixed carried forward:
  - `fixed_refresh_2026-07-08/llvm17_inject_amd/pathfinder/sites.csv`
  - `fixed_refresh_2026-07-08/llvm17_inject_amd/pathfinder/sites_metadata.csv`
  - `fixed_comparable_summaries_2026-07-17/llvm17_inject_amd/pathfinder/float/summary.csv`
  - `fixed_comparable_summaries_2026-07-17/llvm17_inject_amd/pathfinder/float/summary_counts.txt`
- Generated fill:
  - `generated_fill_2026-07-17/llvm17_inject_amd/pathfinder/sites.csv`
  - `generated_fill_2026-07-17/llvm17_inject_amd/pathfinder/sites_metadata.csv`
  - `generated_fill_2026-07-17/llvm17_inject_amd/pathfinder/summary.csv`
  - `generated_fill_2026-07-17/llvm17_inject_amd/pathfinder/summary_counts.txt`
- Irreducible provenance gaps:
  - No original-source `llvm17_inject_amd/pathfinder/sites.csv`
  - No original-source `llvm17_inject_amd/pathfinder/sites_metadata.csv`
  - No original-source `llvm17_inject_amd/pathfinder/summary.csv`
  - No original-source `llvm17_inject_amd/pathfinder/summary_counts.txt`

### entropy

- Original found:
  - `original/llvm17_inject_amd/entropy/sites.csv`
  - `original/llvm17_inject_amd/entropy/sites_metadata.csv`
  - `original/llvm17_inject_amd/entropy/summary.csv`
  - `original/llvm17_inject_amd_aligned_srun/entropy/summary.csv`
  - `original/llvm17_inject_amd_aligned_srun/entropy/summary_counts.txt`
- Fixed carried forward:
  - `fixed_refresh_2026-07-08/llvm17_inject_amd/entropy/sites.csv`
  - `fixed_refresh_2026-07-08/llvm17_inject_amd/entropy/sites_metadata.csv`
  - `fixed_comparable_summaries_2026-07-17/llvm17_inject_amd/entropy/float/summary.csv`
  - `fixed_comparable_summaries_2026-07-17/llvm17_inject_amd/entropy/float/summary_counts.txt`
- Generated fill:
  - `generated_fill_2026-07-17/llvm17_inject_amd/entropy/summary_counts.txt`
- Irreducible provenance gap:
  - No original-source `llvm17_inject_amd/entropy/summary_counts.txt`

### colorwheel

- Original found:
  - `original/llvm17_inject_amd/colorwheel/summary.csv`
  - `original/llvm17_inject_amd/colorwheel/summary_counts.txt`
- Fixed carried forward:
  - `fixed_refresh_2026-07-08/llvm17_inject_amd/colorwheel/sites.csv`
  - `fixed_refresh_2026-07-08/llvm17_inject_amd/colorwheel/sites_metadata.csv`
  - `fixed_comparable_summaries_2026-07-17/llvm17_inject_amd/colorwheel/float/summary.csv`
  - `fixed_comparable_summaries_2026-07-17/llvm17_inject_amd/colorwheel/float/summary_counts.txt`
- Generated fill:
  - `generated_fill_2026-07-17/llvm17_inject_amd/colorwheel/sites.csv`
  - `generated_fill_2026-07-17/llvm17_inject_amd/colorwheel/sites_metadata.csv`
  - `generated_fill_2026-07-17/llvm17_inject_amd_aligned_srun/colorwheel/summary.csv`
  - `generated_fill_2026-07-17/llvm17_inject_amd_aligned_srun/colorwheel/summary_counts.txt`
- Irreducible provenance gaps:
  - No original-source `llvm17_inject_amd/colorwheel/sites.csv`
  - No original-source `llvm17_inject_amd/colorwheel/sites_metadata.csv`
  - No original-source `llvm17_inject_amd_aligned_srun/colorwheel/summary.csv`
  - No original-source `llvm17_inject_amd_aligned_srun/colorwheel/summary_counts.txt`

### randomAccess

- Original found:
  - `original/llvm17_inject_amd/randomAccess/sites.csv`
  - `original/llvm17_inject_amd/randomAccess/sites_metadata.csv`
  - `original/llvm17_inject_amd/randomAccess/summary.csv`
  - `original/llvm17_inject_amd_aligned_srun/randomAccess/summary.csv`
  - `original/llvm17_inject_amd_aligned_srun/randomAccess/summary_counts.txt`
- Fixed carried forward:
  - `fixed_refresh_2026-07-08/llvm17_inject_amd/randomAccess/sites.csv`
  - `fixed_refresh_2026-07-08/llvm17_inject_amd/randomAccess/sites_metadata.csv`
  - `fixed_comparable_summaries_2026-07-17/llvm17_inject_amd/randomAccess/float/summary.csv`
  - `fixed_comparable_summaries_2026-07-17/llvm17_inject_amd/randomAccess/float/summary_counts.txt`
- Generated fill:
  - `generated_fill_2026-07-17/llvm17_inject_amd/randomAccess/summary_counts.txt`
- Irreducible provenance gap:
  - No original-source `llvm17_inject_amd/randomAccess/summary_counts.txt`

## Regeneration status

No FI injections were rerun on July 17, 2026.
No fresh metadata dumps were required because the fixed Frontier AMD site inventories already existed in commit `a6325c20`.
The July 17, 2026 gap fill was completed by copying those fixed inventories and the fixed comparable summary tables into source-shaped paths under `generated_fill_2026-07-17/`.
