#!/usr/bin/env python3
import argparse
import csv
import math
import os
import subprocess
from collections import defaultdict
import io
import re


OUTCOMES = [
    ("MASKED:errorDetected", "masked_errorDetected_frac", "#1f77b4"),
    ("MASKED:noError", "masked_noError_frac", "#2ca02c"),
    ("SDC:errorDetected", "sdc_errorDetected_frac", "#ff7f0e"),
    ("SDC:noError", "sdc_noError_frac", "#f1c40f"),
    ("DUE", "due_frac", "#d62728"),
]
PHASES = ("float", "operand", "pointer")
PHASE_COLORS = {"float": "#4E79A7", "operand": "#F28E2B", "pointer": "#59A14F"}
PHASE_TO_WL = {
    "float": "worklist_sycl_aligned.csv",
    "operand": "worklist_operand_sycl_aligned.csv",
    "pointer": "worklist_pointer_sycl_aligned.csv",
}


def read_worklist(path):
    with open(path, "rb") as f:
        raw = f.read().replace(b"\x00", b"")
    r = csv.DictReader(io.StringIO(raw.decode("utf-8", errors="replace")))
    rows = []
    for row in r:
        try:
            rows.append(
                {
                    "site_id": int(row["site_id"]),
                    "bit_index": int(row["bit_index"]),
                    "opcode": (row.get("opcode", "").strip() or "unknown"),
                }
            )
        except Exception:
            continue
    return rows


def classify_out_path(path):
    if not os.path.exists(path) or os.path.getsize(path) == 0:
        return "DUE"
    with open(path, "rb") as f:
        blob = f.read()
    if b"\x00" in blob:
        return "DUE"
    text = blob.decode("utf-8", errors="ignore").lower()
    padded = "\n" + text + "\n"
    pass_marker = ("\npass\n" in padded) or ("locations (pass)." in text)
    fail_marker = ("\nfail\n" in padded) or ("locations (fail)." in text)
    error_flag = "errorDetected" if fail_marker else "noError"
    if "compare_ok" in text or "compare_exact" in text or "result: masked" in text:
        return f"MASKED:{error_flag}"
    if "compare_mismatch" in text or "\nmismatch\n" in padded or "result: sdc" in text:
        return f"SDC:{error_flag}"
    # If there is no explicit compare marker, classify as DUE.
    if pass_marker or fail_marker:
        return "DUE"
    return "DUE"


def read_rows(path):
    rows = []
    with open(path, newline="") as f:
        r = csv.DictReader(f)
        for row in r:
            row["total"] = int(row["total"])
            for _, col, _ in OUTCOMES:
                row[col] = float(row[col])
            rows.append(row)
    return rows


def polar_to_xy(cx, cy, radius, angle):
    return cx + radius * math.cos(angle), cy + radius * math.sin(angle)


def arc_path(cx, cy, r_in, r_out, a0, a1):
    if a1 < a0:
        a0, a1 = a1, a0
    large = 1 if (a1 - a0) > math.pi else 0
    x0o, y0o = polar_to_xy(cx, cy, r_out, a0)
    x1o, y1o = polar_to_xy(cx, cy, r_out, a1)
    x1i, y1i = polar_to_xy(cx, cy, r_in, a1)
    x0i, y0i = polar_to_xy(cx, cy, r_in, a0)
    return (
        f"M {x0o:.2f} {y0o:.2f} "
        f"A {r_out:.2f} {r_out:.2f} 0 {large} 1 {x1o:.2f} {y1o:.2f} "
        f"L {x1i:.2f} {y1i:.2f} "
        f"A {r_in:.2f} {r_in:.2f} 0 {large} 0 {x0i:.2f} {y0i:.2f} Z"
    )


