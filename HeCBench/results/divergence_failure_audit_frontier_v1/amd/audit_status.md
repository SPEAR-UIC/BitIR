# AMD Failure Audit Status

Focused AMD failure/SDC audit completed under Slurm job `5010883`.

Slurm accounting:

```text
JobID    JobName                    State         ExitCode  Elapsed
5010883  bitir_amd_failure_audit    OUT_OF_MEMORY 0:125     00:07:17
```

The Slurm batch step reported OOM after the run, but the audit runner printed all planned trials and wrote the machine-readable summaries:

- `audit_summary.csv`
- `audit_counts.csv`
- 32 per-trace `raw_outcome.txt` records

The OOM marker is preserved as a caveat because dense-embedding rows with exit `137` may reflect memory pressure rather than only fault behavior.

Run matrix:

- Modes: `injected_ir`, `plugin`
- Cases: 8 selected historical failure/SDC/hang-oriented rows
- Trials: 2 per case per mode

Submission settings used after queue adjustment:

```text
Partition=batch
QOS=debug
TimeLimit=01:00:00
```
