#!/usr/bin/env python3
import argparse
import os
import re
import subprocess
from typing import Dict, List, Optional, Tuple


GOLDEN_BENCHES = {
    "matrix-rotate": "HeCBench/src/matrix-rotate-cuda",
    "jacobi": "HeCBench/src/jacobi-cuda",
    "layout": "HeCBench/src/layout-cuda",
    "atomicCost": "HeCBench/src/atomicCost-cuda",
    "dense-embedding": "HeCBench/src/dense-embedding-cuda",
    "pathfinder": "HeCBench/src/pathfinder-cuda",
    "bsearch": "HeCBench/src/bsearch-cuda",
    "entropy": "HeCBench/src/entropy-cuda",
    "colorwheel": "HeCBench/src/colorwheel-cuda",
    "randomAccess": "HeCBench/src/randomAccess-cuda",
}


class Site:
    def __init__(self, site_id: int, function: str, opcode: str, src_file: str, src_line: str, src_col: str, ir_file: str):
        self.site_id = site_id
        self.function = function
        self.opcode = opcode
        self.src_file = src_file
        self.src_line = src_line
        self.src_col = src_col
        self.ir_file = ir_file


def discover_cu_files(root: str) -> List[str]:
    cu_files = []
    for dirpath, _, filenames in os.walk(root):
        for name in filenames:
            if name.endswith(".cu"):
                cu_files.append(os.path.join(dirpath, name))
    return sorted(cu_files)


def run_cmd(cmd: List[str], cwd: Optional[str] = None) -> Tuple[int, str]:
    proc = subprocess.run(cmd, cwd=cwd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    output = proc.stdout.decode("utf-8", errors="replace") if proc.stdout else ""
    return proc.returncode, output


def parse_metadata(lines: List[str]) -> Tuple[Dict[str, Tuple[str, str]], Dict[str, str], Dict[str, str]]:
    file_map: Dict[str, Tuple[str, str]] = {}
    scope_file: Dict[str, str] = {}
    scope_parent: Dict[str, str] = {}

    re_file = re.compile(r'!(\d+)\s*=\s*!DIFile\(filename:\s*"([^"]+)",\s*directory:\s*"([^"]+)"')
    re_sub = re.compile(r'!(\d+)\s*=\s*!DISubprogram\(.*file:\s*!(\d+)')
    re_lex = re.compile(r'!(\d+)\s*=\s*!DILexicalBlock\(.*scope:\s*!(\d+).*file:\s*!(\d+)')
    re_lex2 = re.compile(r'!(\d+)\s*=\s*!DILexicalBlock\(.*scope:\s*!(\d+)')

    for line in lines:
        m = re_file.search(line)
        if m:
            file_map[m.group(1)] = (m.group(3), m.group(2))
            continue
        m = re_sub.search(line)
        if m:
            scope_file[m.group(1)] = m.group(2)
            continue
        m = re_lex.search(line)
        if m:
            scope_parent[m.group(1)] = m.group(2)
            scope_file[m.group(1)] = m.group(3)
            continue
        m = re_lex2.search(line)
        if m:
            scope_parent[m.group(1)] = m.group(2)
            continue

    return file_map, scope_file, scope_parent


def resolve_file(scope_id: str, file_map: Dict[str, Tuple[str, str]], scope_file: Dict[str, str], scope_parent: Dict[str, str]) -> str:
    cur = scope_id
    for _ in range(6):
        if cur in scope_file:
            file_id = scope_file[cur]
            if file_id in file_map:
                directory, filename = file_map[file_id]
                return os.path.join(directory, filename)
            return file_id
        if cur in scope_parent:
            cur = scope_parent[cur]
        else:
            break
    return ""


def parse_ir(ir_path: str) -> List[Site]:
    with open(ir_path, "r", encoding="utf-8", errors="replace") as fh:
        lines = fh.readlines()

    file_map, scope_file, scope_parent = parse_metadata(lines)

    sites: List[Site] = []
    in_func = False
    func = ""
    site_id = 0

    re_define = re.compile(r'define .*@([^(]+)\(')
    re_dbg = re.compile(r'!dbg !(\d+)')
    re_loc = re.compile(r'!(\d+)\s*=\s*!DILocation\(line:\s*(\d+),\s*column:\s*(\d+),\s*scope:\s*!(\d+)')

    loc_map: Dict[str, Tuple[str, str, str]] = {}
    for line in lines:
        m = re_loc.search(line)
        if m:
            loc_map[m.group(1)] = (m.group(2), m.group(3), m.group(4))

    for line in lines:
        s = line.strip()
        if not s or s.startswith(";"):
            continue
        m = re_define.search(s)
        if m:
            in_func = True
            func = m.group(1)
            continue
        if in_func and s == "}":
            in_func = False
            func = ""
            continue
        if not in_func:
            continue
        if s.endswith(":"):
            continue
        if s.startswith("attributes ") or s.startswith("declare "):
            continue
        if s.startswith("!"):
            continue

        dbg_id = ""
        m = re_dbg.search(s)
        if m:
            dbg_id = m.group(1)

        if "=" in s:
            rhs = s.split("=", 1)[1].strip()
        else:
            rhs = s
        opcode = rhs.split()[0]

        if opcode == "call" and ("@llvm.dbg" in rhs or "@llvm.lifetime" in rhs):
            continue

        src_line = ""
        src_col = ""
        src_file = ""
        if dbg_id and dbg_id in loc_map:
            src_line, src_col, scope_id = loc_map[dbg_id]
            src_file = resolve_file(scope_id, file_map, scope_file, scope_parent)

        site_id += 1
        sites.append(Site(site_id, func, opcode, src_file, src_line, src_col, ir_path))

    return sites


def compile_to_ir(clang: str, cuda_home: str, cuda_arch: str, src: str, out_ll: str, include_dirs: List[str]) -> Tuple[int, str]:
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
        "-nostdinc++",
        "-isystem", "/usr/include/c++/7",
        "-isystem", "/usr/include/c++/7/x86_64-suse-linux",
        "-isystem", "/usr/include/c++/7/backward",
        "-isystem", "/usr/lib64/gcc/x86_64-suse-linux/7/include",
    ]
    for inc in include_dirs:
        cmd.extend(["-I", inc])
    cmd.extend([src, "-o", out_ll])
    return run_cmd(cmd)


