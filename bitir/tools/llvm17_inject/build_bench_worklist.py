#!/usr/bin/env python3
import argparse
import csv
import fnmatch
import os
import random
import shutil
import subprocess

from worklist_exclusions import load_excluded_pairs


def run_cmd(cmd, env=None, shell=False):
    proc = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, env=env, shell=shell)
    out = proc.stdout.decode("utf-8", errors="replace") if proc.stdout else ""
    return proc.returncode, out


def resolve_results_path(repo_root, results_dir, value, default_name):
    if not value:
        return os.path.join(results_dir, default_name)
    if os.path.isabs(value):
        return value
    if value.startswith("bitir/"):
        return os.path.join(repo_root, value)
    return os.path.join(results_dir, value)


def source_file(source_dir, pattern):
    if not pattern:
        return ""
    if any(char in pattern for char in "*?["):
        matches = []
        for root, _, files in os.walk(source_dir):
            for name in files:
                rel = os.path.relpath(os.path.join(root, name), source_dir)
                if fnmatch.fnmatch(rel, pattern):
                    matches.append(os.path.join(source_dir, rel))
        return sorted(matches)[0] if matches else ""
    return os.path.join(source_dir, pattern)


def find_opt(repo_root, bitir_root, configured_opt, llvm_search_root):
    candidates = []
    if configured_opt:
        candidates.append(configured_opt)
        if not os.path.isabs(configured_opt):
            candidates.append(os.path.join(repo_root, configured_opt))
    candidates.append(os.path.join(bitir_root, "tools/llvm17_inject/llvm/build/bin/opt"))
    for candidate in candidates:
        if candidate and os.path.isfile(candidate) and os.access(candidate, os.X_OK):
            return candidate
    found = shutil.which("opt")
    if found:
        return found
    for path_dir in os.environ.get("PATH", "").split(os.pathsep):
        if not path_dir or not os.path.isdir(path_dir):
            continue
        names = sorted(
            [name for name in os.listdir(path_dir) if name == "opt" or name.startswith("opt-")]
        )
        for name in reversed(names):
            candidate = os.path.join(path_dir, name)
            if os.access(candidate, os.X_OK):
                return candidate
    if llvm_search_root and os.path.isdir(llvm_search_root):
        for root, _, files in os.walk(llvm_search_root):
            names = sorted([name for name in files if name == "opt" or name.startswith("opt-")])
            for name in reversed(names):
                candidate = os.path.join(root, name)
                if os.access(candidate, os.X_OK):
                    return candidate
    return configured_opt


def csv_set(value):
    return {item.strip().lower() for item in value.replace(";", ",").split(",") if item.strip()}


def site_allowed(kind, opcode, allowed_kinds, allowed_opcodes):
    if allowed_kinds and kind.lower() not in allowed_kinds:
        return False
    if allowed_opcodes and opcode.lower() not in allowed_opcodes:
        return False
    return True


def select_rows(rows, random_sample, random_seed):
    if random_sample <= 0:
        return rows
    selected = list(rows)
    random.Random(random_seed).shuffle(selected)
    return selected[:random_sample]


def write_legacy_worklist(
    worklist_path,
    sites_path,
    target,
    int_float_only,
    excluded_pairs,
    allowed_kinds,
    allowed_opcodes,
    random_sample,
    random_seed,
):
    rows = []
    skipped = 0
    with open(sites_path, "r", encoding="utf-8") as fh:
        next(fh, None)
        for line in fh:
            parts = line.strip().split(",")
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
            if bitwidth <= 0 or not site_allowed(kind, opcode, allowed_kinds, allowed_opcodes):
                continue
            for bit in range(bitwidth):
                if (site_id, str(bit)) in excluded_pairs:
                    skipped += 1
                    continue
                rows.append((site_id, bit, bitwidth, kind, opcode))
    rows = select_rows(rows, random_sample, random_seed)
    with open(worklist_path, "w", encoding="utf-8") as wl:
        wl.write("index,site_id,bit_index,bitwidth,type_kind,opcode\n")
        for index, (site_id, bit, bitwidth, kind, opcode) in enumerate(rows, start=1):
            wl.write(f"{index},{site_id},{bit},{bitwidth},{kind},{opcode}\n")
    return len(rows), skipped


