from __future__ import annotations

import re
from pathlib import Path

KNOWN_MODELS = ("cuda", "hip", "sycl", "omp", "openmp")


def parse_list(value: str | None) -> list[str]:
    return [item.strip() for item in re.split(r"[;,\s]+", value or "") if item.strip()]


def discover_variants(benchmark_root: Path, source_root: str = "src", require_cmake: bool = False) -> dict[str, dict[str, Path]]:
    source_dir = benchmark_root / source_root
    variants: dict[str, dict[str, Path]] = {}
    if not source_dir.is_dir():
        raise SystemExit(f"missing benchmark source root: {source_dir}")
    for child in sorted(source_dir.iterdir()):
        if not child.is_dir():
            continue
        if require_cmake and not (child / "CMakeLists.txt").is_file():
            continue
        for model in KNOWN_MODELS:
            suffix = f"-{model}"
            if child.name.endswith(suffix):
                variants.setdefault(child.name[: -len(suffix)], {})[model] = child
                break
    return variants


def split_top_level_args(text: str) -> list[str]:
    args: list[str] = []
    current: list[str] = []
    depth = 0
    in_string: str | None = None
    escape = False
    for char in text:
        if in_string:
            current.append(char)
            if escape:
                escape = False
            elif char == "\\":
                escape = True
            elif char == in_string:
                in_string = None
            continue
        if char in ("'", '"'):
            in_string = char
            current.append(char)
        elif char in "([{":
            depth += 1
            current.append(char)
        elif char in ")]}":
            depth = max(0, depth - 1)
            current.append(char)
        elif char == "," and depth == 0:
            args.append("".join(current).strip())
            current = []
        else:
            current.append(char)
    if current:
        args.append("".join(current).strip())
    return args


def source_files(source_dir: Path) -> list[Path]:
    files: set[Path] = set()
    for pattern in ("*.cu", "*.cpp", "*.cc", "*.cxx", "*.c", "*.h", "*.hpp"):
        files.update(source_dir.glob(pattern))
    return sorted(files)


def read_sources(source_dir: Path) -> list[tuple[str, str]]:
    chunks: list[tuple[str, str]] = []
    for path in source_files(source_dir):
        try:
            chunks.append((path.name, path.read_text(encoding="utf-8", errors="replace")))
        except OSError:
            continue
    return chunks
