#!/usr/bin/env python3
import argparse
import os
import subprocess


def run_cmd(cmd):
    proc = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    out = proc.stdout.decode("utf-8", errors="replace") if proc.stdout else ""
    return proc.returncode, out


def bench_config(repo_root, bench):
    src_dir = os.path.join(repo_root, "HeCBench", "src", f"{bench}-cuda")
    src = os.path.join(src_dir, "main.cu")
    return src_dir, src


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--bench", required=True)
    parser.add_argument("--clang", default="/soft/compilers/llvm/release-17.0.6/bin/clang++")
    parser.add_argument("--opt", default="/soft/compilers/llvm/release-17.0.6/bin/opt")
    parser.add_argument("--llvm-as", default="/soft/compilers/llvm/release-17.0.6/bin/llvm-as")
    parser.add_argument("--cuda-home", default="/soft/compilers/cudatoolkit/cuda-11.8.0")
    parser.add_argument("--cuda-arch", default="sm_80")
    parser.add_argument("--out-dir", default="HeCBench/build/llvm17-inject-bench-worklist")
    parser.add_argument("--target", choices=["result", "operand", "pointer"], default="result")
    parser.add_argument("--int-float-only", type=int, choices=[0, 1], default=1)
    parser.add_argument("--include-constants", type=int, choices=[0, 1], default=0)
    parser.add_argument("--worklist", default="")
    parser.add_argument("--sites", default="")
    args = parser.parse_args()

    repo_root = os.getcwd()
    out_dir = os.path.join(repo_root, args.out_dir, args.bench)
    os.makedirs(out_dir, exist_ok=True)
    results_dir = os.path.join(repo_root, "HeCBench/results/llvm17_inject", args.bench)
    os.makedirs(results_dir, exist_ok=True)

    src_dir, src = bench_config(repo_root, args.bench)
    if not os.path.isfile(src):
        print("missing source: %s" % src)
        return 2

    ir_ll = os.path.join(out_dir, "device.ll")
    ir_bc = os.path.join(out_dir, "device.bc")

    cmd = [
        args.clang,
        "-x", "cuda",
        "--cuda-device-only",
        f"--cuda-gpu-arch={args.cuda_arch}",
        f"--cuda-path={args.cuda_home}",
        "-Xclang", "-emit-llvm",
        "-S", "-O0", "-g",
        "-D__STRICT_ANSI__",
        "-D_GLIBCXX_USE_FLOAT128=0",
        "-nostdinc++",
        "-isystem", "/usr/include/c++/7",
        "-isystem", "/usr/include/c++/7/x86_64-suse-linux",
        "-isystem", "/usr/include/c++/7/backward",
        "-isystem", "/usr/lib64/gcc/x86_64-suse-linux/7/include",
        "-I", src_dir,
        "-I", os.path.join(repo_root, "HeCBench/src"),
        src,
        "-o", ir_ll,
    ]
    code, out = run_cmd(cmd)
    if code != 0:
        print(out)
        return code

    code, out = run_cmd([args.llvm_as, ir_ll, "-o", ir_bc])
    if code != 0:
        print(out)
        return code

    plugin = os.path.join(repo_root, "HeCBench/tools/llvm17_inject/libfi_inject.so")
    suffix = "" if args.target == "result" else f"_{args.target}"
    sites_path = os.path.join(results_dir, args.sites or f"sites{suffix}.csv")
    if os.path.exists(sites_path):
        os.remove(sites_path)

    cmd = [
        args.opt,
        "-load-pass-plugin", plugin,
        "-passes=fi-inject",
        "-fi-site=-1",
        f"-fi-target={args.target}",
        f"-fi-int-float-only={args.int_float_only}",
        f"-fi-include-constants={args.include_constants}",
        "-fi-dump-sites=" + sites_path,
        ir_bc,
        "-o", os.path.join(out_dir, "device.dump.bc"),
    ]
    code, out = run_cmd(cmd)
    if code != 0:
        print(out)
        return code

    worklist_path = os.path.join(results_dir, args.worklist or f"worklist{suffix}.csv")
    with open(worklist_path, "w", encoding="utf-8") as wl:
        wl.write("index,site_id,bit_index,bitwidth,type_kind,opcode\n")
        index = 0
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
                if args.target == "pointer":
                    if kind != "ptr":
                        continue
                else:
                    if args.int_float_only and kind not in ("int", "float"):
                        continue
                if bitwidth <= 0:
                    continue
                for bit in range(bitwidth):
                    index += 1
                    wl.write(f"{index},{site_id},{bit},{bitwidth},{kind},{opcode}\n")

    print(f"Wrote {index} injections to {worklist_path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
