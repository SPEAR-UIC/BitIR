#!/usr/bin/env python3
import argparse
import csv
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


def source_file(source_dir, backend):
    if backend == "intel":
        return os.path.join(source_dir, "main.cpp")
    src = os.path.join(source_dir, "main.cu")
    if os.path.isfile(src):
        return src
    cu_files = sorted(name for name in os.listdir(source_dir) if name.endswith(".cu")) if os.path.isdir(source_dir) else []
    if len(cu_files) == 1:
        return os.path.join(source_dir, cu_files[0])
    return src


def find_opt(repo_root, configured_opt, llvm_search_root):
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
    if llvm_search_root and os.path.isdir(llvm_search_root):
        for root, _, files in os.walk(llvm_search_root):
            if "opt" in files:
                candidate = os.path.join(root, "opt")
                if os.access(candidate, os.X_OK):
                    return candidate
    return configured_opt


def find_llvm_tool(repo_root, configured_tool, tool_name, llvm_search_root):
    candidates = []
    if configured_tool:
        candidates.append(configured_tool)
        if not os.path.isabs(configured_tool):
            candidates.append(os.path.join(repo_root, configured_tool))
    candidates.append(os.path.join(repo_root, "HeCBench/tools/llvm17_inject/llvm/build/bin", tool_name))
    for candidate in candidates:
        if candidate and os.path.isfile(candidate) and os.access(candidate, os.X_OK):
            return candidate
    found = shutil.which(tool_name)
    if found:
        return found
    if llvm_search_root and os.path.isdir(llvm_search_root):
        for root, _, files in os.walk(llvm_search_root):
            if tool_name in files:
                candidate = os.path.join(root, tool_name)
                if os.access(candidate, os.X_OK):
                    return candidate
    return configured_tool


def build_cuda_ir(args, repo_root, src_dir, src, out_dir):
    llvm_search_root = os.environ.get("BITIR_MACHINE_LLVM_SEARCH_ROOT", "")
    clang = find_llvm_tool(repo_root, args.clang, "clang++", llvm_search_root) or ""
    llvm_as = find_llvm_tool(repo_root, args.llvm_as, "llvm-as", llvm_search_root) or ""
    cuda_home = args.cuda_home or os.environ.get("BITIR_MACHINE_RUNTIME_HOME", "")
    cuda_arch = args.cuda_arch or os.environ.get("BITIR_MACHINE_CUDA_ARCH_NAME", "")
    if not clang or not args.opt or not llvm_as or not cuda_home or not cuda_arch:
        print("missing required CUDA or LLVM settings")
        return "", 2
    ir_ll = os.path.join(out_dir, "device.ll")
    ir_bc = os.path.join(out_dir, "device.bc")
    cmd = [
        clang,
        "-x", "cuda",
        "--cuda-device-only",
        f"--cuda-gpu-arch={cuda_arch}",
        f"--cuda-path={cuda_home}",
        "-Xclang", "-emit-llvm",
        "-S", "-O0", "-g",
        "-D__STRICT_ANSI__",
        "-D_GLIBCXX_USE_FLOAT128=0",
        "-I", src_dir,
        "-I", os.path.join(repo_root, "HeCBench/src"),
        src,
        "-o", ir_ll,
    ]
    code, out = run_cmd(cmd)
    if code != 0:
        print(out)
        return "", code
    code, out = run_cmd([llvm_as, ir_ll, "-o", ir_bc])
    if code != 0:
        print(out)
        return "", code
    return ir_bc, 0


