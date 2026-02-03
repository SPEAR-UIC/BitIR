#!/usr/bin/env python3
import argparse
import csv
import os
import re
from collections import defaultdict


RESULT_RE = re.compile(r"^Result:\\s+(MASKED|SDC|FAILURE)\\b")


def load_pruned_pairs(path):
    pairs = []
    with open(path, newline="") as fh:
        r = csv.DictReader(fh)
        for row in r:
            try:
                site = int(row["site_id"])
                bit = int(row["bit_index"])
            except Exception:
                continue
            pairs.append((site, bit))
    return pairs


def outcome_from_out(out_path, err_path):
    try:
        with open(out_path) as fh:
            for line in fh:
                m = RESULT_RE.match(line.strip())
                if m:
                    return m.group(1)
                low = line.strip().lower()
                if low == "compare_ok":
                    return "MASKED"
                if low == "mismatch":
                    return "SDC"
    except OSError:
        return None
    # If no explicit outcome in .out, treat non-empty .err as FAILURE
    try:
        if err_path and os.path.exists(err_path) and os.path.getsize(err_path) > 0:
            return "FAILURE"
    except OSError:
        pass
    return None


def build_outcome_map(results_dir, pairs, summary_path=None):
    outcomes = {}
    if summary_path and os.path.exists(summary_path):
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
        for site, bit in pairs:
            outcomes.setdefault((site, bit), None)
        return outcomes
    for site, bit in pairs:
        out_path = os.path.join(results_dir, f"site{site}_bit{bit}.out")
        err_path = os.path.join(results_dir, f"site{site}_bit{bit}.err")
        outcome = outcome_from_out(out_path, err_path)
        outcomes[(site, bit)] = outcome
    return outcomes


def ensure_matplotlib():
    try:
        import matplotlib.pyplot as plt  # noqa: F401
        return True
    except Exception:
        return False


def plot_option_a(outcomes, sites, max_bit, out_path, mode="grid", dpi=300):
    import matplotlib.pyplot as plt
    import numpy as np

    outcome_to_val = {"MASKED": 0, "SDC": 1, "FAILURE": 2}
    cmap = plt.get_cmap("viridis", 3)
    if mode == "scatter":
        xs = []
        ys = []
        cs = []
        site_index = {s: i for i, s in enumerate(sites)}
        for (site, bit), val in outcomes.items():
            if val not in outcome_to_val:
                continue
            xs.append(bit)
            ys.append(site_index[site])
            cs.append(outcome_to_val[val])
        plt.figure(figsize=(12, 8))
        plt.scatter(xs, ys, c=cs, cmap=cmap, vmin=0, vmax=2, s=2, marker="s")
        cbar = plt.colorbar(ticks=[0, 1, 2])
        cbar.ax.set_yticklabels(["Masked", "SDC", "Failure"])
        plt.title("Option A (fine): Site x Bit outcome scatter")
        plt.xlabel("Bit index")
        plt.ylabel("Site id (sorted index)")
        plt.tight_layout()
        plt.figtext(0.5, 0.01, "Each square is one site/bit pair; no-data pairs are omitted.", ha="center", fontsize=9)
        plt.savefig(out_path, dpi=dpi)
        plt.close()
        return

    data = np.full((len(sites), max_bit + 1), -1, dtype=int)
    for i, site in enumerate(sites):
        for bit in range(max_bit + 1):
            val = outcomes.get((site, bit))
            if val in outcome_to_val:
                data[i, bit] = outcome_to_val[val]

    cmap = plt.get_cmap("viridis", 4)
    plt.figure(figsize=(12, 8))
    plt.imshow(data, aspect="auto", interpolation="nearest", cmap=cmap, vmin=-1, vmax=2)
    cbar = plt.colorbar(ticks=[-1, 0, 1, 2])
    cbar.ax.set_yticklabels(["No data", "Masked", "SDC", "Failure"])
    plt.title("Option A: Site x Bit outcome heatmap")
    plt.xlabel("Bit index")
    plt.ylabel("Site id (sorted)")
    plt.tight_layout()
    plt.figtext(0.5, 0.01, "Each cell shows the outcome for a site/bit pair.", ha="center", fontsize=9)
    plt.savefig(out_path, dpi=dpi)
    plt.close()


def plot_dense_packed(outcomes, pairs, out_path, width=128, dpi=300):
    import matplotlib.pyplot as plt
    import numpy as np

    outcome_to_val = {"MASKED": 0, "SDC": 1, "FAILURE": 2}
    ordered = []
    for site, bit in pairs:
        ordered.append(outcomes.get((site, bit)))
    n = len(ordered)
    rows = (n + width - 1) // width
    data = np.full((rows, width), -1, dtype=int)
    for idx, val in enumerate(ordered):
        r = idx // width
        c = idx % width
        if val in outcome_to_val:
            data[r, c] = outcome_to_val[val]
    cmap = plt.get_cmap("viridis", 4)
    plt.figure(figsize=(12, 8))
    plt.imshow(data, aspect="auto", interpolation="nearest", cmap=cmap, vmin=-1, vmax=2)
    cbar = plt.colorbar(ticks=[-1, 0, 1, 2])
    cbar.ax.set_yticklabels(["No data", "Masked", "SDC", "Failure"])
    plt.title(f"Dense packed heatmap (width={width})")
    plt.xlabel("Packed column")
    plt.ylabel("Packed row")
    plt.tight_layout()
    plt.figtext(0.5, 0.01, "Pairs are packed in worklist order to remove gaps.", ha="center", fontsize=9)
    plt.savefig(out_path, dpi=dpi)
    plt.close()


