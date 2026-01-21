#!/usr/bin/env python3
"""
Helper utility for building and running HeCBench CUDA benchmarks with FI-GPU.

The script configures a dedicated CMake build that enables FI instrumentation,
builds the requested benchmark target, and then orchestrates profiling or
injection experiments. Results are written under results/fi/ by default so
that existing golden-output infrastructure remains untouched.
"""

from __future__ import annotations

import argparse
import json
import os
import random
import shutil
import subprocess
import sys
from datetime import datetime
from pathlib import Path
from typing import Dict, List, Sequence

REPO_ROOT = Path(__file__).resolve().parents[1]
DEFAULT_RESULTS_ROOT = REPO_ROOT / "results" / "fi"


def log(msg: str) -> None:
    print(f"[fi-runner] {msg}")


def run_cmd(cmd: Sequence[str], cwd: Path | None = None) -> None:
    pretty = " ".join(cmd)
    log(f"+ {pretty}")
    subprocess.run(cmd, check=True, cwd=cwd)


def configure_cmake(build_dir: Path, fi_root: Path, mode: str, cuda_arch: str | None, extra_args: List[str]) -> None:
    build_dir.mkdir(parents=True, exist_ok=True)
    cmd = [
        "cmake",
        "-S",
        str(REPO_ROOT),
        "-B",
        str(build_dir),
        "-DHECBENCH_ENABLE_CUDA=ON",
        "-DHECBENCH_FI_GPU=ON",
        f"-DHECBENCH_FI_GPU_ROOT={fi_root}",
        f"-DHECBENCH_FI_MODE={mode}",
        "-DHECBENCH_BUILD_ALL_BENCHMARKS=OFF",
    ]
    if cuda_arch:
        cmd.append(f"-DHECBENCH_CUDA_ARCH={cuda_arch}")
    cmd.extend(extra_args)
    run_cmd(cmd)


def build_target(build_dir: Path, target: str) -> None:
    run_cmd(["cmake", "--build", str(build_dir), "--target", target])


def resolve_binary(build_dir: Path, benchmark: str) -> Path:
    candidate = build_dir / "bin" / "cuda" / benchmark
    if candidate.exists():
        return candidate
    exe_candidate = candidate.with_suffix(".exe")
    if exe_candidate.exists():
        return exe_candidate
    raise FileNotFoundError(f"Unable to locate built executable for {benchmark} under {candidate.parent}")


def make_results_dir(benchmark: str, mode: str, base: Path | None) -> Path:
    if base:
        path = Path(base)
    else:
        stamp = datetime.utcnow().strftime("%Y%m%d-%H%M%S")
        path = DEFAULT_RESULTS_ROOT / benchmark / f"{mode}-{stamp}"
    path.mkdir(parents=True, exist_ok=True)
    return path


def execute_binary(binary: Path, args: List[str], run_dir: Path, timeout: int | None) -> Dict[str, object]:
    cmd = [str(binary)] + args
    stdout_path = run_dir / "stdout.log"
    stderr_path = run_dir / "stderr.log"
    result: Dict[str, object] = {
        "command": cmd,
        "cwd": str(run_dir),
    }
    log(f"Running {' '.join(cmd)} (timeout={timeout or 'none'}s) in {run_dir}")
    run_dir.mkdir(parents=True, exist_ok=True)
    with open(stdout_path, "w") as stdout, open(stderr_path, "w") as stderr:
        try:
            completed = subprocess.run(
                cmd,
                cwd=run_dir,
                stdout=stdout,
                stderr=stderr,
                text=True,
                timeout=timeout,
            )
            result["returncode"] = completed.returncode
            result["status"] = "ok" if completed.returncode == 0 else "nonzero"
        except subprocess.TimeoutExpired as exc:
            stdout.write(exc.stdout or "")
            stderr.write(exc.stderr or "")
            result["returncode"] = None
            result["status"] = "timeout"
        except Exception as exc:  # pylint: disable=broad-except
            result["returncode"] = None
            result["status"] = f"error: {exc}"
    return result


