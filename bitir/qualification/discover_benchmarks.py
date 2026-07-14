#!/usr/bin/env python3
import argparse
import csv
from pathlib import Path


MODELS = ("cuda", "hip", "sycl", "omp", "openmp")


def discover(benchmark_root, source_root, model):
    src_root = benchmark_root / source_root
    if not src_root.is_dir():
        raise SystemExit(f"missing benchmark source root: {src_root}")
    suffix = f"-{model}"
    rows = []
    for path in sorted(src_root.iterdir()):
        if not path.is_dir() or not path.name.endswith(suffix):
            continue
        cmake = path / "CMakeLists.txt"
        if not cmake.is_file():
            continue
        text = cmake.read_text(encoding="utf-8", errors="replace")
        if "add_hecbench_benchmark" not in text:
            continue
        bench = path.name[: -len(suffix)]
        rows.append(
            {
                "benchmark": bench,
                "model": model,
                "source_dir": str(path.relative_to(benchmark_root)),
                "cmake": str(cmake.relative_to(benchmark_root)),
            }
        )
    return rows


def write_chunks(rows, chunks_dir, chunk_size, prefix):
    chunks_dir.mkdir(parents=True, exist_ok=True)
    if chunk_size <= 0:
        chunk_size = len(rows) or 1
    for index in range(0, len(rows), chunk_size):
        chunk = rows[index:index + chunk_size]
        path = chunks_dir / f"{prefix}_{index // chunk_size:03d}.txt"
        path.write_text("\n".join(row["benchmark"] for row in chunk) + "\n", encoding="utf-8")


def main():
    parser = argparse.ArgumentParser(description="Discover registered benchmark variants and write chunk files")
    parser.add_argument("--benchmark-root", required=True)
    parser.add_argument("--source-root", default="src")
    parser.add_argument("--model", choices=MODELS, required=True)
    parser.add_argument("--output-dir", required=True)
    parser.add_argument("--chunk-size", type=int, default=25)
    args = parser.parse_args()

    benchmark_root = Path(args.benchmark_root).resolve()
    output_dir = Path(args.output_dir)
    output_dir.mkdir(parents=True, exist_ok=True)
    rows = discover(benchmark_root, args.source_root, args.model)

    csv_path = output_dir / f"benchmarks_{args.model}.csv"
    with csv_path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=["benchmark", "model", "source_dir", "cmake"])
        writer.writeheader()
        writer.writerows(rows)

    write_chunks(rows, output_dir / "chunks", args.chunk_size, args.model)
    print(f"wrote {len(rows)} benchmark(s) to {csv_path}")
    print(f"wrote chunks to {output_dir / 'chunks'}")


if __name__ == "__main__":
    main()
