#!/usr/bin/env python3
import argparse
import csv
import io
import os
import shutil
import subprocess
from collections import Counter, defaultdict


PHASE_TO_WL = {
    "float": "worklist_sycl_aligned.csv",
    "operand": "worklist_operand_sycl_aligned.csv",
    "pointer": "worklist_pointer_sycl_aligned.csv",
}
OUTCOME_CLASSES = (
    "MASKED:errorDetected",
    "MASKED:noError",
    "SDC:errorDetected",
    "SDC:noError",
    "DUE",
)


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
                    "opcode": row.get("opcode", "").strip() or "unknown",
                }
            )
        except Exception:
            continue
    return rows


def classify_out_path(path):
    if not os.path.exists(path):
        return "DUE"
    if os.path.getsize(path) == 0:
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

    # Taxonomy rule requested: no golden-compare marker => DUE.
    if "compare_ok" in text or "compare_exact" in text or "result: masked" in text:
        return f"MASKED:{error_flag}"
    if "compare_mismatch" in text or "\nmismatch\n" in padded or "result: sdc" in text:
        return f"SDC:{error_flag}"
    return "DUE"


def collect_records(root, benches, phases):
    records = []
    complete = set()
    for bench in benches:
        bench_complete = True
        phase_rows = {}
        for phase in phases:
            wl = os.path.join(root, f"{bench}-sycl", PHASE_TO_WL[phase])
            out_dir = os.path.join(root, bench, phase)
            if not os.path.exists(wl) or not os.path.isdir(out_dir):
                bench_complete = False
                continue
            rows = read_worklist(wl)
            phase_rows[phase] = rows
            for row in rows:
                outp = os.path.join(out_dir, f"site{row['site_id']}_bit{row['bit_index']}.out")
                if not os.path.exists(outp):
                    bench_complete = False
                    break
        if bench_complete:
            complete.add(bench)
        for phase, rows in phase_rows.items():
            out_dir = os.path.join(root, bench, phase)
            for row in rows:
                outp = os.path.join(out_dir, f"site{row['site_id']}_bit{row['bit_index']}.out")
                records.append(
                    {
                        "bench": bench,
                        "phase": phase,
                        "site_id": row["site_id"],
                        "bit_index": row["bit_index"],
                        "opcode": row["opcode"],
                        "outcome": classify_out_path(outp),
                    }
                )
    return records, complete


def write_taxonomy_summary(records, benches, out_csv):
    counts = {b: Counter() for b in benches}
    totals = Counter()
    for r in records:
        b = r["bench"]
        if b not in counts:
            continue
        counts[b][r["outcome"]] += 1
        totals[b] += 1
    with open(out_csv, "w", newline="") as f:
        w = csv.writer(f)
        w.writerow(
            [
                "benchmark",
                "total",
                "masked_errorDetected",
                "masked_noError",
                "sdc_errorDetected",
                "sdc_noError",
                "due",
                "masked_errorDetected_frac",
                "masked_noError_frac",
                "sdc_errorDetected_frac",
                "sdc_noError_frac",
                "due_frac",
            ]
        )
        for b in benches:
            t = totals[b]
            me = counts[b]["MASKED:errorDetected"]
            mn = counts[b]["MASKED:noError"]
            se = counts[b]["SDC:errorDetected"]
            sn = counts[b]["SDC:noError"]
            d = counts[b]["DUE"]
            w.writerow(
                [
                    b,
                    t,
                    me,
                    mn,
                    se,
                    sn,
                    d,
                    (me / t if t else 0),
                    (mn / t if t else 0),
                    (se / t if t else 0),
                    (sn / t if t else 0),
                    (d / t if t else 0),
                ]
            )


def write_taxonomy_summary_by_phase(records, benches, phases, out_csv):
    counts = {(b, p): Counter() for b in benches for p in phases}
    totals = Counter()
    for r in records:
        b = r["bench"]
        p = r["phase"]
        if b not in benches or p not in phases:
            continue
        counts[(b, p)][r["outcome"]] += 1
        totals[(b, p)] += 1
    with open(out_csv, "w", newline="") as f:
        w = csv.writer(f)
        w.writerow(
            [
                "benchmark",
                "phase",
                "total",
                "masked_errorDetected",
                "masked_noError",
                "sdc_errorDetected",
                "sdc_noError",
                "due",
                "masked_errorDetected_frac",
                "masked_noError_frac",
                "sdc_errorDetected_frac",
                "sdc_noError_frac",
                "due_frac",
            ]
        )
        for b in benches:
            for p in phases:
                t = totals[(b, p)]
                me = counts[(b, p)]["MASKED:errorDetected"]
                mn = counts[(b, p)]["MASKED:noError"]
                se = counts[(b, p)]["SDC:errorDetected"]
                sn = counts[(b, p)]["SDC:noError"]
                d = counts[(b, p)]["DUE"]
                w.writerow(
                    [
                        b,
                        p,
                        t,
                        me,
                        mn,
                        se,
                        sn,
                        d,
                        (me / t if t else 0),
                        (mn / t if t else 0),
                        (se / t if t else 0),
                        (sn / t if t else 0),
                        (d / t if t else 0),
                    ]
                )


