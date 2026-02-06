#!/usr/bin/env python3
import csv, os
import matplotlib.pyplot as plt
from matplotlib.colors import ListedColormap
import matplotlib.patches as mpatches
import numpy as np

def load_ordered_results(results_dir, worklist_pruned, results_csv=None):
    if results_csv and os.path.exists(results_csv):
        rows = []
        with open(results_csv, newline='') as fh:
            r = csv.DictReader(fh)
            for row in r:
                try:
                    site = int(row['site_id']); bit = int(row['bit_index'])
                except Exception:
                    continue
                res = row.get('result', '').strip().upper()
                if not res:
                    continue
                rows.append((site, bit, res))
        rows.sort(key=lambda x: (x[0], x[1]))
        return rows

    if not os.path.exists(worklist_pruned):
        raise SystemExit(f'missing {worklist_pruned}')
    pairs = []
    with open(worklist_pruned, newline='') as fh:
        r = csv.DictReader(fh)
        for row in r:
            try:
                site = int(row['site_id']); bit = int(row['bit_index'])
            except Exception:
                continue
            pairs.append((site, bit))
    pairs.sort()

    vals = []
    for site, bit in pairs:
        out_path = os.path.join(results_dir, f"site{site}_bit{bit}.out")
        if not os.path.exists(out_path):
            continue
        result = None
        with open(out_path, 'r', errors='ignore') as fh:
            for line in fh:
                if line.startswith("Result:"):
                    result = line.strip().split()[1].upper()
        if result is None:
            continue
        vals.append((site, bit, result))
    vals.sort(key=lambda x: (x[0], x[1]))
    return vals

layout_dir = '/home/mdunlavy/GPU_FI/HeCBench/results/fi_debug_3phase/layout/float'
layout_worklist = '/home/mdunlavy/GPU_FI/HeCBench/results/llvm17_inject/layout/worklist_aligned.csv'
layout_results_csv = '/home/mdunlavy/GPU_FI/plots/layout_float_results_plot.csv'

matrix_dir = '/home/mdunlavy/GPU_FI/HeCBench/results/llvm17_inject/matrix-rotate/float'
matrix_worklist = '/home/mdunlavy/GPU_FI/HeCBench/results/llvm17_inject/matrix-rotate-sycl/worklist_sycl_aligned.csv'
matrix_results_csv = '/home/mdunlavy/GPU_FI/plots/matrix_rotate_float_results_plot.csv'

layout_rows = load_ordered_results(layout_dir, layout_worklist, layout_results_csv)
matrix_rows = load_ordered_results(matrix_dir, matrix_worklist, matrix_results_csv)

def norm_result(res):
    r = (res or "").strip().upper()
    if r.startswith("MASK"):
        return "MASKED"
    if r.startswith("SDC"):
        return "SDC"
    if r.startswith("FAIL"):
        return "FAILURE"
    return "UNKNOWN"

label_to_val = {'MASKED':0, 'SDC':1, 'FAILURE':2, 'UNKNOWN':0}
layout_vals = [label_to_val.get(norm_result(res), 0) for _,_,res in layout_rows]
matrix_vals = [label_to_val.get(norm_result(res), 0) for _,_,res in matrix_rows]

res_cmap = ListedColormap(['#2ca02c', '#ff7f0e', '#0066FF'])

arr_layout = np.array(layout_vals)[None, :]
arr_matrix = np.array(matrix_vals)[None, :]

fig_w = max(10, max(len(layout_vals), len(matrix_vals))/200)
fig_h = 3.0
fig, ax = plt.subplots(2,1, figsize=(fig_w, fig_h), gridspec_kw={'height_ratios':[0.6,0.6]})

ax[0].imshow(arr_matrix, aspect='auto', cmap=res_cmap, interpolation='nearest', vmin=0, vmax=2,
             extent=(0, 1, -0.5, 0.5))
ax[0].set_yticks([0]); ax[0].set_yticklabels(['matrix-rotate'])
ax[0].set_xticks([])
ax[0].set_xlim(0, 1)

ax[1].imshow(arr_layout, aspect='auto', cmap=res_cmap, interpolation='nearest', vmin=0, vmax=2,
             extent=(0, 1, -0.5, 0.5))
ax[1].set_yticks([0]); ax[1].set_yticklabels(['layout'])
ax[1].set_xticks([])
ax[1].set_xlim(0, 1)

# Make FAILURE bars thicker (overlay taller rectangles)
def overlay_failures(axis, vals):
    for i, v in enumerate(vals):
        if v == 2:  # FAILURE
            axis.add_patch(plt.Rectangle((i-0.5, -0.7), 1.0, 1.4, color='#0066FF', alpha=1.0, linewidth=0))

overlay_failures(ax[0], matrix_vals)
overlay_failures(ax[1], layout_vals)

legend = [
    mpatches.Patch(color='#2ca02c', label='MASKED'),
    mpatches.Patch(color='#ff7f0e', label='SDC'),
    mpatches.Patch(color='#0066FF', label='FAILURE'),
]
ax[0].legend(handles=legend, loc='center left', bbox_to_anchor=(1.01, 0.5), frameon=False, prop={'size':12})

plt.subplots_adjust(hspace=0.25)
out_png = '/home/mdunlavy/GPU_FI/plots/layout_float_ordered_opcode.png'
plt.tight_layout()
plt.savefig(out_png, dpi=200, bbox_inches='tight')
print(out_png)
