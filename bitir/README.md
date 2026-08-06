# BitIR Runtime

`bitir/` contains the user-facing code and configuration needed to run fault-injection campaigns.

## Layout

| Path | Purpose |
| --- | --- |
| `config/` | Base config, reusable fault models, shared machine definitions, and run templates |
| `tools/llvm17_inject/` | Campaign controller, LLVM injection pass, worklist builder, runner, and comparators |
| `tools/benchmarks/` | Runtime benchmark overlay and golden-output profiling tools |

Development tools, proposed dump adapters, proposed manifests, notes, and research analysis belong in `../dev/`, not here. Reviewed benchmark assets can be added under `bitir/` only when they become runtime campaign contracts.

## Entry Point

Run campaigns through:

```bash
python3 bitir/tools/llvm17_inject/controller.py <task> <config.yml>
```
