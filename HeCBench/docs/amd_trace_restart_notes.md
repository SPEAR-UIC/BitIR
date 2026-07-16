# AMD Trace Restart Notes

This note preserves the useful lessons from the noisy AMD divergence-trace attempts
without keeping the bulky one-off result bundles.

## Fixes to keep

- Use the same `fi-target` namespace for metadata and injection. Selected manifests
  built from all-site metadata must inject with `INJECT_TARGET=all`; otherwise the
  same numeric `site_id` can refer to a different instruction.
- Dump `injection_sites_metadata.csv` from the exact device IR passed to
  `fi-inject`, using the same `-fi-target` as the injection command. Compare the
  selected manifest row against this row, not just against an older worklist.
- Prefer AMD `injected_ir` mode for mechanism proof. Plugin mode may be useful for
  separate audits, but it should not be mixed with selected semantic-site proof.
- Preserve device-side mechanism artifacts before running the binary so hard hangs
  still leave evidence: `device.ll`, `device.injected.ll`, `pre_injection.ll`,
  `post_injection.ll`, `diag.json`, `diag_records.csv`, and AMDGPU/code-object
  disassembly when available.
- Record runtime outcome separately in `raw_outcome.txt`, including benchmark
  status, process exit, timeout flag, dump presence, selected row, local metadata
  row, and mutated IR instruction.
- Derive `fault_path.txt` from injected IR to state the mutated instruction,
  mutated value, first direct consumer, consumer class, and final observed outcome.

## Failure modes observed

- `site_id` alignment was repeatedly misleading when class-filtered injection
  (`fi-target=result`) was compared with manifests built from all-site metadata.
- Some old AMD bundles reported a semantic row that looked correct while the
  inserted mutation was visibly on a different IR instruction.
- The corrected `colorwheel site215 bit31` mutation flipped the loop predicate
  path, explaining timeout behavior; older result-filtered artifacts were not the
  same mutation.
- Dense-embedding `site381 bit31` and `site385 bit31` corrected all-target traces
  both completed as SDC in the temporary restart bundle, but those bulky bundles
  were intentionally removed during cleanup.

## Restart guidance

- Rebuild fresh AMD metadata before choosing new cases.
- Rebuild the selected manifest from strict semantic equality, including
  `opcode`, `function`, `source_line`, `source_column`, `site_class`,
  `type_kind`, `bitwidth`, `signature_ordinal` when present, and `compare_mode`.
- Reject source-line-only matches and any row where the matched `site_class`
  differs.
- Keep future pushed results reduced and campaign-scoped; do not commit `.bin`,
  `.bc`, `.o`, code objects, build directories, scratch job directories, or large
  golden outputs.
