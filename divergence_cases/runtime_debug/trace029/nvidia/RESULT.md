# NVIDIA TRACE029 runtime result

- PBS job: `7270720.polaris-pbs-01.hsn.cm.polaris.alcf.anl.gov`
- Backend: NVIDIA on Polaris
- Arguments: `10000 1000 1000`
- Original provenance: site 9, bit 31
- Regenerated semantic site: site 9, bit 31
- Execution plan rows: 1
- Baseline outcome: `BASELINE` (exact golden match)
- Injection outcome: `MASKED` (exact golden match)

The baseline and injected runs each observed 10,000,000 thread instances, with
zero valid, computed, or final-writing threads. The TRACE029 flip changed the
32-bit `small_block_cols` value in all 10,000,000 instances and changed
`blkX`, `blkXmax`, and `xidx` in 5,000,000 instances. It did not change the
validity predicate in any instance. The injected trace retained the first 2048
detailed records and counted 9,997,952 additional differing records.

Although the output classifier is `MASKED`, this is overflow-driven
suppression, not conventional masking after a faulty computation. Signed
32-bit geometry changes are visible at runtime, but the unchanged false
predicate prevents the affected path from computing or reaching a final
write. The original configuration and uninitialized `d_gpuResult` behavior
were preserved.