def write_outcome_mix_data(records, benches, out_dat):
    counts = {b: Counter() for b in benches}
    totals = Counter()
    for r in records:
        b = r["bench"]
        if b not in counts:
            continue
        counts[b][r["outcome"]] += 1
        totals[b] += 1
    with open(out_dat, "w") as f:
        f.write("bench masked_err masked_noerr sdc_err sdc_noerr due\n")
        for b in benches:
            t = totals[b]
            me = counts[b]["MASKED:errorDetected"] / t if t else 0.0
            mn = counts[b]["MASKED:noError"] / t if t else 0.0
            se = counts[b]["SDC:errorDetected"] / t if t else 0.0
            sn = counts[b]["SDC:noError"] / t if t else 0.0
            d = counts[b]["DUE"] / t if t else 0.0
            f.write(f"{b} {me:.6f} {mn:.6f} {se:.6f} {sn:.6f} {d:.6f}\n")


def write_outcome_mix_data_for_phase(records, benches, phase, out_dat):
    rows = [r for r in records if r["phase"] == phase]
    write_outcome_mix_data(rows, benches, out_dat)


def write_benchmark_opcode_mix_data(records, bench, out_dat, top_n=30):
    counts = defaultdict(Counter)
    totals = Counter()
    for r in records:
        if r["bench"] != bench:
            continue
        op = r["opcode"] or "unknown"
        counts[op][r["outcome"]] += 1
        totals[op] += 1

    sorted_ops = [op for op, _ in sorted(totals.items(), key=lambda x: x[1], reverse=True)]
    top_ops = sorted_ops if top_n <= 0 else sorted_ops[:top_n]
    with open(out_dat, "w") as f:
        f.write("opcode masked_err masked_noerr sdc_err sdc_noerr due\n")
        for op in top_ops:
            t = totals[op]
            me = counts[op]["MASKED:errorDetected"] / t if t else 0.0
            mn = counts[op]["MASKED:noError"] / t if t else 0.0
            se = counts[op]["SDC:errorDetected"] / t if t else 0.0
            sn = counts[op]["SDC:noError"] / t if t else 0.0
            d = counts[op]["DUE"] / t if t else 0.0
            f.write(f"{op} {me:.6f} {mn:.6f} {se:.6f} {sn:.6f} {d:.6f}\n")


def write_global_opcode_mix_data(records, out_dat, top_n=40):
    counts = defaultdict(Counter)
    totals = Counter()
    for r in records:
        op = r["opcode"] or "unknown"
        counts[op][r["outcome"]] += 1
        totals[op] += 1

    sorted_ops = [op for op, _ in sorted(totals.items(), key=lambda x: x[1], reverse=True)]
    top_ops = sorted_ops if top_n <= 0 else sorted_ops[:top_n]
    with open(out_dat, "w") as f:
        f.write("opcode masked_err masked_noerr sdc_err sdc_noerr due\n")
        for op in top_ops:
            t = totals[op]
            me = counts[op]["MASKED:errorDetected"] / t if t else 0.0
            mn = counts[op]["MASKED:noError"] / t if t else 0.0
            se = counts[op]["SDC:errorDetected"] / t if t else 0.0
            sn = counts[op]["SDC:noError"] / t if t else 0.0
            d = counts[op]["DUE"] / t if t else 0.0
            f.write(f"{op} {me:.6f} {mn:.6f} {se:.6f} {sn:.6f} {d:.6f}\n")


