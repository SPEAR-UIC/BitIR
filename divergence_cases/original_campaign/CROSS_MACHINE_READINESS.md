# Cross-Machine Readiness Gate

This tree is not yet certified as ready for cross-machine divergence experimentation.

The Intel artifacts under `divergence_cases/original_campaign/intel/` are original-campaign inputs with source provenance. They are not, by themselves, an aligned cross-machine semantic mapping.

Required before use as experiment input:

- Add original NVIDIA campaign artifacts under `divergence_cases/original_campaign/nvidia/`.
- Generate canonical metadata for NVIDIA, AMD, and Intel using `HeCBench/tools/llvm17_inject/canonical_site_metadata.py`.
- Build NVIDIA-anchored shared semantic inventories with `HeCBench/tools/llvm17_inject/build_shared_semantic_inventory.py`.
- Use only rows with explicit backend mappings; do not use raw Intel `site_id` values directly across machines.
- Treat `match_mode=strict` as directly aligned. Treat `match_mode=class_family` as a recorded normalization fallback, not silent equality.
- Exclude rows with `canonical_status=external_source` from shared source-site experiments unless a separate policy explicitly permits runtime/library source sites.

Current blocking gaps:

- No original NVIDIA campaign artifact root is present in this branch. The only local NVIDIA path found is `HeCBench/results/debug_trace_top10/nvidia`, which is explicitly excluded from this reset.
- Intel `layout` normalized SYCL outcome tables were not copied because the only local normalized candidate found was under `layout-sycl-debugscale-r1`, which is treated as later/debug-scale evidence.

Current positive checks:

- The durable metadata fixes from `aurora-debug-trace` are present on this branch.
- All eight Intel `sites_metadata.csv` files parse with the fixed canonical metadata tool.
- No Intel metadata files were regenerated, and no FI injections were rerun.
