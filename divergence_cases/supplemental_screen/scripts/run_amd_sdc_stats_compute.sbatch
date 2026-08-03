#!/bin/bash
#SBATCH -J amd_sdc_stats
#SBATCH -A UIC-HPC
#SBATCH -N 1
#SBATCH -t 02:00:00
#SBATCH -o amd_sdc_stats.%j.out
#SBATCH -e amd_sdc_stats.%j.err

set -euo pipefail

cd "${SLURM_SUBMIT_DIR:-$HOME/GPU_FI}"

OUTDIR="divergence_cases/supplemental_screen/results/frontier_amd_mechanism_debug_20260724_155816/compact/amd_sdc_full_mismatch_stats"
mkdir -p "$OUTDIR/rows"
PY="$OUTDIR/compute_one_sdc_stats.py"

cat > "$PY" <<'PY'
import csv, hashlib, os, struct, sys

POPCOUNT = [bin(i).count("1") for i in range(256)]

def sha256_path(path):
    h = hashlib.sha256()
    with open(path, "rb") as f:
        for chunk in iter(lambda: f.read(16 * 1024 * 1024), b""):
            h.update(chunk)
    return h.hexdigest()

def decode_at(path, off):
    aligned = off - (off % 4)
    with open(path, "rb") as f:
        f.seek(aligned)
        b = f.read(4)
    if len(b) < 4:
        return "", ""
    return struct.unpack("<i", b)[0], struct.unpack("<f", b)[0]

def stats(golden, candidate, label):
    g_size = os.path.getsize(golden)
    c_size = os.path.getsize(candidate)
    if g_size != c_size or g_size == 0 or c_size == 0:
        return {"status": "not_full_size_sdc", "golden_bytes": g_size, "candidate_bytes": c_size}

    differing_bytes = 0
    first = None
    total_words = g_size // 4
    differing_words = 0
    total_hamming = 0
    max_hamming = 0
    first_word_hamming = ""
    offset = 0
    chunk_size = 16 * 1024 * 1024
    next_report = 512 * 1024 * 1024

    with open(golden, "rb") as gf, open(candidate, "rb") as cf:
        while True:
            gb = gf.read(chunk_size)
            cb = cf.read(chunk_size)
            if not gb and not cb:
                break
            n = min(len(gb), len(cb))
            xor = bytes([a ^ b for a, b in zip(gb[:n], cb[:n])])

            if first is None:
                for i, x in enumerate(xor):
                    if x:
                        first = offset + i
                        break

            differing_bytes += sum(1 for x in xor if x)
            usable = n - (n % 4)
            for j in range(0, usable, 4):
                hd = POPCOUNT[xor[j]] + POPCOUNT[xor[j+1]] + POPCOUNT[xor[j+2]] + POPCOUNT[xor[j+3]]
                if hd:
                    differing_words += 1
                    total_hamming += hd
                    if hd > max_hamming:
                        max_hamming = hd
                    if first_word_hamming == "":
                        first_word_hamming = hd

            offset += n
            if offset >= next_report:
                print("[progress]", label, offset, "of", g_size, flush=True)
                next_report += 512 * 1024 * 1024

    gi, gf32 = decode_at(golden, first if first is not None else 0)
    ci, cf32 = decode_at(candidate, first if first is not None else 0)
    return {
        "status": "SDC" if differing_bytes else "MASKED",
        "golden_bytes": g_size,
        "candidate_bytes": c_size,
        "golden_sha256": sha256_path(golden),
        "candidate_sha256": sha256_path(candidate),
        "first_differing_byte": "" if first is None else first,
        "differing_bytes": differing_bytes,
        "percent_differing_bytes": 100.0 * differing_bytes / g_size,
        "total_words32_compared": total_words,
        "differing_words32": differing_words,
        "percent_differing_words32": 100.0 * differing_words / total_words if total_words else "",
        "total_hamming32_over_differing_words": total_hamming,
        "avg_hamming32_per_differing_word": float(total_hamming) / differing_words if differing_words else "",
        "max_hamming32": max_hamming,
        "first_word_hamming32": first_word_hamming,
        "golden_i32": gi,
        "candidate_i32": ci,
        "golden_f32": gf32,
        "candidate_f32": cf32,
    }

