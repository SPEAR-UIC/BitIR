#!/usr/bin/env python3
import argparse
import csv
import hashlib
import json
import os
import shutil
import subprocess
from pathlib import Path

BENCH_CONFIG = {
    "matrix-rotate": {
        "source_dir": "HeCBench/src/matrix-rotate-sycl",
        "extra_includes": [],
    },
    "layout": {
        "source_dir": "HeCBench/src/layout-sycl",
        "extra_includes": [],
    },
    "dense-embedding": {
        "source_dir": "HeCBench/src/dense-embedding-sycl",
        "extra_includes": [],
    },
    "entropy": {
        "source_dir": "HeCBench/src/entropy-sycl",
        "extra_includes": ["HeCBench/src/entropy-cuda"],
    },
}

MINIMAL_SITE_FIELDS = [
    "site_id",
    "opcode",
    "type_kind",
    "bitwidth",
    "operand_index",
    "function",
]


def sha256(path: Path):
    h = hashlib.sha256()
    with path.open("rb") as fh:
        for chunk in iter(lambda: fh.read(1024 * 1024), b""):
            h.update(chunk)
    return h.hexdigest()


def run_cmd(cmd, *, cwd: Path, env, stdout: Path, stderr: Path):
    with stdout.open("w", encoding="utf-8") as out_fh, stderr.open("w", encoding="utf-8") as err_fh:
        proc = subprocess.run(cmd, cwd=cwd, env=env, stdout=out_fh, stderr=err_fh)
    if proc.returncode != 0:
        raise RuntimeError(f"command failed rc={proc.returncode}: {' '.join(cmd)}")


def resolve_tool(name: str, candidates):
    for candidate in candidates:
        if candidate and Path(candidate).is_file() and os.access(candidate, os.X_OK):
            return candidate
    found = shutil.which(name)
    if found:
        return found
    raise RuntimeError(f"missing required tool: {name}")


def write_minimal_sites(metadata_csv: Path, sites_csv: Path):
    with metadata_csv.open(newline="", encoding="utf-8") as fh:
        rows = list(csv.DictReader(fh))
    with sites_csv.open("w", newline="", encoding="utf-8") as out_fh:
        writer = csv.DictWriter(out_fh, fieldnames=MINIMAL_SITE_FIELDS)
        writer.writeheader()
        for row in rows:
            writer.writerow({field: row.get(field, "") for field in MINIMAL_SITE_FIELDS})


def write_cmd(path: Path, cmd):
    path.write_text(subprocess.list2cmdline(cmd) + "\n", encoding="utf-8")


