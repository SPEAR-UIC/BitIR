#!/usr/bin/env python3
import csv, os, math
from collections import defaultdict, Counter
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.colors import ListedColormap
from matplotlib.sankey import Sankey

summary = '/home/mdunlavy/GPU_FI/HeCBench/results/fi_debug_3phase/layout/float/summary.csv'
worklist = '/home/mdunlavy/GPU_FI/HeCBench/results/llvm17_inject/layout/worklist_plot.csv'
out_dir = '/home/mdunlavy/GPU_FI/plots'
os.makedirs(out_dir, exist_ok=True)

if not os.path.exists(summary):
    raise SystemExit(f'missing {summary}')
if not os.path.exists(worklist):
    raise SystemExit(f'missing {worklist}')

# Load opcode map
op_map = {}
with open(worklist, newline='') as fh:
    r = csv.DictReader(fh)
    for row in r:
        try:
            site = int(row['site_id']); bit = int(row['bit_index'])
        except Exception:
            continue
        opcode = row.get('opcode','').strip() or 'UNK'
        op_map[(site,bit)] = opcode

# Load outcomes
rows = []
with open(summary, newline='') as fh:
    r = csv.DictReader(fh)
    for row in r:
        try:
            site = int(row['site_id']); bit = int(row['bit_index'])
        except Exception:
            continue
        res = row.get('result','').strip().upper()
        opcode = op_map.get((site,bit), 'UNK')
        rows.append((site, bit, opcode, res))

rows.sort(key=lambda x: (x[0], x[1]))

# Common data
op_counts = Counter([r[2] for r in rows])
ops_top = [op for op,_ in op_counts.most_common(20)]

# Map result to numeric
res_val = {'MASKED':0, 'SDC':1, 'FAILURE':2}

# 1) Opcode x bit index heatmap (non-masked ratio)
max_bit = max(r[1] for r in rows) if rows else 0
bits = list(range(max_bit+1))
mat = np.zeros((len(ops_top), len(bits)))
count = np.zeros_like(mat)
for site, bit, opcode, res in rows:
    if opcode not in ops_top: continue
    i = ops_top.index(opcode)
    j = bit
    count[i,j] += 1
    if res != 'MASKED':
        mat[i,j] += 1
mat = np.divide(mat, count, out=np.zeros_like(mat), where=count>0)

