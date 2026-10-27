#!/usr/bin/env bash
# Reproduce CI locally. Install dependencies with npm ci before running.
# CHROMIUM_PATH selects a system browser; otherwise run npx playwright install chromium.
# SPDX-License-Identifier: GPL-3.0-or-later
set -euo pipefail
cd "$(dirname "$0")"
npm run format:check
npm run lint
npm run check
npm run test
npm audit --audit-level=low
npm run build
npm run test:e2e
./tools/check-docker.sh
