# Cross-Machine Readiness Gate

This branch contains original campaign artifacts for NVIDIA, AMD, and Intel plus derived validation artifacts under `divergence_cases/validation/`.

Readiness is tiered because exact `site_class` and `signature_ordinal` are not stable across the three backend IR inventories.

Tiers:

- `strict_full`: same canonical source anchor, opcode, type kind, bitwidth, site class, operand index, and signature ordinal.
- `family_full`: same canonical source anchor, opcode, type kind, bitwidth, value-family site class, operand index, and signature ordinal. This records result/base drift explicitly.
- `family_no_ordinal`: same as `family_full`, but does not require `signature_ordinal`. This records ordinal drift explicitly and only accepts unique three-machine keys.

Current result:

- `strict_full` has zero three-machine sites for all eight benchmarks. This does not mean no sites match; it means exact backend-local `site_class` equality is too strict for these artifacts.
- Outcome-backed `family_full` sites exist for `matrix-rotate`, `entropy`, and `colorwheel`.
- Outcome-backed `family_no_ordinal` sites additionally recover `randomAccess`.
- `jacobi`, `layout`, `dense-embedding`, and `pathfinder` still have no outcome-backed unique three-machine consensus sites under these tiers.

Machine-readable files:

- `divergence_cases/validation/cross_machine_readiness.csv`
- `divergence_cases/validation/cross_machine_alignment/tiered_alignment_summary.csv`
- `divergence_cases/validation/cross_machine_alignment/tiered_outcome_summary_status.csv`
- Per-benchmark `*_consensus_sites.csv`, `*_ambiguous_keys.csv`, and `*_outcome_summary.csv` under `divergence_cases/validation/cross_machine_alignment/<bench>/`

Do not use raw backend-local `site_id` values directly across machines. Use the tiered mapping rows and preserve `match_tier` in downstream summaries.
