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
  --output dev/manifests/hecbench/output_manifest.proposed.yml
```

Run the static review against the current machine configs with:

```bash
python3 dev/tools/review_hecbench_manifest.py
```

This writes:

- `dev/manifests/hecbench/static_review.csv`
- `dev/manifests/hecbench/static_review_summary.yml`

The static review uses `bitir/config/machines/*.yml` to check the currently configured campaign backends:

- Polaris: CUDA
- Aurora: SYCL
- Frontier: HIP

Entries marked `static_candidate` have consistent static evidence across those configured backends. Entries marked `manual_review` need source inspection or manifest correction before dynamic verification.

Reviewed manifests can later move into runtime locations under `bitir/` once they are exact campaign contracts. Dynamic verification should use the existing machine YAMLs to generate build/golden/baseline jobs rather than introducing separate machine logic.
