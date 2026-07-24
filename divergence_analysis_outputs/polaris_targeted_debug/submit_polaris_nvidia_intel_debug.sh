#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "usage: $0 <polaris_project_account>" >&2
  exit 2
fi

ACCOUNT="$1"
REPO_ROOT="$(git rev-parse --show-toplevel)"
SRC="${REPO_ROOT}/divergence_analysis_outputs/polaris_targeted_debug/run_polaris_nvidia_intel_debug.pbs"
SUBMIT_DIR="${REPO_ROOT}/divergence_analysis_outputs/polaris_targeted_debug/submitted"
mkdir -p "${SUBMIT_DIR}"

STAMP="$(date -u +%Y%m%d_%H%M%S)"
DST="${SUBMIT_DIR}/run_polaris_nvidia_intel_debug_${STAMP}.pbs"
sed "s/{ADD ACCOUNT HERE}/${ACCOUNT}/g" "${SRC}" > "${DST}"
chmod +x "${DST}"

echo "submitting ${DST}"
qsub "${DST}"
