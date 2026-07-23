#!/usr/bin/env python3
import csv
import hashlib
import json
import math
import os
import re
import shutil
import subprocess
import time
from collections import Counter, defaultdict
from pathlib import Path

REPO_ROOT = Path(os.environ['REPO_ROOT']).resolve()
RESULTS_DIR = Path(os.environ['RESULTS_DIR']).resolve()
WORKLIST = Path(os.environ['WORKLIST']).resolve()
FRESH_METADATA_ROOT = Path(os.environ['FRESH_METADATA_ROOT']).resolve()
FULL_DUMP_ROOT = Path(os.environ.get('FULL_DUMP_ROOT', str(RESULTS_DIR))).resolve()
RUNNER = REPO_ROOT / 'HeCBench/tools/llvm17_inject/run_benchmark_injection.sh'
GOLDEN_ROOT = Path(os.environ.get('CAMPAIGN_GOLDEN_ROOT', str(REPO_ROOT / 'Aurora_Sycl_Golden_Outputs'))).resolve()
DEFAULT_ORIGINAL_TIMEOUT = os.environ.get('ORIGINAL_CAMPAIGN_TIMEOUT', '200s')
FALLBACK_BASELINE_TIMEOUT_SECONDS = int(os.environ.get('BASELINE_TIMEOUT_FALLBACK_SECONDS', '600'))

CONFIG = {
    'matrix-rotate': {
        'run_args': '10000 1',
        'source_dir': 'HeCBench/src/matrix-rotate-sycl',
        'golden_file': 'matrix-rotate_10000_1.bin',
        'extra_includes': '',
    },
    'layout': {
        'run_args': '1',
        'source_dir': 'HeCBench/src/layout-sycl',
        'golden_file': 'layout.bin',
        'extra_includes': '',
    },
    'dense-embedding': {
        'run_args': '10000 8 1',
        'source_dir': 'HeCBench/src/dense-embedding-sycl',
        'golden_file': 'dense-embedding.bin',
        'extra_includes': '',
    },
    'entropy': {
        'run_args': '10000 1024 1',
        'source_dir': 'HeCBench/src/entropy-sycl',
        'golden_file': 'entropy.bin',
        'extra_includes': 'HeCBench/src/entropy-cuda',
    },
}

BASE_ENV = {
    'REPO_ROOT': str(REPO_ROOT),
    'BITIR_WORKDIR': str(REPO_ROOT),
    'BITIR_MACHINE': 'aurora_supplemental_screen',
    'BITIR_MACHINE_BACKEND': 'intel',
    'BITIR_MACHINE_BUILD_DIR': 'HeCBench/build/sycl-intel-golden',
    'BITIR_MACHINE_BINARY_SUBDIR': 'sycl',
    'BITIR_MACHINE_GOLDEN_ROOT': str(GOLDEN_ROOT),
    'BITIR_MACHINE_RESULTS_ROOT': 'HeCBench/results/llvm17_inject',
    'BITIR_MACHINE_DEVICE_VISIBLE_ENV': 'ONEAPI_DEVICE_SELECTOR',
    'BITIR_MACHINE_DEVICE_VISIBLE_VALUE': 'level_zero:gpu',
    'BITIR_MACHINE_SYCL_TARGET': 'spir64',
    'BITIR_MACHINE_SYCL_OFFLOAD_TARGET': 'sycl-spir64-unknown-unknown',
    'BITIR_MACHINE_SYCL_HOST_TRIPLE': 'x86_64-unknown-linux-gnu',
    'BITIR_MACHINE_TOOL_SEARCH_ROOTS': '/opt/aurora/25.190.0/oneapi/compiler/latest/bin /opt/aurora/25.190.0/oneapi/compiler/latest/bin/compiler /opt/aurora/25.190.0/oneapi/compiler/2025.2/bin /opt/aurora/25.190.0/oneapi/compiler/2025.2/bin/compiler',
    'BITIR_MACHINE_LLVM_SEARCH_ROOT': '/opt/aurora/25.190.0/spack/unified',
    'TRACE_LEVEL': 'off',
    'INJECT_TARGET': 'result',
    'INT_FLOAT_ONLY': '1',
    'INCLUDE_CONSTANTS': '0',
    'KEEP_DUMPS': '1',
    'SKIP_EXISTING': '0',
    'SUMMARY_INCLUDE_PATHS': '1',
    'RUN_TIMEOUT_KILL_AFTER': os.environ.get('RUN_TIMEOUT_KILL_AFTER', '15s'),
}