fields = [
    "case","bench","site","bit","trial","status",
    "golden_path","candidate_path","golden_bytes","candidate_bytes",
    "golden_sha256","candidate_sha256","first_differing_byte",
    "differing_bytes","percent_differing_bytes",
    "total_words32_compared","differing_words32","percent_differing_words32",
    "total_hamming32_over_differing_words","avg_hamming32_per_differing_word",
    "max_hamming32","first_word_hamming32",
    "golden_i32","candidate_i32","golden_f32","candidate_f32",
]

case, bench, site, bit, trial, golden, candidate, out_csv = sys.argv[1:]
label = "%s %s site%s bit%s trial%s" % (case, bench, site, bit, trial)
print("[case]", label, flush=True)
row = {
    "case": case, "bench": bench, "site": site, "bit": bit, "trial": trial,
    "golden_path": golden, "candidate_path": candidate,
}
try:
    if not os.path.exists(golden):
        row["status"] = "missing_golden"
    elif not os.path.exists(candidate):
        row["status"] = "missing_candidate"
    else:
        row.update(stats(golden, candidate, label))
except Exception as e:
    row["status"] = "error:" + str(e)

with open(out_csv, "w", newline="") as f:
    w = csv.DictWriter(f, fieldnames=fields)
    w.writeheader()
    w.writerow(row)
print("[done]", label, out_csv, flush=True)
PY

run_case() {
  python3 "$PY" "$@" "$OUTDIR/rows/$1_$2_site$3_bit$4_trial$5.csv"
}

run_case C2 matrix-rotate 64 13 1 \
  divergence_cases/supplemental_screen/results/frontier_amd_supplemental_screen_20260723_fixed/goldens/matrix-rotate.bin \
  divergence_cases/supplemental_screen/results/frontier_amd_mechanism_debug_20260724_155816/raw/matrix-rotate/matrix-rotate_site64_bit13.bin &
run_case C2 matrix-rotate 64 13 2 \
  divergence_cases/supplemental_screen/results/frontier_amd_supplemental_screen_20260723_fixed/goldens/matrix-rotate.bin \
  divergence_cases/supplemental_screen/results/frontier_amd_mechanism_debug_20260724_155816/raw/matrix-rotate/matrix-rotate_site64_bit13_trial2.bin &
run_case C3 dense-embedding 68 11 1 \
  divergence_cases/supplemental_screen/results/frontier_amd_supplemental_screen_20260724_002651/goldens/dense-embedding.bin \
  divergence_cases/supplemental_screen/results/frontier_amd_mechanism_debug_20260724_155816/raw/dense-embedding/dense-embedding_site68_bit11.bin &
run_case C3 dense-embedding 68 11 2 \
  divergence_cases/supplemental_screen/results/frontier_amd_supplemental_screen_20260724_002651/goldens/dense-embedding.bin \
  divergence_cases/supplemental_screen/results/frontier_amd_mechanism_debug_20260724_155816/raw/dense-embedding/dense-embedding_site68_bit11_trial2.bin &
run_case C5 layout 82 12 1 \
  divergence_cases/supplemental_screen/results/frontier_amd_supplemental_screen_20260724_002651/goldens/layout.bin \
  divergence_cases/supplemental_screen/results/frontier_amd_mechanism_debug_20260724_155816/raw/layout/layout_site82_bit12.bin &
run_case C5 layout 82 12 2 \
  divergence_cases/supplemental_screen/results/frontier_amd_supplemental_screen_20260724_002651/goldens/layout.bin \
  divergence_cases/supplemental_screen/results/frontier_amd_mechanism_debug_20260724_155816/raw/layout/layout_site82_bit12_trial2.bin &
wait

python3 - <<'PY'
import csv
from pathlib import Path

outdir = Path("divergence_cases/supplemental_screen/results/frontier_amd_mechanism_debug_20260724_155816/compact/amd_sdc_full_mismatch_stats")
rows = []
fields = None
for path in sorted((outdir / "rows").glob("*.csv")):
    with open(path, newline="") as f:
        r = csv.DictReader(f)
        if fields is None:
            fields = r.fieldnames
        rows.extend(r)

out = outdir / "amd_sdc_full_mismatch_stats.csv"
with open(out, "w", newline="") as f:
    w = csv.DictWriter(f, fieldnames=fields)
    w.writeheader()
    w.writerows(rows)

print(out)
print(open(out).read())
PY
