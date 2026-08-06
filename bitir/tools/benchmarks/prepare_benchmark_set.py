#!/usr/bin/env python3
import argparse
import csv
import re
import shutil
import shlex
from pathlib import Path

from benchmark_common import discover_variants, parse_list, split_top_level_args


GENERATED_DUMP_MODELS = ("cuda", "hip")


def cmake_quote(value):
    return '"' + str(value).replace("\\", "\\\\").replace('"', '\\"') + '"'


def adapter_root_for(benchmark_set):
    bitir_root = Path(__file__).resolve().parents[2]
    return bitir_root / "benchmarks" / benchmark_set / "dump_adapters"


def find_statement_end(text, start):
    in_string = None
    escape = False
    in_line_comment = False
    in_block_comment = False
    pos = start
    while pos < len(text):
        char = text[pos]
        nxt = text[pos + 1] if pos + 1 < len(text) else ""
        if in_line_comment:
            if char == "\n":
                in_line_comment = False
        elif in_block_comment:
            if char == "*" and nxt == "/":
                in_block_comment = False
                pos += 1
        elif in_string:
            if escape:
                escape = False
            elif char == "\\":
                escape = True
            elif char == in_string:
                in_string = None
        elif char == "/" and nxt == "/":
            in_line_comment = True
            pos += 1
        elif char == "/" and nxt == "*":
            in_block_comment = True
            pos += 1
        elif char in ("'", '"'):
            in_string = char
        elif char == ";":
            return pos + 1
        pos += 1
    return start


def find_device_to_host_copies(text, model):
    api = r"cudaMemcpy(?:Async)?" if model == "cuda" else r"hipMemcpy(?:Async)?"
    direction = "cudaMemcpyDeviceToHost" if model == "cuda" else "hipMemcpyDeviceToHost"
    calls = []
    pattern = re.compile(rf"\b{api}\s*\(", re.MULTILINE)
    index = 0
    while True:
        match = pattern.search(text, index)
        if not match:
            break
        pos = match.end()
        depth = 1
        in_string = None
        escape = False
        while pos < len(text) and depth:
            char = text[pos]
            if in_string:
                if escape:
                    escape = False
                elif char == "\\":
                    escape = True
                elif char == in_string:
                    in_string = None
            elif char in ("'", '"'):
                in_string = char
            elif char == "(":
                depth += 1
            elif char == ")":
                depth -= 1
            pos += 1
        args = split_top_level_args(text[match.end(): pos - 1])
        end = pos
        while end < len(text) and text[end].isspace():
            end += 1
        if end < len(text) and text[end] != ";":
            end = find_statement_end(text, end)
        elif end < len(text):
            end += 1
        if len(args) >= 4 and args[3].strip() == direction:
            calls.append(
                {
                    "dest": args[0],
                    "bytes": args[2],
                    "insert_after": end,
                }
            )
        index = end
    return calls


def dump_insertion_point(text, calls, model):
    latest_copy = max(call["insert_after"] for call in calls)
    cleanup_api = r"cudaFree|cudaFreeHost" if model == "cuda" else r"hipFree|hipHostFree"
    pattern = re.compile(rf"\b(?:{cleanup_api}|free|delete)\b|\breturn\b")
    match = pattern.search(text, latest_copy)
    if not match:
        return latest_copy
    line_start = text.rfind("\n", 0, match.start()) + 1
    return line_start if line_start >= latest_copy else match.start()


def copied_value_name(dest):
    match = re.match(r"\s*&?\s*([A-Za-z_][A-Za-z0-9_]*)", dest)
    return match.group(1) if match else ""


def select_dump_calls(text, calls, insertion):
    used = []
    for call in calls:
        name = copied_value_name(call["dest"])
        if not name:
            continue
        after_copy = text[call["insert_after"]:insertion]
        if re.search(rf"\b{re.escape(name)}\b", after_copy):
            used.append(call)
    return used or calls