def write_sunburst_svg(rows, out_svg):
    by_bench = defaultdict(list)
    for r in rows:
        by_bench[r["benchmark"]].append(r)
    benches = sorted(by_bench)
    totals = {b: sum(rr["total"] for rr in by_bench[b]) for b in benches}
    grand = sum(totals.values())
    if grand == 0 or not benches:
        return

    width, height = 1400, 1400
    cx, cy = width / 2, height / 2
    r0, r1, r2 = 180, 320, 470

    parts = [
        f'<svg xmlns="http://www.w3.org/2000/svg" width="{width}" height="{height}" viewBox="0 0 {width} {height}">',
        '<rect width="100%" height="100%" fill="white"/>',
        '<text x="700" y="42" text-anchor="middle" font-size="30" font-family="sans-serif">Taxonomy Sunburst</text>',
        '<text x="700" y="75" text-anchor="middle" font-size="16" fill="#333" font-family="sans-serif">benchmark -> phase -> outcome</text>',
    ]

    # Normalize: each benchmark gets identical angular width.
    b_uniform_span = 2.0 * math.pi / len(benches)
    effective_span = b_uniform_span
    start = -math.pi / 2.0
    for b in benches:
        b_span = effective_span
        b_end = start + b_span
        pth = arc_path(cx, cy, 80, r0, start, b_end)
        parts.append(f'<path d="{pth}" fill="#d9d9d9" stroke="white" stroke-width="1"/>')
        mid = (start + b_end) / 2
        lx, ly = polar_to_xy(cx, cy, 130, mid)
        parts.append(
            f'<text x="{lx:.1f}" y="{ly:.1f}" text-anchor="middle" font-size="12" font-family="sans-serif">{b}</text>'
        )

        phase_rows = {p: [rr for rr in by_bench[b] if rr["phase"] == p] for p in PHASES}
        phase_totals = {p: sum(rr["total"] for rr in phase_rows[p]) for p in PHASES}
        p_start = start
        for p in PHASES:
            pt = phase_totals[p]
            if pt <= 0:
                continue
            p_span = b_span * (pt / totals[b])
            p_end = p_start + p_span
            pth = arc_path(cx, cy, r0 + 2, r1, p_start, p_end)
            parts.append(f'<path d="{pth}" fill="{PHASE_COLORS[p]}" stroke="white" stroke-width="1"/>')
            pmid = (p_start + p_end) / 2
            plx, ply = polar_to_xy(cx, cy, (r0 + r1) / 2, pmid)
            parts.append(
                f'<text x="{plx:.1f}" y="{ply:.1f}" text-anchor="middle" font-size="11" fill="white" font-family="sans-serif">{p}</text>'
            )

            o_start = p_start
            agg = defaultdict(float)
            for rr in phase_rows[p]:
                for oc, col, _ in OUTCOMES:
                    agg[oc] += rr["total"] * rr[col]
            for oc, _, color in OUTCOMES:
                v = agg[oc]
                if v <= 0:
                    continue
                o_span = p_span * (v / pt)
                o_end = o_start + o_span
                opth = arc_path(cx, cy, r1 + 2, r2, o_start, o_end)
                parts.append(f'<path d="{opth}" fill="{color}" stroke="white" stroke-width="1"/>')
                o_start = o_end
            p_start = p_end
        start = b_end

    # Strong benchmark boundary dividers that extend across all rings.
    div_start = -math.pi / 2.0
    for i in range(len(benches) + 1):
        ang = div_start + i * b_uniform_span
        x0, y0 = polar_to_xy(cx, cy, 70, ang)
        x1, y1 = polar_to_xy(cx, cy, r2 + 14, ang)
        parts.append(
            f'<line x1="{x0:.2f}" y1="{y0:.2f}" x2="{x1:.2f}" y2="{y1:.2f}" '
            f'stroke="#000" stroke-width="4.6" stroke-linecap="round"/>'
        )

    parts.append('<circle cx="700" cy="700" r="78" fill="white" stroke="#bbb" stroke-width="1"/>')
    parts.append('<text x="700" y="695" text-anchor="middle" font-size="17" font-family="sans-serif">All FI</text>')
    parts.append(f'<text x="700" y="720" text-anchor="middle" font-size="14" fill="#444" font-family="sans-serif">{grand} pairs</text>')

    legend_x = 980
    legend_y = 110
    parts.append('<text x="980" y="85" font-size="16" font-family="sans-serif">Outcome Legend</text>')
    for i, (oc, _, color) in enumerate(OUTCOMES):
        y = legend_y + i * 28
        parts.append(f'<rect x="{legend_x}" y="{y}" width="18" height="18" fill="{color}" stroke="#777" stroke-width="0.5"/>')
        parts.append(f'<text x="{legend_x+26}" y="{y+14}" font-size="13" font-family="sans-serif">{oc}</text>')

    parts.append("</svg>")
    with open(out_svg, "w") as f:
        f.write("\n".join(parts))