def write_global_opcode_stats_csv(records, out_csv, top_n=40):
    counts = defaultdict(Counter)
    totals = Counter()
    for r in records:
        op = r["opcode"] or "unknown"
        counts[op][r["outcome"]] += 1
        totals[op] += 1

    sorted_ops = [op for op, _ in sorted(totals.items(), key=lambda x: x[1], reverse=True)]
    top_ops = sorted_ops if top_n <= 0 else sorted_ops[:top_n]
    with open(out_csv, "w", newline="") as f:
        w = csv.writer(f)
        w.writerow(
            [
                "opcode",
                "total",
                "masked_err_frac",
                "masked_noerr_frac",
                "sdc_err_frac",
                "sdc_noerr_frac",
                "due_frac",
                "sdc_total_frac",
                "non_masked_frac",
            ]
        )
        for op in top_ops:
            t = totals[op]
            me = counts[op]["MASKED:errorDetected"] / t if t else 0.0
            mn = counts[op]["MASKED:noError"] / t if t else 0.0
            se = counts[op]["SDC:errorDetected"] / t if t else 0.0
            sn = counts[op]["SDC:noError"] / t if t else 0.0
            d = counts[op]["DUE"] / t if t else 0.0
            w.writerow([op, t, me, mn, se, sn, d, se + sn, 1.0 - me - mn])


def write_opcode_heatmap_data(records, benches, out_dat, out_labels):
    op_counts = defaultdict(Counter)
    op_sdc = defaultdict(Counter)
    ops = set()
    for r in records:
        b = r["bench"]
        if b not in benches:
            continue
        op = r["opcode"]
        ops.add(op)
        op_counts[b][op] += 1
        if r["outcome"].startswith("SDC:"):
            op_sdc[b][op] += 1
    op_total = {op: sum(op_counts[b][op] for b in benches) for op in ops}
    top_ops = [op for op, _ in sorted(op_total.items(), key=lambda x: x[1], reverse=True)[:20]]
    with open(out_dat, "w") as f:
        for yi, op in enumerate(top_ops, start=1):
            for xi, b in enumerate(benches, start=1):
                n = op_counts[b][op]
                z = (op_sdc[b][op] / n) if n else 0.0
                f.write(f"{xi} {yi} {z:.6f}\n")
    with open(out_labels, "w") as f:
        f.write("x_labels=" + ",".join(benches) + "\n")
        f.write("y_labels=" + ",".join(top_ops) + "\n")
    return top_ops


def write_opcode_heatmap_data_for_phase(records, benches, phase, out_dat, out_labels):
    phase_rows = [r for r in records if r["phase"] == phase]
    return write_opcode_heatmap_data(phase_rows, benches, out_dat, out_labels)


def write_site_decile_data(records, benches, out_dat):
    by_bench = defaultdict(list)
    for r in records:
        if r["bench"] in benches:
            by_bench[r["bench"]].append(r)
    bins = 10
    with open(out_dat, "w") as f:
        for yi, b in enumerate(benches, start=1):
            rows = by_bench[b]
            site_ids = sorted({r["site_id"] for r in rows})
            rank = {sid: idx / max(len(site_ids) - 1, 1) for idx, sid in enumerate(site_ids)}
            totals = [0] * bins
            bad = [0] * bins
            for r in rows:
                dec = min(bins - 1, int(rank[r["site_id"]] * bins))
                totals[dec] += 1
                if not r["outcome"].startswith("MASKED:"):
                    bad[dec] += 1
            for xi in range(1, bins + 1):
                t = totals[xi - 1]
                z = (bad[xi - 1] / t) if t else 0.0
                f.write(f"{xi} {yi} {z:.6f}\n")


def run_gnuplot(script_text):
    if not shutil.which("gnuplot"):
        raise RuntimeError("gnuplot not found")
    subprocess.run(["gnuplot"], input=script_text.encode("utf-8"), check=True)


def plot_stacked_outcome_mix(data, png, title, xlabel, xtic_rotate=-25):
    script = f"""
set terminal pngcairo size 1800,900
set output '{png}'
set style data histogram
set style histogram rowstacked
set style fill solid 1.0 border -1
set boxwidth 0.7
set xrange [-0.5:*]
set offset 0,0,0,0
set key outside right top font ',12'
set title '{title}' font ',20'
set xlabel '{xlabel}' font ',16'
set ylabel 'Fraction of injected site/bit pairs' font ',16'
set yrange [0:1]
set xtics rotate by {xtic_rotate} font ',12'
set ytics font ',12'
plot '{data}' using 2:xtic(1) title 'MASKED:errorDetected' lc rgb '#5DA5DA', \\
     '' using 3 title 'MASKED:noError' lc rgb '#59A14F', \\
     '' using 4 title 'SDC:errorDetected' lc rgb '#F28E2B', \\
     '' using 5 title 'SDC:noError' lc rgb '#EDC948', \\
     '' using 6 title 'DUE' lc rgb '#E15759'
"""
    run_gnuplot(script)


