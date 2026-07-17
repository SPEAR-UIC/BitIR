# Cross-Machine Readiness Gate

This branch contains original campaign artifacts for NVIDIA, AMD, and Intel plus derived validation artifacts under `divergence_cases/validation/`.

The current alignment policy follows the AMD/NVIDIA precedent: normalized application source matching is the primary bridge, while backend-specific semantic-key fields are diagnostics. Exact `semantic_key` matching is not used because it contains backend-specific paths/functions.

Tiers are applied from strictest to loosest and selected as non-overlapping backend-local sites:

- `strict_full`: source anchor, opcode, type kind, bitwidth, exact site class, operand index, signature ordinal.
- `family_full`: source anchor, opcode, type kind, bitwidth, value-family site class, operand index, signature ordinal.
- `source_context_type_family`: previous/current/next normalized source text, opcode, type kind, bitwidth, value-family site class.
- `source_text_type_family`: current normalized source text, opcode, type kind, bitwidth, value-family site class.
- `source_context_type`: previous/current/next normalized source text, opcode, type kind, bitwidth.
- `source_text_type`: current normalized source text, opcode, type kind, bitwidth.

Ambiguous keys are reported separately and are not counted as matched sites.

Current all-three matched site counts under the best non-overlapping tiered policy:

| Benchmark | All-three matched sites |
|---|---:|
| matrix-rotate | 8 |
| jacobi | 1 |
| layout | 10 |
| dense-embedding | 8 |
| pathfinder | 41 |
| entropy | 21 |
| colorwheel | 125 |
| randomAccess | 85 |
| **Total** | **299** |

Machine-readable files:

- `divergence_cases/validation/cross_machine_readiness.csv`
- `divergence_cases/validation/cross_machine_alignment/source_text_tiered_alignment_summary.csv`
- Per-benchmark `best_tier_nonoverlap_sites.csv`, `*_consensus_sites.csv`, and `*_ambiguous_keys.csv` under `divergence_cases/validation/cross_machine_alignment/<bench>/`

Do not use raw backend-local `site_id` values directly across machines. Use the tiered mapping rows and preserve `match_tier` in downstream summaries.