def plot_option_b(outcomes, sites, max_bit, out_path, dpi=300):
    import matplotlib.pyplot as plt
    import numpy as np

    data = np.zeros((len(sites), 3), dtype=float)
    for i, site in enumerate(sites):
        counts = defaultdict(int)
        total = 0
        for bit in range(max_bit + 1):
            val = outcomes.get((site, bit))
            if val:
                counts[val] += 1
                total += 1
        if total > 0:
            data[i, 0] = counts["MASKED"] / total
            data[i, 1] = counts["SDC"] / total
            data[i, 2] = counts["FAILURE"] / total
        else:
            data[i, :] = 0.0

    plt.figure(figsize=(8, 6))
    plt.imshow(data, aspect="auto", interpolation="nearest", cmap="magma", vmin=0, vmax=1)
    plt.colorbar()
    plt.title("Option B: Per-site outcome rates")
    plt.xlabel("Outcome (0=Masked,1=SDC,2=Failure)")
    plt.ylabel("Site id (sorted)")
    plt.xticks([0, 1, 2], ["Masked", "SDC", "Failure"])
    plt.tight_layout()
    plt.figtext(0.5, 0.01, "Each row shows fraction of outcomes for that site.", ha="center", fontsize=9)
    plt.savefig(out_path, dpi=dpi)
    plt.close()


def plot_option_c(outcomes, sites, max_bit, out_path, dpi=300):
    import matplotlib.pyplot as plt
    import numpy as np

    data = np.zeros((max_bit + 1, 3), dtype=float)
    for bit in range(max_bit + 1):
        counts = defaultdict(int)
        total = 0
        for site in sites:
            val = outcomes.get((site, bit))
            if val:
                counts[val] += 1
                total += 1
        if total > 0:
            data[bit, 0] = counts["MASKED"] / total
            data[bit, 1] = counts["SDC"] / total
            data[bit, 2] = counts["FAILURE"] / total
        else:
            data[bit, :] = 0.0

    plt.figure(figsize=(8, 6))
    plt.imshow(data, aspect="auto", interpolation="nearest", cmap="magma", vmin=0, vmax=1)
    plt.colorbar()
    plt.title("Option C: Per-bit outcome rates")
    plt.xlabel("Outcome (0=Masked,1=SDC,2=Failure)")
    plt.ylabel("Bit index")
    plt.xticks([0, 1, 2], ["Masked", "SDC", "Failure"])
    plt.tight_layout()
    plt.figtext(0.5, 0.01, "Each row shows fraction of outcomes for that bit.", ha="center", fontsize=9)
    plt.savefig(out_path, dpi=dpi)
    plt.close()


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--bench", required=True)
    ap.add_argument("--results-dir", required=True)
    ap.add_argument("--pruned-worklist", required=True)
    ap.add_argument("--out-dir", required=True)
    ap.add_argument("--summary", default="")
    ap.add_argument("--mode", choices=["grid","scatter"], default="scatter")
    ap.add_argument("--dpi", type=int, default=300)
    ap.add_argument("--dense-widths", default="64,128,256")
    args = ap.parse_args()

    pairs = load_pruned_pairs(args.pruned_worklist)
    if not pairs:
        print("No pairs found in pruned worklist.")
        return 2

    sites = sorted({s for s, _ in pairs})
    max_bit = max(b for _, b in pairs)
    summary_path = args.summary if args.summary else os.path.join(args.results_dir, "summary.csv")
    outcomes = build_outcome_map(args.results_dir, pairs, summary_path=summary_path)

    os.makedirs(args.out_dir, exist_ok=True)

    if not ensure_matplotlib():
        print("matplotlib not available; cannot generate plots.")
        return 3

    plot_option_a(outcomes, sites, max_bit, os.path.join(args.out_dir, f"{args.bench}_optA_site_bit.png"), mode=args.mode, dpi=args.dpi)
    plot_option_b(outcomes, sites, max_bit, os.path.join(args.out_dir, f"{args.bench}_optB_site_rates.png"), dpi=args.dpi)
    plot_option_c(outcomes, sites, max_bit, os.path.join(args.out_dir, f"{args.bench}_optC_bit_rates.png"), dpi=args.dpi)
    widths = []
    for w in args.dense_widths.split(","):
        w = w.strip()
        if not w:
            continue
        try:
            widths.append(int(w))
        except Exception:
            pass
    for w in widths:
        out_path = os.path.join(args.out_dir, f"{args.bench}_dense_width{w}.png")
        plot_dense_packed(outcomes, pairs, out_path, width=w, dpi=args.dpi)
    print("plots written to", args.out_dir)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