def ensure(path: Path):
    path.mkdir(parents=True, exist_ok=True)


def load_csv(path: Path):
    with path.open(newline='', encoding='utf-8') as f:
        return list(csv.DictReader(f))


def write_csv(path: Path, fields, rows):
    with path.open('w', newline='', encoding='utf-8') as f:
        writer = csv.DictWriter(f, fieldnames=fields)
        writer.writeheader()
        writer.writerows(rows)


def hash_file(path: Path):
    h = hashlib.sha256()
    size = 0
    with path.open('rb') as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b''):
            h.update(chunk)
            size += len(chunk)
    return h.hexdigest(), size


def compare_exact(golden: Path, candidate: Path, out_json: Path):
    gsha, gsize = hash_file(golden)
    csha, csize = hash_file(candidate)
    report = {
        'mode': 'exact',
        'golden_path': str(golden),
        'candidate_path': str(candidate),
        'golden_sha256': gsha,
        'candidate_sha256': csha,
        'golden_size_bytes': gsize,
        'candidate_size_bytes': csize,
        'exact_match': gsha == csha and gsize == csize,
        'status': 'pass' if gsha == csha and gsize == csize else 'fail',
    }
    first = ''
    mismatches = 0
    if gsize == csize and report['status'] == 'fail':
        offset = 0
        with golden.open('rb') as fg, candidate.open('rb') as fc:
            while True:
                gb = fg.read(1024 * 1024)
                cb = fc.read(1024 * 1024)
                if not gb and not cb:
                    break
                for i, (a, b) in enumerate(zip(gb, cb)):
                    if a != b:
                        if first == '':
                            first = offset + i
                        mismatches += 1
                offset += len(gb)
    elif gsize != csize:
        mismatches = 'size_mismatch'
    report['mismatch_count'] = mismatches
    report['first_differing_index'] = first
    out_json.write_text(json.dumps(report, indent=2, sort_keys=True) + '\n', encoding='utf-8')
    return report


def parse_timeout_seconds(value: str):
    return int(str(value).rstrip('s'))


def original_timeout_for_bench(bench: str):
    specific = os.environ.get(f'ORIGINAL_TIMEOUT_{bench.upper().replace("-", "_")}')
    if specific:
        return parse_timeout_seconds(specific), f'env:ORIGINAL_TIMEOUT_{bench.upper().replace("-", "_")}'
    default = os.environ.get('ORIGINAL_CAMPAIGN_TIMEOUT')
    if default:
        return parse_timeout_seconds(default), 'env:ORIGINAL_CAMPAIGN_TIMEOUT'
    return None, ''


def classify_failure(exit_code, stdout_path: Path, stderr_path: Path, dump_exists: bool):
    text = ''
    for path in (stdout_path, stderr_path):
        if path.is_file():
            text += path.read_text(encoding='utf-8', errors='replace')[-20000:]
    lower = text.lower()
    timeout = str(exit_code) in {'124', '137'} or 'timeout' in lower or 'timed out' in lower
    signal = bool(re.search(r'(signal|segmentation fault|sigsegv|sigabrt|sigill|sigbus)', lower))
    gpu = bool(re.search(r'(level_zero|ze_result|sycl|pi_error|ur_result|gpu|device).*?(error|failed|failure)', lower))
    nonzero = bool(str(exit_code) and str(exit_code) != '0')
    if dump_exists:
        return 'HAS_DUMP', '', timeout, signal, nonzero, gpu
    if timeout:
        return 'DUE', 'timeout', timeout, signal, nonzero, gpu
    if signal:
        return 'DUE', 'signal_or_crash', timeout, signal, nonzero, gpu
    if gpu:
        return 'DUE', 'gpu_runtime_error', timeout, signal, nonzero, gpu
    if nonzero:
        if re.search(r'(missing|not found|no such file|site validation failed|metadata|compile|link|python traceback|syntaxerror|permission denied)', lower):
            return 'INFRA_FAILURE', 'script_or_setup_failure', timeout, signal, nonzero, gpu
        return 'DUE', 'nonzero_application_failure', timeout, signal, nonzero, gpu
    return 'INFRA_FAILURE', 'missing_dump_no_failure', timeout, signal, nonzero, gpu


