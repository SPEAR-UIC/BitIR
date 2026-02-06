#!/usr/bin/env python3
import csv, os
import numpy as np
import matplotlib.pyplot as plt
from collections import Counter

summary = '/home/mdunlavy/GPU_FI/HeCBench/results/fi_debug_3phase/layout/float/summary.csv'
worklist = '/home/mdunlavy/GPU_FI/HeCBench/results/llvm17_inject/layout/worklist_plot.csv'
out_dir = '/home/mdunlavy/GPU_FI/plots'
os.makedirs(out_dir, exist_ok=True)

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
        opcode = row.get('opcode','').strip() or 'UNK'
        kind = row.get('type_kind','').strip() or 'UNK'
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
        res = row.get('result','').strip().upper()
        opcode = op_map[(site,bit)]
        kind = kind_map[(site,bit)]
        if opcode == 'UNK' or kind == 'UNK':
            continue
        rows.append((site, bit, opcode, kind, res))

if not rows:
    raise SystemExit('no rows after filtering')

def save_variants(base_name, data, xlabels, ylabels, title_prefix):
    # Original
    fig, ax = plt.subplots(figsize=(12, max(4, (data.shape[0])/30)))
    im = ax.imshow(data, aspect='auto', cmap='magma', interpolation='nearest')
    fig.colorbar(im, ax=ax, label='Non-masked ratio')
    ax.set_yticks([])
    ax.set_xticks(range(len(xlabels)))
    ax.set_xticklabels(xlabels, rotation=60, ha='right')
    ax.set_xlabel(xlabels[0].__class__.__name__ if False else '')  # no-op placeholder
    ax.set_ylabel('Site index')
    ax.set_title(f'{title_prefix} (ratio)')
    ax.set_xlabel('')
    fig.tight_layout()
    fig.savefig(os.path.join(out_dir, f'{base_name}.png'), dpi=200)
    plt.close(fig)

    # Log1p
    log_data = np.log1p(data)
    fig, ax = plt.subplots(figsize=(12, max(4, (data.shape[0])/30)))
    im = ax.imshow(log_data, aspect='auto', cmap='magma', interpolation='nearest')
    fig.colorbar(im, ax=ax, label='log1p(ratio)')
    ax.set_yticks([])
    ax.set_xticks(range(len(xlabels)))
    ax.set_xticklabels(xlabels, rotation=60, ha='right')
    ax.set_ylabel('Site index')
    ax.set_title(f'{title_prefix} (log1p)')
    fig.tight_layout()
    fig.savefig(os.path.join(out_dir, f'{base_name}_log.png'), dpi=200)
    plt.close(fig)

    # Z-score
    mean = np.nanmean(data)
    std = np.nanstd(data) if np.nanstd(data) > 0 else 1.0
    z = (data - mean) / std
    fig, ax = plt.subplots(figsize=(12, max(4, (data.shape[0])/30)))
    im = ax.imshow(z, aspect='auto', cmap='coolwarm', interpolation='nearest')
    fig.colorbar(im, ax=ax, label='z-score')
    ax.set_yticks([])
    ax.set_xticks(range(len(xlabels)))
    ax.set_xticklabels(xlabels, rotation=60, ha='right')
    ax.set_ylabel('Site index')
    ax.set_title(f'{title_prefix} (z-score)')
    fig.tight_layout()
    fig.savefig(os.path.join(out_dir, f'{base_name}_z.png'), dpi=200)
    plt.close(fig)

    # Binary (>= 0.5)
    binary = (data >= 0.5).astype(float)
    fig, ax = plt.subplots(figsize=(12, max(4, (data.shape[0])/30)))
    im = ax.imshow(binary, aspect='auto', cmap='Greys', interpolation='nearest', vmin=0, vmax=1)
    fig.colorbar(im, ax=ax, label='ratio >= 0.5')
    ax.set_yticks([])
    ax.set_xticks(range(len(xlabels)))
    ax.set_xticklabels(xlabels, rotation=60, ha='right')
    ax.set_ylabel('Site index')
    ax.set_title(f'{title_prefix} (binary >= 0.5)')
    fig.tight_layout()
    fig.savefig(os.path.join(out_dir, f'{base_name}_binary.png'), dpi=200)
    plt.close(fig)

    # Threshold (>= 0.2)
    thresh = (data >= 0.2).astype(float)
    fig, ax = plt.subplots(figsize=(12, max(4, (data.shape[0])/30)))
    im = ax.imshow(thresh, aspect='auto', cmap='Greys', interpolation='nearest', vmin=0, vmax=1)
    fig.colorbar(im, ax=ax, label='ratio >= 0.2')
    ax.set_yticks([])
    ax.set_xticks(range(len(xlabels)))
    ax.set_xticklabels(xlabels, rotation=60, ha='right')
    ax.set_ylabel('Site index')
    ax.set_title(f'{title_prefix} (binary >= 0.2)')
    fig.tight_layout()
    fig.savefig(os.path.join(out_dir, f'{base_name}_thresh.png'), dpi=200)
    plt.close(fig)

