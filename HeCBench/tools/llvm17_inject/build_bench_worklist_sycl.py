#!/usr/bin/env python3
import argparse
import os
import shlex
import shutil
import subprocess

from worklist_exclusions import load_excluded_pairs


def run_cmd(cmd):
    proc = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    out = proc.stdout.decode("utf-8", errors="replace") if proc.stdout else ""
    return proc.returncode, out


def resolve_results_path(repo_root, results_dir, value, default_name):
    if not value:
        return os.path.join(results_dir, default_name)
    if os.path.isabs(value):
        return value
    if value.startswith("HeCBench/"):
        return os.path.join(repo_root, value)
    return os.path.join(results_dir, value)


def find_opt(repo_root, configured_opt):
    candidates = []
    if configured_opt:
      candidates.append(configured_opt)
      if not os.path.isabs(configured_opt):
          candidates.append(os.path.join(repo_root, configured_opt))

    candidates.append(os.path.join(repo_root, "HeCBench/tools/llvm17_inject/llvm/build/bin/opt"))

    for candidate in candidates:
        if candidate and os.path.isfile(candidate) and os.access(candidate, os.X_OK):
            return candidate

    found = shutil.which("opt")
    if found:
        return found

    spack_root = "/opt/aurora/25.190.0/spack/unified"
    for root, _, files in os.walk(spack_root):
        if "opt" in files:
            candidate = os.path.join(root, "opt")
            if os.access(candidate, os.X_OK):
                return candidate

    return configured_opt