def plot_outcome_mix(data, png, title):
    plot_stacked_outcome_mix(
        data,
        png,
        title,
        "Benchmark (one stacked bar per benchmark)",
        xtic_rotate=-25,
    )


def quote_labels(labels):
    return ", ".join([f'"{lab}" {i + 1}' for i, lab in enumerate(labels)])


def plot_opcode_heatmap(out_dir, benches, op_labels):
    data = os.path.join(out_dir, "opcode_sdc_heatmap.dat")
    png = os.path.join(out_dir, "opcode_sdc_heatmap.png")
    script = f"""
set terminal pngcairo size 1800,1000
set output '{png}'
set view map
unset key
set xrange [0.5:{len(benches)+0.5}]
set yrange [0.5:{len(op_labels)+0.5}]
set title 'Opcode-Level SDC Fraction by Benchmark (all phases combined)' font ',20'
set xtics ({quote_labels(benches)}) rotate by -25 font ',12'
set ytics ({quote_labels(op_labels)}) font ',12'
set xlabel 'Benchmark' font ',16'
set ylabel 'Opcode category from aligned worklists' font ',16'
set cblabel 'Fraction of injected site/bit pairs classified as SDC within opcode' font ',14'
set cbrange [0:1]
set palette rgbformulae 22,13,-31
plot '{data}' using 1:2:3 with image pixels
"""
    run_gnuplot(script)


def plot_opcode_heatmap_from_data(data, png, benches, op_labels, title):
    script = f"""
set terminal pngcairo size 1800,1000
set output '{png}'
set view map
unset key
set xrange [0.5:{len(benches)+0.5}]
set yrange [0.5:{len(op_labels)+0.5}]
set title '{title}' font ',20'
set xtics ({quote_labels(benches)}) rotate by -25 font ',12'
set ytics ({quote_labels(op_labels)}) font ',12'
set xlabel 'Benchmark' font ',16'
set ylabel 'Opcode category from aligned worklists' font ',16'
set cblabel 'Fraction of injected site/bit pairs classified as SDC within opcode' font ',14'
set cbrange [0:1]
set palette rgbformulae 22,13,-31
plot '{data}' using 1:2:3 with image pixels
"""
    run_gnuplot(script)


def write_global_opcode_outcome_heatmap_data(stats_csv, out_dat):
    rows = []
    with open(stats_csv, newline="") as f:
        r = csv.DictReader(f)
        rows = list(r)
    x_labels = ["MASKED:errorDetected", "MASKED:noError", "SDC:errorDetected", "SDC:noError", "DUE"]
    cols = ["masked_err_frac", "masked_noerr_frac", "sdc_err_frac", "sdc_noerr_frac", "due_frac"]
    y_labels = [row["opcode"] for row in rows]
    with open(out_dat, "w") as f:
        for yi, row in enumerate(rows, start=1):
            for xi, col in enumerate(cols, start=1):
                f.write(f"{xi} {yi} {float(row[col]):.6f}\n")
    return x_labels, y_labels


def plot_global_opcode_outcome_heatmap(data, png, x_labels, y_labels):
    script = f"""
set terminal pngcairo size 1900,1300
set output '{png}'
set view map
unset key
set xrange [0.5:{len(x_labels)+0.5}]
set yrange [0.5:{len(y_labels)+0.5}]
set title 'Opcode vs Outcome Heatmap (global, all benchmarks/phases)' font ',20'
set xtics ({quote_labels(x_labels)}) rotate by -20 font ',12'
set ytics ({quote_labels(y_labels)}) font ',10'
set xlabel 'Outcome class' font ',16'
set ylabel 'Opcode category' font ',16'
set cblabel 'Fraction within opcode' font ',14'
set cbrange [0:1]
set palette rgbformulae 22,13,-31
plot '{data}' using 1:2:3 with image pixels
"""
    run_gnuplot(script)