def patch_argc_for_dump(text):
    matches = list(re.finditer(r"argc\s*!=\s*(\d+)", text))
    main_match = re.search(r"\bmain\s*\([^)]*\)\s*\{", text)
    if main_match and not re.search(r"\bmain\s*\([^)]*\bargc\b[^)]*\bargv\b[^)]*\)", text):
        return text, 0
    if matches:
        match = matches[0]
        expected = int(match.group(1))
        dump_arg = expected
        replacement = f"(argc != {expected} && argc != {expected + 1})"
        text = text[: match.start()] + replacement + text[match.end():]
        usage_start = text.find("Usage:", match.start())
        if usage_start != -1:
            line_end = text.find("\\n", usage_start)
            if line_end != -1:
                text = text[:line_end] + " [dump file]" + text[line_end:]
        argv_match = list(re.finditer(rf"argv\s*\[\s*{expected - 1}\s*\]", text))
        if argv_match:
            line_end = text.find("\n", argv_match[-1].end())
            if line_end != -1:
                insert = f'\n  const char *dump_path = (argc == {expected + 1}) ? argv[{dump_arg}] : NULL;\n  if (dump_path) setenv("BITIR_DUMP_PATH", dump_path, 1);'
                text = text[:line_end] + insert + text[line_end:]
                return text, dump_arg
        main_match = re.search(r"\bmain\s*\([^)]*\)\s*\{", text)
        if main_match:
            insert = f'\n  const char *dump_path = (argc == {expected + 1}) ? argv[{dump_arg}] : NULL;\n  if (dump_path) setenv("BITIR_DUMP_PATH", dump_path, 1);'
            text = text[: main_match.end()] + insert + text[main_match.end():]
            return text, dump_arg
        return text, None
    if main_match:
        insert = '\n  const char *dump_path = (argc > 1) ? argv[argc - 1] : NULL;\n  if (dump_path) setenv("BITIR_DUMP_PATH", dump_path, 1);'
        text = text[: main_match.end()] + insert + text[main_match.end():]
        return text, -1
    return text, None


def add_stdio_include(text):
    if "#include <stdio.h>" in text or "#include <cstdio>" in text:
        return text
    include_match = re.search(r"^(#include\s+[<\"].+[>\"]\s*)$", text, re.MULTILINE)
    if include_match:
        return text[: include_match.end()] + "\n#include <stdio.h>" + text[include_match.end():]
    return "#include <stdio.h>\n" + text


def add_stdlib_include(text):
    if "#include <stdlib.h>" in text or "#include <cstdlib>" in text:
        return text
    include_match = re.search(r"^(#include\s+[<\"].+[>\"]\s*)$", text, re.MULTILINE)
    if include_match:
        return text[: include_match.end()] + "\n#include <stdlib.h>" + text[include_match.end():]
    return "#include <stdlib.h>\n" + text


def dump_block(calls):
    lines = [
        "",
        '  const char *bitir_dump_path = getenv("BITIR_DUMP_PATH");',
        "  if (bitir_dump_path) {",
        '    FILE *bitir_dump = fopen(bitir_dump_path, "wb");',
        "    if (!bitir_dump) {",
        '      perror("bitir dump");',
        "      return 1;",
        "    }",
        f"    const unsigned long long bitir_output_count = {len(calls)}ULL;",
        "    fwrite(&bitir_output_count, sizeof(bitir_output_count), 1, bitir_dump);",
    ]
    for index, call in enumerate(calls):
        lines.extend(
            [
                f"    size_t bitir_bytes_{index} = (size_t)({call['bytes']});",
                f"    fwrite(&bitir_bytes_{index}, sizeof(bitir_bytes_{index}), 1, bitir_dump);",
                f"    fwrite({call['dest']}, 1, bitir_bytes_{index}, bitir_dump);",
            ]
        )
    lines.extend(["    fclose(bitir_dump);", "  }", ""])
    return "\n".join(lines)


def generate_dump_adapter(source_dir, model):
    if model not in GENERATED_DUMP_MODELS:
        return False
    candidates = []
    for pattern in ("*.cu", "*.cpp", "*.cc", "*.cxx", "*.c"):
        candidates.extend(source_dir.glob(pattern))
    main_file = None
    best = None
    best_calls = []
    for path in sorted(set(candidates)):
        text = path.read_text(encoding="utf-8", errors="replace")
        if main_file is None and re.search(r"\bmain\s*\([^)]*\)", text):
            main_file = path
        calls = find_device_to_host_copies(text, model)
        if len(calls) > len(best_calls):
            best = path
            best_calls = calls
    if not main_file or not best or not best_calls:
        return False
    main_text = main_file.read_text(encoding="utf-8", errors="replace")
    main_text = add_stdlib_include(main_text)
    main_text, dump_arg = patch_argc_for_dump(main_text)
    if dump_arg is None:
        return False
    main_file.write_text(main_text, encoding="utf-8")
    text = best.read_text(encoding="utf-8", errors="replace")
    if "bitir_dump_path" in text:
        return True
    text = add_stdlib_include(add_stdio_include(text))
    best_calls = find_device_to_host_copies(text, model)
    if not best_calls:
        return False
    insertion = dump_insertion_point(text, best_calls, model)
    best_calls = select_dump_calls(text, best_calls, insertion)
    text = text[:insertion] + dump_block(best_calls) + text[insertion:]
    best.write_text(text, encoding="utf-8")
    return True


