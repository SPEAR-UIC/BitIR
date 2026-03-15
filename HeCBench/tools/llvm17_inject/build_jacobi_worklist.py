#!/usr/bin/env python3
import os
import subprocess
import sys


def main():
    repo_root = os.getcwd()
    script = os.path.join(repo_root, "HeCBench/tools/llvm17_inject/build_bench_worklist.py")
    cmd = [sys.executable, script, "--bench", "jacobi", *sys.argv[1:]]
    return subprocess.call(cmd)


if __name__ == "__main__":
    raise SystemExit(main())