def write_opcode_risk_scatter_data(stats_csv, out_dat, top_labels=24):
    rows = []
    with open(stats_csv, newline="") as f:
        r = csv.DictReader(f)
        rows = list(r)
    max_total = max([int(row["total"]) for row in rows], default=1)
    with open(out_dat, "w") as f:
        f.write("opcode sdc due ps label\n")
        for i, row in enumerate(rows):
            t = int(row["total"])
            sdc = float(row["sdc_total_frac"])
            due = float(row["due_frac"])
            ps = 0.6 + 2.4 * ((t / max_total) ** 0.5)
            label = row["opcode"] if i < top_labels else ""
            f.write(f"{row['opcode']} {sdc:.6f} {due:.6f} {ps:.4f} {label}\n")


def plot_opcode_risk_scatter(data, png):
    script = f"""
set terminal pngcairo size 1700,1000
set output '{png}'
set title 'Opcode Risk Map (SDC vs DUE, bubble size by volume)' font ',20'
set xlabel 'SDC fraction within opcode' font ',15'
set ylabel 'DUE fraction within opcode' font ',15'
set xrange [0:1]
set yrange [0:1]
set grid lc rgb '#dddddd'
set key off
plot '{data}' using 2:3:4 with points pt 7 ps variable lc rgb '#F28E2B', \\
     '' using 2:3:5 with labels offset char 1,0.6 font ',9' tc rgb '#222222'
"""
    run_gnuplot(script)


def plot_site_decile_heatmap(out_dir, benches):
    data = os.path.join(out_dir, "site_decile_sensitivity.dat")
    png = os.path.join(out_dir, "site_decile_sensitivity_heatmap.png")
    xlabels = [f"D{i}" for i in range(1, 11)]
    script = f"""
set terminal pngcairo size 1800,900
set output '{png}'
set view map
unset key
set xrange [0.5:10.5]
set yrange [0.5:{len(benches)+0.5}]
set title 'Site-Rank Sensitivity Heatmap by Benchmark (all phases combined)' font ',20'
set xtics ({quote_labels(xlabels)}) font ',12'
set ytics ({quote_labels(benches)}) font ',12'
set xlabel 'Site-id decile after ranking site IDs within each benchmark' font ',16'
set ylabel 'Benchmark' font ',16'
set cblabel 'Fraction of pairs not MASKED (SDC + DUE)' font ',14'
set cbrange [0:1]
set palette rgbformulae 22,13,-31
plot '{data}' using 1:2:3 with image pixels
"""
    run_gnuplot(script)


def write_phase_heatmap_data(records, benches, phases, metric_name, out_dat):
    # metric_name: one of the taxonomy classes or derived "non_masked"
    counts = {(b, p): Counter() for b in benches for p in phases}
    totals = Counter()
    for r in records:
        b = r["bench"]
        p = r["phase"]
        if b not in benches or p not in phases:
            continue
        counts[(b, p)][r["outcome"]] += 1
        totals[(b, p)] += 1
    with open(out_dat, "w") as f:
        for yi, b in enumerate(benches, start=1):
            for xi, p in enumerate(phases, start=1):
                t = totals[(b, p)]
                if t == 0:
                    z = 0.0
                elif metric_name == "non_masked":
                    z = (t - counts[(b, p)]["MASKED:errorDetected"] - counts[(b, p)]["MASKED:noError"]) / t
                else:
                    z = counts[(b, p)][metric_name] / t
                f.write(f"{xi} {yi} {z:.6f}\n")


def plot_phase_heatmap(data, png, benches, phases, title, cblabel):
    script = f"""
set terminal pngcairo size 1600,900
set output '{png}'
set view map
unset key
set xrange [0.5:{len(phases)+0.5}]
set yrange [0.5:{len(benches)+0.5}]
set xtics ({quote_labels(phases)}) font ',12'
set ytics ({quote_labels(benches)}) font ',12'
set title '{title}' font ',20'
set xlabel 'Injection phase category' font ',16'
set ylabel 'Benchmark' font ',16'
set cblabel '{cblabel}' font ',14'
set cbrange [0:1]
set palette rgbformulae 22,13,-31
plot '{data}' using 1:2:3 with image pixels
"""
    run_gnuplot(script)