def detect_pass_fail(stdout_path: Path):
    if not stdout_path.is_file():
        return 'UNKNOWN'
    text = stdout_path.read_text(encoding='utf-8', errors='replace')
    if re.search(r'(^|\s)FAIL(\s|$)', text):
        return 'FAIL'
    if re.search(r'(^|\s)PASS(\s|$)', text):
        return 'PASS'
    return 'UNKNOWN'


def run_cmd(cmd, env, cwd: Path, out: Path, err: Path, check=True):
    with out.open('w', encoding='utf-8') as fo, err.open('w', encoding='utf-8') as fe:
        proc = subprocess.run(cmd, cwd=cwd, env=env, stdout=fo, stderr=fe)
    if check and proc.returncode != 0:
        raise RuntimeError(f'command failed rc={proc.returncode}: {cmd}')
    return proc.returncode


def run_runner(bench: str, site: str, bit: str, trial: str, baseline: bool, timeout_s: int):
    cfg = CONFIG[bench]
    bench_dir = FULL_DUMP_ROOT / 'local_dumps' / bench
    ensure(bench_dir)
    out_dir = FULL_DUMP_ROOT / 'tmp' / (f'{bench}_baseline' if baseline else f'{bench}_site{site}_bit{bit}_trial{trial}')
    summary = RESULTS_DIR / (f'{bench}_baseline_summary.csv' if baseline else f'{bench}_trial{trial}_summary.csv')
    stdout = RESULTS_DIR / 'logs' / (f'{bench}_baseline_driver.out' if baseline else f'{bench}_site{site}_bit{bit}_trial{trial}.driver.out')
    stderr = RESULTS_DIR / 'logs' / (f'{bench}_baseline_driver.err' if baseline else f'{bench}_site{site}_bit{bit}_trial{trial}.driver.err')
    env = os.environ.copy()
    env.update(BASE_ENV)
    env.update({
        'BENCH': bench,
        'SITE_ID': site,
        'BIT_INDEX': bit,
        'BASELINE': '1' if baseline else '0',
        'TRIAL_INDEX': trial,
        'BITIR_COMPARE_MODE': 'exact',
        'BITIR_ABS_TOL': '0',
        'BITIR_REL_TOL': '0',
        'BITIR_RUN_ARGS': cfg['run_args'],
        'BITIR_SOURCE_DIR': cfg['source_dir'],
        'BITIR_GOLDEN_FILE': cfg['golden_file'],
        'BITIR_EXTRA_INCLUDES': cfg['extra_includes'],
        'BITIR_TRACE_METADATA_DIR': str(FRESH_METADATA_ROOT / bench),
        'RESULTS_DIR': str(bench_dir),
        'OUT_DIR': str(out_dir),
        'CSV': str(summary),
        'BITIR_RUN_TIMEOUT': f'{int(timeout_s)}s',
    })
    start = time.monotonic()
    rc = run_cmd(['bash', str(RUNNER)], env, REPO_ROOT, stdout, stderr, check=False)
    return rc, time.monotonic() - start, summary, out_dir, bench_dir, stdout, stderr


def first_summary_row(summary: Path):
    rows = load_csv(summary) if summary.is_file() else []
    return rows[0] if rows else {}


def single_summary(summary: Path, site: str, bit: str, trial: str):
    if not summary.is_file():
        return {}
    rows = [r for r in load_csv(summary) if r.get('site_id') == site and r.get('bit_index') == bit and r.get('trial') == trial]
    return rows[0] if len(rows) == 1 else {}


