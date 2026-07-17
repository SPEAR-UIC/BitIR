# Cross-Machine Readiness Gate

This branch now contains original campaign artifacts for NVIDIA, AMD, and Intel, plus derived validation artifacts under `divergence_cases/validation/`.

Readiness is split into two levels:

- `strict_cross_machine_ready`: exact canonical site-key agreement, including `site_class`.
- `class_family_cross_machine_usable`: unique three-machine match under the recorded value-family fallback, where `result` and `base` are treated as the same value family but the actual per-backend `site_class` is preserved in the mapping.

Current result:

- No benchmark has strict three-machine consensus sites.
- `matrix-rotate`, `entropy`, and `colorwheel` have outcome-backed class-family consensus rows.
- `jacobi`, `layout`, `dense-embedding`, `pathfinder`, and `randomAccess` do not currently have outcome-backed three-machine consensus rows under these policies.

Use `divergence_cases/validation/cross_machine_alignment/alignment_summary.csv` and `divergence_cases/validation/cross_machine_alignment/outcome_summary_status.csv` as the machine-readable source of truth. Do not use raw backend-local `site_id` values directly across machines.
