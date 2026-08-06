# BitIR Runtime

`bitir/` contains the user-facing code and configuration needed to run fault-injection campaigns.

## Layout

| Path | Purpose |
| --- | --- |
| `config/` | Base config, reusable fault models, shared machine definitions, and run templates |
| `tools/llvm17_inject/` | Campaign controller, LLVM injection pass, worklist builder, runner, and comparators |
| `tools/benchmarks/` | Runtime benchmark overlay and golden-output profiling tools |
| `benchmarks/hecbench/` | Runtime HeCBench assets used by campaigns, such as reviewed dump adapters |

Development tools, proposed manifests, notes, and research analysis belong in `../dev/`, not here.

## Entry Point

Run campaigns through:

```bash
python3 bitir/tools/llvm17_inject/controller.py <task> <config.yml>
```