def bench_config(repo_root, bench):
    if bench.endswith("-sycl"):
        bench_name = bench
        bench_base = bench[:-5]
    else:
        bench_base = bench
        bench_name = f"{bench}-sycl"
    src_dir = os.path.join(repo_root, "HeCBench", "src", bench_name)
    src = os.path.join(src_dir, "main.cpp")
    return bench_base, bench_name, src_dir, src


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--bench", required=True)
    parser.add_argument("--icpx", default=os.environ.get("ICPX", "/opt/aurora/25.190.0/oneapi/compiler/latest/bin/icpx"))
    parser.add_argument(
        "--bundler",
        default=os.environ.get(
            "CLANG_OFFLOAD_BUNDLER",
            "/opt/aurora/25.190.0/oneapi/compiler/latest/bin/compiler/clang-offload-bundler",
        ),
    )
    parser.add_argument("--opt", default=os.environ.get("OPT_BIN", ""))
    parser.add_argument("--out-dir", default="HeCBench/build/llvm17-inject-bench-worklist-sycl")
    parser.add_argument("--target", choices=["result", "operand", "pointer", "all"], default="all")
    parser.add_argument("--int-float-only", type=int, choices=[0, 1], default=0)
    parser.add_argument("--include-constants", type=int, choices=[0, 1], default=0)
    parser.add_argument("--worklist", default="")
    parser.add_argument("--sites", default="")
    parser.add_argument("--sites-rich", default="")
    parser.add_argument("--metadata-only", action="store_true")
    parser.add_argument("--reuse", action="store_true")
    parser.add_argument("--extra-cflags", default="")
    parser.add_argument("--exclude-summary", action="append", default=[])
    parser.add_argument("--exclude-git-ref", action="append", default=[])
    args = parser.parse_args()

    repo_root = os.getcwd()
    bench_base, bench_name, src_dir, src = bench_config(repo_root, args.bench)
    if not os.path.isfile(src):
        print(f"missing source: {src}")
        return 2

    out_dir = os.path.join(repo_root, args.out_dir, bench_name)
    os.makedirs(out_dir, exist_ok=True)
    results_dir = os.path.join(repo_root, "HeCBench/results/llvm17_inject", bench_name)
    os.makedirs(results_dir, exist_ok=True)

    bundle_obj = os.path.join(out_dir, "bundle.o")
    host_obj = os.path.join(out_dir, "host.o")
    ir_bc = os.path.join(out_dir, "device.bc")

    if not args.reuse or not os.path.exists(ir_bc):
        cuda_inc = os.path.join(repo_root, "HeCBench", "src", f"{bench_base}-cuda")
        cmd = [
            args.icpx,
            "-fsycl",
            "-fsycl-targets=spir64",
            "-O0",
            "-g",
            "-DUSE_GPU",
            "-I",
            src_dir,
            "-I",
            os.path.join(repo_root, "HeCBench/src"),
            "-I",
            cuda_inc if os.path.isdir(cuda_inc) else src_dir,
            "-c",
            src,
            "-o",
            bundle_obj,
        ]
        if args.extra_cflags:
            cmd[1:1] = shlex.split(args.extra_cflags)
        code, out = run_cmd(cmd)
        if code != 0:
            print(out)
            return code

        cmd = [
            args.bundler,
            "--unbundle",
            "--type=o",
            f"--input={bundle_obj}",
            f"--output={host_obj}",
            f"--output={ir_bc}",
            "--targets=host-x86_64-unknown-linux-gnu,sycl-spir64-unknown-unknown",
        ]
        code, out = run_cmd(cmd)
        if code != 0:
            print(out)
            return code

    plugin = os.path.join(repo_root, "HeCBench/tools/llvm17_inject/libfi_inject.so")
    opt_bin = find_opt(repo_root, args.opt)
    if not opt_bin or not os.path.isfile(opt_bin):
        print(f"missing opt: {args.opt or 'not found'}")
        return 2
    suffix = "" if args.target in ("result", "all") else f"_{args.target}"
    sites_path = resolve_results_path(repo_root, results_dir, args.sites, f"sites{suffix}.csv")
    sites_rich_path = resolve_results_path(repo_root, results_dir, args.sites_rich, f"sites{suffix}_metadata.csv")
    if os.path.exists(sites_path):
        os.remove(sites_path)
    if os.path.exists(sites_rich_path):
        os.remove(sites_rich_path)

    cmd = [
        opt_bin,
        "-load-pass-plugin",
        plugin,
        "-passes=fi-inject",
        "-fi-site=-1",
        f"-fi-target={args.target}",
        f"-fi-int-float-only={args.int_float_only}",
        f"-fi-include-constants={args.include_constants}",
        "-fi-dump-sites=" + sites_path,
        "-fi-dump-sites-rich=" + sites_rich_path,
        ir_bc,
        "-o",
        os.path.join(out_dir, "device.dump.bc"),
    ]
    code, out = run_cmd(cmd)
    if code != 0:
        print(out)
        return code

    if args.metadata_only:
        print(f"Wrote rich site metadata to {sites_rich_path}")
        return 0

    excluded_pairs, exclusion_sources = load_excluded_pairs(
        repo_root,
        bench_base,
        args.target,
        summary_paths=args.exclude_summary,
        git_refs=args.exclude_git_ref,
    )
    worklist_path = resolve_results_path(repo_root, results_dir, args.worklist, f"worklist{suffix}.csv")
    with open(worklist_path, "w", encoding="utf-8") as wl:
        wl.write("index,site_id,bit_index,bitwidth,type_kind,opcode,site_class,operand_index\n")
        index = 0
        skipped = 0
        with open(sites_rich_path, "r", encoding="utf-8", newline="") as fh:
            for row in __import__("csv").DictReader(fh):
                site_id = row.get("site_id", "").strip()
                opcode = row.get("opcode", "").strip()
                kind = row.get("type_kind", "").strip()
                site_class = row.get("site_class", "").strip() or "base"
                operand_index = row.get("operand_index", "").strip() or "-1"
                try:
                    bitwidth = int(row.get("bitwidth", "0"))
                except ValueError:
                    bitwidth = 0
                if not site_id or bitwidth <= 0:
                    continue
                if args.target == "pointer":
                    if site_class != "pointer" or kind != "ptr":
                        continue
                elif args.target == "operand":
                    if site_class != "operand" or kind not in ("int", "float"):
                        continue
                elif args.target == "result":
                    if site_class != "base" or kind not in ("int", "float"):
                        continue
                else:
                    if site_class == "base" and kind not in ("int", "float"):
                        continue
                    if site_class == "operand" and kind not in ("int", "float"):
                        continue
                    if site_class == "pointer" and kind != "ptr":
                        continue
                    if site_class not in ("base", "operand", "pointer"):
                        continue
                if args.target != "all" and args.int_float_only and kind not in ("int", "float") and site_class != "pointer":
                    continue
                for bit in range(bitwidth):
                    if (site_id, str(bit)) in excluded_pairs:
                        skipped += 1
                        continue
                    index += 1
                    wl.write(
                        f"{index},{site_id},{bit},{bitwidth},{kind},{opcode},{site_class},{operand_index}\n"
                    )

    message = f"Wrote {index} injections to {worklist_path}"
    if exclusion_sources:
        message += f" (excluded {skipped} site-bit pairs from {len(exclusion_sources)} summary source(s))"
    print(message)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
