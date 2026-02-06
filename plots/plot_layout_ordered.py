#!/usr/bin/env python3
import csv, os
import matplotlib.pyplot as plt
from matplotlib.colors import ListedColormap

summary = '/home/mdunlavy/GPU_FI/HeCBench/results/fi_debug_3phase/layout/float/summary.csv'
if not os.path.exists(summary):
    raise SystemExit(f'missing {summary}')

rows = []
with open(summary, newline='') as fh:
    r = csv.DictReader(fh)
    for row in r:
        try:
            site = int(row['site_id']); bit = int(row['bit_index'])
        except Exception:
            continue
        res = row.get('result','').strip().upper()
        rows.append((site, bit, res))

rows.sort(key=lambda x: (x[0], x[1]))
label_to_val = {'MASKED':0, 'SDC':1, 'FAILURE':2}
vals = [label_to_val.get(res, 0) for _,_,res in rows]

import numpy as np
arr = np.array(vals)[None, :]

# Palette without UNKNOWN: green=MASKED, orange=SDC, red=FAILURE
cmap = ListedColormap(['#2ca02c', '#ff7f0e', '#d62728'])

# Make slices thicker for visibility
fig_w = max(12, len(vals)/120)
fig_h = 4
plt.figure(figsize=(fig_w, fig_h))
plt.imshow(arr, aspect='auto', cmap=cmap, interpolation='nearest', vmin=0, vmax=2)
plt.yticks([0], ['layout float/int'])
plt.xticks([])
plt.title('Layout float/int ordered by (site, bit)')

import matplotlib.patches as mpatches
legend = [
    mpatches.Patch(color='#2ca02c', label='MASKED'),
    mpatches.Patch(color='#ff7f0e', label='SDC'),
    mpatches.Patch(color='#d62728', label='FAILURE'),
]
plt.legend(handles=legend, loc='upper right', frameon=False)

out_png = '/home/mdunlavy/GPU_FI/plots/layout_float_ordered_thick.png'
out_svg = '/home/mdunlavy/GPU_FI/plots/layout_float_ordered_thick.svg'
plt.tight_layout()
plt.savefig(out_png, dpi=200)
plt.savefig(out_svg)
print(out_png)
print(out_svg)
