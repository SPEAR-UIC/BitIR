#!/usr/bin/env python3
import argparse
import csv
import math
import os
import statistics
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


def parse_float(v):
    try:
        return float(v)
    except Exception:
        return None


def quantile(vals, q):
    if not vals:
        return 0.0
    if len(vals) == 1:
        return vals[0]
    s = sorted(vals)
    pos = q * (len(s) - 1)
    lo = int(math.floor(pos))
    hi = int(math.ceil(pos))
    if lo == hi:
        return s[lo]
    t = pos - lo
    return s[lo] * (1.0 - t) + s[hi] * t


def collect(root):
    data = defaultdict(lambda: defaultdict(lambda: defaultdict(list)))
    counts = defaultdict(lambda: defaultdict(int))
    for b in BENCHES:
        for p in PHASES:
            path = os.path.join(root, b, p, "summary.csv")
            if not os.path.exists(path):
                continue
            with open(path, newline="") as f:
                r = csv.DictReader(f)
                for row in r:
                    res = (row.get("result", "") or "").upper()
                    if not res.startswith("SDC"):
                        continue
                    counts[b][p] += 1
                    for m in ("metric_abs_max", "metric_rmse", "metric_max_rel", "metric_max_ulp"):
                        v = parse_float(row.get(m, ""))
                        if v is not None and math.isfinite(v):
                            data[b][p][m].append(v)
    return data, counts


def write_summary_csv(data, counts, out_csv):
    with open(out_csv, "w", newline="") as f:
        w = csv.writer(f)
        w.writerow(
            [
                "benchmark",
                "phase",
                "sdc_count",
                "abs_max_median",
                "abs_max_p95",
                "rmse_median",
                "rmse_p95",
                "max_rel_median",
                "max_rel_p95",
                "max_ulp_median",
                "max_ulp_p95",
            ]
        )
        for b in BENCHES:
            for p in PHASES:
                c = counts[b][p]
                vals = data[b][p]
                am = sorted(vals["metric_abs_max"])
                rm = sorted(vals["metric_rmse"])
                mr = sorted(vals["metric_max_rel"])
                mu = sorted(vals["metric_max_ulp"])
                w.writerow(
                    [
                        b,
                        p,
                        c,
                        quantile(am, 0.5),
                        quantile(am, 0.95),
                        quantile(rm, 0.5),
                        quantile(rm, 0.95),
                        quantile(mr, 0.5),
                        quantile(mr, 0.95),
                        quantile(mu, 0.5),
                        quantile(mu, 0.95),
                    ]
                )


def quote_labels(labels):
    return ", ".join([f'"{lab}" {i + 1}' for i, lab in enumerate(labels)])


def write_heatmap_dat(summary_csv, metric_col, out_dat):
    rows = []
    with open(summary_csv, newline="") as f:
        r = csv.DictReader(f)
        rows = list(r)
    with open(out_dat, "w") as f:
        for yi, b in enumerate(BENCHES, start=1):
            for xi, p in enumerate(PHASES, start=1):
                match = [row for row in rows if row["benchmark"] == b and row["phase"] == p]
                z = float(match[0][metric_col]) if match else 0.0
                z = math.log10(max(1e-16, z))
                f.write(f"{xi} {yi} {z:.8f}\n")


def plot_heatmap(dat, png, title, cblabel):
    script = f"""
set terminal pngcairo size 1500,900
set output '{png}'
set view map
unset key
set xrange [0.5:{len(PHASES)+0.5}]
set yrange [0.5:{len(BENCHES)+0.5}]
set xtics ({quote_labels(PHASES)}) font ',12'
set ytics ({quote_labels(BENCHES)}) font ',12'
set title '{title}' font ',20'
set xlabel 'Injection phase' font ',16'
set ylabel 'Benchmark' font ',16'
set cblabel '{cblabel}' font ',14'
set palette defined (0 '#f7fbff', 0.2 '#c6dbef', 0.4 '#6baed6', 0.6 '#fdd0a2', 0.8 '#f16913', 1 '#a63603')
plot '{dat}' using 1:2:3 with image pixels
"""
    subprocess.run(["gnuplot"], input=script.encode("utf-8"), check=True)


def write_count_cluster_dat(summary_csv, out_dat):
    rows = []
    with open(summary_csv, newline="") as f:
        r = csv.DictReader(f)
        rows = list(r)
    with open(out_dat, "w") as f:
        f.write("bench float operand pointer\n")
        for b in BENCHES:
            vals = []
            for p in PHASES:
                match = [row for row in rows if row["benchmark"] == b and row["phase"] == p]
                vals.append(float(match[0]["sdc_count"]) if match else 0.0)
            f.write(f"{b} {vals[0]:.0f} {vals[1]:.0f} {vals[2]:.0f}\n")


def plot_count_cluster(dat, png):
    script = f"""
set terminal pngcairo size 1700,900
set output '{png}'
set style data histogram
set style histogram clustered gap 1
set style fill solid 1.0 border -1
set boxwidth 0.85
set key outside right top
set title 'SDC Count by Benchmark and Phase' font ',20'
set xlabel 'Benchmark' font ',16'
set ylabel 'Number of SDC rows with metrics' font ',16'
set xtics rotate by -25 font ',12'
plot '{dat}' using 2:xtic(1) title 'float' lc rgb '#4E79A7', \\
     '' using 3 title 'operand' lc rgb '#F28E2B', \\
     '' using 4 title 'pointer' lc rgb '#59A14F'
"""
    subprocess.run(["gnuplot"], input=script.encode("utf-8"), check=True)


def main():
    p = argparse.ArgumentParser()
    p.add_argument("--root", default="HeCBench/results/llvm17_inject")
    p.add_argument("--out-dir", default="HeCBench/results/llvm17_inject/visualizations")
    args = p.parse_args()

    os.makedirs(args.out_dir, exist_ok=True)
    data, counts = collect(args.root)
    summary_csv = os.path.join(args.out_dir, "sdc_severity_summary.csv")
    write_summary_csv(data, counts, summary_csv)

    hm1 = os.path.join(args.out_dir, "sdc_rmse_p95_heatmap_log10.dat")
    write_heatmap_dat(summary_csv, "rmse_p95", hm1)
    plot_heatmap(
        hm1,
        os.path.join(args.out_dir, "sdc_rmse_p95_heatmap_log10.png"),
        "SDC Severity: log10(P95 RMSE) by Benchmark and Phase",
        "log10(P95 RMSE)",
    )

    hm2 = os.path.join(args.out_dir, "sdc_absmax_p95_heatmap_log10.dat")
    write_heatmap_dat(summary_csv, "abs_max_p95", hm2)
    plot_heatmap(
        hm2,
        os.path.join(args.out_dir, "sdc_absmax_p95_heatmap_log10.png"),
        "SDC Severity: log10(P95 Absolute Difference) by Benchmark and Phase",
        "log10(P95 abs diff)",
    )

    cnt_dat = os.path.join(args.out_dir, "sdc_count_cluster.dat")
    write_count_cluster_dat(summary_csv, cnt_dat)
    plot_count_cluster(cnt_dat, os.path.join(args.out_dir, "sdc_count_cluster.png"))

    print("Wrote:", summary_csv)
    print("Wrote SDC severity visuals to:", args.out_dir)


if __name__ == "__main__":
    main()