def collect_records(root):
    benches = [
        "colorwheel",
        "dense-embedding",
        "entropy",
        "jacobi",
        "layout",
        "matrix-rotate",
        "pathfinder",
        "randomAccess",
    ]
    records = []
    for bench in benches:
        for phase in PHASES:
            wl = os.path.join(root, f"{bench}-sycl", PHASE_TO_WL[phase])
            out_dir = os.path.join(root, bench, phase)
            if not os.path.exists(wl) or not os.path.isdir(out_dir):
                continue
            for row in read_worklist(wl):
                outp = os.path.join(out_dir, f"site{row['site_id']}_bit{row['bit_index']}.out")
                records.append(
                    {
                        "benchmark": bench,
                        "phase": phase,
                        "opcode": row["opcode"],
                        "outcome": classify_out_path(outp),
                    }
                )
    return records


def write_sunburst_opcode_svg(records, out_svg, top_n_opcode=10):
    by_bench = defaultdict(list)
    for r in records:
        by_bench[r["benchmark"]].append(r)
    benches = sorted(by_bench)
    if not benches:
        return

    # Choose top opcodes globally; merge others into "other".
    op_totals = defaultdict(int)
    for r in records:
        op_totals[r["opcode"]] += 1
    top_ops = [op for op, _ in sorted(op_totals.items(), key=lambda x: x[1], reverse=True)[:top_n_opcode]]
    top_set = set(top_ops)

    width, height = 1400, 1400
    cx, cy = width / 2, height / 2
    r0, r1, r2 = 180, 320, 470
    parts = [
        f'<svg xmlns="http://www.w3.org/2000/svg" width="{width}" height="{height}" viewBox="0 0 {width} {height}">',
        '<rect width="100%" height="100%" fill="white"/>',
        '<text x="700" y="42" text-anchor="middle" font-size="30" font-family="sans-serif">Taxonomy Sunburst</text>',
        '<text x="700" y="75" text-anchor="middle" font-size="16" fill="#333" font-family="sans-serif">benchmark -> opcode -> outcome</text>',
    ]
    b_uniform_span = 2.0 * math.pi / len(benches)
    effective_span = b_uniform_span
    start = -math.pi / 2.0
    op_palette = [
        "#4E79A7",
        "#A0CBE8",
        "#F28E2B",
        "#FFBE7D",
        "#59A14F",
        "#8CD17D",
        "#B6992D",
        "#F1CE63",
        "#499894",
        "#86BCB6",
        "#79706E",
    ]
    op_color = {op: op_palette[i % len(op_palette)] for i, op in enumerate(top_ops)}
    op_color["other"] = "#9d9d9d"
    oc_cols = {oc: c for oc, _, c in OUTCOMES}

    for b in benches:
        b_rows = by_bench[b]
        b_total = len(b_rows)
        b_end = start + effective_span
        parts.append(f'<path d="{arc_path(cx, cy, 80, r0, start, b_end)}" fill="#d9d9d9" stroke="white" stroke-width="1"/>')
        mid = (start + b_end) / 2
        lx, ly = polar_to_xy(cx, cy, 130, mid)
        parts.append(f'<text x="{lx:.1f}" y="{ly:.1f}" text-anchor="middle" font-size="12" font-family="sans-serif">{b}</text>')

        op_group = defaultdict(list)
        for rr in b_rows:
            op_key = rr["opcode"] if rr["opcode"] in top_set else "other"
            op_group[op_key].append(rr)
        op_sorted = sorted(op_group.keys(), key=lambda k: len(op_group[k]), reverse=True)
        p_start = start
        for op in op_sorted:
            op_rows = op_group[op]
            pt = len(op_rows)
            p_span = effective_span * (pt / b_total if b_total else 0.0)
            p_end = p_start + p_span
            parts.append(
                f'<path d="{arc_path(cx, cy, r0 + 2, r1, p_start, p_end)}" fill="{op_color.get(op, "#888")}" stroke="white" stroke-width="1"/>'
            )
            if p_span > 0.08:
                pmid = (p_start + p_end) / 2
                plx, ply = polar_to_xy(cx, cy, (r0 + r1) / 2, pmid)
                parts.append(f'<text x="{plx:.1f}" y="{ply:.1f}" text-anchor="middle" font-size="10" fill="white" font-family="sans-serif">{op}</text>')

            out_counts = defaultdict(int)
            for rr in op_rows:
                out_counts[rr["outcome"]] += 1
            o_start = p_start
            for oc, _, _ in OUTCOMES:
                v = out_counts[oc]
                if v <= 0:
                    continue
                o_span = p_span * (v / pt if pt else 0.0)
                o_end = o_start + o_span
                parts.append(
                    f'<path d="{arc_path(cx, cy, r1 + 2, r2, o_start, o_end)}" fill="{oc_cols[oc]}" stroke="white" stroke-width="1"/>'
                )
                o_start = o_end
            p_start = p_end
        start = b_end

    div_start = -math.pi / 2.0
    for i in range(len(benches) + 1):
        ang = div_start + i * b_uniform_span
        x0, y0 = polar_to_xy(cx, cy, 70, ang)
        x1, y1 = polar_to_xy(cx, cy, r2 + 14, ang)
        parts.append(f'<line x1="{x0:.2f}" y1="{y0:.2f}" x2="{x1:.2f}" y2="{y1:.2f}" stroke="#000" stroke-width="4.6" stroke-linecap="round"/>')

    parts.append('<circle cx="700" cy="700" r="78" fill="white" stroke="#bbb" stroke-width="1"/>')
    parts.append('<text x="700" y="695" text-anchor="middle" font-size="17" font-family="sans-serif">All FI</text>')
    parts.append(f'<text x="700" y="720" text-anchor="middle" font-size="14" fill="#444" font-family="sans-serif">{len(records)} pairs</text>')

    legend_x = 980
    legend_y = 110
    parts.append('<text x="980" y="85" font-size="16" font-family="sans-serif">Outcome Legend</text>')
    for i, (oc, _, color) in enumerate(OUTCOMES):
        y = legend_y + i * 28
        parts.append(f'<rect x="{legend_x}" y="{y}" width="18" height="18" fill="{color}" stroke="#777" stroke-width="0.5"/>')
        parts.append(f'<text x="{legend_x+26}" y="{y+14}" font-size="13" font-family="sans-serif">{oc}</text>')

    parts.append("</svg>")
    with open(out_svg, "w") as f:
        f.write("\n".join(parts))


