# Development Workspace

`dev/` contains files that help develop, review, and analyze BitIR. Nothing here is required for a normal user to run a fault-injection campaign.

## Layout

| Path | Purpose |
| --- | --- |
| `tools/` | Development inspection tools, including HeCBench output-manifest inventory generation |
| `manifests/` | Proposed or review-stage manifests that are not yet runtime contracts |
| `research/analysis/` | Research post-processing scripts |
| `docs/` | Development notes and migration investigations |

## HeCBench Output Manifest Review

Generate the proposed application-level output inventory with:

```bash
python3 dev/tools/inspect_hecbench_outputs.py \
  --benchmark-root HeCBench \
  --output dev/manifests/hecbench/output_manifest.proposed.yml
```

Reviewed manifests can later move into runtime locations under `bitir/` once they are exact campaign contracts.
