// Copyright (c) 2026 Garden Wardens contributors
// SPDX-License-Identifier: GPL-3.0-or-later
import js from "@eslint/js";
import globals from "globals";
export default [
  {
    ignores: [
      "dist/**",
      "coverage/**",
      "playwright-report/**",
      "test-results/**",
    ],
  },
  js.configs.recommended,
  {
    files: ["**/*.js"],
    languageOptions: { globals: { ...globals.browser, ...globals.node } },
    rules: { "no-unused-vars": ["error", { argsIgnorePattern: "^_" }] },
  },
];
