#!/usr/bin/env python3
"""
End-to-end LLFI-GPU exhaustive injection sweep for the matrix-rotate benchmark.

The workflow:
 1. Configure and build LLFI-enabled profiling and injection binaries.
 2. Run a profiling pass to capture bamboo.profile.txt.
 3. Enumerate every injectable instruction instance observed in the profile.
 4. For each instance, run the injection binary once, force it to dump the
    resulting matrix, compare it to the golden output, and classify the result
    as MASKED / SDC / FAILURE.

Outputs (under --output-root):
  * profile_run/           : Logs + bamboo.profile.txt from the profiling pass.
  * injection_runs/run_xxx : Per-injection stdout/stderr, matrices, bamboo logs.
  * report.csv             : Tabular summary for each injection attempt.
  * sweep_summary.json     : Metadata describing the sweep configuration.
"""

import argparse
import csv
import json
import os
import shutil
import subprocess
import sys
from datetime import datetime
from pathlib import Path
from typing import Dict, Iterable, Iterator, List, Optional, Tuple


REPO_ROOT = Path(__file__).resolve().parents[1]
DEFAULT_LLFI_ROOT = REPO_ROOT.parent / "LLFI-GPU"


def log(msg: str) -> None:
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    print(f"[{timestamp}] {msg}", flush=True)


def run_cmd(cmd: List[str], cwd: Optional[Path] = None, env: Optional[Dict[str, str]] = None) -> None:
    pretty = " ".join(cmd)
    log(f"+ {pretty}")
    subprocess.run(cmd, check=True, cwd=cwd, env=env)


def configure_build(mode: str, build_dir: Path, llfi_root: Path, cuda_arch: Optional[str], extra_args: List[str]) -> None:
    build_dir.mkdir(parents=True, exist_ok=True)
    cmd = [
        "cmake",
        "-S",
        str(REPO_ROOT),
        "-B",
        str(build_dir),
        "-DHECBENCH_ENABLE_CUDA=ON",
        "-DHECBENCH_ENABLE_HIP=OFF",
        "-DHECBENCH_ENABLE_SYCL=OFF",
        "-DHECBENCH_ENABLE_OPENMP=OFF",
        "-DHECBENCH_BUILD_ALL_BENCHMARKS=OFF",
        "-DHECBENCH_LLFI_GPU=ON",
        f"-DHECBENCH_LLFI_GPU_ROOT={llfi_root}",
        f"-DHECBENCH_LLFI_MODE={mode}",
    ]
    if cuda_arch:
        cmd.append(f"-DHECBENCH_CUDA_ARCH={cuda_arch}")
    cmd.extend(extra_args)
    run_cmd(cmd)


def build_target(build_dir: Path, target: str) -> None:
    run_cmd(["cmake", "--build", str(build_dir), "--target", target])


def files_match(a: Path, b: Path, chunk_size: int = 1 << 20) -> bool:
    if a.stat().st_size != b.stat().st_size:
        return False
    with a.open("rb") as fa, b.open("rb") as fb:
        while True:
            ba = fa.read(chunk_size)
            bb = fb.read(chunk_size)
            if not ba:
                return True
            if ba != bb:
                return False


def run_binary(
    binary: Path,
    args: List[str],
    work_dir: Path,
    env: Optional[Dict[str, str]] = None,
) -> Tuple[int, Path, Path]:
    work_dir.mkdir(parents=True, exist_ok=True)
    stdout_path = work_dir / "stdout.log"
    stderr_path = work_dir / "stderr.log"
    log(f"Running {' '.join([str(binary)] + args)} in {work_dir}")
    combined_env = os.environ.copy()
    if env:
        combined_env.update(env)
    with stdout_path.open("w", encoding="utf-8") as stdout, stderr_path.open("w", encoding="utf-8") as stderr:
        result = subprocess.run(
            [str(binary), *args],
            cwd=work_dir,
            env=combined_env,
            stdout=stdout,
            stderr=stderr,
            text=True,
        )
    return result.returncode, stdout_path, stderr_path


