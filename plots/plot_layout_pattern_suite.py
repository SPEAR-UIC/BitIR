#!/usr/bin/env python3
import csv
import os
import math
from collections import Counter, defaultdict

import numpy as np
import matplotlib.pyplot as plt
from matplotlib.sankey import Sankey

summary = '/home/mdunlavy/GPU_FI/HeCBench/results/fi_debug_3phase/layout/float/summary.csv'
worklist = '/home/mdunlavy/GPU_FI/HeCBench/results/llvm17_inject/layout/worklist_plot.csv'
out_dir = '/home/mdunlavy/GPU_FI/plots'
os.makedirs(out_dir, exist_ok=True)

pretty = {
    'zext': 'zero extension',
    'sext': 'sign extension',
    'trunc': 'truncate',
    'fptoui': 'float to uint',
    'fptosi': 'float to int',
    'uitofp': 'uint to float',
    'sitofp': 'int to float',
    'fadd': 'float add',
    'fsub': 'float sub',
    'fmul': 'float mul',
    'fdiv': 'float div',
    'add': 'int add',
    'sub': 'int sub',
    'mul': 'int mul',
    'udiv': 'uint div',
    'sdiv': 'int div',
    'and': 'bitwise and',
    'or': 'bitwise or',
    'xor': 'bitwise xor',
    'shl': 'shift left',
    'lshr': 'logical shift right',
    'ashr': 'arith shift right',
    'icmp': 'int compare',
    'fcmp': 'float compare',
    'select': 'select',
    'phi': 'phi',
    'load': 'load',
    'store': 'store',
    'call': 'call',
    'getelementptr': 'getelementptr',
}

if not os.path.exists(summary):
    raise SystemExit(f'missing {summary}')
if not os.path.exists(worklist):
    raise SystemExit(f'missing {worklist}')

op_map = {}
kind_map = {}
with open(worklist, newline='') as fh:
    r = csv.DictReader(fh)
    for row in r:
        try:
            site = int(row['site_id']); bit = int(row['bit_index'])
        except Exception:
            continue
        opcode = (row.get('opcode','') or '').strip().lower()
        kind = (row.get('type_kind','') or '').strip()
        if not opcode or opcode in ('unk','unknown'):
            continue
        if not kind or kind in ('UNK','UNKNOWN'):
            continue
        op_map[(site,bit)] = opcode
        kind_map[(site,bit)] = kind

rows = []
with open(summary, newline='') as fh:
    r = csv.DictReader(fh)
    for row in r:
        try:
            site = int(row['site_id']); bit = int(row['bit_index'])
        except Exception:
            continue
        if (site,bit) not in op_map:
            continue
        outcome = (row.get('result','') or '').strip().upper()
        opcode = op_map[(site,bit)]
        kind = kind_map[(site,bit)]
        rows.append((site, bit, opcode, kind, outcome))

if not rows:
    raise SystemExit('no rows after filtering')

rows.sort(key=lambda x: (x[0], x[1]))

def outcome_score(o):
    return 0 if o == 'MASKED' else 1

# 1) Sankey-like flows: opcode -> type kind and type kind -> outcome (two panels)
op_counts = Counter([r[2] for r in rows])
top_ops = [op for op,_ in op_counts.most_common(6)]
kinds = sorted(set(r[3] for r in rows))
top_kinds = kinds[:6]

flow_op_kind = Counter()
flow_kind_out = Counter()
for site, bit, opcode, kind, outcome in rows:
    if opcode in top_ops and kind in top_kinds:
        flow_op_kind[(opcode, kind)] += 1
    if kind in top_kinds and outcome in ('MASKED','SDC','FAILURE'):
        flow_kind_out[(kind, outcome)] += 1

plt.figure(figsize=(12, 4))
ax1 = plt.subplot(1, 2, 1)
sankey1 = Sankey(ax=ax1, unit=None)
labels = []
flows = []
orientations = []
for op in top_ops:
    total = sum(flow_op_kind[(op, k)] for k in top_kinds)
    if total == 0:
        continue
    flows.append(total)
    labels.append(pretty.get(op, op))
    orientations.append(1)
    for k in top_kinds:
        val = flow_op_kind[(op, k)]
        if val == 0:
            continue
        flows.append(-val)
        labels.append(k)
        orientations.append(-1)
sankey1.add(flows=flows, labels=labels, orientations=orientations, trunklength=1.0)
sankey1.finish()
ax1.set_title('Flow: opcode → type kind (top)')

