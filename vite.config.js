// Copyright (c) 2026 Garden Wardens contributors
// SPDX-License-Identifier: GPL-3.0-or-later
import { defineConfig } from "vite";

export default defineConfig({
  base: "./",
  build: { sourcemap: false, chunkSizeWarningLimit: 1400 },
});