rows.sort(key=lambda x: (x[0], x[1]))
max_site = max(r[0] for r in rows)
max_bit = max(r[1] for r in rows)

op_counts = Counter([r[2] for r in rows])
ops_top = [op for op,_ in op_counts.most_common(20)]
site_op = np.zeros((max_site+1, len(ops_top)))
site_op_cnt = np.zeros_like(site_op)
for site, bit, opcode, kind, res in rows:
    if opcode not in ops_top: continue
    j = ops_top.index(opcode)
    site_op_cnt[site, j] += 1
    if res != 'MASKED':
        site_op[site, j] += 1
site_op = np.divide(site_op, site_op_cnt, out=np.zeros_like(site_op), where=site_op_cnt>0)

save_variants(
    base_name='layout_site_opcode_heatmap',
    data=site_op,
    xlabels=ops_top,
    ylabels=None,
    title_prefix='Layout: site × opcode non-masked ratio'
)

kinds = sorted(set(r[3] for r in rows))
site_kind = np.zeros((max_site+1, len(kinds)))
site_kind_cnt = np.zeros_like(site_kind)
for site, bit, opcode, kind, res in rows:
    j = kinds.index(kind)
    site_kind_cnt[site, j] += 1
    if res != 'MASKED':
        site_kind[site, j] += 1
site_kind = np.divide(site_kind, site_kind_cnt, out=np.zeros_like(site_kind), where=site_kind_cnt>0)

save_variants(
    base_name='layout_site_typekind_heatmap',
    data=site_kind,
    xlabels=kinds,
    ylabels=None,
    title_prefix='Layout: site × type kind non-masked ratio'
)

site_out = np.zeros(max_site+1, dtype=int)
for site in range(max_site+1):
    outcomes = [r[4] for r in rows if r[0]==site]
    if not outcomes:
        site_out[site] = 0
        continue
    c = Counter(outcomes)
    order = {'FAILURE':2, 'SDC':1, 'MASKED':0}
    maj = max(c.items(), key=lambda kv: (kv[1], order.get(kv[0],0)))[0]
    site_out[site] = order.get(maj,0)

plt.figure(figsize=(8, max(4, (max_site+1)/30)))
plt.imshow(site_out[:,None], aspect='auto', cmap=plt.get_cmap('viridis',3), interpolation='nearest', vmin=0, vmax=2)
plt.yticks([])
plt.xticks([0], ['majority outcome'])
plt.title('Layout: site index × majority outcome')
plt.tight_layout()
plt.savefig(os.path.join(out_dir,'layout_site_outcome_majority.png'), dpi=200)
plt.close()

bit_kind = np.zeros((max_bit+1, len(kinds)))
bit_kind_cnt = np.zeros_like(bit_kind)
for site, bit, opcode, kind, res in rows:
    j = kinds.index(kind)
    bit_kind_cnt[bit, j] += 1
    if res != 'MASKED':
        bit_kind[bit, j] += 1
bit_kind = np.divide(bit_kind, bit_kind_cnt, out=np.zeros_like(bit_kind), where=bit_kind_cnt>0)

save_variants(
    base_name='layout_bit_typekind_heatmap',
    data=bit_kind,
    xlabels=kinds,
    ylabels=None,
    title_prefix='Layout: bit index × type kind non-masked ratio'
)

print('Rebuilt axis plots with UNK filtered and 4 variants')