def write_phase_profile_heatmap_data(records, benches, phases, out_dat):
    counts = {(b, p): Counter() for b in benches for p in phases}
    totals = Counter()
    for r in records:
        b = r["bench"]
        p = r["phase"]
        if b not in benches or p not in phases:
            continue
        counts[(b, p)][r["outcome"]] += 1
        totals[(b, p)] += 1
    cols = []
    for ph in phases:
        cols.extend(
            [
                (ph, "MASKED:errorDetected"),
                (ph, "MASKED:noError"),
                (ph, "SDC:errorDetected"),
                (ph, "SDC:noError"),
                (ph, "DUE"),
            ]
        )
    with open(out_dat, "w") as f:
        for yi, b in enumerate(benches, start=1):
            for xi, (ph, outcome) in enumerate(cols, start=1):
                t = totals[(b, ph)]
                z = counts[(b, ph)][outcome] / t if t else 0.0
                f.write(f"{xi} {yi} {z:.6f}\n")
    labels = []
    for ph, oc in cols:
        if ":" in oc:
            a, b = oc.split(":", 1)
            labels.append(f"{ph}:{a}:{b}")
        else:
            labels.append(f"{ph}:{oc}")
    return labels


def plot_phase_profile_heatmap(data, png, benches, xlabels):
    script = f"""
set terminal pngcairo size 2400,900
set output '{png}'
set view map
unset key
set xrange [0.5:{len(xlabels)+0.5}]
set yrange [0.5:{len(benches)+0.5}]
set xtics ({quote_labels(xlabels)}) rotate by -60 font ',11'
set ytics ({quote_labels(benches)}) font ',12'
set title 'Outcome Fractions by Benchmark and Injection Phase-Class' font ',20'
set xlabel 'Phase and taxonomy class (MASKED/SDC/DUE with errorDetected/noError split)' font ',16'
set ylabel 'Benchmark' font ',16'
set cblabel 'Fraction of injected site/bit pairs' font ',14'
set cbrange [0:1]
set palette rgbformulae 22,13,-31
plot '{data}' using 1:2:3 with image pixels
"""
    run_gnuplot(script)


def write_phase_delta_data(records, benches, phases, out_dat):
    counts = {(b, p): Counter() for b in benches for p in phases}
    totals = Counter()
    for r in records:
        b = r["bench"]
        p = r["phase"]
        if b not in benches or p not in phases:
            continue
        counts[(b, p)][r["outcome"]] += 1
        totals[(b, p)] += 1

    def frac(b, p, outcome):
        t = totals[(b, p)]
        if t == 0:
            return 0.0
        return counts[(b, p)][outcome] / t

    with open(out_dat, "w") as f:
        f.write("bench ptr_minus_float_nonmasked ptr_minus_float_due op_minus_float_nonmasked op_minus_float_due\n")
        for b in benches:
            nm_f = 1.0 - frac(b, "float", "MASKED:errorDetected") - frac(b, "float", "MASKED:noError")
            nm_o = 1.0 - frac(b, "operand", "MASKED:errorDetected") - frac(b, "operand", "MASKED:noError")
            nm_p = 1.0 - frac(b, "pointer", "MASKED:errorDetected") - frac(b, "pointer", "MASKED:noError")
            due_f = frac(b, "float", "DUE")
            due_o = frac(b, "operand", "DUE")
            due_p = frac(b, "pointer", "DUE")
            f.write(f"{b} {nm_p - nm_f:.6f} {due_p - due_f:.6f} {nm_o - nm_f:.6f} {due_o - due_f:.6f}\n")


def plot_phase_delta(data, png):
    script = f"""
set terminal pngcairo size 1800,900
set output '{png}'
set style data histogram
set style histogram clustered gap 1
set style fill solid 1.0 border -1
set boxwidth 0.9
set key outside right top font ',12'
set title 'Phase Delta vs Float by Benchmark' font ',20'
set xlabel 'Benchmark' font ',16'
set ylabel 'Fraction delta relative to float phase' font ',16'
set yzeroaxis lc rgb '#222222' lw 1
set xtics rotate by -25 font ',12'
set ytics font ',12'
plot '{data}' using 2:xtic(1) title 'Pointer-Float non-masked' lc rgb '#F28E2B', \\
     '' using 3 title 'Pointer-Float DUE' lc rgb '#E15759', \\
     '' using 4 title 'Operand-Float non-masked' lc rgb '#EDC948', \\
     '' using 5 title 'Operand-Float DUE' lc rgb '#B07AA1'
"""
    run_gnuplot(script)