def ensure_goldens(benches):
    rows = []
    for bench in benches:
        golden = GOLDEN_ROOT / CONFIG[bench]['golden_file']
        if golden.is_file():
            rows.append({'bench': bench, 'golden_path': str(golden), 'generated': 'no', 'status': 'existing', 'stdout': '', 'stderr': ''})
            continue
        timeout_s, source = original_timeout_for_bench(bench)
        if timeout_s is None:
            timeout_s = FALLBACK_BASELINE_TIMEOUT_SECONDS
            source = 'fallback_baseline_timeout'
        rc, elapsed, summary, out_dir, _, driver_out, driver_err = run_runner(bench, '1', '0', '0', True, timeout_s)
        summary_row = first_summary_row(summary)
        run_stdout = Path(summary_row.get('stdout', out_dir / 'baseline.out'))
        run_stderr = Path(summary_row.get('stderr', out_dir / 'baseline.err'))
        dump = out_dir / f'{bench}_baseline.bin'
        app_status = detect_pass_fail(run_stdout)
        if rc != 0 or not dump.is_file() or app_status == 'FAIL' or str(summary_row.get('exit_code', '')) not in {'', '0'}:
            rows.append({'bench': bench, 'golden_path': str(golden), 'generated': 'attempted', 'status': f'failed_rc_{rc}', 'stdout': str(run_stdout), 'stderr': str(run_stderr)})
            raise RuntimeError(f'failed to generate golden for {bench}: rc={rc} dump={dump.is_file()} app={app_status} timeout_source={source}')
        shutil.copy2(dump, golden)
        rows.append({'bench': bench, 'golden_path': str(golden), 'generated': 'yes', 'status': 'generated', 'stdout': str(run_stdout), 'stderr': str(run_stderr)})
    return rows


def write_all(golden_rows, timeout_rows, baseline_rows, trial_rows, hash_rows, diag_rows, repro_rows):
    write_csv(RESULTS_DIR / 'golden_status.csv', ['bench', 'golden_path', 'generated', 'status', 'stdout', 'stderr'], golden_rows)
    write_csv(RESULTS_DIR / 'per_benchmark_timeout.csv', ['bench', 'timeout_seconds', 'source'], timeout_rows)
    write_csv(RESULTS_DIR / 'baseline_status.csv', ['bench', 'baseline_status', 'runner_returncode', 'summary_result', 'summary_exit_code', 'elapsed_seconds', 'timeout_seconds', 'golden_path', 'generated_golden', 'baseline_dump', 'compare_json', 'stdout', 'stderr'], baseline_rows)
    write_csv(RESULTS_DIR / 'per_trial_results.csv', ['screen_id', 'bench', 'old_site_id', 'site_id', 'bit_index', 'trial', 'classification', 'due_reason', 'runner_returncode', 'summary_result', 'summary_exit_code', 'dump_exists', 'dump', 'compare_json', 'stdout', 'stderr'], trial_rows)
    write_csv(RESULTS_DIR / 'dump_hashes.csv', ['kind', 'screen_id', 'bench', 'site_id', 'bit_index', 'trial', 'path', 'sha256', 'size_bytes'], hash_rows)
    write_csv(RESULTS_DIR / 'due_infra_diagnostics.csv', ['screen_id', 'bench', 'site_id', 'bit_index', 'trial', 'classification', 'timeout', 'signal_or_crash', 'nonzero_exit', 'gpu_runtime_error', 'infra_failure', 'due_reason'], diag_rows)
    write_csv(RESULTS_DIR / 'final_reproducible_results.csv', ['screen_id', 'bench', 'old_site_id', 'site_id', 'bit_index', 'trial1_classification', 'trial2_classification', 'final_reproducible_result', 'reproducible'], repro_rows)
    counts = Counter(r['classification'] for r in trial_rows)
    final_counts = Counter(r['final_reproducible_result'] for r in repro_rows)
    (RESULTS_DIR / 'aggregate_outcome_counts.json').write_text(json.dumps({'trial_counts': counts, 'final_counts': final_counts}, indent=2, sort_keys=True) + '\n', encoding='utf-8')