def load_profile(profile_path: Path) -> List[Dict[str, int]]:
    entries: List[Dict[str, int]] = []
    with open(profile_path, "r") as profile_file:
        for line in profile_file:
            tokens = [segment.strip() for segment in line.split("--") if segment.strip()]
            record: Dict[str, int] = {}
            for token in tokens:
                parts = token.split()
                if len(parts) >= 2:
                    key = parts[0]
                    try:
                        record[key] = int(parts[1])
                    except ValueError:
                        continue
            if {"threadIndex", "instCount", "dynamicKernelIndex", "staticKernelIndex"} <= record.keys():
                entries.append(record)
    if not entries:
        raise ValueError(f"No valid entries found in {profile_path}")
    return entries


def select_injection(groups: Dict[int, List[Dict[str, int]]], rng: random.Random) -> Dict[str, int]:
    dynamic_kernel = rng.choice(list(groups.keys()))
    entry = rng.choice(groups[dynamic_kernel])
    selected_inst = rng.randint(1, entry["instCount"])
    selection = entry.copy()
    selection["selectedInst"] = selected_inst
    return selection


def group_by_dynamic_kernel(entries: List[Dict[str, int]]) -> Dict[int, List[Dict[str, int]]]:
    grouped: Dict[int, List[Dict[str, int]]] = {}
    for entry in entries:
        grouped.setdefault(entry["dynamicKernelIndex"], []).append(entry)
    return grouped


def handle_profile(args: argparse.Namespace) -> None:
    build_dir = Path(args.build_dir or (REPO_ROOT / "build" / f"fi-profile-{args.benchmark}"))
    fi_root = Path(args.fi_root).resolve()
    configure_cmake(build_dir, fi_root, "profiling", args.cuda_arch, args.cmake_arg)
    target = f"{args.benchmark}-cuda"
    build_target(build_dir, target)

    binary = resolve_binary(build_dir, args.benchmark)
    run_dir = make_results_dir(args.benchmark, "profiling", args.output_dir)
    run_dir.mkdir(parents=True, exist_ok=True)
    (run_dir / "bamboo_fi").mkdir(exist_ok=True)
    program_args = args.program_args or []
    result = execute_binary(binary, program_args, run_dir, args.timeout)

    metadata = {
        "mode": "profiling",
        "benchmark": args.benchmark,
        "binary": str(binary),
        "result": result,
        "run_dir": str(run_dir),
    }
    metadata_path = run_dir / "metadata.json"
    metadata_path.write_text(json.dumps(metadata, indent=2), encoding="utf-8")
    log(f"Profiling run complete. Outputs stored in {run_dir}")


