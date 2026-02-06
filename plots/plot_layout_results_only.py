#!/usr/bin/env python3
import csv
import os
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.colors import ListedColormap
import matplotlib.patches as mpatches

results_csv = '/home/mdunlavy/GPU_FI/plots/layout_float_results_plot.csv'
if not os.path.exists(results_csv):
    raise SystemExit(f'missing {results_csv}')

rows = []
with open(results_csv, newline='') as fh:
    r = csv.DictReader(fh)
    for row in r:
        try:
            site = int(row['site_id']); bit = int(row['bit_index'])
        except Exception:
            continue
        res = (row.get('result') or '').strip().upper()
        if not res:
            continue
        rows.append((site, bit, res))

rows.sort(key=lambda x: (x[0], x[1]))
label_to_val = {'MASKED':0, 'SDC':1, 'FAILURE':2, 'UNKNOWN':0}
vals = [label_to_val.get(res, 0) for _,_,res in rows]

arr = np.array(vals)[None, :]
res_cmap = ListedColormap(['#2ca02c', '#ff7f0e', '#0066FF'])

fig_w = max(10, len(vals)/200)
fig_h = 1.8
fig, ax = plt.subplots(1,1, figsize=(fig_w, fig_h))

ax.imshow(arr, aspect='auto', cmap=res_cmap, interpolation='nearest', vmin=0, vmax=2)
ax.set_yticks([0]); ax.set_yticklabels(['result'])
ax.set_xticks([])
ax.set_title('Layout float/int ordered by (site, bit)')

legend = [
    mpatches.Patch(color='#2ca02c', label='MASKED'),
    mpatches.Patch(color='#ff7f0e', label='SDC'),
    mpatches.Patch(color='#0066FF', label='FAILURE'),
]
ax.legend(handles=legend, loc='center left', bbox_to_anchor=(1.01, 0.5), frameon=False, prop={'size':12})

out_png = '/home/mdunlavy/GPU_FI/plots/layout_float_results_only.png'
plt.tight_layout()
plt.savefig(out_png, dpi=200, bbox_inches='tight')
print(out_png)
