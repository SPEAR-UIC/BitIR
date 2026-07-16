# AMD Failure Audit Status

Prepared focused AMD failure/SDC audit for the suspicious selected divergence rows, but no GPU trials completed in this session.

Reason: Frontier Slurm was unreachable from `login10` during submission attempts:

```text
sbatch: error: Batch job submission failed: Unable to contact slurm controller (connect failure)
```

Prepared rerun command once Slurm is reachable:

```bash
sbatch /tmp/bitir_failure_audit.sbatch
```

Equivalent in-repo runner entrypoint:

```bash
cd /ccs/home/mdunlavy/GPU_Fault_Injection
module load rocm/6.4.2 || true
module load rocm-llvm-toolchain || true
REPO_ROOT=/ccs/home/mdunlavy/GPU_Fault_Injection \
BITIR_MACHINE_RUNTIME_HOME=/opt/rocm-6.4.2 \
TRIALS=2 \
MODES="injected_ir plugin" \
bash HeCBench/tools/llvm17_inject/run_amd_failure_audit.sh
```
