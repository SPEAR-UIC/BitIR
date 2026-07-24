# Polaris NVIDIA/Intel Targeted Debug Rerun

This bundle reruns the seven numeric NVIDIA site/bit rows from the latest
Intel-vs-NVIDIA divergence table. It uses current `main` BitIR paths under
`bitir/` and enables `trace_level: full`, `trace_repeats: 2`, `keep_dumps: 1`,
`CUDA_LAUNCH_BLOCKING=1`, and forced HeCBench dumps.

Note: these are the exact same numeric site IDs from the divergence table. The
older semantic crosswalk used for previous supplemental reruns can map a screen
ID to a different backend-local site ID. Use this bundle to debug the rows we
currently called divergent; use the older crosswalk artifacts if the goal is
strict semantic-counterpart reruns.

Targeted numeric NVIDIA rows:

| screen | benchmark | NVIDIA site | bit | current NVIDIA | current Intel |
| --- | --- | ---: | ---: | --- | --- |
| SUP001 | matrix-rotate | 17 | 31 | SDC | DUE |
| SUP002 | matrix-rotate | 17 | 13 | DUE | SDC |
| SUP003 | layout | 16 | 0 | DUE | MASKED |
| SUP010 | dense-embedding | 192 | 0 | MASKED | SDC |
| SUP006 | entropy | 26 | 0 | MASKED | DUE |
| SUP007 | entropy | 22 | 0 | DUE | MASKED |
| SUP011 | entropy | 64 | 10 | SDC | MASKED |

Run from the repository root on Polaris:

```bash
divergence_analysis_outputs/polaris_targeted_debug/submit_polaris_nvidia_intel_debug.sh <account>
```

The submit wrapper writes an account-filled copy of the PBS file under
`divergence_analysis_outputs/polaris_targeted_debug/submitted/` and submits it
with `qsub`.

After the job finishes, inspect:

```bash
ls -td divergence_analysis_outputs/polaris_targeted_debug/run_* | head -n 1
cat divergence_analysis_outputs/polaris_targeted_debug/run_*/result_dirs.csv
column -s, -t divergence_analysis_outputs/polaris_targeted_debug/run_*/summary.csv | less -S
```

Each result directory listed in `result_dirs.csv` contains per-site stdout/stderr,
kept dumps, full trace artifacts, injected LLVM IR, PTX/fatbin artifacts, GPU
state captures, runtime environment captures, and summary CSVs.
