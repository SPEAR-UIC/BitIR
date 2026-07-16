# AMD Failure Audit Completion Note

Job: `5010883`

Slurm state: `OUT_OF_MEMORY`, `ExitCode=0:125`, elapsed `00:07:17`.

Despite the Slurm batch-step OOM marker, the audit runner printed all 32 planned trials and wrote `audit_summary.csv` plus `audit_counts.csv`. The OOM marker is important context for dense-embedding memory pressure and should be considered when interpreting exit `137` rows.

Planned matrix:

- Modes: `injected_ir`, `plugin`
- Cases: 8 selected historical failure/SDC/hang-oriented rows
- Trials: 2 per case per mode
- Raw outcome records written: 32

Key result shape:

- `injected_ir` recovered `colorwheel site103 bit0` as benchmark `FAIL` plus dump mismatch: `SDC`, exit `0`, both trials.
- Historical hang/failure probes `colorwheel site481 bit3`, `entropy site392 bit0`, `entropy site482 bit0`, and `dense-embedding site362 bit0` were `MASKED` in both trials under `injected_ir`.
- `dense-embedding site362 bit24` produced exit `137` with dump mismatch in both modes/trials; recorded as `SDC` with `timeout=1` by the audit's raw outcome logic.
- `plugin` mode produced no `mutated_ir_instruction` in `diag.json`, consistent with the plugin-mode audit path not preserving an injected device IR artifact.

Primary machine-readable files:

- `audit_summary.csv`
- `audit_counts.csv`
- per-case `summary.csv`
- per-trace `raw_outcome.txt`
- per-trace `diag.json` / `diag_records.csv`

No `.bin`, `.bc`, object, HIP fatbin, or build artifacts are intentionally included.
