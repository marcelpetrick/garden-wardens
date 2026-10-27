// Copyright (c) 2026 Garden Wardens contributors
// SPDX-License-Identifier: GPL-3.0-or-later
import { defineConfig } from "vitest/config";
export default defineConfig({
  test: {
    include: ["tests/unit/**/*.test.js"],
    coverage: {
      provider: "v8",
      include: ["src/**/*.js"],
      thresholds: { lines: 95, statements: 95, functions: 95 },
    },
  },
});