def materialize_source_dir(output_root, adapter_root, bench, model, source_dir, generate_adapters=True):
    adapter_dir = adapter_root / f"{bench}-{model}"
    materialized = output_root / "sources" / f"{bench}-{model}"
    if adapter_dir.is_dir():
        if materialized.exists():
            shutil.rmtree(materialized)
        shutil.copytree(source_dir, materialized, symlinks=True)
        for path in adapter_dir.rglob("*"):
            rel = path.relative_to(adapter_dir)
            dest = materialized / rel
            if path.is_dir():
                dest.mkdir(parents=True, exist_ok=True)
            else:
                dest.parent.mkdir(parents=True, exist_ok=True)
                shutil.copy2(path, dest)
        return materialized, adapter_dir
    if generate_adapters and model in GENERATED_DUMP_MODELS:
        if materialized.exists():
            shutil.rmtree(materialized)
        shutil.copytree(source_dir, materialized, symlinks=True)
        if generate_dump_adapter(materialized, model):
            return materialized, "generated_dump_adapter"
        shutil.rmtree(materialized)
    return source_dir, ""


def write_manifest(path, selected):
    with path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.writer(handle)
        writer.writerow(["benchmark", "model", "source_dir", "adapter_dir"])
        for bench, model, source_dir, adapter_dir in selected:
            writer.writerow([bench, model, source_dir, adapter_dir])