def write_phase_metric_cluster_data(records, benches, phases, metric, out_dat):
    counts = {(b, p): Counter() for b in benches for p in phases}
    totals = Counter()
    for r in records:
        b = r["bench"]
        p = r["phase"]
        if b not in benches or p not in phases:
            continue
        counts[(b, p)][r["outcome"]] += 1
        totals[(b, p)] += 1

    with open(out_dat, "w") as f:
        f.write("bench float operand pointer\n")
        for b in benches:
            vals = []
            for p in phases:
                t = totals[(b, p)]
                if t == 0:
                    vals.append(0.0)
                    continue
                if metric == "sdc_total":
                    v = (counts[(b, p)]["SDC:errorDetected"] + counts[(b, p)]["SDC:noError"]) / t
                elif metric == "due":
                    v = counts[(b, p)]["DUE"] / t
                elif metric == "non_masked":
                    v = (
                        t
                        - counts[(b, p)]["MASKED:errorDetected"]
                        - counts[(b, p)]["MASKED:noError"]
                    ) / t
                else:
                    raise ValueError(f"unknown metric {metric}")
                vals.append(v)
            f.write(f"{b} {vals[0]:.6f} {vals[1]:.6f} {vals[2]:.6f}\n")


def plot_phase_metric_cluster(data, png, title, ylabel):
    script = f"""
set terminal pngcairo size 1800,900
set output '{png}'
set style data histogram
set style histogram clustered gap 1
set style fill solid 1.0 border -1
set boxwidth 0.85
set key outside right top font ',12'
set title '{title}' font ',20'
set xlabel 'Benchmark' font ',16'
set ylabel '{ylabel}' font ',16'
set yrange [0:1]
set xtics rotate by -25 font ',12'
set ytics font ',12'
plot '{data}' using 2:xtic(1) title 'float' lc rgb '#4E79A7', \\
     '' using 3 title 'operand' lc rgb '#F28E2B', \\
     '' using 4 title 'pointer' lc rgb '#59A14F'
"""
    run_gnuplot(script)