def write_rich_worklist(
    worklist_path,
    sites_path,
    target,
    int_float_only,
    excluded_pairs,
    allowed_kinds,
    allowed_opcodes,
    random_sample,
    random_seed,
):
    rows = []
    skipped = 0
    with open(sites_path, "r", encoding="utf-8", newline="") as fh:
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
                if site_class == "pointer" and kind != "ptr":
                    continue
                if site_class in ("result", "operand") and kind not in ("int", "float"):
                    continue
                if site_class not in ("result", "operand", "pointer"):
                    continue
            if target != "all" and int_float_only and kind not in ("int", "float") and site_class != "pointer":
                continue
            if not site_allowed(kind, opcode, allowed_kinds, allowed_opcodes):
                continue
            for bit in range(bitwidth):
                if (site_id, str(bit)) in excluded_pairs:
                    skipped += 1
                    continue
                rows.append((site_id, bit, bitwidth, kind, opcode, site_class, operand_index))
    rows = select_rows(rows, random_sample, random_seed)
    with open(worklist_path, "w", encoding="utf-8") as wl:
        wl.write("index,site_id,bit_index,bitwidth,type_kind,opcode,site_class,operand_index\n")
        for index, (site_id, bit, bitwidth, kind, opcode, site_class, operand_index) in enumerate(rows, start=1):
            wl.write(f"{index},{site_id},{bit},{bitwidth},{kind},{opcode},{site_class},{operand_index}\n")
    return len(rows), skipped


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--bench", required=True)
    parser.add_argument("--source-dir", default=os.environ.get("BITIR_SOURCE_DIR", ""))
    parser.add_argument("--source-file", default=os.environ.get("BITIR_MACHINE_SOURCE_FILE", ""))
    parser.add_argument("--opt", default=os.environ.get("BITIR_MACHINE_OPT_BIN", os.environ.get("OPT_BIN", "")))
    parser.add_argument("--out-dir", default="bitir/build/llvm17-inject-bench-worklist")
    parser.add_argument("--target", choices=["result", "operand", "pointer", "all"], default="result")
    parser.add_argument("--int-float-only", type=int, choices=[0, 1], default=1)
    parser.add_argument("--include-constants", type=int, choices=[0, 1], default=0)
    parser.add_argument("--type-kind", default="")
    parser.add_argument("--opcode", default="")
    parser.add_argument("--random-sample", type=int, default=0)
    parser.add_argument("--random-seed", type=int, default=1)
    parser.add_argument("--worklist", default="")
    parser.add_argument("--sites", default="")
    parser.add_argument("--sites-rich", default="")
    parser.add_argument("--metadata-only", action="store_true")
    parser.add_argument("--exclude-summary", action="append", default=[])
    parser.add_argument("--exclude-git-ref", action="append", default=[])
    args = parser.parse_args()

    repo_root = os.getcwd()
    bitir_root = os.environ.get("BITIR_ROOT", os.path.join(repo_root, "bitir"))
    benchmark_root = os.environ.get("BITIR_BENCHMARK_ROOT", repo_root)
    if not args.source_dir:
        print("missing source dir")
        return 2
    if not args.source_file:
        print("missing machine source file pattern")
        return 2
    if os.path.isabs(args.source_dir):
        source_dir = args.source_dir
    elif args.source_dir.startswith("bitir/"):
        source_dir = os.path.join(repo_root, args.source_dir)
    else:
        source_dir = os.path.join(benchmark_root, args.source_dir)
    src = source_file(source_dir, args.source_file)
    if not src or not os.path.isfile(src):
        print(f"missing source: {src}")
        return 2

    llvm_search_root = os.environ.get("BITIR_MACHINE_LLVM_SEARCH_ROOT", "")
    opt_bin = find_opt(repo_root, bitir_root, args.opt, llvm_search_root)
    if not opt_bin or not os.path.isfile(opt_bin):
        print(f"missing opt: {args.opt or 'not found'}")
        return 2

    out_dir = os.path.join(repo_root, args.out_dir, args.bench)
    os.makedirs(out_dir, exist_ok=True)
    results_root = os.environ.get("BITIR_MACHINE_RESULTS_ROOT", "bitir/results/llvm17_inject")
    results_dir = os.path.join(repo_root, results_root, args.bench)
    os.makedirs(results_dir, exist_ok=True)

    ir_bc = os.path.join(out_dir, "device.bc")
    ir_ll = os.path.join(out_dir, "device.ll")
    env = os.environ.copy()
    env.update(
        {
            "REPO_ROOT": repo_root,
            "BITIR_ROOT": bitir_root,
            "BITIR_BENCHMARK_ROOT": benchmark_root,
            "SRC_DIR": source_dir,
            "SRC": src,
            "OUT_DIR": out_dir,
            "IR_BC": ir_bc,
            "IR_LL": ir_ll,
        }
    )

    build_ir = os.environ.get("BITIR_MACHINE_WORKLIST_BUILD_IR", "")
    if not build_ir:
        print("missing machine worklist build command")
        return 2
    code, out = run_cmd(build_ir, env=env, shell=True)
    if code != 0:
        print(out)
        return code
    if not os.path.isfile(ir_bc):
        print(f"missing generated bitcode: {ir_bc}")
        return 2

    plugin = os.path.join(bitir_root, "tools/llvm17_inject/libfi_inject.so")
    suffix = "" if args.target in ("result", "all") else f"_{args.target}"
    format_name = os.environ.get("BITIR_MACHINE_WORKLIST_FORMAT", "rich").strip().lower()
    sites_path = resolve_results_path(repo_root, results_dir, args.sites, f"sites{suffix}.csv")
    sites_rich_path = resolve_results_path(repo_root, results_dir, args.sites_rich, f"sites{suffix}_metadata.csv")
    if os.path.exists(sites_path):
        os.remove(sites_path)
    if os.path.exists(sites_rich_path):
        os.remove(sites_rich_path)

    dump_rich = sites_rich_path if format_name == "rich" else ""
    cmd = [
        opt_bin,
        "-load-pass-plugin", plugin,
        "-passes=fi-inject",
        "-fi-site=-1",
        f"-fi-target={args.target}",
        f"-fi-int-float-only={args.int_float_only}",
        f"-fi-include-constants={args.include_constants}",
        "-fi-dump-sites=" + sites_path,
    ]
    if dump_rich:
        cmd.append("-fi-dump-sites-rich=" + dump_rich)
    cmd.extend([ir_bc, "-o", os.path.join(out_dir, "device.dump.bc")])
    code, out = run_cmd(cmd)
    if code != 0:
        print(out)
        return code

    if args.metadata_only:
        print(f"Wrote site metadata to {dump_rich or sites_path}")
        return 0

    excluded_pairs, exclusion_sources = load_excluded_pairs(
        repo_root,
        args.bench,
        args.target,
        summary_paths=args.exclude_summary,
        git_refs=args.exclude_git_ref,
    )
    worklist_path = resolve_results_path(repo_root, results_dir, args.worklist, f"worklist{suffix}.csv")
    allowed_kinds = csv_set(args.type_kind)
    allowed_opcodes = csv_set(args.opcode)
    if format_name == "rich":
        count, skipped = write_rich_worklist(
            worklist_path,
            sites_rich_path,
            args.target,
            args.int_float_only,
            excluded_pairs,
            allowed_kinds,
            allowed_opcodes,
            args.random_sample,
            args.random_seed,
        )
    else:
        count, skipped = write_legacy_worklist(
            worklist_path,
            sites_path,
            args.target,
            args.int_float_only,
            excluded_pairs,
            allowed_kinds,
            allowed_opcodes,
            args.random_sample,
            args.random_seed,
        )

    message = f"Wrote {count} candidate injections to {worklist_path}"
    if exclusion_sources:
        message += f" (excluded {skipped} site-bit pairs from {len(exclusion_sources)} summary source(s))"
    print(message)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
