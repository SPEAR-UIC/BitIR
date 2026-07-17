#!/bin/bash
set -euo pipefail

REPO_ROOT="${REPO_ROOT:-$HOME/GPU_FI}"
cd "$REPO_ROOT"

export RERUN_MODE="dry-run"
export MAX_BENCHES="${MAX_BENCHES:-0}"
export MAX_ROWS="${MAX_ROWS:-0}"

exec bash divergence_cases/rerun_scripts/frontier_amd_rerun_driver.sh
