#!/usr/bin/env python3
import argparse
import os
import subprocess


def run_cmd(cmd):
    proc = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    out = proc.stdout.decode("utf-8", errors="replace") if proc.stdout else ""
    return proc.returncode, out


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--clang", default="/soft/compilers/llvm/release-17.0.6/bin/clang++")
    parser.add_argument("--opt", default="/soft/compilers/llvm/release-17.0.6/bin/opt")
    parser.add_argument("--llvm-as", default="/soft/compilers/llvm/release-17.0.6/bin/llvm-as")
    parser.add_argument("--cuda-home", default="/soft/compilers/cudatoolkit/cuda-11.8.0")
    parser.add_argument("--cuda-arch", default="sm_80")
    parser.add_argument("--out-dir", default="HeCBench/build/llvm17-inject-matrix-rotate-worklist")
    parser.add_argument("--worklist", default="HeCBench/results/llvm17_inject/matrix-rotate/worklist.csv")
    parser.add_argument("--sites", default="HeCBench/results/llvm17_inject/matrix-rotate/sites.csv")
    args = parser.parse_args()

    repo_root = os.getcwd()
    out_dir = os.path.join(repo_root, args.out_dir)
    os.makedirs(out_dir, exist_ok=True)
    results_dir = os.path.dirname(os.path.join(repo_root, args.worklist))
    os.makedirs(results_dir, exist_ok=True)

    src = os.path.join(repo_root, "HeCBench/src/matrix-rotate-cuda/main.cu")
    bench_dir = os.path.join(repo_root, "HeCBench/src/matrix-rotate-cuda")
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
        "-I", bench_dir,
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

    plugin = os.path.join(repo_root, "HeCBench/tools/llvm17_inject/libllfi_inject.so")
    sites_path = os.path.join(repo_root, args.sites)
    if os.path.exists(sites_path):
        os.remove(sites_path)

    cmd = [
        args.opt,
        "-load-pass-plugin", plugin,
        "-passes=llfi-inject",
        "-llfi-site=-1",
        "-llfi-dump-sites=" + sites_path,
        ir_bc,
        "-o", os.path.join(out_dir, "device.dump.bc"),
    ]
    code, out = run_cmd(cmd)
    if code != 0:
        print(out)
        return code

    worklist_path = os.path.join(repo_root, args.worklist)
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
                if kind not in ("int", "float") or bitwidth <= 0:
                    continue
                for bit in range(bitwidth):
                    index += 1
                    wl.write(f"{index},{site_id},{bit},{bitwidth},{kind},{opcode}\n")

    print(f"Wrote {index} injections to {worklist_path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