ax2 = plt.subplot(1, 2, 2)
sankey2 = Sankey(ax=ax2, unit=None)
labels = []
flows = []
orientations = []
for k in top_kinds:
    total = sum(flow_kind_out[(k, o)] for o in ('MASKED','SDC','FAILURE'))
    if total == 0:
        continue
    flows.append(total)
    labels.append(k)
    orientations.append(1)
    for o in ('MASKED','SDC','FAILURE'):
        val = flow_kind_out[(k, o)]
        if val == 0:
            continue
        flows.append(-val)
        labels.append(o)
        orientations.append(-1)
sankey2.add(flows=flows, labels=labels, orientations=orientations, trunklength=1.0)
sankey2.finish()
ax2.set_title('Flow: type kind → outcome')
plt.tight_layout()
plt.savefig(os.path.join(out_dir, 'layout_flow_sankey.png'), dpi=200)
plt.close()

# 2) Cumulative outcome vs site index
max_site = max(r[0] for r in rows)
site_counts = np.zeros(max_site+1, dtype=int)
site_nonmasked = np.zeros(max_site+1, dtype=int)
site_failure = np.zeros(max_site+1, dtype=int)
for site, bit, opcode, kind, outcome in rows:
    site_counts[site] += 1
    if outcome != 'MASKED':
        site_nonmasked[site] += 1
    if outcome == 'FAILURE':
        site_failure[site] += 1

cum_counts = np.cumsum(site_counts)
cum_nonmasked = np.cumsum(site_nonmasked)
cum_failure = np.cumsum(site_failure)
cum_nonmasked_rate = np.divide(cum_nonmasked, cum_counts, out=np.zeros_like(cum_nonmasked, dtype=float), where=cum_counts>0)
cum_failure_rate = np.divide(cum_failure, cum_counts, out=np.zeros_like(cum_failure, dtype=float), where=cum_counts>0)

plt.figure(figsize=(10,4))
plt.plot(cum_nonmasked_rate, label='Cumulative non-masked rate', color='#ff7f0e')
plt.plot(cum_failure_rate, label='Cumulative failure rate', color='#0066FF')
plt.xlabel('Site index')
plt.ylabel('Cumulative rate')
plt.title('Cumulative outcomes vs site index')
plt.legend(frameon=False)
plt.tight_layout()
plt.savefig(os.path.join(out_dir, 'layout_cumulative_outcomes.png'), dpi=200)
plt.close()

# 3) Opcode outcome "clustering" via PCA ordering heatmap
ops = sorted(set(r[2] for r in rows))
ops_counts = {op: Counter() for op in ops}
for _, _, op, _, outcome in rows:
    ops_counts[op][outcome] += 1
vecs = []
for op in ops:
    total = sum(ops_counts[op].values())
    vecs.append([
        ops_counts[op].get('MASKED',0)/total if total else 0,
        ops_counts[op].get('SDC',0)/total if total else 0,
        ops_counts[op].get('FAILURE',0)/total if total else 0,
    ])
X = np.array(vecs)
u, s, vt = np.linalg.svd(X - X.mean(axis=0), full_matrices=False)
order = np.argsort(u[:,0])
Xo = X[order]
ops_o = [ops[i] for i in order]

plt.figure(figsize=(8, max(4, len(ops_o)*0.25)))
plt.imshow(Xo, aspect='auto', cmap='magma', interpolation='nearest')
plt.yticks(range(len(ops_o)), [pretty.get(op, op) for op in ops_o], fontsize=7)
plt.xticks([0,1,2], ['MASKED','SDC','FAILURE'])
plt.title('Opcode outcome ratios (ordered by PCA)')
plt.tight_layout()
plt.savefig(os.path.join(out_dir, 'layout_opcode_cluster_pca.png'), dpi=200)
plt.close()

# 4) Top-K sensitive sites (lollipop)
site_rate = np.divide(site_nonmasked, site_counts, out=np.zeros_like(site_nonmasked, dtype=float), where=site_counts>0)
top_k = 25
top_idx = np.argsort(site_rate)[-top_k:][::-1]
plt.figure(figsize=(8,6))
plt.hlines(range(top_k), 0, site_rate[top_idx], color='#444')
plt.plot(site_rate[top_idx], range(top_k), 'o', color='#ff7f0e')
plt.yticks(range(top_k), [str(i) for i in top_idx])
plt.xlabel('Non-masked rate')
plt.ylabel('Site')
plt.title('Top sensitive sites by non-masked rate')
plt.tight_layout()
plt.savefig(os.path.join(out_dir, 'layout_top_sites_lollipop.png'), dpi=200)
plt.close()

