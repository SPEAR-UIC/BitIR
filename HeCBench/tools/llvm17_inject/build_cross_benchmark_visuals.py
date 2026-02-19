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


def plot_outcome_mix(data, png, title):
    script = f"""
set terminal pngcairo size 1400,700
set output '{png}'
set style data histogram
set style histogram rowstacked
set style fill solid 1.0 border -1
set boxwidth 0.7
set key outside right top
set ylabel 'Fraction of injections'
set yrange [0:1]
set xtics rotate by -25
set title '{title}'
plot '{data}' using 2:xtic(1) title 'MASKED:errorDetected' lc rgb '#5DA5DA', \\
     '' using 3 title 'MASKED:noError' lc rgb '#59A14F', \\
     '' using 4 title 'SDC:errorDetected' lc rgb '#F28E2B', \\
     '' using 5 title 'SDC:noError' lc rgb '#EDC948', \\
     '' using 6 title 'DUE' lc rgb '#E15759'
"""
    run_gnuplot(script)


def quote_labels(labels):
    return ", ".join([f'"{lab}" {i + 1}' for i, lab in enumerate(labels)])


def plot_opcode_heatmap(out_dir, benches, op_labels):
    data = os.path.join(out_dir, "opcode_sdc_heatmap.dat")
    png = os.path.join(out_dir, "opcode_sdc_heatmap.png")
    script = f"""
set terminal pngcairo size 1600,900
set output '{png}'
set view map
unset key
set xrange [0.5:{len(benches)+0.5}]
set yrange [0.5:{len(op_labels)+0.5}]
set xtics ({quote_labels(benches)}) rotate by -25
set ytics ({quote_labels(op_labels)})
set xlabel 'Benchmark'
set ylabel 'Opcode'
set cblabel 'SDC fraction within opcode'
set cbrange [0:1]
set palette rgbformulae 22,13,-31
plot '{data}' using 1:2:3 with image pixels
"""
    run_gnuplot(script)


def plot_site_decile_heatmap(out_dir, benches):
    data = os.path.join(out_dir, "site_decile_sensitivity.dat")
    png = os.path.join(out_dir, "site_decile_sensitivity_heatmap.png")
    xlabels = [f"D{i}" for i in range(1, 11)]
    script = f"""
set terminal pngcairo size 1500,700
set output '{png}'
set view map
unset key
set xrange [0.5:10.5]
set yrange [0.5:{len(benches)+0.5}]
set xtics ({quote_labels(xlabels)})
set ytics ({quote_labels(benches)})
set xlabel 'Site-id decile (within benchmark)'
set ylabel 'Benchmark'
set cblabel 'Non-MASKED fraction (SDC + DUE)'
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
set terminal pngcairo size 1200,700
set output '{png}'
set view map
unset key
set xrange [0.5:{len(phases)+0.5}]
set yrange [0.5:{len(benches)+0.5}]
set xtics ({quote_labels(phases)})
set ytics ({quote_labels(benches)})
set title '{title}'
set xlabel 'Phase'
set ylabel 'Benchmark'
set cblabel '{cblabel}'
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
set terminal pngcairo size 2200,700
set output '{png}'
set view map
unset key
set xrange [0.5:{len(xlabels)+0.5}]
set yrange [0.5:{len(benches)+0.5}]
set xtics ({quote_labels(xlabels)}) rotate by -60
set ytics ({quote_labels(benches)})
set title 'Outcome Fractions by Benchmark and Phase-Class'
set xlabel 'Phase:Outcome'
set ylabel 'Benchmark'
set cblabel 'Fraction'
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
set terminal pngcairo size 1600,700
set output '{png}'
set style data histogram
set style histogram clustered gap 1
set style fill solid 1.0 border -1
set boxwidth 0.9
set key outside right top
set ylabel 'Fraction delta'
set yzeroaxis lc rgb '#222222' lw 1
set xtics rotate by -25
set title 'Phase Delta vs Float by Benchmark'
plot '{data}' using 2:xtic(1) title 'Pointer-Float non-masked' lc rgb '#F28E2B', \\
     '' using 3 title 'Pointer-Float DUE' lc rgb '#E15759', \\
     '' using 4 title 'Operand-Float non-masked' lc rgb '#EDC948', \\
     '' using 5 title 'Operand-Float DUE' lc rgb '#B07AA1'
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
    p.add_argument("--exclude", default="jacobi,randomAccess")
    args = p.parse_args()

    benches = [b.strip() for b in args.benches.split(",") if b.strip()]
    exclude = {b.strip() for b in args.exclude.split(",") if b.strip()}
    os.makedirs(args.out_dir, exist_ok=True)

    records, complete = collect_records(args.root, benches, ("float", "operand", "pointer"))
    chosen = sorted([b for b in complete if b not in exclude])
    if not chosen:
        raise SystemExit("No complete non-running benchmarks available to visualize.")
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
        "Outcome Mix by Benchmark (all phases)",
    )
    for ph in phases:
        mix_ph = os.path.join(args.out_dir, f"outcome_mix_{ph}.dat")
        write_outcome_mix_data_for_phase(filtered, chosen, ph, mix_ph)
        plot_outcome_mix(
            mix_ph,
            os.path.join(args.out_dir, f"outcome_mix_by_benchmark_{ph}.png"),
            f"Outcome Mix by Benchmark ({ph})",
        )
    plot_opcode_heatmap(args.out_dir, chosen, op_labels)
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
        "DUE Fraction by Benchmark and Phase",
        "DUE fraction",
    )
    plot_phase_heatmap(
        nonmasked_hm,
        os.path.join(args.out_dir, "benchmark_phase_nonmasked_heatmap.png"),
        chosen,
        phases,
        "Non-MASKED Fraction by Benchmark and Phase",
        "Non-MASKED fraction",
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

    print("Complete benches:", ",".join(sorted(complete)))
    print("Excluded benches:", ",".join(sorted(exclude)))
    print("Visualized benches:", ",".join(chosen))
    print("Wrote outputs to:", args.out_dir)


if __name__ == "__main__":
    main()
