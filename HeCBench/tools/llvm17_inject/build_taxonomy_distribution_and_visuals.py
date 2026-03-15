#!/usr/bin/env python3
import csv
import os
import re
from collections import Counter


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
TAXONOMY = [
    "MASKED_FLAGGED",
    "MASKED_UNFLAGGED",
    "SDC_FLAGGED",
    "SDC_NOTFLAGGED",
    "FAILURE_HANG",
    "FAILURE_NONHANG",
]
COLORS = {
    "MASKED_FLAGGED": "#1f77b4",
    "MASKED_UNFLAGGED": "#4daf4a",
    "SDC_FLAGGED": "#ff7f0e",
    "SDC_NOTFLAGGED": "#f2c14e",
    "FAILURE_HANG": "#c62828",
    "FAILURE_NONHANG": "#8d2f23",
}
RANDACC_ERRCOUNT_RE = re.compile(r"Found\s+(\d+)\s+errors?\s+in\s+\d+\s+locations\s+\((PASS|FAIL)\)\.", re.IGNORECASE)


def benchmark_flagged(bench, out_text, err_text, result, exit_code, failure_kind):
    exit_code = (exit_code or "").strip()
    failure_kind = (failure_kind or "").strip()
    if result in ("DUE", "FAILURE"):
        return True
    if failure_kind or exit_code not in ("", "0"):
        return True

    if bench == "randomAccess":
        m = RANDACC_ERRCOUNT_RE.search(out_text + "\n" + err_text)
        if m:
            return int(m.group(1)) > 0 or m.group(2).upper() == "FAIL"
        return False

    if bench in {"colorwheel", "dense-embedding", "entropy", "jacobi", "layout", "matrix-rotate"}:
        lines = [ln.strip().upper() for ln in out_text.splitlines() if ln.strip()]
        if "FAIL" in lines:
            return True
        if "PASS" in lines:
            return False

    return False


def taxonomy_for_row(bench, row):
    result = (row.get("result") or "").strip()
    exit_code = row.get("exit_code", "")
    failure_kind = row.get("failure_kind", "")
    out_text = ""
    err_text = ""
    out_path = row.get("stdout", "")
    err_path = row.get("stderr", "")
    if out_path and os.path.exists(out_path):
        with open(out_path, "r", errors="ignore") as fh:
            out_text = fh.read()
    if err_path and os.path.exists(err_path):
        with open(err_path, "r", errors="ignore") as fh:
            err_text = fh.read()
    flagged = benchmark_flagged(bench, out_text, err_text, result, exit_code, failure_kind)
    if result == "MASKED":
        return "MASKED_FLAGGED" if flagged else "MASKED_UNFLAGGED"
    if result == "SDC":
        return "SDC_FLAGGED" if flagged else "SDC_NOTFLAGGED"
    if result in ("DUE", "FAILURE"):
        if str(exit_code).startswith("timeout_") or failure_kind == "hang_timeout":
            return "FAILURE_HANG"
        return "FAILURE_NONHANG"
    return ""


def collect_counts(root):
    per_bp = {}
    overall = Counter()
    for bench in BENCHES:
        for phase in PHASES:
            path = os.path.join(root, bench, phase, "summary.csv")
            if not os.path.exists(path):
                continue
            counts = Counter()
            total = 0
            with open(path, newline="") as fh:
                for row in csv.DictReader(fh):
                    result = (row.get("result") or "").strip()
                    if result not in ("MASKED", "SDC", "DUE", "FAILURE"):
                        continue
                    tax = taxonomy_for_row(bench, row)
                    if not tax:
                        continue
                    counts[tax] += 1
                    overall[tax] += 1
                    total += 1
            per_bp[(bench, phase)] = {"total": total, "counts": counts}
    return per_bp, overall


def write_csv(out_csv, per_bp, overall):
    with open(out_csv, "w", newline="") as fh:
        w = csv.writer(fh)
        w.writerow(["benchmark", "phase", "total", *TAXONOMY])
        for bench in BENCHES:
            for phase in PHASES:
                item = per_bp.get((bench, phase))
                if not item:
                    continue
                row = [bench, phase, item["total"]]
                row.extend(item["counts"].get(k, 0) for k in TAXONOMY)
                w.writerow(row)
        w.writerow(["OVERALL", "ALL", sum(overall.values()), *[overall.get(k, 0) for k in TAXONOMY]])


def esc(text):
    return (
        str(text)
        .replace("&", "&amp;")
        .replace("<", "&lt;")
        .replace(">", "&gt;")
    )