plt.figure(figsize=(12, max(4,len(ops_top)*0.3)))
plt.imshow(mat, aspect='auto', cmap='magma', interpolation='nearest')
plt.colorbar(label='Non-masked ratio')
plt.yticks(range(len(ops_top)), ops_top)
plt.xticks(range(0,len(bits), max(1,len(bits)//8)))
plt.title('Layout: opcode × bit index non-masked ratio')
plt.tight_layout()
plt.savefig(os.path.join(out_dir,'layout_opcode_bit_heatmap.png'), dpi=200)
plt.close()

# 2) Outcome density over ordered injections (moving average)
vals = [res_val.get(r[3],0) for r in rows]
window = max(10, len(vals)//50) if vals else 10
ma = np.convolve(vals, np.ones(window)/window, mode='valid') if vals else np.array([])
plt.figure(figsize=(12,3))
plt.plot(ma, color='#ff7f0e', label='Avg outcome (0=masked,2=failure)')
plt.title('Layout: moving average outcome over ordered injections')
plt.xlabel('Injection index (windowed)')
plt.ylabel('Avg outcome')
plt.legend(frameon=False)
plt.tight_layout()
plt.savefig(os.path.join(out_dir,'layout_outcome_density.png'), dpi=200)
plt.close()

# 3) Opcode ratio stacked bars (already done, regenerate as alternative)
counts_by_op = defaultdict(Counter)
for _,_,op,res in rows:
    counts_by_op[op][res]+=1
ops = [op for op,_ in op_counts.most_common(15)]
masked = []; sdc=[]; fail=[]
for op in ops:
    total = sum(counts_by_op[op].values())
    masked.append(counts_by_op[op].get('MASKED',0)/total)
    sdc.append(counts_by_op[op].get('SDC',0)/total)
    fail.append(counts_by_op[op].get('FAILURE',0)/total)

x = np.arange(len(ops))
plt.figure(figsize=(max(10,len(ops)*0.7),4))
plt.bar(x, masked, label='MASKED', color='#2ca02c')
plt.bar(x, sdc, bottom=masked, label='SDC', color='#ff7f0e')
plt.bar(x, fail, bottom=[m+s for m,s in zip(masked,sdc)], label='FAILURE', color='#0066FF')
plt.xticks(x, ops, rotation=60, ha='right')
plt.ylim(0,1)
plt.ylabel('Ratio')
plt.title('Layout: outcome ratios by opcode (top 15)')
plt.legend(frameon=False)
plt.tight_layout()
plt.savefig(os.path.join(out_dir,'layout_opcode_ratio_stacked.png'), dpi=200)
plt.close()

# 4) Clustered heatmap (kmeans on outcome ratios per opcode)
# Build vectors per opcode
vecs = []
ops_all = [op for op,_ in op_counts.most_common(30)]
for op in ops_all:
    total = sum(counts_by_op[op].values())
    if total == 0:
        vecs.append([0,0,0]); continue
    vecs.append([
        counts_by_op[op].get('MASKED',0)/total,
        counts_by_op[op].get('SDC',0)/total,
        counts_by_op[op].get('FAILURE',0)/total,
    ])
vecs = np.array(vecs)

# simple kmeans
k=4
centroids = vecs[np.random.choice(len(vecs), k, replace=False)]
for _ in range(10):
    dists = ((vecs[:,None,:]-centroids[None,:,:])**2).sum(axis=2)
    labels = dists.argmin(axis=1)
    newc = []
    for i in range(k):
        pts = vecs[labels==i]
        newc.append(pts.mean(axis=0) if len(pts)>0 else centroids[i])
    centroids = np.array(newc)

# reorder ops by cluster
order = np.argsort(labels)
plt.figure(figsize=(6, max(4,len(ops_all)*0.3)))
plt.imshow(vecs[order], aspect='auto', cmap='viridis')
plt.yticks(range(len(ops_all)), [ops_all[i] for i in order])
plt.xticks([0,1,2], ['MASKED','SDC','FAILURE'])
plt.title('Layout: opcode outcome ratios (clustered)')
plt.tight_layout()
plt.savefig(os.path.join(out_dir,'layout_opcode_clustered.png'), dpi=200)
plt.close()

# 5) Treemap (simple squarify)
# compute sizes by opcode count
sizes = [op_counts[op] for op in ops_all]
labels = ops_all

# simple squarify algorithm
rects = []
W, H = 1.0, 1.0
x0, y0 = 0.0, 0.0
sizes = np.array(sizes, dtype=float)
if sizes.sum() > 0:
    sizes = sizes / sizes.sum() * (W*H)

row = []
row_sum = 0
short_side = min(W,H)

def worst_ratio(row, row_sum, short_side):
    if not row: return float('inf')
    max_s = max(row); min_s = min(row)
    return max((short_side**2)*max_s/(row_sum**2), (row_sum**2)/((short_side**2)*min_s))

rects = []
remaining = list(sizes)
while remaining:
    s = remaining[0]
    if not row:
        row.append(s); row_sum = s
        remaining.pop(0); continue
    if worst_ratio(row+[s], row_sum+s, short_side) <= worst_ratio(row, row_sum, short_side):
        row.append(s); row_sum += s
        remaining.pop(0)
    else:
        # layout row
        if W >= H:
            row_h = row_sum / W
            cx = x0
            for r in row:
                rects.append((cx, y0, r/row_h, row_h))
                cx += r/row_h
            y0 += row_h; H -= row_h
        else:
            row_w = row_sum / H
            cy = y0
            for r in row:
                rects.append((x0, cy, row_w, r/row_w))
                cy += r/row_w
            x0 += row_w; W -= row_w
        row=[]; row_sum=0
        short_side = min(W,H)

# last row
if row:
    if W >= H:
        row_h = row_sum / W
        cx = x0
        for r in row:
            rects.append((cx, y0, r/row_h, row_h))
            cx += r/row_h
    else:
        row_w = row_sum / H
        cy = y0
        for r in row:
            rects.append((x0, cy, row_w, r/row_w))
            cy += r/row_w

plt.figure(figsize=(6,6))
ax = plt.gca()
for (x,y,w,h), label in zip(rects, labels):
    ax.add_patch(plt.Rectangle((x,y), w,h, fill=True, edgecolor='white', facecolor='#1f77b4', alpha=0.6))
    if w*h > 0.02:
        ax.text(x+w/2, y+h/2, label, ha='center', va='center', fontsize=7, color='black')
ax.set_xlim(0,1); ax.set_ylim(0,1)
ax.axis('off')
plt.title('Layout: opcode treemap (size=frequency)')
plt.tight_layout()
plt.savefig(os.path.join(out_dir,'layout_opcode_treemap.png'), dpi=200)
plt.close()

# 6) Sankey (top 6 opcodes)
ops_sankey = [op for op,_ in op_counts.most_common(6)]
flows = []
labels = []
colors = []
# Build a single Sankey diagram with opcode -> outcome
sankey = Sankey(unit=None, format='')
# flows: each opcode as input, outcomes as outputs
for op in ops_sankey:
    total = sum(counts_by_op[op].values())
    m = counts_by_op[op].get('MASKED',0)
    s = counts_by_op[op].get('SDC',0)
    f = counts_by_op[op].get('FAILURE',0)
    sankey.add(flows=[total, -m, -s, -f], labels=[op, 'MASKED', 'SDC', 'FAILURE'], orientations=[0,1,1,1])
fig = plt.figure(figsize=(8,4))
try:
    sankey.finish()
    plt.title('Layout: Sankey (top 6 opcodes)')
    plt.tight_layout()
    plt.savefig(os.path.join(out_dir,'layout_opcode_sankey.png'), dpi=200)
except Exception:
    pass
plt.close()

print('Wrote gallery plots to', out_dir)