def parse_profile(profile_path: Path) -> List[Dict[str, int]]:
    required_fields = {"threadIndex", "instCount", "dynamicKernelIndex", "staticKernelIndex"}
    entries: List[Dict[str, int]] = []
    with profile_path.open("r", encoding="utf-8") as profile_file:
        for line in profile_file:
            segments = [segment.strip() for segment in line.split("--") if segment.strip()]
            record: Dict[str, int] = {}
            for segment in segments:
                parts = segment.split()
                if len(parts) >= 2:
                    key = parts[0]
                    try:
                        record[key] = int(parts[1])
                    except ValueError:
                        continue
            if required_fields <= record.keys() and record["instCount"] > 0:
                entries.append(record)
    if not entries:
        raise RuntimeError(f"No injectable sites parsed from {profile_path}")
    return entries


def iter_injection_sites(entries: List[Dict[str, int]]) -> Iterator[Dict[str, int]]:
    for entry in entries:
        inst_count = entry["instCount"]
        for inst_idx in range(1, inst_count + 1):
            yield {
                "threadIndex": entry["threadIndex"],
                "dynamicKernelIndex": entry["dynamicKernelIndex"],
                "staticKernelIndex": entry["staticKernelIndex"],
                "instIndex": inst_idx,
                "instCount": inst_count,
            }


def ensure_golden_exists(path: Path) -> None:
    if not path.exists():
        raise FileNotFoundError(f"Golden output not found: {path}")


def parse_runtime_log(runtime_log: Path) -> Tuple[Optional[int], Optional[int]]:
    fi_bit = None
    bamboo_index = None
    if runtime_log.exists():
        with runtime_log.open("r", encoding="utf-8") as log_file:
            for line in log_file:
                if line.startswith("fiBit:"):
                    try:
                        fi_bit = int(line.split(":", 1)[1].strip())
                    except ValueError:
                        pass
                elif line.startswith("bambooIndex:"):
                    try:
                        bamboo_index = int(line.split(":", 1)[1].strip())
                    except ValueError:
                        pass
    return fi_bit, bamboo_index


def classify_outcome(
    status: int,
    run_dir: Path,
    dump_path: Path,
    golden_path: Path,
) -> Tuple[str, str]:
    if status != 0:
        return "FAILURE", f"non-zero exit status {status}"
    err_dir = run_dir / "bamboo_fi" / "err_output"
    if err_dir.exists() and any(err_dir.iterdir()):
        return "FAILURE", "LLFI runtime error logs present"
    if not dump_path.exists():
        return "FAILURE", "matrix dump missing"
    if files_match(dump_path, golden_path):
        return "MASKED", "outputs match golden reference"
    return "SDC", "output mismatch vs golden"


def sweep_injections(
    binary: Path,
    size: int,
    repeat: int,
    golden_path: Path,
    injection_entries: List[Dict[str, int]],
    output_root: Path,
    max_sites: Optional[int],
    site_offset: int = 0,
    site_count: Optional[int] = None,
) -> None:
    injection_root = output_root / "injection_runs"
    injection_root.mkdir(parents=True, exist_ok=True)
    report_path = output_root / "report.csv"
    global_total = sum(entry["instCount"] for entry in injection_entries)
    if site_offset < 0:
        raise ValueError("site_offset must be >= 0")
    if site_offset > global_total:
        raise ValueError(f"site_offset {site_offset} exceeds total sites {global_total}")
    remaining = global_total - site_offset
    planned_sites = remaining if site_count is None else min(site_count, remaining)
    if max_sites is not None:
        planned_sites = min(planned_sites, max_sites)
    log(f"Planning to execute {planned_sites} injection runs (offset={site_offset}, total={global_total})")
    with report_path.open("w", newline="", encoding="utf-8") as csvfile:
        fieldnames = [
            "index",
            "threadIndex",
            "dynamicKernelIndex",
            "staticKernelIndex",
            "instIndex",
            "instCount",
            "fiBit",
            "bambooIndex",
            "outcome",
            "details",
        ]
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        writer.writeheader()
        site_iter = iter_injection_sites(injection_entries)
        for _ in range(site_offset):
            next(site_iter, None)
        for idx in range(1, planned_sites + 1):
            site = next(site_iter, None)
            if site is None:
                break
            run_dir = injection_root / f"run_{idx:06d}"
            if run_dir.exists():
                shutil.rmtree(run_dir)
            (run_dir / "bamboo_fi").mkdir(parents=True, exist_ok=True)
            config_path = run_dir / "bamboo_fi" / "bamboo.fi.config.txt"
            config_line = f"{site['threadIndex']} {site['instIndex']} {site['dynamicKernelIndex']} {site['staticKernelIndex']}"
            config_path.write_text(config_line + "\n", encoding="utf-8")
            log(f"[{idx}/{planned_sites}] Injecting thread={site['threadIndex']} dynamic={site['dynamicKernelIndex']} static={site['staticKernelIndex']} inst={site['instIndex']}")
            dump_path = run_dir / "matrix_dump.bin"
            env = {"HECBENCH_LLFI_FORCE_DUMP": "1"}
            status, _, _ = run_binary(
                binary,
                [str(size), str(repeat), str(dump_path)],
                run_dir,
                env=env,
            )
            runtime_log = run_dir / "bamboo_fi" / "bamboo.fi.runtime.log.txt"
            fi_bit, bamboo_index = parse_runtime_log(runtime_log)
            outcome, details = classify_outcome(status, run_dir, dump_path, golden_path)
            writer.writerow(
                {
                    "index": idx,
                    "threadIndex": site["threadIndex"],
                    "dynamicKernelIndex": site["dynamicKernelIndex"],
                    "staticKernelIndex": site["staticKernelIndex"],
                    "instIndex": site["instIndex"],
                    "instCount": site["instCount"],
                    "fiBit": fi_bit if fi_bit is not None else "",
                    "bambooIndex": bamboo_index if bamboo_index is not None else "",
                    "outcome": outcome,
                    "details": details,
                }
            )
            csvfile.flush()


