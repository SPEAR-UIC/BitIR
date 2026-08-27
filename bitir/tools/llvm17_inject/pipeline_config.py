from copy import deepcopy
from pathlib import Path
from typing import Any, Dict, List, Set, Union

import yaml


def merge_dicts(base: Any, override: Any) -> Any:
    if not isinstance(base, dict) or not isinstance(override, dict):
        return deepcopy(override)
    merged = deepcopy(base)
    for key, value in override.items():
        if isinstance(merged.get(key), dict) and isinstance(value, dict):
            merged[key] = merge_dicts(merged[key], value)
        else:
            merged[key] = deepcopy(value)
    return merged


def load_config(path: Union[str, Path]) -> Dict[str, Any]:
    seen = set()  # type: Set[Path]

    def read_one(config_path: Path) -> Dict[str, Any]:
        config_path = config_path.resolve()
        if config_path in seen:
            raise SystemExit(f"cyclic config extends detected at {config_path}")
        seen.add(config_path)
        with config_path.open("r", encoding="utf-8") as handle:
            config = yaml.safe_load(handle) or {}
        extends = config.pop("extends", None)
        if not extends:
            return config
        base = {}  # type: Dict[str, Any]
        for item in extends if isinstance(extends, list) else [extends]:
            base_path = Path(item)
            if not base_path.is_absolute():
                base_path = config_path.parent / base_path
            base = merge_dicts(base, read_one(base_path))
        return merge_dicts(base, config)

    return read_one(Path(path))


def read_benches(path: Union[str, Path]) -> List[str]:
    benches = []  # type: List[str]
    for raw in Path(path).read_text(encoding="utf-8").splitlines():
        line = raw.strip()
        if line and not line.startswith("#"):
            benches.append(line)
    return benches


def require_fields(scope: str, mapping: Dict[str, Any], keys: List[str]) -> None:
    missing = [key for key in keys if str(mapping.get(key, "")).strip() == ""]
    if missing:
        raise SystemExit(f"missing {scope} field(s) in YAML: {', '.join(missing)}")


def validate_machine(task: str, machine_name: str, machine: Dict[str, Any], mode: str) -> None:
    require_fields(f"machines.{machine_name}", machine, ["script_extension"])
    if mode == "submit":
        require_fields(f"machines.{machine_name}", machine, ["submit_command"])
    if task in {"build", "golden"}:
        require_fields(
            f"machines.{machine_name}",
            machine,
            ["build_dir", "binary_subdir", "golden_root", "build_configure"],
        )
    if task in {"deploy", "baseline", "inject-one"}:
        require_fields(
            f"machines.{machine_name}",
            machine,
            ["results_root", "golden_root", "source_file", "binary_subdir"],
        )
        if not str(machine.get("inject_build", "")).strip():
            require_fields(
                f"machines.{machine_name}",
                machine,
                ["inject_build_baseline", "inject_build_injected"],
            )
    if task == "deploy":
        require_fields(f"machines.{machine_name}", machine, ["worklist_build_ir"])


def resolve_mode(args: Any, run_cfg: Dict[str, Any]) -> str:
    if args.submit:
        return "submit"
    if args.local:
        return "local"
    if args.print_script:
        return "print-script"
    mode = (args.execution_mode or str(run_cfg.get("execution_mode", "write-script")).strip() or "write-script").lower()
    aliases = {"render": "print-script", "print": "print-script", "stdout": "print-script", "write": "write-script"}
    mode = aliases.get(mode, mode)
    if mode not in {"submit", "local", "print-script", "write-script"}:
        raise SystemExit(f"unsupported execution_mode={mode!r}")
    return mode