def write_parallel_dat(rows, out_dat):
    with open(out_dat, "w") as f:
        idx = 0
        for r in rows:
            idx += 1
            f.write(f"# {idx} {r['benchmark']}:{r['phase']}\n")
            for xi, (_, col, _) in enumerate(OUTCOMES, start=1):
                f.write(f"{xi} {r[col]:.8f}\n")
            f.write("\n")
    return idx


def plot_parallel(out_dat, _line_count, out_png):
    script = f"""
set terminal pngcairo size 1700,900
set output '{out_png}'
set title 'Parallel Coordinates (benchmark-phase outcome profiles)' font ',20'
set xlabel 'Outcome feature'
set ylabel 'Fraction'
set xrange [1:5]
set yrange [0:1]
set grid ytics lc rgb '#dddddd'
set xtics ('MASKED:err' 1, 'MASKED:noerr' 2, 'SDC:err' 3, 'SDC:noerr' 4, 'DUE' 5) rotate by -20
unset key
plot '{out_dat}' using 1:2 with lines lw 1 lc rgb '#4E79A7'
"""
    subprocess.run(["gnuplot"], input=script.encode("utf-8"), check=True)


def write_heatmap_dat(rows, out_dat):
    rows_sorted = sorted(rows, key=lambda r: (r["benchmark"], PHASES.index(r["phase"])))
    with open(out_dat, "w") as f:
        for yi, r in enumerate(rows_sorted, start=1):
            for xi, (_, col, _) in enumerate(OUTCOMES, start=1):
                f.write(f"{xi} {yi} {r[col]:.8f}\n")
    return rows_sorted


