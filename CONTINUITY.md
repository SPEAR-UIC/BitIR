Snapshot
- 2026-06-30T18:22:40+00:00 [TOOL] Current date confirmed for this audit
- 2026-06-30 [USER] `main` must stay production-ready, divergence and trace work stays off `main`
- 2026-06-30 [USER] Long-lived branch for this work is `debug-trace`
- 2026-06-30 [TOOL] Semantic mapping already exists for NVIDIA↔Intel in `origin/intel_aurora` aligned worklists
- 2026-06-30 [TOOL] AMD raw metadata and aligned outcome summaries exist in `origin/amd-hip-llvm17-injection-pipeline`
- 2026-06-30 [TOOL] Current curated trace case CSVs are not trustworthy for cross-machine comparison because local site IDs are not aligned
- 2026-06-30 [TOOL] A three-machine disagreement table was rebuilt from aligned NVIDIA↔Intel worklists plus AMD raw metadata mapping
- 2026-06-30 [TOOL] Starter case list was reduced to 10 aligned disagreement cases for deeper reruns
- 2026-06-30 [USER] Starter set must exclude all `UNKNOWN` outcomes
- 2026-06-30 [TOOL] Branch-local rerun YAMLs now target fixed output roots under `HeCBench/results/debug_trace_top10/<machine>`

Decisions
- 2026-06-30 [USER] D001 ACTIVE: Keep experimental trace and divergence work off `main`
- 2026-06-30 [USER] D002 ACTIVE: Use a long-lived `debug-trace` branch for this analysis

Done (recent)
- 2026-06-30 [TOOL] Created and switched to local branch `debug-trace`
- 2026-06-30 [TOOL] Confirmed `origin/intel_aurora` contains `worklist_aligned.csv` for the target benches
- 2026-06-30 [TOOL] Confirmed `origin/amd-hip-llvm17-injection-pipeline` contains raw AMD `sites_metadata.csv` and `llvm17_inject_amd_aligned_srun/*/summary.csv`
- 2026-06-30 [TOOL] Verified existing Polaris and Aurora trace case CSVs are not aligned to each other
- 2026-06-30 [TOOL] Derived a backend-aware AMD mapping by matching CUDA `result` sites to AMD `base` sites on app-source metadata fields
- 2026-06-30 [TOOL] Rebuilt the starter set so every selected case is only `MASKED`, `SDC`, or `FAILURE`
- 2026-06-30 [TOOL] Added per-machine benchmark-local site lists and run YAMLs for 2-repeat full-trace reruns

Now
- 2026-06-30 [TOOL] Storing the top 10 aligned disagreement cases for the next debug campaign

Next
- 2026-06-30 [ASSUMPTION] Generate per-machine rerun lists from the aligned top 10 set
- 2026-06-30 [ASSUMPTION] Add branch-local debug rerun configs that target only those cases
- 2026-06-30 [ASSUMPTION] Run heavy-debug reruns and compare trace mechanisms across machines

Working set
- 2026-06-30 [CODE] /home/mdunlavy/GPU_FI/CONTINUITY.md
- 2026-06-30 [CODE] /home/mdunlavy/GPU_FI/HeCBench/config/sites/debug_trace_divergence_top10.csv
- 2026-06-30 [CODE] /home/mdunlavy/GPU_FI/HeCBench/config/runs/nvidia_debug_trace_top10.yml
- 2026-06-30 [CODE] /home/mdunlavy/GPU_FI/HeCBench/config/runs/aurora_debug_trace_top10.yml
- 2026-06-30 [CODE] /home/mdunlavy/GPU_FI/HeCBench/config/runs/frontier_debug_trace_top10.yml
- 2026-06-30 [CODE] /home/mdunlavy/GPU_FI/HeCBench/config/sites/debug_trace_top10_nvidia_entropy.csv
- 2026-06-30 [CODE] /home/mdunlavy/GPU_FI/HeCBench/results/llvm17_inject
- 2026-06-30 [TOOL] origin/intel_aurora
- 2026-06-30 [TOOL] origin/amd-hip-llvm17-injection-pipeline

Receipts
- 2026-06-30 [TOOL] `git checkout -b debug-trace`
- 2026-06-30 [TOOL] `git show origin/intel_aurora:HeCBench/results/llvm17_inject/*/worklist_aligned.csv`
- 2026-06-30 [TOOL] `git show origin/amd-hip-llvm17-injection-pipeline:HeCBench/results/llvm17_inject_amd/*/sites_metadata.csv`
- 2026-06-30 [TOOL] `git show origin/amd-hip-llvm17-injection-pipeline:HeCBench/results/llvm17_inject_amd_aligned_srun/*/summary.csv`