def write_cmake(path, benchmark_root, selected):
    modules_dir = benchmark_root / "cmake" / "modules"
    source_root = benchmark_root / "src"
    lines = [
        "cmake_minimum_required(VERSION 3.21)",
        "project(BitIRBenchmarkSet LANGUAGES C CXX)",
        "",
        "set(CMAKE_CXX_STANDARD 17)",
        "set(CMAKE_CXX_STANDARD_REQUIRED ON)",
        "set(CMAKE_CXX_EXTENSIONS OFF)",
        "set(CMAKE_CUDA_STANDARD 17)",
        "set(CMAKE_CUDA_STANDARD_REQUIRED ON)",
        "set(CMAKE_CUDA_EXTENSIONS OFF)",
        "",
        "option(HECBENCH_ENABLE_CUDA \"Enable CUDA benchmarks\" OFF)",
        "option(HECBENCH_ENABLE_HIP \"Enable HIP benchmarks\" OFF)",
        "option(HECBENCH_ENABLE_SYCL \"Enable SYCL benchmarks\" OFF)",
        "option(HECBENCH_ENABLE_OPENMP \"Enable OpenMP benchmarks\" OFF)",
        "option(HECBENCH_ENABLE_TESTING \"Enable testing\" OFF)",
        'set(HECBENCH_CUDA_ARCH "70" CACHE STRING "CUDA architecture")',
        'set(HECBENCH_HIP_ARCH "gfx90a" CACHE STRING "HIP architecture")',
        'set(HECBENCH_FI_ENABLED FALSE)',
        f"set(BITIR_BENCHMARK_ROOT {cmake_quote(benchmark_root)})",
        f"set(BITIR_BENCHMARK_SOURCE_ROOT {cmake_quote(source_root)})",
        f"list(APPEND CMAKE_MODULE_PATH {cmake_quote(modules_dir)})",
        "",
        "if(HECBENCH_ENABLE_CUDA)",
        "  enable_language(CUDA)",
        "  find_package(CUDAToolkit REQUIRED)",
        '  if(HECBENCH_CUDA_ARCH MATCHES "^sm_([0-9]+)$")',
        "    set(_bitir_cuda_arch ${CMAKE_MATCH_1})",
        "  else()",
        "    set(_bitir_cuda_arch ${HECBENCH_CUDA_ARCH})",
        "  endif()",
        "  set(CMAKE_CUDA_ARCHITECTURES ${_bitir_cuda_arch})",
        "endif()",
        "",
        "if(HECBENCH_ENABLE_HIP)",
        "  enable_language(HIP)",
        "  find_package(HIP MODULE)",
        "endif()",
        "",
        "if(HECBENCH_ENABLE_SYCL)",
        "  find_package(SYCL MODULE)",
        "endif()",
        "",
        "if(HECBENCH_ENABLE_OPENMP)",
        "  find_package(OpenMP)",
        "endif()",
        "",
        "set_property(GLOBAL PROPERTY HECBENCH_ALL_BENCHMARKS \"\")",
        "set_property(GLOBAL PROPERTY HECBENCH_CATEGORIES \"\")",
        "",
        "function(add_hecbench_benchmark)",
        "  set(options \"\")",
        "  set(oneValueArgs NAME MODEL TEST_REGEX TEST_TIMEOUT)",
        "  set(multiValueArgs SOURCES CATEGORIES COMPILE_OPTIONS LINK_LIBRARIES INCLUDE_DIRS TEST_ARGS)",
        "  cmake_parse_arguments(BENCH \"${options}\" \"${oneValueArgs}\" \"${multiValueArgs}\" ${ARGN})",
        "  if(NOT BENCH_NAME OR NOT BENCH_MODEL OR NOT BENCH_SOURCES)",
        "    message(FATAL_ERROR \"add_hecbench_benchmark requires NAME, MODEL, and SOURCES\")",
        "  endif()",
        "  string(TOLOWER \"${BENCH_MODEL}\" BENCH_MODEL_LOWER)",
        "  set(TARGET_NAME \"${BENCH_NAME}-${BENCH_MODEL_LOWER}\")",
        "  set(MODEL_ENABLED FALSE)",
        "  if(BENCH_MODEL_LOWER STREQUAL \"cuda\" AND HECBENCH_ENABLE_CUDA)",
        "    set(MODEL_ENABLED TRUE)",
        "  elseif(BENCH_MODEL_LOWER STREQUAL \"hip\" AND HECBENCH_ENABLE_HIP)",
        "    set(MODEL_ENABLED TRUE)",
        "  elseif(BENCH_MODEL_LOWER STREQUAL \"sycl\" AND HECBENCH_ENABLE_SYCL)",
        "    set(MODEL_ENABLED TRUE)",
        "  elseif((BENCH_MODEL_LOWER STREQUAL \"omp\" OR BENCH_MODEL_LOWER STREQUAL \"openmp\") AND HECBENCH_ENABLE_OPENMP)",
        "    set(MODEL_ENABLED TRUE)",
        "  endif()",
        "  if(NOT MODEL_ENABLED)",
        "    message(STATUS \"Skipping ${TARGET_NAME} (model not enabled)\")",
        "    return()",
        "  endif()",
        "  if(BENCH_MODEL_LOWER STREQUAL \"hip\")",
        "    set_source_files_properties(${BENCH_SOURCES} PROPERTIES LANGUAGE HIP)",
        "  endif()",
        "  add_executable(${TARGET_NAME} ${BENCH_SOURCES})",
        "  set_target_properties(${TARGET_NAME} PROPERTIES OUTPUT_NAME ${BENCH_NAME} RUNTIME_OUTPUT_DIRECTORY \"${CMAKE_BINARY_DIR}/bin/${BENCH_MODEL_LOWER}\")",
        "  if(BENCH_INCLUDE_DIRS)",
        "    target_include_directories(${TARGET_NAME} PRIVATE ${BENCH_INCLUDE_DIRS})",
        "  endif()",
        "  target_include_directories(${TARGET_NAME} PRIVATE \"${BITIR_BENCHMARK_SOURCE_ROOT}/include\" \"${CMAKE_CURRENT_SOURCE_DIR}\")",
        "  if(NOT BENCH_MODEL_LOWER STREQUAL \"cuda\")",
        "    set(_cuda_variant \"${BITIR_BENCHMARK_SOURCE_ROOT}/${BENCH_NAME}-cuda\")",
        "    if(EXISTS \"${_cuda_variant}\")",
        "      target_include_directories(${TARGET_NAME} PRIVATE \"${_cuda_variant}\")",
        "    endif()",
        "  endif()",
        "  if(BENCH_MODEL_LOWER STREQUAL \"cuda\")",
        "    set_target_properties(${TARGET_NAME} PROPERTIES CUDA_SEPARABLE_COMPILATION ON CUDA_STANDARD 17 CUDA_STANDARD_REQUIRED ON CUDA_EXTENSIONS OFF)",
        "    target_link_libraries(${TARGET_NAME} PRIVATE CUDA::cudart)",
        "  elseif(BENCH_MODEL_LOWER STREQUAL \"hip\")",
        "    set_target_properties(${TARGET_NAME} PROPERTIES HIP_STANDARD 17 HIP_ARCHITECTURES ${HECBENCH_HIP_ARCH})",
        "    target_compile_options(${TARGET_NAME} PRIVATE $<$<COMPILE_LANGUAGE:HIP>:--offload-arch=${HECBENCH_HIP_ARCH}>)",
        "  elseif(BENCH_MODEL_LOWER STREQUAL \"sycl\")",
        "    target_compile_options(${TARGET_NAME} PRIVATE -fsycl ${SYCL_FLAGS})",
        "    target_link_options(${TARGET_NAME} PRIVATE -fsycl ${SYCL_FLAGS})",
        "  elseif(BENCH_MODEL_LOWER STREQUAL \"omp\" OR BENCH_MODEL_LOWER STREQUAL \"openmp\")",
        "    if(OpenMP_CXX_FOUND)",
        "      target_link_libraries(${TARGET_NAME} PRIVATE OpenMP::OpenMP_CXX)",
        "    endif()",
        "  endif()",
        "  if(BENCH_COMPILE_OPTIONS)",
        "    target_compile_options(${TARGET_NAME} PRIVATE ${BENCH_COMPILE_OPTIONS})",
        "  endif()",
        "  if(BENCH_LINK_LIBRARIES)",
        "    target_link_libraries(${TARGET_NAME} PRIVATE ${BENCH_LINK_LIBRARIES})",
        "  endif()",
        "  if(NOT TARGET ${BENCH_NAME}-all)",
        "    add_custom_target(${BENCH_NAME}-all)",
        "  endif()",
        "  add_dependencies(${BENCH_NAME}-all ${TARGET_NAME})",
        "  message(STATUS \"Registered benchmark: ${TARGET_NAME}\")",
        "endfunction()",
        "",
    ]
    for bench, model, source_dir, _ in selected:
        binary_dir = f"_bitir/{bench}-{model}"
        lines.append(f"add_subdirectory({cmake_quote(source_dir)} {cmake_quote(binary_dir)})")
    lines.append("")
    path.write_text("\n".join(lines), encoding="utf-8")