def write_sites_csv(path: str, sites: List[Site]) -> None:
    with open(path, "w", encoding="utf-8") as fh:
        fh.write("site_id,function,opcode,src_file,src_line,src_col,ir_file\n")
        for s in sites:
            fh.write(f"{s.site_id},{s.function},{s.opcode},{s.src_file},{s.src_line},{s.src_col},{s.ir_file}\n")


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--clang", default="/soft/compilers/llvm/release-17.0.6/bin/clang++")
    parser.add_argument("--cuda-home", default="/soft/compilers/cudatoolkit/cuda-11.8.0")
    parser.add_argument("--cuda-arch", default="sm_80")
    parser.add_argument("--out-root", default="HeCBench/results/llvm17_sites")
    parser.add_argument("--bench", action="append", default=[], help="Limit to specific benchmark(s)")
    args = parser.parse_args()

    repo_root = os.getcwd()
    out_root = os.path.join(repo_root, args.out_root)
    os.makedirs(out_root, exist_ok=True)

    summary_path = os.path.join(out_root, "summary.csv")
    with open(summary_path, "w", encoding="utf-8") as summary:
        summary.write("benchmark,total_sites,files_ok,files_failed\n")

        benches = GOLDEN_BENCHES
        if args.bench:
            benches = {k: v for k, v in GOLDEN_BENCHES.items() if k in args.bench}
            missing = [b for b in args.bench if b not in GOLDEN_BENCHES]
            if missing:
                print(f"Unknown benchmarks: {', '.join(missing)}")

        for bench, rel_dir in benches.items():
            src_dir = os.path.join(repo_root, rel_dir)
            bench_out = os.path.join(out_root, bench)
            os.makedirs(bench_out, exist_ok=True)

            cu_files = discover_cu_files(src_dir)
            files_ok = 0
            files_failed = 0
            all_sites: List[Site] = []

            error_log = os.path.join(bench_out, "compile_errors.txt")
            if os.path.exists(error_log):
                os.remove(error_log)

            for cu in cu_files:
                rel = os.path.relpath(cu, src_dir)
                ll_path = os.path.join(bench_out, rel + ".ll")
                os.makedirs(os.path.dirname(ll_path), exist_ok=True)

                include_dirs = [os.path.dirname(cu), src_dir, os.path.join(repo_root, "HeCBench", "src")]
                code, output = compile_to_ir(args.clang, args.cuda_home, args.cuda_arch, cu, ll_path, include_dirs)
                if code != 0:
                    files_failed += 1
                    with open(error_log, "a", encoding="utf-8") as err:
                        err.write(f"[{cu}] clang++ failed (code {code})\n")
                        err.write(output)
                        err.write("\n")
                    continue

                files_ok += 1
                all_sites.extend(parse_ir(ll_path))

            write_sites_csv(os.path.join(bench_out, "sites.csv"), all_sites)
            summary.write(f"{bench},{len(all_sites)},{files_ok},{files_failed}\n")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