def build_amd_ir(args, repo_root, src_dir, src, out_dir):
    llvm_search_root = os.environ.get("BITIR_MACHINE_LLVM_SEARCH_ROOT", "")
    clang = find_llvm_tool(repo_root, args.clang, "clang++", llvm_search_root) or ""
    llvm_as = find_llvm_tool(repo_root, args.llvm_as, "llvm-as", llvm_search_root) or ""
    hip_home = args.cuda_home or os.environ.get("BITIR_MACHINE_RUNTIME_HOME", "")
    hip_arch = args.cuda_arch or os.environ.get("BITIR_MACHINE_HIP_ARCH", "")
    if not clang or not llvm_as or not hip_home or not hip_arch:
        print("missing required HIP or LLVM settings")
        return "", 2
    ir_ll = os.path.join(out_dir, "device.ll")
    ir_bc = os.path.join(out_dir, "device.bc")
    cmd = [
        clang,
        "-x", "hip",
        "--offload-device-only",
        f"--offload-arch={hip_arch}",
        f"--hip-path={hip_home}",
        "-Xclang", "-emit-llvm",
        "-S", "-O0", "-g",
        "-D__STRICT_ANSI__",
        "-D_GLIBCXX_USE_FLOAT128=0",
        "-I", src_dir,
        "-I", os.path.join(repo_root, "HeCBench/src"),
        src,
        "-o", ir_ll,
    ]
    extra_includes = str(os.environ.get("BITIR_EXTRA_INCLUDES", "")).split()
    for include_dir in extra_includes:
        include_path = include_dir if os.path.isabs(include_dir) else os.path.join(repo_root, include_dir)
        cmd[1:1] = ["-I", include_path]
    if args.extra_cflags:
        cmd[1:1] = shlex.split(args.extra_cflags)
    code, out = run_cmd(cmd)
    if code != 0:
        print(out)
        return "", code
    code, out = run_cmd([llvm_as, ir_ll, "-o", ir_bc])
    if code != 0:
        print(out)
        return "", code
    return ir_bc, 0


def build_sycl_ir(args, repo_root, src_dir, src, out_dir):
    sycl_target = os.environ.get("BITIR_MACHINE_SYCL_TARGET", "")
    sycl_offload_target = os.environ.get("BITIR_MACHINE_SYCL_OFFLOAD_TARGET", "")
    sycl_host_triple = os.environ.get("BITIR_MACHINE_SYCL_HOST_TRIPLE", "")
    tool_search_roots = os.environ.get("BITIR_MACHINE_TOOL_SEARCH_ROOTS", "").split()
    if not sycl_target or not sycl_offload_target or not sycl_host_triple:
        print("missing SYCL target metadata")
        return "", 2
    icpx = args.icpx or shutil.which("icpx") or ""
    bundler = args.bundler or shutil.which("clang-offload-bundler") or ""
    if not icpx:
        for root in tool_search_roots:
            candidate = os.path.join(root, "icpx")
            if os.access(candidate, os.X_OK):
                icpx = candidate
                break
    if not bundler:
        for root in tool_search_roots:
            candidate = os.path.join(root, "clang-offload-bundler")
            if os.access(candidate, os.X_OK):
                bundler = candidate
                break
    if not icpx or not bundler:
        print("missing SYCL compiler tools")
        return "", 2
    bundle_obj = os.path.join(out_dir, "bundle.o")
    host_obj = os.path.join(out_dir, "host.o")
    ir_bc = os.path.join(out_dir, "device.bc")
    cmd = [
        icpx,
        "-fsycl",
        f"-fsycl-targets={sycl_target}",
        "-O0",
        "-g",
        "-DUSE_GPU",
        "-I", src_dir,
        "-I", os.path.join(repo_root, "HeCBench/src"),
        "-c", src,
        "-o", bundle_obj,
    ]
    extra_includes = str(os.environ.get("BITIR_EXTRA_INCLUDES", "")).split()
    for include_dir in extra_includes:
        include_path = include_dir if os.path.isabs(include_dir) else os.path.join(repo_root, include_dir)
        cmd[1:1] = ["-I", include_path]
    if args.extra_cflags:
        cmd[1:1] = shlex.split(args.extra_cflags)
    code, out = run_cmd(cmd)
    if code != 0:
        print(out)
        return "", code
    cmd = [
        bundler,
        "--unbundle",
        "--type=o",
        f"--input={bundle_obj}",
        f"--output={host_obj}",
        f"--output={ir_bc}",
        f"--targets=host-{sycl_host_triple},{sycl_offload_target}",
    ]
    code, out = run_cmd(cmd)
    if code != 0:
        print(out)
        return "", code
    return ir_bc, 0