def main():
    for dirname in ['logs', 'comparisons', 'compact_stdout_stderr']:
        ensure(RESULTS_DIR / dirname)
    ensure(FULL_DUMP_ROOT / 'local_dumps')
    ensure(FULL_DUMP_ROOT / 'tmp')
    rows = load_csv(WORKLIST)
    planned = sum(int(r.get('trials', '2') or '2') for r in rows)
    if len(rows) != int(os.environ.get('EXPECTED_ROWS', '11')) or planned != int(os.environ.get('EXPECTED_INJECTIONS', '22')):
        raise RuntimeError(f'bad plan rows={len(rows)} planned={planned}')

    by_bench = defaultdict(list)
    for row in rows:
        by_bench[row['bench']].append(row)

    benches = [b.strip() for b in os.environ.get('BENCHES', 'matrix-rotate,layout,dense-embedding,entropy').split(',') if b.strip()]
    golden_rows = ensure_goldens(benches)
    timeout_rows = []
    baseline_rows = []
    trial_rows = []
    hash_rows = []
    diag_rows = []
    repro_rows = []

    for bench in benches:
        bench_rows = by_bench.get(bench, [])
        first = bench_rows[0] if bench_rows else {'site_id': '1', 'bit_index': '0'}
        original_timeout_s, timeout_source = original_timeout_for_bench(bench)
        baseline_timeout_s = original_timeout_s if original_timeout_s is not None else FALLBACK_BASELINE_TIMEOUT_SECONDS
        rc, elapsed, summary, out_dir, _, driver_stdout, driver_stderr = run_runner(bench, first['site_id'], first['bit_index'], '0', True, baseline_timeout_s)
        srow = first_summary_row(summary)
        baseline_dump = out_dir / f'{bench}_baseline.bin'
        golden = GOLDEN_ROOT / CONFIG[bench]['golden_file']
        cmp_json = RESULTS_DIR / 'comparisons' / f'{bench}_baseline_exact_summary.json'
        exact_ok = False
        if baseline_dump.is_file():
            compare = compare_exact(golden, baseline_dump, cmp_json)
            exact_ok = bool(compare['exact_match'])
            sha, size = hash_file(baseline_dump)
            hash_rows.append({'kind': 'baseline', 'screen_id': 'BASELINE', 'bench': bench, 'site_id': first['site_id'], 'bit_index': first['bit_index'], 'trial': '0', 'path': str(baseline_dump), 'sha256': sha, 'size_bytes': size})
        status = 'PASS' if rc == 0 and exact_ok else 'FAIL'
        if original_timeout_s is None:
            exec_timeout_s = max(60, int(math.ceil(elapsed * 10.0)))
            exec_timeout_source = '10x_measured_baseline'
        else:
            exec_timeout_s = original_timeout_s
            exec_timeout_source = timeout_source
        timeout_rows.append({'bench': bench, 'timeout_seconds': exec_timeout_s, 'source': exec_timeout_source})
        generated = next((g['generated'] for g in golden_rows if g['bench'] == bench), 'no')
        baseline_rows.append({
            'bench': bench,
            'baseline_status': status,
            'runner_returncode': rc,
            'summary_result': srow.get('result', ''),
            'summary_exit_code': srow.get('exit_code', ''),
            'elapsed_seconds': f'{elapsed:.3f}',
            'timeout_seconds': exec_timeout_s,
            'golden_path': str(golden),
            'generated_golden': generated,
            'baseline_dump': str(baseline_dump) if baseline_dump.is_file() else '',
            'compare_json': str(cmp_json),
            'stdout': str(driver_stdout),
            'stderr': str(driver_stderr),
        })
        write_all(golden_rows, timeout_rows, baseline_rows, trial_rows, hash_rows, diag_rows, repro_rows)
        if status != 'PASS':
            for row in bench_rows:
                for trial in range(1, int(row.get('trials', '2') or '2') + 1):
                    trial_rows.append({'screen_id': row['screen_id'], 'bench': bench, 'old_site_id': row['old_site_id'], 'site_id': row['site_id'], 'bit_index': row['bit_index'], 'trial': trial, 'classification': 'SKIPPED_BASELINE_MISMATCH', 'due_reason': '', 'runner_returncode': '', 'summary_result': '', 'summary_exit_code': '', 'dump_exists': False, 'dump': '', 'compare_json': '', 'stdout': '', 'stderr': ''})
                repro_rows.append({'screen_id': row['screen_id'], 'bench': bench, 'old_site_id': row['old_site_id'], 'site_id': row['site_id'], 'bit_index': row['bit_index'], 'trial1_classification': 'SKIPPED_BASELINE_MISMATCH', 'trial2_classification': 'SKIPPED_BASELINE_MISMATCH', 'final_reproducible_result': 'SKIPPED_BASELINE_MISMATCH', 'reproducible': True})
            write_all(golden_rows, timeout_rows, baseline_rows, trial_rows, hash_rows, diag_rows, repro_rows)
            continue

        for row in bench_rows:
            outcomes = []
            for trial in range(1, int(row.get('trials', '2') or '2') + 1):
                rc, elapsed, summary, _, bench_dir, driver_stdout, driver_stderr = run_runner(bench, row['site_id'], row['bit_index'], str(trial), False, exec_timeout_s)
                srow = single_summary(summary, row['site_id'], row['bit_index'], str(trial))
                dump = Path(srow['dump']) if srow.get('dump') else bench_dir / f'{bench}_site{row["site_id"]}_bit{row["bit_index"]}_trial{trial}.bin'
                exists = dump.is_file()
                cmp_json = RESULTS_DIR / 'comparisons' / f'{row["screen_id"]}_{bench}_site{row["site_id"]}_bit{row["bit_index"]}_trial{trial}.json'
                due_reason = ''
                timeout = signal = nonzero = gpu = False
                if exists:
                    cmp = compare_exact(golden, dump, cmp_json)
                    classification = 'MASKED' if cmp['exact_match'] else 'SDC'
                    sha, size = hash_file(dump)
                    hash_rows.append({'kind': 'injected', 'screen_id': row['screen_id'], 'bench': bench, 'site_id': row['site_id'], 'bit_index': row['bit_index'], 'trial': trial, 'path': str(dump), 'sha256': sha, 'size_bytes': size})
                else:
                    classification, due_reason, timeout, signal, nonzero, gpu = classify_failure(srow.get('exit_code', rc), Path(srow.get('stdout', driver_stdout)), Path(srow.get('stderr', driver_stderr)), exists)
                    cmp_json.write_text(json.dumps({'status': 'no_dump', 'golden_path': str(golden), 'candidate_path': str(dump)}, indent=2) + '\n', encoding='utf-8')
                    if classification in {'DUE', 'INFRA_FAILURE'}:
                        for src in [Path(srow.get('stdout', '')), Path(srow.get('stderr', ''))]:
                            if src.is_file():
                                shutil.copy2(src, RESULTS_DIR / 'compact_stdout_stderr' / f'{row["screen_id"]}_trial{trial}{src.suffix}')
                outcomes.append(classification)
                trial_rows.append({
                    'screen_id': row['screen_id'],
                    'bench': bench,
                    'old_site_id': row['old_site_id'],
                    'site_id': row['site_id'],
                    'bit_index': row['bit_index'],
                    'trial': trial,
                    'classification': classification,
                    'due_reason': due_reason,
                    'runner_returncode': rc,
                    'summary_result': srow.get('result', ''),
                    'summary_exit_code': srow.get('exit_code', ''),
                    'dump_exists': exists,
                    'dump': str(dump) if exists else '',
                    'compare_json': str(cmp_json),
                    'stdout': srow.get('stdout', str(driver_stdout)),
                    'stderr': srow.get('stderr', str(driver_stderr)),
                })
                diag_rows.append({
                    'screen_id': row['screen_id'],
                    'bench': bench,
                    'site_id': row['site_id'],
                    'bit_index': row['bit_index'],
                    'trial': trial,
                    'classification': classification,
                    'timeout': timeout,
                    'signal_or_crash': signal,
                    'nonzero_exit': nonzero,
                    'gpu_runtime_error': gpu,
                    'infra_failure': classification == 'INFRA_FAILURE',
                    'due_reason': due_reason,
                })
                write_all(golden_rows, timeout_rows, baseline_rows, trial_rows, hash_rows, diag_rows, repro_rows)
            repro_rows.append({
                'screen_id': row['screen_id'],
                'bench': bench,
                'old_site_id': row['old_site_id'],
                'site_id': row['site_id'],
                'bit_index': row['bit_index'],
                'trial1_classification': outcomes[0] if outcomes else '',
                'trial2_classification': outcomes[1] if len(outcomes) > 1 else '',
                'final_reproducible_result': outcomes[0] if len(set(outcomes)) == 1 else 'UNSTABLE',
                'reproducible': len(set(outcomes)) == 1,
            })
            write_all(golden_rows, timeout_rows, baseline_rows, trial_rows, hash_rows, diag_rows, repro_rows)


if __name__ == '__main__':
    main()
