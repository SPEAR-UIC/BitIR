AMD fault-path trace rerun for selected colorwheel semantic cases.

Manifest:
HeCBench/config/sites/divergence_trace_fault_path_amd_colorwheel.csv

Execution:
- Primary Slurm job: 5011495
- Repair Slurm job for colorwheel site215 bit31 trial2: 5011545
- Backend: AMD HIP on Frontier
- Execution mode: injected_ir
- Injection target namespace: all

Cases:
- colorwheel site256 bit3: SDC in both trials
- colorwheel site374 bit10: MASKED in both trials
- colorwheel site215 bit31: FAILURE/timeout 124 in both trials

Trace notes:
- site215 bit31 is the strict AMD semantic match for computeColor load int32 line 47 col 15 signature ordinal 21.
- site215 bit31 mutates the loaded int32 with xor bit31, then the poisoned value feeds an icmp that feeds branch/control flow.
- HIP runtime logs for site215 show kernel launch followed by host wait in hipDeviceSynchronize until timeout.
- This tree intentionally excludes binary dumps, bitcode, object files, code objects, fatbins, executables, and build directories.