def write_cuda_worklist(worklist_path, sites_path, target, int_float_only, excluded_pairs):
    with open(worklist_path, "w", encoding="utf-8") as wl:
        wl.write("index,site_id,bit_index,bitwidth,type_kind,opcode\n")
        index = 0
        skipped = 0
        with open(sites_path, "r", encoding="utf-8") as fh:
            next(fh, None)
            for line in fh:
                line = line.strip()
                if not line:
                    continue
                parts = line.split(",")
                if len(parts) < 4:
                    continue
                site_id = parts[0]
                opcode = parts[1]
                kind = parts[2]
                bitwidth = int(parts[3]) if parts[3].isdigit() else 0
                if target == "pointer":
                    if kind != "ptr":
                        continue
                elif int_float_only and kind not in ("int", "float"):
                    continue
                if bitwidth <= 0:
                    continue
                for bit in range(bitwidth):
                    if (site_id, str(bit)) in excluded_pairs:
                        skipped += 1
                        continue
                    index += 1
                    wl.write(f"{index},{site_id},{bit},{bitwidth},{kind},{opcode}\n")
    return index, skipped


def write_sycl_worklist(worklist_path, sites_rich_path, bench_base, target, int_float_only, excluded_pairs):
    with open(worklist_path, "w", encoding="utf-8") as wl:
        wl.write("index,site_id,bit_index,bitwidth,type_kind,opcode,site_class,operand_index\n")
        index = 0
        skipped = 0
        with open(sites_rich_path, "r", encoding="utf-8", newline="") as fh:
            for row in csv.DictReader(fh):
                site_id = row.get("site_id", "").strip()
                opcode = row.get("opcode", "").strip()
                kind = row.get("type_kind", "").strip()
                site_class = row.get("site_class", "").strip() or "result"
                if site_class == "base":
                    site_class = "result"
                operand_index = row.get("operand_index", "").strip() or "-1"
                try:
                    bitwidth = int(row.get("bitwidth", "0"))
                except ValueError:
                    bitwidth = 0
                if not site_id or bitwidth <= 0:
                    continue
                if target == "pointer":
                    if site_class != "pointer" or kind != "ptr":
                        continue
                elif target == "operand":
                    if site_class != "operand" or kind not in ("int", "float"):
                        continue
                elif target == "result":
                    if site_class != "result" or kind not in ("int", "float"):
                        continue
                else:
                    if site_class == "result" and kind not in ("int", "float"):
                        continue
                    if site_class == "operand" and kind not in ("int", "float"):
                        continue
                    if site_class == "pointer" and kind != "ptr":
                        continue
                    if site_class not in ("result", "operand", "pointer"):
                        continue
                if target != "all" and int_float_only and kind not in ("int", "float") and site_class != "pointer":
                    continue
                for bit in range(bitwidth):
                    if (site_id, str(bit)) in excluded_pairs:
                        skipped += 1
                        continue
                    index += 1
                    wl.write(f"{index},{site_id},{bit},{bitwidth},{kind},{opcode},{site_class},{operand_index}\n")
    return index, skipped


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--bench", required=True)
    parser.add_argument("--source-dir", default=os.environ.get("BITIR_SOURCE_DIR", ""))
    parser.add_argument("--backend", default=os.environ.get("BITIR_MACHINE_BACKEND", "nvidia"))
    parser.add_argument("--clang", default=os.environ.get("CLANG", ""))
    parser.add_argument("--llvm-as", default=os.environ.get("LLVM_AS", ""))
    parser.add_argument("--cuda-home", default=os.environ.get("CUDA_HOME", ""))
    parser.add_argument("--cuda-arch", default=os.environ.get("CUDA_ARCH", ""))
    parser.add_argument("--icpx", default=os.environ.get("ICPX", ""))
    parser.add_argument("--bundler", default=os.environ.get("CLANG_OFFLOAD_BUNDLER", ""))
    parser.add_argument("--opt", default=os.environ.get("OPT_BIN", ""))
    parser.add_argument("--out-dir", default="HeCBench/build/llvm17-inject-bench-worklist")
    parser.add_argument("--target", choices=["result", "operand", "pointer", "all"], default="result")
    parser.add_argument("--int-float-only", type=int, choices=[0, 1], default=1)
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
    backend = args.backend.strip().lower()
    if backend not in ("nvidia", "intel", "amd"):
        print(f"unsupported backend: {backend}")
        return 2
    if not args.source_dir:
        print("missing source dir")
        return 2
    source_dir = args.source_dir if os.path.isabs(args.source_dir) else os.path.join(repo_root, args.source_dir)
    src = source_file(source_dir, backend)
    if not os.path.isfile(src):
        print(f"missing source: {src}")
        return 2

    bench_name = os.path.basename(source_dir)
    out_dir = os.path.join(repo_root, args.out_dir, bench_name)
    os.makedirs(out_dir, exist_ok=True)
    results_root = os.environ.get("BITIR_MACHINE_RESULTS_ROOT", "HeCBench/results/llvm17_inject")
    results_dir = os.path.join(repo_root, results_root, bench_name)
    os.makedirs(results_dir, exist_ok=True)

    llvm_search_root = os.environ.get("BITIR_MACHINE_LLVM_SEARCH_ROOT", "")
    opt_bin = find_opt(repo_root, args.opt, llvm_search_root)
    if not opt_bin or not os.path.isfile(opt_bin):
        print(f"missing opt: {args.opt or 'not found'}")
        return 2
    args.opt = opt_bin

    if backend == "intel":
        ir_bc, code = build_sycl_ir(args, repo_root, source_dir, src, out_dir)
    elif backend == "amd":
        ir_bc, code = build_amd_ir(args, repo_root, source_dir, src, out_dir)
    else:
        ir_bc, code = build_cuda_ir(args, repo_root, source_dir, src, out_dir)
    if code != 0:
        return code

    plugin = os.path.join(repo_root, "HeCBench/tools/llvm17_inject/libfi_inject.so")
    suffix = "" if args.target in ("result", "all") else f"_{args.target}"
    sites_path = resolve_results_path(repo_root, results_dir, args.sites, f"sites{suffix}.csv")
    sites_rich_path = resolve_results_path(repo_root, results_dir, args.sites_rich, f"sites{suffix}_metadata.csv")
    if os.path.exists(sites_path):
        os.remove(sites_path)
    if os.path.exists(sites_rich_path):
        os.remove(sites_rich_path)

    cmd = [
        opt_bin,
        "-load-pass-plugin", plugin,
        "-passes=fi-inject",
        "-fi-site=-1",
        f"-fi-target={args.target}",
        f"-fi-int-float-only={args.int_float_only}",
        f"-fi-include-constants={args.include_constants}",
        "-fi-dump-sites=" + sites_path,
        "-fi-dump-sites-rich=" + sites_rich_path,
        ir_bc,
        "-o", os.path.join(out_dir, "device.dump.bc"),
    ]
    code, out = run_cmd(cmd)
    if code != 0:
        print(out)
        return code

    if args.metadata_only:
        print(f"Wrote rich site metadata to {sites_rich_path}")
        return 0

    bench_base = args.bench
    backend_suffix = os.environ.get("BITIR_MACHINE_BINARY_SUBDIR", "")
    if backend == "intel" and backend_suffix and bench_base.endswith(f"-{backend_suffix}"):
        bench_base = bench_base[:-len(f"-{backend_suffix}")]

    excluded_pairs, exclusion_sources = load_excluded_pairs(
        repo_root,
        bench_base,
        args.target,
        summary_paths=args.exclude_summary,
        git_refs=args.exclude_git_ref,
    )
    worklist_path = resolve_results_path(repo_root, results_dir, args.worklist, f"worklist{suffix}.csv")
    if backend in ("intel", "amd"):
        count, skipped = write_sycl_worklist(
            worklist_path,
            sites_rich_path,
            bench_base,
            args.target,
            args.int_float_only,
            excluded_pairs,
        )
    else:
        count, skipped = write_cuda_worklist(
            worklist_path,
            sites_path,
            args.target,
            args.int_float_only,
            excluded_pairs,
        )

    message = f"Wrote {count} injections to {worklist_path}"
    if exclusion_sources:
        message += f" (excluded {skipped} site-bit pairs from {len(exclusion_sources)} summary source(s))"
    print(message)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
