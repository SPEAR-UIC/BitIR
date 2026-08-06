from __future__ import annotations

import shlex
from pathlib import Path
from typing import Any


def shell_join(command: list[Any]) -> str:
    return " ".join(shlex.quote(str(part)) for part in command)


def export_line(name: str, value: Any) -> str:
    if value is None or value == "":
        return ""
    if isinstance(value, list):
        value = " ".join(str(item) for item in value)
    return f"export {name}={shlex.quote(str(value))}"


def export_mapping(lines: list[str], prefix: str, value: Any) -> None:
    if isinstance(value, dict):
        for key, subvalue in value.items():
            export_mapping(lines, f"{prefix}_{str(key).upper()}", subvalue)
        return
    line = export_line(prefix, value)
    if line:
        lines.append(line)


def script_header(machine_name: str, task: str, job: dict[str, Any]) -> list[str]:
    values = {
        "machine": machine_name,
        "task": task.replace("-", "_"),
        "bench": str(job.get("bench", "all")).strip() or "all",
        "stamp": str(job.get("stamp", "")).strip(),
        "index": str(job.get("index", "00")).strip() or "00",
        "account": str(job.get("account", "{ADD ACCOUNT HERE}")).strip() or "{ADD ACCOUNT HERE}",
    }
    header = ["#!/bin/bash"]
    for line in job.get("header", []):
        rendered = str(line)
        for key, value in values.items():
            rendered = rendered.replace("{" + key + "}", value)
        rendered = rendered.replace("{ADD ACCOUNT HERE}", values["account"])
        header.append(rendered)
    return header


def module_block(module_use: list[str], modules: list[str], permissive: bool) -> list[str]:
    lines: list[str] = [
        'if ! command -v module >/dev/null 2>&1 && [[ -f /etc/profile.d/modules.sh ]]; then',
        '  source /etc/profile.d/modules.sh',
        "fi",
        'if command -v module >/dev/null 2>&1; then',
        "  module purge || true" if permissive else "  module purge",
    ]
    quiet = " 2>/dev/null || true" if permissive else ""
    for path in module_use:
        lines.append(f"  module use {shlex.quote(str(path))}{quiet}")
    for mod in modules:
        lines.append(f"  module load {shlex.quote(str(mod))}{quiet}")
    lines.append("fi")
    return lines


def wrapper_script(
    machine_name: str,
    task: str,
    job: dict[str, Any],
    command: list[Any],
    repo_root: Path,
    module_use: list[str],
    modules: list[str],
) -> str:
    lines = [
        "set -euo pipefail",
        'echo "[trace] start $(date -u +%Y-%m-%dT%H:%M:%SZ)"',
        'echo "[trace] host $(hostname)"',
        *module_block(module_use, modules, permissive=False),
        f"cd {shlex.quote(str(repo_root))}",
        shell_join(command),
    ]
    return "\n".join(script_header(machine_name, task, job) + ["", *lines, ""])


def local_script(
    machine_name: str,
    task: str,
    job: dict[str, Any],
    exports: list[str],
    body: str,
    module_use: list[str],
    modules: list[str],
) -> str:
    lines = [
        "set -euo pipefail",
        'echo "[trace] start $(date -u +%Y-%m-%dT%H:%M:%SZ)"',
        'echo "[trace] host $(hostname)"',
        *[line for line in exports if line],
        *module_block(module_use, modules, permissive=True),
        'cd "${BITIR_WORKDIR}"',
        body,
    ]
    return "\n".join(script_header(machine_name, task, job) + ["", *lines, ""])