def main():
    parser = argparse.ArgumentParser(description="Prepare a BitIR benchmark-set CMake overlay")
    parser.add_argument("--benchmark-set", default="hecbench")
    parser.add_argument("--benchmark-root", required=True)
    parser.add_argument("--source-root", default="src")
    parser.add_argument("--output-root", required=True)
    parser.add_argument("--benchmarks", required=True)
    parser.add_argument("--models", required=True)
    parser.add_argument("--no-generate-adapters", action="store_true")
    parser.add_argument("--list", action="store_true")
    args = parser.parse_args()

    benchmark_root = Path(args.benchmark_root).resolve()
    output_root = Path(args.output_root).resolve()
    adapter_root = adapter_root_for(args.benchmark_set)
    output_root.mkdir(parents=True, exist_ok=True)
    variants = discover_variants(benchmark_root, args.source_root, require_cmake=True)
    benches = parse_list(args.benchmarks)
    models = parse_list(args.models)
    if not benches:
        raise SystemExit("no benchmarks requested")
    if not models:
        raise SystemExit("no benchmark models requested")

    selected = []
    missing = []
    for bench in benches:
        for model in models:
            source_dir = variants.get(bench, {}).get(model)
            if source_dir:
                selected_source, adapter_dir = materialize_source_dir(
                    output_root,
                    adapter_root,
                    bench,
                    model,
                    source_dir,
                    generate_adapters=not args.no_generate_adapters,
                )
                selected.append((bench, model, selected_source, adapter_dir))
            else:
                missing.append(f"{bench}-{model}")
    if args.list:
        for bench in sorted(variants):
            print(bench + ": " + ",".join(sorted(variants[bench])))
        return
    if missing:
        available = ", ".join(f"{bench}: {','.join(sorted(models))}" for bench, models in sorted(variants.items()))
        raise SystemExit(f"missing benchmark variant(s): {', '.join(missing)}\navailable variants: {available}")

    write_manifest(output_root / "benchmark_variants.csv", selected)
    write_cmake(output_root / "CMakeLists.txt", benchmark_root, selected)
    quoted = " ".join(shlex.quote(f"{bench}-{model}") for bench, model, _, _ in selected)
    print(f"[benchmark-set] {args.benchmark_set}: prepared {quoted} in {output_root}")


if __name__ == "__main__":
    main()
