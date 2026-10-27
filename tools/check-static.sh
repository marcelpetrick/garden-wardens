#!/usr/bin/env bash
# Check maintained shell/Python script syntax without running asset generation.
# Requires Bash and Python 3; creates no compiled files or generated assets.
# SPDX-License-Identifier: GPL-3.0-or-later
set -euo pipefail
cd "$(dirname "$0")/.."
for script in localPipeline.sh tools/*.sh; do bash -n "$script"; done
python3 - <<'PY'
import ast
from pathlib import Path
for script in Path("tools").glob("*.py"):
    ast.parse(script.read_text(), filename=str(script))
PY
