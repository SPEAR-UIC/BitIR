#!/usr/bin/env python3
import argparse
import csv
import os
import math
from collections import defaultdict


def load_summary(summary_path):
    outcomes = {}
    with open(summary_path, newline="") as fh:
        r = csv.DictReader(fh)
        for row in r:
            try:
                site = int(row.get("site_id", ""))
                bit = int(row.get("bit_index", ""))
            except Exception:
                continue
            res = (row.get("result") or "").strip().upper()
            if res in ("MASKED", "SDC", "FAILURE"):
                outcomes[(site, bit)] = res
    return outcomes


def load_worklist(path):
    rows = []
    with open(path, newline="") as fh:
        r = csv.DictReader(fh)
        for row in r:
            try:
                site = int(row.get("site_id", ""))
                bit = int(row.get("bit_index", ""))
            except Exception:
                continue
            opcode = (row.get("opcode") or "").strip()
            type_kind = (row.get("type_kind") or "").strip()
            bitwidth = row.get("bitwidth") or row.get("type_width") or ""
            try:
                bitwidth = int(bitwidth)
            except Exception:
                bitwidth = None
            rows.append((site, bit, opcode, type_kind, bitwidth))
    return rows


def per_site_sensitivity(rows, outcomes):
    counts = defaultdict(lambda: {"MASKED": 0, "SDC": 0, "FAILURE": 0, "TOTAL": 0})
    for site, bit, *_ in rows:
        res = outcomes.get((site, bit))
        if res is None:
            continue
        counts[site][res] += 1
        counts[site]["TOTAL"] += 1
    return counts


def per_bit_sensitivity(rows, outcomes):
    counts = defaultdict(lambda: {"MASKED": 0, "SDC": 0, "FAILURE": 0, "TOTAL": 0})
    for site, bit, *_ in rows:
        res = outcomes.get((site, bit))
        if res is None:
            continue
        counts[bit][res] += 1
        counts[bit]["TOTAL"] += 1
    return counts


def per_opcode_type(rows, outcomes):
    counts = defaultdict(lambda: {"MASKED": 0, "SDC": 0, "FAILURE": 0, "TOTAL": 0})
    for site, bit, opcode, type_kind, _ in rows:
        res = outcomes.get((site, bit))
        if res is None:
            continue
        key = f"{opcode}|{type_kind}"
        counts[key][res] += 1
        counts[key]["TOTAL"] += 1
    return counts


def per_opcode(rows, outcomes):
    counts = defaultdict(lambda: {"MASKED": 0, "SDC": 0, "FAILURE": 0, "TOTAL": 0})
    for site, bit, opcode, _type_kind, _bw in rows:
        res = outcomes.get((site, bit))
        if res is None:
            continue
        key = opcode or "unknown"
        counts[key][res] += 1
        counts[key]["TOTAL"] += 1
    return counts


def per_opcode_bitwidth(rows, outcomes):
    counts = defaultdict(lambda: {"MASKED": 0, "SDC": 0, "FAILURE": 0, "TOTAL": 0})
    for site, bit, opcode, _type_kind, bw in rows:
        res = outcomes.get((site, bit))
        if res is None:
            continue
        bw_s = str(bw) if bw is not None else "na"
        key = f"{opcode or 'unknown'}:{bw_s}"
        counts[key][res] += 1
        counts[key]["TOTAL"] += 1
    return counts


def site_opcode_rates(rows, outcomes, opcodes):
    # matrix: site x opcode -> (sdc+failure)/total
    site_counts = defaultdict(lambda: {op: {"SDC": 0, "FAILURE": 0, "TOTAL": 0} for op in opcodes})
    for site, bit, opcode, _type_kind, _bw in rows:
        res = outcomes.get((site, bit))
        if res is None:
            continue
        op = opcode or "unknown"
        if op not in opcodes:
            continue
        cell = site_counts[site][op]
        cell["TOTAL"] += 1
        if res in ("SDC", "FAILURE"):
            cell[res] += 1
    sites = sorted(site_counts.keys())
    data = []
    for s in sites:
        row = []
        for op in opcodes:
            c = site_counts[s][op]
            total = c["TOTAL"] or 0
            rate = (c["SDC"] + c["FAILURE"]) / total if total else 0.0
            row.append(rate)
        data.append(row)
    return sites, data


