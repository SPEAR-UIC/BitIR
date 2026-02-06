#!/usr/bin/env python3
import csv, os
import matplotlib.pyplot as plt
from matplotlib.colors import ListedColormap
import numpy as np
from collections import Counter

summary = '/home/mdunlavy/GPU_FI/HeCBench/results/fi_debug_3phase/layout/float/summary.csv'
worklist = '/home/mdunlavy/GPU_FI/HeCBench/results/llvm17_inject/layout/worklist_plot.csv'
if not os.path.exists(summary):
    raise SystemExit(f'missing {summary}')
if not os.path.exists(worklist):
    raise SystemExit(f'missing {worklist}')

# map (site,bit) -> function
fn_map = {}
with open(worklist, newline='') as fh:
    r = csv.DictReader(fh)
    for row in r:
        try:
            site = int(row['site_id']); bit = int(row['bit_index'])
        except Exception:
            continue
        fn = row.get('function','').strip() or 'UNK'
        fn_map[(site,bit)] = fn

rows = []
with open(summary, newline='') as fh:
    r = csv.DictReader(fh)
    for row in r:
        try:
            site = int(row['site_id']); bit = int(row['bit_index'])
        except Exception:
            continue
        res = row.get('result','').strip().upper()
        fn = fn_map.get((site,bit), 'UNK')
        rows.append((site, bit, res, fn))

rows.sort(key=lambda x: (x[0], x[1]))

label_to_val = {'MASKED':0, 'SDC':1, 'FAILURE':2}
vals = [label_to_val.get(res,0) for _,_,res,_ in rows]

fn_counts = Counter([r[3] for r in rows])
fn_top = [f for f,_ in fn_counts.most_common(15)]
fn_index = {f:i for i,f in enumerate(fn_top)}
other_idx = len(fn_top)
fn_vals = [fn_index.get(fn, other_idx) for *_,fn in rows]

import matplotlib.cm as cm
fn_cmap = cm.get_cmap('tab20', len(fn_top)+1)
res_cmap = ListedColormap(['#2ca02c', '#ff7f0e', '#0066FF'])

arr = np.array(vals)[None,:]
fn_arr = np.array(fn_vals)[None,:]

fig_w = max(12, len(vals)/120)
fig_h = 4.6
fig, ax = plt.subplots(2,1, figsize=(fig_w, fig_h), gridspec_kw={'height_ratios':[1,1]})

ax[0].imshow(arr, aspect='auto', cmap=res_cmap, interpolation='nearest', vmin=0, vmax=2)
ax[0].set_yticks([0]); ax[0].set_yticklabels(['outcome'])
ax[0].set_xticks([])
ax[0].set_title('Layout: ordered injections with function bands')

ax[1].imshow(fn_arr, aspect='auto', cmap=fn_cmap, interpolation='nearest', vmin=0, vmax=len(fn_top))
ax[1].set_yticks([0]); ax[1].set_yticklabels(['function'])
ax[1].set_xticks([])

import matplotlib.patches as mpatches
legend = [
    mpatches.Patch(color='#2ca02c', label='MASKED'),
    mpatches.Patch(color='#ff7f0e', label='SDC'),
    mpatches.Patch(color='#0066FF', label='FAILURE'),
]
ax[0].legend(handles=legend, loc='center left', bbox_to_anchor=(1.01,0.5), frameon=False)

# function legend (top 15 + OTHER), sanitize leading '_' to show
fn_legend = []
for f in fn_top:
    label = f if not f.startswith('_') else f'fn:{f}'
    fn_legend.append(mpatches.Patch(color=fn_cmap(fn_index[f]), label=label))
fn_legend.append(mpatches.Patch(color=fn_cmap(other_idx), label='OTHER'))
ax[1].legend(handles=fn_legend, loc='center left', bbox_to_anchor=(1.01,0.5), frameon=False, fontsize=8)

plt.tight_layout()
out = '/home/mdunlavy/GPU_FI/plots/layout_function_timeline.png'
plt.savefig(out, dpi=200, bbox_inches='tight')
print(out)
