# TRACE029 Runtime Debug Schema

TRACE029 diagnoses backend-dependent signed-overflow behavior after flipping bit
31 of the `small_block_cols` subtraction in Pathfinder. A baseline with no final
writes is valid evidence and must not be rejected.

Each backend writes `baseline_runtime_summary.csv`,
`injected_runtime_summary.csv`, `baseline_runtime_records.csv`, and
`injected_runtime_records.csv` using the headers in this directory. Counts are
aggregated over all kernel launches. Detailed records are bounded to 2048 rows
and prioritize threads whose 64-bit expected geometry differs from 32-bit
execution, whose validity/computation predicate differs, or which computes or
reaches a final write.

`computed` means the thread entered the computation body at least once during
the launch. `final_write_executed` follows the original final `computed`
predicate exactly. Output classification remains an exact byte comparison with
the existing platform golden; runtime overflow behavior is reported separately
from conventional `MASKED`/`SDC` outcome labels.

The original configuration is fixed at arguments `10000 1000 1000`. Adapters
must not initialize `d_gpuResult` or otherwise repair the workload.
