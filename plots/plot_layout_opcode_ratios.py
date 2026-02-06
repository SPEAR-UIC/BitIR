#!/usr/bin/env python3
import csv, os
from collections import defaultdict, Counter
import matplotlib.pyplot as plt
import numpy as np

summary = '/home/mdunlavy/GPU_FI/HeCBench/results/fi_debug_3phase/layout/float/summary.csv'
worklist = '/home/mdunlavy/GPU_FI/HeCBench/results/llvm17_inject/layout/worklist_plot.csv'
if not os.path.exists(summary):
    raise SystemExit(f'missing {summary}')
if not os.path.exists(worklist):
    raise SystemExit(f'missing {worklist}')

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

op_map = {}
with open(worklist, newline='') as fh:
    r = csv.DictReader(fh)
    for row in r:
        try:
            site = int(row['site_id']); bit = int(row['bit_index'])
        except Exception:
            continue
        opcode = row.get('opcode','').strip().lower()
        if not opcode or opcode in ('unk', 'unknown'):
            continue
        op_map[(site,bit)] = opcode

counts = defaultdict(Counter)
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
        counts[opcode][res] += 1

opcodes = sorted(counts.keys(), key=lambda o: sum(counts[o].values()), reverse=True)[:20]
labels = [pretty.get(op, op) for op in opcodes]

masked = []
sdc = []
failure = []
for op in opcodes:
    total = sum(counts[op].values())
    if total == 0:
        masked.append(0); sdc.append(0); failure.append(0)
        continue
    masked.append(counts[op].get('MASKED',0)/total)
    sdc.append(counts[op].get('SDC',0)/total)
    failure.append(counts[op].get('FAILURE',0)/total)

x = np.arange(len(opcodes))
width = 0.45

plt.figure(figsize=(max(12, len(opcodes)*0.7), 4.5))
plt.bar(x, masked, width=width, label='MASKED', color='#2ca02c')
plt.bar(x, sdc, width=width, bottom=masked, label='SDC', color='#ff7f0e')
plt.bar(x, failure, width=width, bottom=[m+s for m,s in zip(masked,sdc)], label='FAILURE', color='#0066FF')

plt.xticks(x, labels, rotation=60, ha='right')
plt.ylim(0,1)
plt.ylabel('Ratio within opcode')
plt.title('Layout float/int outcome ratios by opcode (top 20)')
plt.legend(frameon=False, loc='center left', bbox_to_anchor=(1.15, 0.5))
plt.tight_layout()

out = '/home/mdunlavy/GPU_FI/plots/layout_opcode_ratios.png'
plt.savefig(out, dpi=200, bbox_inches='tight')
print(out)