def main():
    p = argparse.ArgumentParser()
    p.add_argument("--root", default="HeCBench/results/llvm17_inject")
    p.add_argument("--out-dir", default="HeCBench/results/llvm17_inject/visualizations")
    p.add_argument(
        "--benches",
        default="colorwheel,dense-embedding,entropy,jacobi,layout,matrix-rotate,pathfinder,randomAccess",
    )
    p.add_argument("--exclude", default="")
    args = p.parse_args()

    benches = [b.strip() for b in args.benches.split(",") if b.strip()]
    exclude = {b.strip() for b in args.exclude.split(",") if b.strip()}
    os.makedirs(args.out_dir, exist_ok=True)

    records, complete = collect_records(args.root, benches, ("float", "operand", "pointer"))
    chosen = sorted([b for b in benches if b not in exclude])
    if not chosen:
        raise SystemExit("No benchmarks selected to visualize.")
    filtered = [r for r in records if r["bench"] in chosen]

    phases = ("float", "operand", "pointer")
    write_taxonomy_summary(filtered, chosen, os.path.join(args.out_dir, "benchmark_taxonomy_summary.csv"))
    write_taxonomy_summary_by_phase(
        filtered, chosen, phases, os.path.join(args.out_dir, "benchmark_taxonomy_summary_by_phase.csv")
    )
    mix_all = os.path.join(args.out_dir, "outcome_mix.dat")
    write_outcome_mix_data(filtered, chosen, mix_all)
    op_labels = write_opcode_heatmap_data(
        filtered,
        chosen,
        os.path.join(args.out_dir, "opcode_sdc_heatmap.dat"),
        os.path.join(args.out_dir, "opcode_sdc_heatmap_labels.txt"),
    )
    write_site_decile_data(filtered, chosen, os.path.join(args.out_dir, "site_decile_sensitivity.dat"))

    plot_outcome_mix(
        mix_all,
        os.path.join(args.out_dir, "outcome_mix_by_benchmark.png"),
        "Outcome Mix by Benchmark for All Injection Site/Bit Pairs (all phases)",
    )
    phase_desc = {
        "float": "Float Result Injection Sites/Bits",
        "operand": "Operand Injection Sites/Bits",
        "pointer": "Pointer Injection Sites/Bits",
    }
    for ph in phases:
        mix_ph = os.path.join(args.out_dir, f"outcome_mix_{ph}.dat")
        write_outcome_mix_data_for_phase(filtered, chosen, ph, mix_ph)
        plot_outcome_mix(
            mix_ph,
            os.path.join(args.out_dir, f"outcome_mix_by_benchmark_{ph}.png"),
            f"Outcome Mix by Benchmark for {phase_desc[ph]}",
        )
    plot_opcode_heatmap(args.out_dir, chosen, op_labels)
    for ph in phases:
        hm_dat = os.path.join(args.out_dir, f"opcode_sdc_heatmap_{ph}.dat")
        hm_lbl = os.path.join(args.out_dir, f"opcode_sdc_heatmap_{ph}_labels.txt")
        ph_ops = write_opcode_heatmap_data_for_phase(filtered, chosen, ph, hm_dat, hm_lbl)
        plot_opcode_heatmap_from_data(
            hm_dat,
            os.path.join(args.out_dir, f"opcode_sdc_heatmap_{ph}.png"),
            chosen,
            ph_ops,
            f"Opcode-Level SDC Fraction by Benchmark ({ph} phase)",
        )
    plot_site_decile_heatmap(args.out_dir, chosen)
    due_hm = os.path.join(args.out_dir, "phase_due_heatmap.dat")
    nonmasked_hm = os.path.join(args.out_dir, "phase_nonmasked_heatmap.dat")
    write_phase_heatmap_data(filtered, chosen, phases, "DUE", due_hm)
    write_phase_heatmap_data(filtered, chosen, phases, "non_masked", nonmasked_hm)
    plot_phase_heatmap(
        due_hm,
        os.path.join(args.out_dir, "benchmark_phase_due_heatmap.png"),
        chosen,
        phases,
        "DUE Fraction by Benchmark and Injection Phase",
        "DUE fraction of injected site/bit pairs",
    )
    plot_phase_heatmap(
        nonmasked_hm,
        os.path.join(args.out_dir, "benchmark_phase_nonmasked_heatmap.png"),
        chosen,
        phases,
        "Non-MASKED Fraction by Benchmark and Injection Phase",
        "Non-MASKED fraction (SDC + DUE)",
    )
    profile_hm = os.path.join(args.out_dir, "phase_profile_heatmap.dat")
    profile_labels = write_phase_profile_heatmap_data(filtered, chosen, phases, profile_hm)
    plot_phase_profile_heatmap(
        profile_hm,
        os.path.join(args.out_dir, "benchmark_phase_profile_heatmap.png"),
        chosen,
        profile_labels,
    )
    delta_dat = os.path.join(args.out_dir, "phase_delta_vs_float.dat")
    write_phase_delta_data(filtered, chosen, phases, delta_dat)
    plot_phase_delta(delta_dat, os.path.join(args.out_dir, "benchmark_phase_delta_vs_float.png"))
    sdc_cluster = os.path.join(args.out_dir, "phase_sdc_cluster.dat")
    write_phase_metric_cluster_data(filtered, chosen, phases, "sdc_total", sdc_cluster)
    plot_phase_metric_cluster(
        sdc_cluster,
        os.path.join(args.out_dir, "benchmark_phase_sdc_cluster.png"),
        "SDC Fraction by Benchmark and Injection Phase",
        "SDC fraction of injected site/bit pairs",
    )
    due_cluster = os.path.join(args.out_dir, "phase_due_cluster.dat")
    write_phase_metric_cluster_data(filtered, chosen, phases, "due", due_cluster)
    plot_phase_metric_cluster(
        due_cluster,
        os.path.join(args.out_dir, "benchmark_phase_due_cluster.png"),
        "DUE Fraction by Benchmark and Injection Phase",
        "DUE fraction of injected site/bit pairs",
    )

    if "layout" in chosen:
        layout_opcode_dat = os.path.join(args.out_dir, "layout_opcode_outcome_mix.dat")
        write_benchmark_opcode_mix_data(filtered, "layout", layout_opcode_dat, top_n=0)
        plot_stacked_outcome_mix(
            layout_opcode_dat,
            os.path.join(args.out_dir, "layout_opcode_outcome_mix.png"),
            "Layout Outcome Mix by Opcode Category (all phases, aligned site/bit pairs)",
            "Layout opcode category",
            xtic_rotate=-20,
        )

    global_opcode_dat = os.path.join(args.out_dir, "opcode_outcome_mix_global.dat")
    write_global_opcode_mix_data(filtered, global_opcode_dat, top_n=0)
    plot_stacked_outcome_mix(
        global_opcode_dat,
        os.path.join(args.out_dir, "opcode_outcome_mix_global.png"),
        "Outcome Mix by Opcode Category (all benchmarks, all phases)",
        "Opcode category",
        xtic_rotate=-20,
    )

    print("Complete benches:", ",".join(sorted(complete)))
    print("Excluded benches:", ",".join(sorted(exclude)))
    print("Visualized benches:", ",".join(chosen))
    print("Wrote outputs to:", args.out_dir)


if __name__ == "__main__":
    main()
