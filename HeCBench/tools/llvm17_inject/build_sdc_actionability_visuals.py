#!/usr/bin/env python3
import argparse
import csv
import io
import math
import os
import subprocess
from collections import defaultdict


BENCHES = [
    "colorwheel",
    "dense-embedding",
    "entropy",
    "jacobi",
    "layout",
    "matrix-rotate",
    "pathfinder",
    "randomAccess",
]
PHASES = ["float", "operand", "pointer"]
PHASE_TO_WL = {
    "float": "worklist_sycl_aligned.csv",
    "operand": "worklist_operand_sycl_aligned.csv",
    "pointer": "worklist_pointer_sycl_aligned.csv",
}


def parse_float(x):
    try:
        v = float(x)
    except Exception:
        return None
    if not math.isfinite(v):
        return None
    return v


def quantile(vals, q):
    if not vals:
        return 0.0
    s = sorted(vals)
    if len(s) == 1:
        return s[0]
    pos = q * (len(s) - 1)
    lo = int(math.floor(pos))
    hi = int(math.ceil(pos))
    if lo == hi:
        return s[lo]
    t = pos - lo
    return s[lo] * (1.0 - t) + s[hi] * t


def read_worklist(path):
    if not os.path.exists(path):
        return {}
    with open(path, "rb") as f:
        raw = f.read().replace(b"\x00", b"")
    r = csv.DictReader(io.StringIO(raw.decode("utf-8", errors="replace")))
    out = {}
    for row in r:
        try:
            s = int(row["site_id"])
            b = int(row["bit_index"])
        except Exception:
            continue
        out[(s, b)] = row.get("opcode", "").strip() or "unknown"
    return out


def quote_labels(labels):
    return ", ".join([f'"{lab}" {i + 1}' for i, lab in enumerate(labels)])


def run_gnuplot(script):
    subprocess.run(["gnuplot"], input=script.encode("utf-8"), check=True)


def build_tables(root):
    # group stats
    bp = defaultdict(lambda: {"total": 0, "sdc": 0, "due": 0, "rmse": []})
    bpo = defaultdict(lambda: {"total": 0, "sdc": 0, "due": 0, "rmse": []})

    for bench in BENCHES:
        for phase in PHASES:
            wl_path = os.path.join(root, f"{bench}-sycl", PHASE_TO_WL[phase])
            opcode_map = read_worklist(wl_path)
            summary = os.path.join(root, bench, phase, "summary.csv")
            if not os.path.exists(summary):
                continue
            with open(summary, newline="") as f:
                r = csv.DictReader(f)
                for row in r:
                    try:
                        s = int(row["site_id"])
                        b = int(row["bit_index"])
                    except Exception:
                        continue
                    res = (row.get("result", "") or "").upper().strip()
                    opcode = opcode_map.get((s, b), "unknown")

                    k1 = (bench, phase)
                    k2 = (bench, phase, opcode)
                    bp[k1]["total"] += 1
                    bpo[k2]["total"] += 1

                    if res.startswith("DUE"):
                        bp[k1]["due"] += 1
                        bpo[k2]["due"] += 1
                    if res.startswith("SDC"):
                        bp[k1]["sdc"] += 1
                        bpo[k2]["sdc"] += 1
                        rmse = parse_float(row.get("metric_rmse", ""))
                        if rmse is not None:
                            bp[k1]["rmse"].append(rmse)
                            bpo[k2]["rmse"].append(rmse)
    return bp, bpo


def summarize_group(rows):
    out = []
    for key, v in rows.items():
        total = v["total"]
        sdc = v["sdc"]
        due = v["due"]
        sdc_rate = sdc / total if total else 0.0
        due_rate = due / total if total else 0.0
        rm = sorted(v["rmse"])
        p50 = quantile(rm, 0.50)
        p95 = quantile(rm, 0.95)
        p99 = quantile(rm, 0.99)
        tail = p99 / max(p50, 1e-16) if rm else 0.0
        out.append(
            {
                "key": key,
                "total": total,
                "sdc": sdc,
                "due": due,
                "sdc_rate": sdc_rate,
                "due_rate": due_rate,
                "rmse_p50": p50,
                "rmse_p95": p95,
                "rmse_p99": p99,
                "rmse_tail_ratio": tail,
            }
        )
    return out


def percentile_rank(values, x):
    if not values:
        return 0.0
    n = len(values)
    le = sum(1 for v in values if v <= x)
    return le / n


