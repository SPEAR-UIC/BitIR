#!/usr/bin/env python3
import csv, os, re
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt

summary='HeCBench/results/llvm17_inject/layout/summary.csv'
base_dir='HeCBench/results/llvm17_inject/layout/float'

pairs=[]
with open(summary,newline='') as fh:
    r=csv.DictReader(fh)
    for row in r:
        pairs.append((int(row['site_id']), int(row['bit_index'])))

pat_ok=re.compile(r'compare_ok|PASS',re.I)
pat_mis=re.compile(r'compare_mismatch|compare_diff|mismatch',re.I)
pat_fail=re.compile(r'\bFAIL\b',re.I)


def classify(path):
    try:
        txt=open(path,errors='ignore').read()
    except FileNotFoundError:
        return 'FAILURE'
    if txt.strip()=='' :
        return 'FAILURE'
    has_ok=bool(pat_ok.search(txt))
    has_mis=bool(pat_mis.search(txt))
    has_fail=bool(pat_fail.search(txt))
    if has_ok:
        return 'MASKED'
    if has_mis:
        return 'SDC'
    if has_fail:
        return 'FAILURE'
    return 'UNKNOWN'

color_map={'MASKED':'#2ca02c','SDC':'#ff7f0e','FAILURE':'#0066FF','UNKNOWN':'#ffffff'}
vals=[]
for s,b in pairs:
    path=os.path.join(base_dir, f'site{s}_bit{b}.out')
    vals.append(classify(path))

# Build a 3-row image: row0 = all results, rows1-2 = only SDC/FAILURE (thicker)
row0=[list(color_map).index(v) if v in color_map else 3 for v in vals]
row1=[]
for v in vals:
    if v == 'SDC':
        row1.append(list(color_map).index('SDC'))
    elif v == 'FAILURE':
        row1.append(list(color_map).index('FAILURE'))
    else:
        row1.append(list(color_map).index('UNKNOWN'))
row2=row1[:]  # duplicate to thicken

cmap=[color_map['MASKED'], color_map['SDC'], color_map['FAILURE'], color_map['UNKNOWN']]

fig, ax = plt.subplots(figsize=(12,2.6))
ax.imshow([row0,row1,row2], aspect='auto', interpolation='nearest', vmin=0, vmax=3,
          cmap=matplotlib.colors.ListedColormap(cmap))
ax.set_yticks([0,1,2])
ax.set_yticklabels(['result','SDC/FAIL','SDC/FAIL'])
ax.set_xticks([])
ax.set_title('Layout float/int ordered by (site, bit) (compare_ok_wins, SDC/FAIL thick)')
handles=[plt.Line2D([0],[0], color=color_map['MASKED'], lw=6, label='MASKED'),
         plt.Line2D([0],[0], color=color_map['SDC'], lw=6, label='SDC'),
         plt.Line2D([0],[0], color=color_map['FAILURE'], lw=6, label='FAILURE')]
ax.legend(handles=handles, loc='center left', bbox_to_anchor=(1.01,0.5))

out='plots/layout_float_ordered_compare_ok_wins_thick.png'
fig.tight_layout()
fig.savefig(out, dpi=150)
plt.close(fig)
print(out)