def run_profiling_pass(
    binary: Path,
    size: int,
    repeat: int,
    output_dir: Path,
) -> Path:
    if output_dir.exists():
        shutil.rmtree(output_dir)
    output_dir.mkdir(parents=True, exist_ok=True)
    env = {"HECBENCH_LLFI_FORCE_DUMP": "1"}
    dump_path = output_dir / "matrix_dump.bin"
    status, _, _ = run_binary(
        binary,
        [str(size), str(repeat), str(dump_path)],
        output_dir,
        env=env,
    )
    if status != 0:
        raise RuntimeError("Profiling run failed - see logs under profile_run/")
    profile_path = output_dir / "bamboo_fi" / "bamboo.profile.txt"
    if not profile_path.exists():
        raise FileNotFoundError(f"Profiling run did not produce bamboo.profile.txt in {output_dir}")
    return profile_path


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Matrix-rotate LLFI exhaustive injection sweep")
    parser.add_argument("--llfi-root", default=DEFAULT_LLFI_ROOT, help="Path to the LLFI-GPU checkout")
    parser.add_argument("--cuda-arch", help="CUDA architecture to target (e.g., sm_80)")
    parser.add_argument("--size", type=int, default=8192, help="Matrix dimension (n)")
    parser.add_argument("--repeat", type=int, default=10, help="Number of rotation iterations")
    parser.add_argument("--golden", required=True, help="Path to the golden matrix dump for comparison")
    parser.add_argument("--output-root", help="Directory for all sweep artifacts")
    parser.add_argument("--profile-build-dir", help="Custom CMake build directory for profiling binaries")
    parser.add_argument("--inject-build-dir", help="Custom CMake build directory for injection binaries")
    parser.add_argument("--profile-path", help="Reuse an existing bamboo.profile.txt (skips profiling run)")
    parser.add_argument("--injection-binary", help="Path to a prebuilt injection binary (skips injection build)")
    parser.add_argument("--profile-only", action="store_true", help="Stop after generating the profiling data")
    parser.add_argument("--inject-only", action="store_true", help="Run injections using an existing profile")
    parser.add_argument("--cmake-arg", action="append", default=[], help="Additional -D arguments forwarded to CMake")
    parser.add_argument("--max-sites", type=int, help="Optional limit on injection sites (useful for testing)")
    parser.add_argument("--site-offset", type=int, default=0, help="Skip this many injection sites before starting")
    parser.add_argument("--site-count", type=int, help="Limit injections to this many sites after the offset")
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    llfi_root = Path(args.llfi_root).resolve()
    if not llfi_root.exists():
        raise FileNotFoundError(f"LLFI-GPU root not found: {llfi_root}")
    golden_path = Path(args.golden).resolve()
    ensure_golden_exists(golden_path)
    output_root = Path(args.output_root) if args.output_root else (REPO_ROOT / "results" / "llfi" / "matrix-rotate" / datetime.utcnow().strftime("full_sweep-%Y%m%d-%H%M%S"))
    output_root.mkdir(parents=True, exist_ok=True)
    summary_path = output_root / "sweep_summary.json"

    profile_build_dir = Path(args.profile_build_dir) if args.profile_build_dir else (REPO_ROOT / "build" / "llfi-matrix-rotate-profile")
    injection_build_dir = Path(args.inject_build_dir) if args.inject_build_dir else (REPO_ROOT / "build" / "llfi-matrix-rotate-inject")
    target = "matrix-rotate-cuda"

    profile_path = None
    if args.profile_path:
        profile_path = Path(args.profile_path).resolve()
        if not profile_path.exists():
            raise FileNotFoundError(f"Profile path not found: {profile_path}")
    if not args.inject_only and profile_path is None:
        log("Configuring profiling build")
        configure_build("profiling", profile_build_dir, llfi_root, args.cuda_arch, args.cmake_arg)
        build_target(profile_build_dir, target)
        profiling_binary = profile_build_dir / "bin" / "cuda" / "matrix-rotate"
        if not profiling_binary.exists():
            raise FileNotFoundError(f"Profiling binary not found: {profiling_binary}")

        log("Running LLFI profiling pass")
        profile_dir = output_root / "profile_run"
        profile_path = run_profiling_pass(profiling_binary, args.size, args.repeat, profile_dir)
        if args.profile_only:
            summary = {
                "benchmark": "matrix-rotate",
                "size": args.size,
                "repeat": args.repeat,
                "golden": str(golden_path),
                "output_root": str(output_root),
                "profile_build_dir": str(profile_build_dir),
                "llfi_root": str(llfi_root),
                "cuda_arch": args.cuda_arch,
                "timestamp": datetime.utcnow().isoformat() + "Z",
                "profile_path": str(profile_path),
            }
            summary_path.write_text(json.dumps(summary, indent=2), encoding="utf-8")
            log(f"Profiling only. Summary stored at {summary_path}")
            return 0
    if profile_path is None:
        raise RuntimeError("Profile path is required for injection-only runs")

    if args.profile_only:
        raise RuntimeError("--profile-only requires profiling run (omit --profile-path)")

    injection_binary = None
    if args.injection_binary:
        injection_binary = Path(args.injection_binary).resolve()
        if not injection_binary.exists():
            raise FileNotFoundError(f"Injection binary not found: {injection_binary}")
    if injection_binary is None:
        log("Configuring injection build")
        configure_build("injection", injection_build_dir, llfi_root, args.cuda_arch, args.cmake_arg)
        build_target(injection_build_dir, target)
        injection_binary = injection_build_dir / "bin" / "cuda" / "matrix-rotate"
        if not injection_binary.exists():
            raise FileNotFoundError(f"Injection binary not found: {injection_binary}")

    log(f"Parsing bamboo profile at {profile_path}")
    injection_entries = parse_profile(profile_path)

    log("Starting exhaustive injection sweep")
    sweep_injections(
        injection_binary,
        args.size,
        args.repeat,
        golden_path,
        injection_entries,
        output_root,
        args.max_sites,
        site_offset=args.site_offset,
        site_count=args.site_count,
    )

    summary = {
        "benchmark": "matrix-rotate",
        "size": args.size,
        "repeat": args.repeat,
        "golden": str(golden_path),
        "output_root": str(output_root),
        "profile_build_dir": str(profile_build_dir),
        "injection_build_dir": str(injection_build_dir),
        "llfi_root": str(llfi_root),
        "cuda_arch": args.cuda_arch,
        "timestamp": datetime.utcnow().isoformat() + "Z",
        "max_sites": args.max_sites,
        "profile_path": str(profile_path),
        "injection_binary": str(injection_binary),
        "site_offset": args.site_offset,
        "site_count": args.site_count,
    }
    summary_path.write_text(json.dumps(summary, indent=2), encoding="utf-8")
    log(f"Sweep complete. Summary stored at {summary_path}")
    return 0


if __name__ == "__main__":
    try:
        sys.exit(main())
    except Exception as exc:  # pylint: disable=broad-except
        log(f"ERROR: {exc}")
        sys.exit(1)
