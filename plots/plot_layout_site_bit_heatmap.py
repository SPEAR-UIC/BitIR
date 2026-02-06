#!/usr/bin/env python3
import csv, os
import numpy as np
import matplotlib.pyplot as plt

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

if not rows:
    raise SystemExit('no rows')

max_site = max(r[0] for r in rows)
max_bit = max(r[1] for r in rows)

mat = np.zeros((max_site+1, max_bit+1))
count = np.zeros_like(mat)

for site, bit, res in rows:
    count[site, bit] += 1
    if res != 'MASKED':
        mat[site, bit] += 1

mat = np.divide(mat, count, out=np.zeros_like(mat), where=count>0)

plt.figure(figsize=(10, 6))
plt.imshow(mat, aspect='auto', cmap='magma', interpolation='nearest')
plt.colorbar(label='Non-masked ratio (SDC/FAIL)')
plt.xlabel('Bit index')
plt.ylabel('Site index')
plt.title('Layout: site index × bit index non-masked ratio')
plt.tight_layout()

out = '/home/mdunlavy/GPU_FI/plots/layout_site_bit_heatmap.png'
plt.savefig(out, dpi=200)
print(out)