def handle_injection(args: argparse.Namespace) -> None:
    build_dir = Path(args.build_dir or (REPO_ROOT / "build" / f"fi-inject-{args.benchmark}"))
    fi_root = Path(args.fi_root).resolve()
    configure_cmake(build_dir, fi_root, "injection", args.cuda_arch, args.cmake_arg)
    target = f"{args.benchmark}-cuda"
    build_target(build_dir, target)
    binary = resolve_binary(build_dir, args.benchmark)

    profile_path = Path(args.profile).resolve()
    entries = load_profile(profile_path)
    grouped = group_by_dynamic_kernel(entries)
    rng = random.Random(args.seed)

    base_dir = make_results_dir(args.benchmark, "injection", args.output_dir)
    shutil.copy(profile_path, base_dir / "bamboo.profile.txt")
    summary: List[Dict[str, object]] = []

    program_args = args.program_args or []
    for idx in range(1, args.trials + 1):
        run_dir = base_dir / f"run_{idx:03d}"
        run_dir.mkdir(parents=True, exist_ok=True)
        selection = select_injection(grouped, rng)
        bamboo_dir = run_dir / "bamboo_fi"
        bamboo_dir.mkdir(exist_ok=True)
        for subdir in ("std_output", "err_output", "prog_output", "ktrace"):
            (bamboo_dir / subdir).mkdir(exist_ok=True)

        config_line = f"{selection['threadIndex']} {selection['selectedInst']} {selection['dynamicKernelIndex']} {selection['staticKernelIndex']}"
        (bamboo_dir / "bamboo.fi.config.txt").write_text(config_line + "\n", encoding="utf-8")
        with open(bamboo_dir / "bamboo.fi.log.txt", "a", encoding="utf-8") as log_file:
            log_file.write(
                f"threadIndex {selection['threadIndex']} instCount {selection['instCount']} "
                f"dynamicKernelIndex {selection['dynamicKernelIndex']} staticKernelIndex {selection['staticKernelIndex']} "
                f"fiInstCount {selection['selectedInst']}\n"
            )

        run_result = execute_binary(binary, program_args, run_dir, args.timeout)
        run_summary = {
            "run": idx,
            "selection": selection,
            "result": run_result,
        }

        runtime_log = bamboo_dir / "bamboo.fi.runtime.log.txt"
        if runtime_log.exists():
            run_summary["runtime_log"] = runtime_log.read_text(encoding="utf-8")

        summary.append(run_summary)
        log(f"Injection run {idx}/{args.trials} complete (status={run_result['status']}). Outputs in {run_dir}")

    metadata = {
        "mode": "injection",
        "benchmark": args.benchmark,
        "binary": str(binary),
        "profile_source": str(profile_path),
        "trials": args.trials,
        "seed": args.seed,
        "results": summary,
    }
    (base_dir / "summary.json").write_text(json.dumps(metadata, indent=2), encoding="utf-8")
    log(f"Injection campaign complete. Outputs stored in {base_dir}")


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        description="HeCBench FI-GPU orchestration utility",
        formatter_class=argparse.ArgumentDefaultsHelpFormatter,
    )
    parser.add_argument("--fi-root", required=True, help="Path to the FI-GPU repository")
    parser.add_argument("--build-dir", help="Custom CMake build directory")
    parser.add_argument("--cuda-arch", help="CUDA architecture (e.g., sm_80)")
    parser.add_argument(
        "--cmake-arg",
        action="append",
        default=[],
        help="Additional -D style arguments forwarded to CMake (can be repeated)",
    )

    subparsers = parser.add_subparsers(dest="command", required=True)

    profile = subparsers.add_parser("profile", help="Build and run a profiling-enabled binary")
    profile.add_argument("--benchmark", required=True, help="Benchmark stem name (e.g., jacobi)")
    profile.add_argument("--output-dir", help="Directory where run artifacts should be stored")
    profile.add_argument("--timeout", type=int, default=600, help="Per-run timeout in seconds")
    profile.add_argument(
        "program_args",
        nargs=argparse.REMAINDER,
        help="Arguments passed to the benchmark executable (prefix with -- to separate)",
    )
    profile.set_defaults(func=handle_profile)

    inject = subparsers.add_parser("inject", help="Run FI-GPU fault injection experiments")
    inject.add_argument("--benchmark", required=True, help="Benchmark stem name (e.g., jacobi)")
    inject.add_argument("--profile", required=True, help="Path to bamboo.profile.txt generated from a profiling run")
    inject.add_argument("--trials", type=int, default=30, help="Number of injection experiments to run")
    inject.add_argument("--seed", type=int, default=None, help="PRNG seed (default: random)")
    inject.add_argument("--output-dir", help="Directory for the overall injection campaign outputs")
    inject.add_argument("--timeout", type=int, default=600, help="Per-run timeout in seconds")
    inject.add_argument(
        "program_args",
        nargs=argparse.REMAINDER,
        help="Arguments passed to the benchmark executable (prefix with -- to separate)",
    )
    inject.set_defaults(func=handle_injection)

    return parser


def main(argv: List[str] | None = None) -> int:
    parser = build_parser()
    args = parser.parse_args(argv)
    try:
        args.func(args)
    except Exception as exc:  # pylint: disable=broad-except
        log(f"ERROR: {exc}")
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