def first_find(root: Path, name: str):
    if not root.is_dir():
        return ""
    proc = subprocess.run(
        ["find", str(root), "-type", "f", "-name", name],
        stdout=subprocess.PIPE,
        stderr=subprocess.DEVNULL,
        universal_newlines=True,
        check=False,
    )
    for line in proc.stdout.splitlines():
        if line:
            return line
    return ""


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--repo-root", required=True)
    ap.add_argument("--out-dir", required=True)
    args = ap.parse_args()

    repo_root = Path(args.repo_root).resolve()
    out_root = Path(args.out_dir).resolve()
    out_root.mkdir(parents=True, exist_ok=True)

    tool_roots = [
        "/opt/aurora/25.190.0/oneapi/compiler/latest/bin",
        "/opt/aurora/25.190.0/oneapi/compiler/latest/bin/compiler",
        "/opt/aurora/25.190.0/oneapi/compiler/2025.2/bin",
        "/opt/aurora/25.190.0/oneapi/compiler/2025.2/bin/compiler",
    ]
    llvm_search_root = Path("/opt/aurora/25.190.0/spack/unified")
    opt_candidates = [str(Path(root) / "opt") for root in tool_roots]
    opt_candidates.append(first_find(llvm_search_root, "opt"))

    icpx = resolve_tool("icpx", [str(Path(root) / "icpx") for root in tool_roots])
    bundler = resolve_tool(
        "clang-offload-bundler",
        [str(Path(root) / "clang-offload-bundler") for root in tool_roots],
    )
    opt_bin = resolve_tool("opt", opt_candidates)
    plugin = repo_root / "HeCBench/tools/llvm17_inject/libfi_inject.so"
    if not plugin.is_file():
        raise RuntimeError(f"missing injection plugin: {plugin}")

    manifest_rows = []
    env = os.environ.copy()
    for bench, cfg in BENCH_CONFIG.items():
        bench_dir = out_root / bench
        bench_dir.mkdir(parents=True, exist_ok=True)
        source_dir = repo_root / cfg["source_dir"]
        probe_src = source_dir / "main.cpp"
        include_args = ["-I", str(source_dir), "-I", str(repo_root / "HeCBench/src")]
        for inc in cfg["extra_includes"]:
            include_args.extend(["-I", str(repo_root / inc)])

        bundle_obj = bench_dir / "bundle.o"
        host_obj = bench_dir / "host.o"
        device_bc = bench_dir / "device.bc"
        device_ll = bench_dir / "device.ll"
        metadata_csv = bench_dir / "sites_metadata.csv"
        sites_csv = bench_dir / "sites.csv"

        compile_cmd = [
            icpx,
            "-fsycl",
            "-fsycl-targets=spir64",
            "-O0",
            "-g",
            "-DUSE_GPU",
            *include_args,
            "-c",
            str(probe_src),
            "-o",
            str(bundle_obj),
        ]
        write_cmd(bench_dir / "build_probe_bundle.cmd", compile_cmd)
        run_cmd(
            compile_cmd,
            cwd=repo_root,
            env=env,
            stdout=bench_dir / "build_probe_bundle.out",
            stderr=bench_dir / "build_probe_bundle.err",
        )

        unbundle_cmd = [
            bundler,
            "--unbundle",
            "--type=o",
            f"--input={bundle_obj}",
            f"--output={host_obj}",
            f"--output={device_bc}",
            "--targets=host-x86_64-unknown-linux-gnu,sycl-spir64-unknown-unknown",
        ]
        write_cmd(bench_dir / "unbundle_probe_device_ir.cmd", unbundle_cmd)
        run_cmd(
            unbundle_cmd,
            cwd=repo_root,
            env=env,
            stdout=bench_dir / "unbundle_probe_device_ir.out",
            stderr=bench_dir / "unbundle_probe_device_ir.err",
        )

        dump_cmd = [
            opt_bin,
            "-load-pass-plugin",
            str(plugin),
            "-passes=fi-inject",
            "-fi-site=-1",
            "-fi-target=result",
            "-fi-int-float-only=1",
            "-fi-include-constants=0",
            f"-fi-dump-sites-rich={metadata_csv}",
            "-disable-output",
            str(device_bc),
        ]
        write_cmd(bench_dir / "dump_probe_sites_metadata.cmd", dump_cmd)
        run_cmd(
            dump_cmd,
            cwd=repo_root,
            env=env,
            stdout=bench_dir / "dump_probe_sites_metadata.out",
            stderr=bench_dir / "dump_probe_sites_metadata.err",
        )

        render_cmd = [opt_bin, "-S", str(device_bc), "-o", str(device_ll)]
        write_cmd(bench_dir / "render_probe_device_ll.cmd", render_cmd)
        run_cmd(
            render_cmd,
            cwd=repo_root,
            env=env,
            stdout=bench_dir / "render_probe_device_ll.out",
            stderr=bench_dir / "render_probe_device_ll.err",
        )

        write_minimal_sites(metadata_csv, sites_csv)
        manifest_rows.append(
            {
                "bench": bench,
                "source_dir": str(source_dir),
                "source_file": str(probe_src),
                "sites_csv": str(sites_csv),
                "sites_metadata_csv": str(metadata_csv),
                "device_bc": str(device_bc),
                "device_ll": str(device_ll),
                "bundle_o": str(bundle_obj),
                "host_o": str(host_obj),
                "icpx": icpx,
                "clang_offload_bundler": bundler,
                "opt_bin": opt_bin,
                "plugin": str(plugin),
                "plugin_sha256": sha256(plugin),
            }
        )

    with (out_root / "fresh_metadata_manifest.csv").open("w", newline="", encoding="utf-8") as fh:
        writer = csv.DictWriter(fh, fieldnames=list(manifest_rows[0].keys()))
        writer.writeheader()
        writer.writerows(manifest_rows)
    (out_root / "fresh_metadata_summary.json").write_text(
        json.dumps({"benchmarks": list(BENCH_CONFIG.keys()), "count": len(manifest_rows)}, indent=2) + "\n",
        encoding="utf-8",
    )


if __name__ == "__main__":
    main()
