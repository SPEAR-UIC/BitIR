# AMD selected trace rerun investigation

The previous `divergence_trace_exploratory_frontier_v3/amd` bundle classified all selected trials as `MASKED`. That was not a trustworthy outcome change: the AMD runner preserved an injected `device.injected.ll` produced by an explicit `opt` pass, but built the executable through a separate `clang++ -fpass-plugin` HIP compilation path. On Frontier/ROCm this split path did not faithfully execute the same injected device IR preserved in the trace bundle.

The v4 rerun changes AMD to match the Intel/NVIDIA model more closely: build HIP device IR, inject that IR, lower the injected bitcode with `llc`, link an AMD code object with `lld`, bundle it with `clang-offload-bundler`, and build the host binary with that bundled injected code object. The executable now follows the preserved injected IR path.

Corrected v4 outcome summary: 20 trials total, 4 `SDC`, 16 `MASKED`. The recovered SDC rows are `colorwheel site103 bit3` and `colorwheel site103 bit0`, both trials each. Some historical SDC/failure/DUE-oriented rows still mask in this direct corrected trace run; those are now interpretable as current-run behavior under this direct HIP trace contract rather than the v3 executable/artifact mismatch.

No `.bin`, `.bc`, `.o`, `.hipfb`, `device.out`, or other binary build payloads are intended for commit in this reduced tree.