def plot_heatmap(out_dat, rows_sorted, out_png):
    ylabels = [f"{r['benchmark']}:{r['phase']}" for r in rows_sorted]
    yt = ", ".join([f'"{lab}" {i+1}' for i, lab in enumerate(ylabels)])
    script = f"""
set terminal pngcairo size 1700,1100
set output '{out_png}'
set view map
unset key
set title 'Feature Heatmap (benchmark-phase x taxonomy features)' font ',20'
set xrange [0.5:5.5]
set yrange [0.5:{len(rows_sorted)+0.5}]
set xtics ('MASKED:err' 1, 'MASKED:noerr' 2, 'SDC:err' 3, 'SDC:noerr' 4, 'DUE' 5) rotate by -25
set ytics ({yt}) font ',9'
set xlabel 'Feature'
set ylabel 'Benchmark:phase'
set cblabel 'Fraction'
set cbrange [0:1]
set palette defined (0 '#f7fbff', 0.2 '#c6dbef', 0.4 '#6baed6', 0.6 '#fdbe85', 0.8 '#fd8d3c', 1 '#d7301f')
plot '{out_dat}' using 1:2:3 with image pixels
"""
    subprocess.run(["gnuplot"], input=script.encode("utf-8"), check=True)


def write_bench_radarish_dat(rows, out_dat):
    # "Radar-ish" compact summary: per benchmark, non-masked by phase (3 spokes).
    by_bench = defaultdict(dict)
    for r in rows:
        non_masked = 1.0 - r["masked_errorDetected_frac"] - r["masked_noError_frac"]
        by_bench[r["benchmark"]][r["phase"]] = non_masked
    benches = sorted(by_bench)
    with open(out_dat, "w") as f:
        f.write("bench float operand pointer\n")
        for b in benches:
            f0 = by_bench[b].get("float", 0.0)
            f1 = by_bench[b].get("operand", 0.0)
            f2 = by_bench[b].get("pointer", 0.0)
            f.write(f"{b} {f0:.8f} {f1:.8f} {f2:.8f}\n")


def plot_bench_radarish(dat, out_png):
    script = f"""
set terminal pngcairo size 1700,900
set output '{out_png}'
set style data histogram
set style histogram clustered gap 1
set style fill solid 1.0 border -1
set boxwidth 0.85
set key outside right top
set yrange [0:1]
set xtics rotate by -25
set ylabel 'Non-MASKED fraction (SDC + DUE)'
set title 'Phase Comparison per Benchmark (compact high-feature view)' font ',20'
plot '{dat}' using 2:xtic(1) title 'float' lc rgb '#4E79A7', \\
     '' using 3 title 'operand' lc rgb '#F28E2B', \\
     '' using 4 title 'pointer' lc rgb '#59A14F'
"""
    subprocess.run(["gnuplot"], input=script.encode("utf-8"), check=True)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument(
        "--summary-by-phase",
        default="HeCBench/results/llvm17_inject/visualizations/benchmark_taxonomy_summary_by_phase.csv",
    )
    ap.add_argument("--root", default="HeCBench/results/llvm17_inject")
    ap.add_argument("--out-dir", default="HeCBench/results/llvm17_inject/visualizations")
    args = ap.parse_args()

    rows = read_rows(args.summary_by_phase)
    os.makedirs(args.out_dir, exist_ok=True)

    sunburst_svg = os.path.join(args.out_dir, "taxonomy_sunburst.svg")
    write_sunburst_svg(rows, sunburst_svg)
    records = collect_records(args.root)
    sunburst_opcode_svg = os.path.join(args.out_dir, "taxonomy_sunburst_opcode.svg")
    write_sunburst_opcode_svg(records, sunburst_opcode_svg, top_n_opcode=10)

    par_dat = os.path.join(args.out_dir, "parallel_coordinates_phase_profiles.dat")
    line_count = write_parallel_dat(rows, par_dat)
    plot_parallel(par_dat, line_count, os.path.join(args.out_dir, "parallel_coordinates_phase_profiles.png"))

    hm_dat = os.path.join(args.out_dir, "feature_heatmap_phase_profiles.dat")
    rows_sorted = write_heatmap_dat(rows, hm_dat)
    plot_heatmap(hm_dat, rows_sorted, os.path.join(args.out_dir, "feature_heatmap_phase_profiles.png"))

    rc_dat = os.path.join(args.out_dir, "phase_compact_cluster.dat")
    write_bench_radarish_dat(rows, rc_dat)
    plot_bench_radarish(rc_dat, os.path.join(args.out_dir, "phase_compact_cluster.png"))

    print("Wrote:", sunburst_svg)
    print("Wrote:", sunburst_opcode_svg)
    print("Wrote advanced visuals to:", args.out_dir)


if __name__ == "__main__":
    main()