def add_action_score(rows):
    rate_vals = [r["sdc_rate"] for r in rows]
    sev_vals = [math.log10(max(r["rmse_p95"], 1e-16)) for r in rows]
    tail_vals = [math.log10(max(r["rmse_tail_ratio"], 1e-16)) for r in rows]
    for r in rows:
        rr = percentile_rank(rate_vals, r["sdc_rate"])
        rs = percentile_rank(sev_vals, math.log10(max(r["rmse_p95"], 1e-16)))
        rt = percentile_rank(tail_vals, math.log10(max(r["rmse_tail_ratio"], 1e-16)))
        score = 0.45 * rr + 0.35 * rs + 0.20 * rt
        r["action_score"] = score
        if score < 0.25:
            tier = "minimal"
        elif score < 0.50:
            tier = "watch"
        elif score < 0.75:
            tier = "guard"
        else:
            tier = "critical"
        r["action_tier"] = tier


def write_bp_csv(rows, out_csv):
    with open(out_csv, "w", newline="") as f:
        w = csv.writer(f)
        w.writerow(
            [
                "benchmark",
                "phase",
                "total",
                "sdc",
                "due",
                "sdc_rate",
                "due_rate",
                "rmse_p50",
                "rmse_p95",
                "rmse_p99",
                "rmse_tail_ratio",
                "action_score",
                "action_tier",
            ]
        )
        for r in sorted(rows, key=lambda x: (x["key"][0], x["key"][1])):
            b, p = r["key"]
            w.writerow(
                [
                    b,
                    p,
                    r["total"],
                    r["sdc"],
                    r["due"],
                    r["sdc_rate"],
                    r["due_rate"],
                    r["rmse_p50"],
                    r["rmse_p95"],
                    r["rmse_p99"],
                    r["rmse_tail_ratio"],
                    r["action_score"],
                    r["action_tier"],
                ]
            )


def write_bpo_csv(rows, out_csv, top_n=80):
    rows_sorted = sorted(rows, key=lambda x: x["total"], reverse=True)[:top_n]
    with open(out_csv, "w", newline="") as f:
        w = csv.writer(f)
        w.writerow(
            [
                "benchmark",
                "phase",
                "opcode",
                "total",
                "sdc",
                "due",
                "sdc_rate",
                "due_rate",
                "rmse_p95",
                "rmse_tail_ratio",
                "action_score",
                "action_tier",
            ]
        )
        for r in rows_sorted:
            b, p, o = r["key"]
            w.writerow(
                [
                    b,
                    p,
                    o,
                    r["total"],
                    r["sdc"],
                    r["due"],
                    r["sdc_rate"],
                    r["due_rate"],
                    r["rmse_p95"],
                    r["rmse_tail_ratio"],
                    r["action_score"],
                    r["action_tier"],
                ]
            )


def build_bp_plots(rows, out_dir):
    # scatter: x=sdc_rate, y=log10(rmse_p95), point size by sdc count, color by phase
    scat_dat = os.path.join(out_dir, "sdc_actionability_scatter_bp.dat")
    phase_color = {"float": "#4E79A7", "operand": "#F28E2B", "pointer": "#59A14F"}
    with open(scat_dat, "w") as f:
        f.write("bench phase x y ps color label\n")
        for r in sorted(rows, key=lambda x: x["key"]):
            b, p = r["key"]
            ps = 0.8 + 2.8 * (math.sqrt(r["sdc"] / max(1.0, r["total"])))
            y = math.log10(max(r["rmse_p95"], 1e-16))
            f.write(
                f"{b} {p} {r['sdc_rate']:.8f} {y:.8f} {ps:.4f} {phase_color[p]} {b}:{p}\n"
            )
    scat_png = os.path.join(out_dir, "sdc_actionability_scatter_bp.png")
    script = f"""
set terminal pngcairo size 1800,1000
set output '{scat_png}'
set title 'SDC Actionability Map (benchmark:phase)' font ',20'
set xlabel 'SDC rate (fraction of injections)' font ',16'
set ylabel 'log10(P95 RMSE among SDCs)' font ',16'
set xrange [0:1]
set grid lc rgb '#dddddd'
set key outside right top
plot '{scat_dat}' using 3:4:5 with points pt 7 ps variable lc rgb '#888888' title 'benchmark:phase', \\
     '' using 3:4:7 with labels offset char 0.8,0.6 font ',9' tc rgb '#222222' notitle
"""
    run_gnuplot(script)

    # heatmap: action score by bench x phase
    hm_dat = os.path.join(out_dir, "sdc_actionability_heatmap_bp.dat")
    with open(hm_dat, "w") as f:
        for yi, b in enumerate(BENCHES, start=1):
            for xi, p in enumerate(PHASES, start=1):
                match = [r for r in rows if r["key"] == (b, p)]
                z = match[0]["action_score"] if match else 0.0
                f.write(f"{xi} {yi} {z:.8f}\n")
    hm_png = os.path.join(out_dir, "sdc_actionability_heatmap_bp.png")
    script = f"""
set terminal pngcairo size 1500,900
set output '{hm_png}'
set view map
unset key
set xrange [0.5:{len(PHASES)+0.5}]
set yrange [0.5:{len(BENCHES)+0.5}]
set xtics ({quote_labels(PHASES)}) font ',12'
set ytics ({quote_labels(BENCHES)}) font ',12'
set title 'Actionability Score Heatmap (frequency + severity + volatility)' font ',20'
set xlabel 'Injection phase' font ',16'
set ylabel 'Benchmark' font ',16'
set cblabel 'Actionability score (relative percentile blend)' font ',14'
set cbrange [0:1]
set palette defined (0 '#2c7bb6', 0.25 '#abd9e9', 0.5 '#ffffbf', 0.75 '#fdae61', 1 '#d7191c')
plot '{hm_dat}' using 1:2:3 with image pixels
"""
    run_gnuplot(script)

    # volatility heatmap: log10 tail ratio p99/p50
    vol_dat = os.path.join(out_dir, "sdc_volatility_heatmap_bp.dat")
    with open(vol_dat, "w") as f:
        for yi, b in enumerate(BENCHES, start=1):
            for xi, p in enumerate(PHASES, start=1):
                match = [r for r in rows if r["key"] == (b, p)]
                z = math.log10(max(match[0]["rmse_tail_ratio"], 1e-16)) if match else -16.0
                f.write(f"{xi} {yi} {z:.8f}\n")
    vol_png = os.path.join(out_dir, "sdc_volatility_heatmap_bp.png")
    script = f"""
set terminal pngcairo size 1500,900
set output '{vol_png}'
set view map
unset key
set xrange [0.5:{len(PHASES)+0.5}]
set yrange [0.5:{len(BENCHES)+0.5}]
set xtics ({quote_labels(PHASES)}) font ',12'
set ytics ({quote_labels(BENCHES)}) font ',12'
set title 'SDC Volatility Heatmap: log10(P99/P50 RMSE)' font ',20'
set xlabel 'Injection phase' font ',16'
set ylabel 'Benchmark' font ',16'
set cblabel 'log10(P99/P50 RMSE)' font ',14'
set palette defined (0 '#f7fbff', 0.3 '#c6dbef', 0.6 '#6baed6', 0.8 '#fd8d3c', 1 '#d7301f')
plot '{vol_dat}' using 1:2:3 with image pixels
"""
    run_gnuplot(script)


