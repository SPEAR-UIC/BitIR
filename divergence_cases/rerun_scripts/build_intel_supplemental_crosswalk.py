#!/usr/bin/env python3
import argparse
import csv
import json
from collections import defaultdict
from pathlib import Path

BENCHES = ['matrix-rotate', 'layout', 'dense-embedding', 'entropy']
OLD_METADATA = {b: f'divergence_cases/original_campaign/intel/{b}/sites_metadata.csv' for b in BENCHES}
TUPLE_FIELDS = [
    'function', 'source_file', 'source_line', 'source_column', 'opcode',
    'type_kind', 'bitwidth', 'operand_index', 'site_class', 'signature_ordinal',
]


def load_csv(path: Path):
    with path.open(newline='', encoding='utf-8') as f:
        return list(csv.DictReader(f))


def write_csv(path: Path, fields, rows):
    with path.open('w', newline='', encoding='utf-8') as f:
        w = csv.DictWriter(f, fieldnames=fields)
        w.writeheader()
        w.writerows(rows)


def tuple_key(row):
    return tuple(str(row.get(field, '')).strip() for field in TUPLE_FIELDS)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--repo-root', required=True)
    ap.add_argument('--worklist', required=True)
    ap.add_argument('--fresh-metadata-dir', required=True)
    ap.add_argument('--out-dir', required=True)
    args = ap.parse_args()

    repo = Path(args.repo_root).resolve()
    worklist = Path(args.worklist).resolve()
    fresh_root = Path(args.fresh_metadata_dir).resolve()
    out_dir = Path(args.out_dir).resolve()
    out_dir.mkdir(parents=True, exist_ok=True)

    input_rows = load_csv(worklist)
    selected = [r for r in input_rows if r.get('bench') in OLD_METADATA]

    old_by_bench = {}
    fresh_by_bench = {}
    for bench in BENCHES:
        old_rows = load_csv(repo / OLD_METADATA[bench])
        old_by_bench[bench] = {str(r['site_id']).strip(): r for r in old_rows}
        fresh_rows = load_csv(fresh_root / bench / 'sites_metadata.csv')
        by_key = defaultdict(list)
        for row in fresh_rows:
            by_key[tuple_key(row)].append(row)
        fresh_by_bench[bench] = by_key

    crosswalk = []
    resolved = []
    unresolved = []
    selected_meta = []
    for row in selected:
        bench = row['bench']
        old_site = str(row['original_site_id']).strip()
        old = old_by_bench[bench].get(old_site)
        if old is None:
            unresolved.append({
                'screen_id': row['screen_id'], 'benchmark': bench,
                'old_site_id': old_site, 'bit_index': row['bit_index'],
                'reason': 'old_site_missing', 'match_count': '0',
            })
            continue
        matches = fresh_by_bench[bench].get(tuple_key(old), [])
        match_count = len(matches)
        fresh_site = str(matches[0]['site_id']).strip() if match_count == 1 else ''
        cw = {
            'screen_id': row['screen_id'],
            'screen_kind': row.get('screen_kind', ''),
            'benchmark': bench,
            'old_site_id': old_site,
            'fresh_site_id': fresh_site,
            'bit_index': row['bit_index'],
            'function': old.get('function', ''),
            'source_file': old.get('source_file', ''),
            'source_line': old.get('source_line', ''),
            'source_column': old.get('source_column', ''),
            'opcode': old.get('opcode', ''),
            'type_kind': old.get('type_kind', ''),
            'bitwidth': old.get('bitwidth', ''),
            'operand_index': old.get('operand_index', ''),
            'site_class': old.get('site_class', ''),
            'signature_ordinal': old.get('signature_ordinal', ''),
            'match_count': str(match_count),
        }
        crosswalk.append(cw)
        if match_count != 1:
            unresolved.append({
                'screen_id': row['screen_id'], 'benchmark': bench,
                'old_site_id': old_site, 'bit_index': row['bit_index'],
                'reason': f'fresh_match_count={match_count}', 'match_count': str(match_count),
            })
            continue
        fresh = matches[0]
        resolved.append({
            'screen_id': row['screen_id'],
            'screen_kind': row.get('screen_kind', ''),
            'bench': bench,
            'site_id': fresh_site,
            'bit_index': row['bit_index'],
            'old_site_id': old_site,
            'trials': row.get('trials', '2'),
            'value_bitwidth': row.get('value_bitwidth', ''),
            'original_result': row.get('original_result', ''),
            'semantic_match_key': row.get('semantic_match_key', ''),
            'opcode': row.get('opcode', ''),
            'canonical_line': row.get('canonical_line', ''),
        })
        selected_meta.append({'screen_id': row['screen_id'], 'benchmark': bench, 'old_or_fresh': 'old', **{f: old.get(f, '') for f in ['site_id'] + TUPLE_FIELDS + ['semantic_key']}})
        selected_meta.append({'screen_id': row['screen_id'], 'benchmark': bench, 'old_or_fresh': 'fresh', **{f: fresh.get(f, '') for f in ['site_id'] + TUPLE_FIELDS + ['semantic_key']}})

    cw_fields = ['screen_id', 'screen_kind', 'benchmark', 'old_site_id', 'fresh_site_id', 'bit_index'] + TUPLE_FIELDS + ['match_count']
    resolved_fields = ['screen_id', 'screen_kind', 'bench', 'site_id', 'bit_index', 'old_site_id', 'trials', 'value_bitwidth', 'original_result', 'semantic_match_key', 'opcode', 'canonical_line']
    unresolved_fields = ['screen_id', 'benchmark', 'old_site_id', 'bit_index', 'reason', 'match_count']
    meta_fields = ['screen_id', 'benchmark', 'old_or_fresh', 'site_id'] + TUPLE_FIELDS + ['semantic_key']
    write_csv(out_dir / 'intel_supplemental_site_crosswalk.csv', cw_fields, crosswalk)
    write_csv(out_dir / 'intel_supplemental_resolved_worklist.csv', resolved_fields, resolved)
    write_csv(out_dir / 'intel_supplemental_unresolved_rows.csv', unresolved_fields, unresolved)
    write_csv(out_dir / 'selected_metadata_rows.csv', meta_fields, selected_meta)
    planned = sum(int(r.get('trials', '2') or '2') for r in resolved)
    summary = {'input_rows': len(input_rows), 'selected_candidates': len(selected), 'resolved': len(resolved), 'unresolved': len(unresolved), 'planned_injections': planned, 'unresolved_rows': unresolved}
    (out_dir / 'intel_supplemental_crosswalk_summary.json').write_text(json.dumps(summary, indent=2, sort_keys=True) + '\n', encoding='utf-8')
    print(json.dumps(summary, indent=2, sort_keys=True))
    if len(selected) != 11 or len(resolved) != 11 or planned != 22:
        raise SystemExit(2)


if __name__ == '__main__':
    main()