# 5) Bit-index sensitivity curve (overall + by type kind)
max_bit = max(r[1] for r in rows)
bit_counts = np.zeros(max_bit+1, dtype=int)
bit_nonmasked = np.zeros(max_bit+1, dtype=int)
for site, bit, op, kind, outcome in rows:
    bit_counts[bit] += 1
    if outcome != 'MASKED':
        bit_nonmasked[bit] += 1
bit_rate = np.divide(bit_nonmasked, bit_counts, out=np.zeros_like(bit_nonmasked, dtype=float), where=bit_counts>0)

plt.figure(figsize=(8,4))
xs = np.arange(len(bit_rate))
# scale marker size and alpha by coverage
max_cnt = bit_counts.max() if bit_counts.max() > 0 else 1
norm = (bit_counts / max_cnt)
size = 10 + 40 * norm
colors = plt.cm.Oranges(0.3 + 0.7 * norm)
plt.scatter(xs, bit_rate, s=size, c=colors, edgecolors='none')
plt.plot(bit_rate, color='#ff7f0e', alpha=0.35)
plt.xlabel('Bit index')
plt.ylabel('Non-masked rate')
plt.title('Bit index sensitivity (raw, weighted by coverage)')
plt.ylim(0, 1)
plt.tight_layout()
plt.savefig(os.path.join(out_dir, 'layout_bit_sensitivity_curve.png'), dpi=200)
plt.close()

# 6) Windowed density (sliding window over sites)
window = 10
rates = []
for i in range(max_site+1):
    start = max(0, i - window//2)
    end = min(max_site+1, i + window//2 + 1)
    c = site_counts[start:end].sum()
    nm = site_nonmasked[start:end].sum()
    rates.append(nm / c if c else 0)
plt.figure(figsize=(10,4))
plt.plot(rates, color='#ff7f0e')
plt.xlabel('Site index')
plt.ylabel(f'Non-masked rate (window={window})')
plt.title('Windowed non-masked density')
plt.tight_layout()
plt.savefig(os.path.join(out_dir, 'layout_windowed_density.png'), dpi=200)
plt.close()

# 7) Pareto of opcodes for failures/SDC
op_fail = {op: ops_counts[op].get('FAILURE',0) + ops_counts[op].get('SDC',0) for op in ops}
ops_sorted = sorted(op_fail.keys(), key=lambda o: op_fail[o], reverse=True)
vals = np.array([op_fail[o] for o in ops_sorted], dtype=float)
total = vals.sum() if vals.sum() else 1.0
cum = np.cumsum(vals) / total
plt.figure(figsize=(10,4))
plt.plot(cum, color='#0066FF')
plt.axhline(0.8, color='#999', linestyle='--', linewidth=1)
plt.xlabel('Opcodes sorted by SDC+FAIL count')
plt.ylabel('Cumulative fraction of SDC+FAIL')
plt.title('Pareto: SDC+FAIL explained by opcodes')
plt.tight_layout()
plt.savefig(os.path.join(out_dir, 'layout_opcode_pareto.png'), dpi=200)
plt.close()

# 8) Co-occurrence graph: site bins × opcode mix (bubble)
bin_size = 10
bins = int(math.ceil((max_site+1)/bin_size))
top_ops = [op for op,_ in op_counts.most_common(12)]
bin_op_counts = np.zeros((bins, len(top_ops)), dtype=int)
bin_op_nonmasked = np.zeros_like(bin_op_counts)
for site, bit, op, kind, outcome in rows:
    if op not in top_ops:
        continue
    b = site // bin_size
    j = top_ops.index(op)
    bin_op_counts[b, j] += 1
    if outcome != 'MASKED':
        bin_op_nonmasked[b, j] += 1
rates = np.divide(bin_op_nonmasked, bin_op_counts, out=np.zeros_like(bin_op_nonmasked, dtype=float), where=bin_op_counts>0)

plt.figure(figsize=(10,5))
for j, op in enumerate(top_ops):
    xs = np.arange(bins)
    ys = np.full(bins, j)
    sizes = rates[:, j] * 200
    plt.scatter(xs, ys, s=sizes, alpha=0.6)
plt.yticks(range(len(top_ops)), [pretty.get(op, op) for op in top_ops], fontsize=7)
plt.xlabel(f'Site bin (size={bin_size})')
plt.ylabel('Opcode (top 12)')
plt.title('Opcode non-masked rate by site bin (bubble size)')
plt.tight_layout()
plt.savefig(os.path.join(out_dir, 'layout_opcode_bubble_bins.png'), dpi=200)
plt.close()

print('Wrote 8 pattern plots to', out_dir)