def build_opcode_plot(rows, out_dir):
    top = sorted(rows, key=lambda x: x["total"], reverse=True)[:60]
    dat = os.path.join(out_dir, "sdc_actionability_scatter_opcode_top.dat")
    with open(dat, "w") as f:
        f.write("x y ps label\n")
        for r in top:
            b, p, op = r["key"]
            x = r["sdc_rate"]
            y = math.log10(max(r["rmse_p95"], 1e-16))
            ps = 0.6 + 2.2 * math.sqrt(r["total"] / max(1.0, top[0]["total"]))
            f.write(f"{x:.8f} {y:.8f} {ps:.4f} {b}:{p}:{op}\n")
    png = os.path.join(out_dir, "sdc_actionability_scatter_opcode_top.png")
    script = f"""
set terminal pngcairo size 1900,1100
set output '{png}'
set title 'Opcode-Level Actionability (top-60 by injection volume)' font ',20'
set xlabel 'SDC rate within benchmark/phase/opcode group' font ',16'
set ylabel 'log10(P95 RMSE among SDCs)' font ',16'
set xrange [0:1]
set grid lc rgb '#dddddd'
set key off
plot '{dat}' using 1:2:3 with points pt 7 ps variable lc rgb '#F28E2B', \\
     '' using 1:2:4 with labels offset char 0.8,0.6 font ',8' tc rgb '#222222'
"""
    run_gnuplot(script)


def main():
    p = argparse.ArgumentParser()
    p.add_argument("--root", default="HeCBench/results/llvm17_inject")
    p.add_argument("--out-dir", default="HeCBench/results/llvm17_inject/visualizations")
    args = p.parse_args()

    os.makedirs(args.out_dir, exist_ok=True)
    bp_raw, bpo_raw = build_tables(args.root)
    bp = summarize_group(bp_raw)
    bpo = summarize_group(bpo_raw)
    add_action_score(bp)
    add_action_score(bpo)

    bp_csv = os.path.join(args.out_dir, "sdc_actionability_bench_phase.csv")
    bpo_csv = os.path.join(args.out_dir, "sdc_actionability_opcode_top.csv")
    write_bp_csv(bp, bp_csv)
    write_bpo_csv(bpo, bpo_csv, top_n=80)
    build_bp_plots(bp, args.out_dir)
    build_opcode_plot(bpo, args.out_dir)

    print("Wrote:", bp_csv)
    print("Wrote:", bpo_csv)
    print("Wrote SDC actionability visuals to:", args.out_dir)


if __name__ == "__main__":
    main()