def plot_stacked_svg(out_svg, per_bp):
    labels = []
    data = {k: [] for k in TAXONOMY}
    for bench in BENCHES:
        for phase in PHASES:
            item = per_bp.get((bench, phase))
            if not item or item["total"] == 0:
                continue
            labels.append(f"{bench}\n{phase}")
            for k in TAXONOMY:
                data[k].append(item["counts"].get(k, 0) / item["total"])
    width = 1900
    height = 860
    margin_left = 110
    margin_right = 20
    margin_top = 70
    margin_bottom = 210
    plot_w = width - margin_left - margin_right
    plot_h = height - margin_top - margin_bottom
    n = max(1, len(labels))
    bar_gap = 8
    bar_w = max(8, (plot_w - bar_gap * (n - 1)) / n)
    x = margin_left
    parts = [
        f'<svg xmlns="http://www.w3.org/2000/svg" width="{width}" height="{height}" viewBox="0 0 {width} {height}">',
        '<rect width="100%" height="100%" fill="white"/>',
        '<text x="950" y="36" text-anchor="middle" font-size="28" font-family="sans-serif">Outcome Taxonomy by Benchmark and Phase</text>',
    ]
    for i in range(6):
        frac = i / 5
        y = margin_top + plot_h * (1 - frac)
        parts.append(f'<line x1="{margin_left}" y1="{y:.1f}" x2="{width-margin_right}" y2="{y:.1f}" stroke="#dddddd" stroke-width="1"/>')
        parts.append(f'<text x="{margin_left-10}" y="{y+4:.1f}" text-anchor="end" font-size="12" font-family="sans-serif">{frac:.1f}</text>')
    for idx, label in enumerate(labels):
        bottom = 0.0
        for key in TAXONOMY:
            frac = data[key][idx]
            h = frac * plot_h
            y = margin_top + plot_h - (bottom + frac) * plot_h
            parts.append(
                f'<rect x="{x:.1f}" y="{y:.1f}" width="{bar_w:.1f}" height="{max(h,0):.1f}" fill="{COLORS[key]}" stroke="none"/>'
            )
            bottom += frac
        cx = x + bar_w / 2
        label_lines = label.split("\n")
        parts.append(f'<g transform="translate({cx:.1f},{height-margin_bottom+18}) rotate(55)">')
        for j, line in enumerate(label_lines):
            parts.append(
                f'<text x="0" y="{j*14}" text-anchor="start" font-size="11" font-family="sans-serif">{esc(line)}</text>'
            )
        parts.append('</g>')
        x += bar_w + bar_gap
    lx = width - 520
    ly = 70
    for i, key in enumerate(TAXONOMY):
        yy = ly + i * 24
        parts.append(f'<rect x="{lx}" y="{yy}" width="16" height="16" fill="{COLORS[key]}"/>')
        parts.append(f'<text x="{lx+24}" y="{yy+13}" font-size="13" font-family="sans-serif">{esc(key)}</text>')
    parts.append('</svg>')
    with open(out_svg, "w") as fh:
        fh.write("\n".join(parts))


def plot_heatmap_svg(out_svg, per_bp):
    rows = []
    matrix = []
    for bench in BENCHES:
        for phase in PHASES:
            item = per_bp.get((bench, phase))
            if not item or item["total"] == 0:
                continue
            rows.append(f"{bench}/{phase}")
            matrix.append([item["counts"].get(k, 0) / item["total"] for k in TAXONOMY])
    max_val = max([max(r) for r in matrix] or [0.01])
    width = 1050
    height = 980
    margin_left = 220
    margin_top = 80
    cell_w = 120
    cell_h = 28
    parts = [
        f'<svg xmlns="http://www.w3.org/2000/svg" width="{width}" height="{height}" viewBox="0 0 {width} {height}">',
        '<rect width="100%" height="100%" fill="white"/>',
        '<text x="525" y="36" text-anchor="middle" font-size="28" font-family="sans-serif">Outcome Taxonomy Heatmap</text>',
    ]
    for j, key in enumerate(TAXONOMY):
        x = margin_left + j * cell_w + cell_w / 2
        parts.append(f'<text x="{x:.1f}" y="{margin_top-12}" text-anchor="middle" font-size="12" font-family="sans-serif">{esc(key)}</text>')
    for i, row_name in enumerate(rows):
        y = margin_top + i * cell_h
        parts.append(f'<text x="{margin_left-10}" y="{y+18:.1f}" text-anchor="end" font-size="12" font-family="sans-serif">{esc(row_name)}</text>')
        for j, val in enumerate(matrix[i]):
            x = margin_left + j * cell_w
            frac = 0 if max_val == 0 else val / max_val
            r = 255
            g = int(245 - 120 * frac)
            b = int(235 - 210 * frac)
            color = f'rgb({r},{max(0,g)},{max(0,b)})'
            parts.append(f'<rect x="{x}" y="{y}" width="{cell_w}" height="{cell_h}" fill="{color}" stroke="#ffffff"/>')
            parts.append(f'<text x="{x+cell_w/2:.1f}" y="{y+18:.1f}" text-anchor="middle" font-size="11" font-family="sans-serif">{val:.3f}</text>')
    parts.append('</svg>')
    with open(out_svg, "w") as fh:
        fh.write("\n".join(parts))


def main():
    repo_root = os.getcwd()
    root = os.path.join(repo_root, "HeCBench", "results", "llvm17_inject")
    out_dir = os.path.join(root, "visualizations")
    os.makedirs(out_dir, exist_ok=True)

    per_bp, overall = collect_counts(root)
    out_csv = os.path.join(out_dir, "taxonomy_distribution_benchmark_phase.csv")
    out_stacked = os.path.join(out_dir, "taxonomy_distribution_benchmark_phase.svg")
    out_heatmap = os.path.join(out_dir, "taxonomy_distribution_heatmap.svg")

    write_csv(out_csv, per_bp, overall)
    plot_stacked_svg(out_stacked, per_bp)
    plot_heatmap_svg(out_heatmap, per_bp)

    print(out_csv)
    print(out_stacked)
    print(out_heatmap)


if __name__ == "__main__":
    main()
