#!/usr/bin/env python3
import glob
import os
import re
import shutil
import time


def main():
    pattern = re.compile(r"invalid ELF header|file too short", re.I)
    now = time.strftime("%Y%m%d_%H%M%S")
    qroot = os.path.join("HeCBench", "results", "quarantine_plugin_error", now)
    os.makedirs(qroot, exist_ok=True)

    err_files = sorted(glob.glob("ERROR_*fi_*.err"))
    quarantined = []
    removed = []

    for err in err_files:
        try:
            with open(err, "r", errors="ignore") as fh:
                data = fh.read()
        except Exception:
            continue
        if not pattern.search(data):
            continue

        base = os.path.basename(err)
        bench = base
        kind = None
        if base.startswith("ERROR_"):
            bench = base[len("ERROR_") :]
        if bench.endswith("_fi_inject.err"):
            bench = bench[: -len("_fi_inject.err")]
            kind = "float"
        elif bench.endswith("_fi_operand.err"):
            bench = bench[: -len("_fi_operand.err")]
            kind = "operand"
        else:
            kind = "unknown"

        cand_dirs = []
        if kind in ("float", "operand"):
            cand_dirs.append(
                os.path.join("HeCBench", "results", "llvm17_inject", bench, kind)
            )
        cand_dirs.append(os.path.join("HeCBench", "results", "llvm17_inject", bench))

        results_dir = None
        for d in cand_dirs:
            if os.path.isdir(d):
                results_dir = d
                break

        count = 0
        if results_dir:
            count = len(glob.glob(os.path.join(results_dir, "site*_bit*.out")))

        if count > 5:
            qdir = os.path.join(qroot, bench, kind)
            os.makedirs(qdir, exist_ok=True)
            if results_dir:
                for f in glob.glob(os.path.join(results_dir, "site*_bit*.out")):
                    shutil.move(f, os.path.join(qdir, os.path.basename(f)))
                for f in glob.glob(os.path.join(results_dir, "summary_node*_gpu*.csv")):
                    shutil.move(f, os.path.join(qdir, os.path.basename(f)))
            for f in glob.glob(f"OUT_{bench}_fi_*.out") + [err]:
                if os.path.exists(f):
                    shutil.move(f, os.path.join(qdir, os.path.basename(f)))
            quarantined.append((bench, kind, count))
        else:
            if results_dir:
                for f in glob.glob(os.path.join(results_dir, "site*_bit*.out")):
                    os.remove(f)
                for f in glob.glob(os.path.join(results_dir, "summary_node*_gpu*.csv")):
                    os.remove(f)
            for f in glob.glob(f"OUT_{bench}_fi_*.out") + [err]:
                if os.path.exists(f):
                    os.remove(f)
            removed.append((bench, kind, count))

    print("quarantined:", quarantined)
    print("removed:", removed)
    print("quarantine_dir:", qroot)


if __name__ == "__main__":
    main()