def kmeans(X, k=6, iters=50):
    # simple kmeans without sklearn
    import random
    n = len(X)
    if n == 0:
        return [], []
    k = min(k, n)
    centers = [X[i][:] for i in random.sample(range(n), k)]
    labels = [0] * n
    for _ in range(iters):
        changed = False
        for i, x in enumerate(X):
            best = 0
            best_d = float("inf")
            for c, center in enumerate(centers):
                d = sum((x[j] - center[j]) ** 2 for j in range(len(x)))
                if d < best_d:
                    best_d = d
                    best = c
            if labels[i] != best:
                labels[i] = best
                changed = True
        if not changed:
            break
        # update centers
        sums = [[0.0] * len(X[0]) for _ in range(k)]
        counts = [0] * k
        for i, x in enumerate(X):
            c = labels[i]
            counts[c] += 1
            for j in range(len(x)):
                sums[c][j] += x[j]
        for c in range(k):
            if counts[c] == 0:
                continue
            centers[c] = [s / counts[c] for s in sums[c]]
    return labels, centers


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--bench", required=True)
    ap.add_argument("--summary", required=True)
    ap.add_argument("--worklist", required=True)
    ap.add_argument("--out-dir", required=True)
    ap.add_argument("--k", type=int, default=6)
    ap.add_argument("--fine-cluster", action="store_true")
    ap.add_argument("--max-opcode-bars", type=int, default=20)
    ap.add_argument("--max-opcode-matrix", type=int, default=30)
    args = ap.parse_args()

    import matplotlib.pyplot as plt
    import numpy as np

    outcomes = load_summary(args.summary)
    rows = load_worklist(args.worklist)
    os.makedirs(args.out_dir, exist_ok=True)

    # Option 1: Per-site sensitivity (sorted)
    site_counts = per_site_sensitivity(rows, outcomes)
    sites = sorted(site_counts.keys())
    sens = []
    for s in sites:
        total = site_counts[s]["TOTAL"] or 1
        sens.append((site_counts[s]["SDC"] + site_counts[s]["FAILURE"]) / total)
    order = np.argsort(sens)[::-1]
    sens_sorted = [sens[i] for i in order]
    plt.figure(figsize=(10, 4))
    plt.plot(range(len(sens_sorted)), sens_sorted, linewidth=1.0)
    plt.title(f"{args.bench}: Per-site sensitivity (sorted)")
    plt.xlabel("Site rank (highest sensitivity first)")
    plt.ylabel("SDC+Failure rate")
    plt.tight_layout()
    plt.figtext(0.5, 0.01, "Option 1: per-site sensitivity curve", ha="center", fontsize=9)
    plt.savefig(os.path.join(args.out_dir, f"{args.bench}_opt1_site_sensitivity.png"), dpi=300)
    plt.close()

    # Option 2: Bit-position sensitivity
    bit_counts = per_bit_sensitivity(rows, outcomes)
    bits = sorted(bit_counts.keys())
    bit_sens = []
    for b in bits:
        total = bit_counts[b]["TOTAL"] or 1
        bit_sens.append((bit_counts[b]["SDC"] + bit_counts[b]["FAILURE"]) / total)
    plt.figure(figsize=(10, 4))
    plt.plot(bits, bit_sens, linewidth=1.0)
    plt.title(f"{args.bench}: Bit-position sensitivity")
    plt.xlabel("Bit index")
    plt.ylabel("SDC+Failure rate")
    plt.tight_layout()
    plt.figtext(0.5, 0.01, "Option 2: bit-position sensitivity", ha="center", fontsize=9)
    plt.savefig(os.path.join(args.out_dir, f"{args.bench}_opt2_bit_sensitivity.png"), dpi=300)
    plt.close()

    # Option 3: Opcode/type bar chart (top N by total)
    op_counts = per_opcode_type(rows, outcomes)
    items = sorted(op_counts.items(), key=lambda kv: kv[1]["TOTAL"], reverse=True)[: args.max_opcode_bars]
    labels = [k for k, _ in items]
    rates = [((v["SDC"] + v["FAILURE"]) / (v["TOTAL"] or 1)) for _, v in items]
    plt.figure(figsize=(12, 6))
    plt.bar(range(len(labels)), rates)
    plt.xticks(range(len(labels)), labels, rotation=75, ha="right", fontsize=7)
    plt.title(f"{args.bench}: Opcode/type sensitivity (top 20)")
    plt.ylabel("SDC+Failure rate")
    plt.ylim(0, 1)
    plt.tight_layout()
    plt.figtext(0.5, 0.01, "Option 3: opcode/type sensitivity", ha="center", fontsize=9)
    plt.savefig(os.path.join(args.out_dir, f"{args.bench}_opt3_opcode_type.png"), dpi=300)
    plt.close()

    # Option 3b: Opcode stacked outcomes
    op_counts2 = per_opcode(rows, outcomes)
    items2 = sorted(op_counts2.items(), key=lambda kv: kv[1]["TOTAL"], reverse=True)[: args.max_opcode_bars]
    labels2 = [k for k, _ in items2]
    masked = [v["MASKED"] / (v["TOTAL"] or 1) for _, v in items2]
    sdc = [v["SDC"] / (v["TOTAL"] or 1) for _, v in items2]
    fail = [v["FAILURE"] / (v["TOTAL"] or 1) for _, v in items2]
    plt.figure(figsize=(12, 6))
    x = np.arange(len(labels2))
    plt.bar(x, masked, label="Masked")
    plt.bar(x, sdc, bottom=masked, label="SDC")
    plt.bar(x, fail, bottom=[masked[i] + sdc[i] for i in range(len(labels2))], label="Failure")
    plt.xticks(x, labels2, rotation=75, ha="right", fontsize=7)
    plt.ylim(0, 1)
    plt.title(f"{args.bench}: Opcode outcomes (stacked, top {len(labels2)})")
    plt.ylabel("Fraction")
    plt.legend(fontsize=8)
    plt.tight_layout()
    plt.figtext(0.5, 0.01, "Opcode outcomes: masked/sdc/failure fractions", ha="center", fontsize=9)
    plt.savefig(os.path.join(args.out_dir, f"{args.bench}_opt3b_opcode_stacked.png"), dpi=300)
    plt.close()

    # Option 3c: Opcode+bitwidth sensitivity
    opbw = per_opcode_bitwidth(rows, outcomes)
    items3 = sorted(opbw.items(), key=lambda kv: kv[1]["TOTAL"], reverse=True)[: args.max_opcode_bars]
    labels3 = [k for k, _ in items3]
    rates3 = [((v["SDC"] + v["FAILURE"]) / (v["TOTAL"] or 1)) for _, v in items3]
    plt.figure(figsize=(12, 6))
    plt.bar(range(len(labels3)), rates3)
    plt.xticks(range(len(labels3)), labels3, rotation=75, ha="right", fontsize=7)
    plt.ylim(0, 1)
    plt.title(f"{args.bench}: Opcode+bitwidth sensitivity (top {len(labels3)})")
    plt.ylabel("SDC+Failure rate")
    plt.tight_layout()
    plt.figtext(0.5, 0.01, "Opcode+bitwidth sensitivity", ha="center", fontsize=9)
    plt.savefig(os.path.join(args.out_dir, f"{args.bench}_opt3c_opcode_bw.png"), dpi=300)
    plt.close()

    # Option 4: CDF of per-site sensitivity
    sens_sorted2 = sorted(sens)
    y = np.linspace(0, 1, len(sens_sorted2), endpoint=True)
    plt.figure(figsize=(6, 4))
    plt.plot(sens_sorted2, y, linewidth=1.0)
    plt.title(f"{args.bench}: CDF of site sensitivity")
    plt.xlabel("SDC+Failure rate")
    plt.ylabel("CDF")
    plt.tight_layout()
    plt.figtext(0.5, 0.01, "Option 4: CDF over site sensitivity", ha="center", fontsize=9)
    plt.savefig(os.path.join(args.out_dir, f"{args.bench}_opt4_cdf.png"), dpi=300)
    plt.close()

    # Option 5: Clustering heatmap (simple k-means on site features)
    features = []
    for s in sites:
        total = site_counts[s]["TOTAL"] or 1
        masked = site_counts[s]["MASKED"] / total
        sdc = site_counts[s]["SDC"] / total
        fail = site_counts[s]["FAILURE"] / total
        features.append([masked, sdc, fail])
    labels, centers = kmeans(features, k=args.k, iters=50)
    if centers:
        data = np.array(centers)
        plt.figure(figsize=(6, 3))
        plt.imshow(data, aspect="auto", interpolation="nearest", cmap="viridis", vmin=0, vmax=1)
        plt.colorbar()
        plt.title(f"{args.bench}: Clustered site profiles (k={len(centers)})")
        plt.xlabel("Feature (masked, sdc, failure)")
        plt.ylabel("Cluster")
        plt.xticks([0, 1, 2], ["Masked", "SDC", "Failure"])
        plt.tight_layout()
        plt.figtext(0.5, 0.01, "Option 5: k-means cluster centroids", ha="center", fontsize=9)
        plt.savefig(os.path.join(args.out_dir, f"{args.bench}_opt5_cluster.png"), dpi=300)
        plt.close()

    # Option 5b: Fine-grain clustered site heatmap (rows = sites ordered by cluster)
    if args.fine_cluster and labels:
        order = sorted(range(len(labels)), key=lambda i: (labels[i], i))
        fine = np.array([features[i] for i in order])
        plt.figure(figsize=(6, 8))
        plt.imshow(fine, aspect="auto", interpolation="nearest", cmap="viridis", vmin=0, vmax=1)
        plt.colorbar()
        plt.title(f"{args.bench}: Clustered sites (fine-grain, k={args.k})")
        plt.xlabel("Feature (masked, sdc, failure)")
        plt.ylabel("Site (cluster-ordered)")
        plt.xticks([0, 1, 2], ["Masked", "SDC", "Failure"])
        plt.tight_layout()
        plt.figtext(0.5, 0.01, "Option 5b: per-site features ordered by cluster", ha="center", fontsize=9)
        plt.savefig(os.path.join(args.out_dir, f"{args.bench}_opt5b_cluster_sites.png"), dpi=300)
        plt.close()

    # Option 6: Site x Opcode heatmap (SDC+Failure rates, top opcodes)
    op_counts3 = per_opcode(rows, outcomes)
    top_ops = [k for k, _ in sorted(op_counts3.items(), key=lambda kv: kv[1]["TOTAL"], reverse=True)[: args.max_opcode_matrix]]
    if top_ops:
        sites2, data2 = site_opcode_rates(rows, outcomes, top_ops)
        if data2:
            plt.figure(figsize=(12, 8))
            plt.imshow(data2, aspect="auto", interpolation="nearest", cmap="magma", vmin=0, vmax=1)
            plt.colorbar()
            plt.title(f"{args.bench}: Site x Opcode sensitivity (top {len(top_ops)} opcodes)")
            plt.xlabel("Opcode")
            plt.ylabel("Site (sorted)")
            plt.xticks(range(len(top_ops)), top_ops, rotation=75, ha="right", fontsize=7)
            plt.tight_layout()
            plt.figtext(0.5, 0.01, "Site x opcode SDC+Failure rate", ha="center", fontsize=9)
            plt.savefig(os.path.join(args.out_dir, f"{args.bench}_opt6_site_opcode.png"), dpi=300)
            plt.close()

    print(f"plots written to {args.out_dir}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
