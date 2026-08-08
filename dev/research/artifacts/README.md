# Research Artifact Packets

This directory contains compact research artifacts used by the paper analysis
and case-study writeups. Runtime campaign code remains under `bitir/`; these
files are archived evidence and post-processing inputs.

Imported packets:

- `divergence_cases/supplemental_screen/`: compact supplemental case-study
  packets from the NVIDIA/Intel divergence-analysis branch, including
  comparison summaries, selected metadata rows, worklists, logs, mechanism
  traces, and Intel SDC mismatch statistics.
- `divergence_cases/supplemental_screen/nvidia_sdc_full_mismatch_stats/`:
  recovered NVIDIA full SDC mismatch statistics used by the case-study
  analysis.
- `divergence_cases/supplemental_screen/results/frontier_amd_mechanism_debug_20260724_155816/compact/amd_sdc_full_mismatch_stats/`:
  AMD full SDC mismatch statistics used by the case-study analysis.

The full production campaigns were run on Polaris, Aurora, and Frontier and are
too large to rerun during artifact evaluation. These compact packets preserve
the result summaries, manifests, metadata, and representative debug evidence
needed to audit the analysis without including every raw binary output from the
campaign.
