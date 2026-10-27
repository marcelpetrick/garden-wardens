// Copyright (c) 2026 Garden Wardens contributors
// SPDX-License-Identifier: GPL-3.0-or-later
// Include distribution notices in every Pages and Docker production build.
import { copyFile, mkdir } from "node:fs/promises";
const target = new URL("../public/licenses/", import.meta.url);
await mkdir(target, { recursive: true });
for (const [source, name] of [
  ["../LICENSE", "GPL-3.0.txt"],
  ["../LICENSES/upstream-MIT.txt", "upstream-MIT.txt"],
  ["../node_modules/phaser/LICENSE.md", "phaser-MIT.txt"],
  ["../node_modules/eventemitter3/LICENSE", "eventemitter3-MIT.txt"],
  [
    "../node_modules/phaser/src/physics/matter-js/lib/license.js",
    "matter-MIT.txt",
  ],
]) {
  await copyFile(new URL(source, import.meta.url), new URL(name, target));
}
