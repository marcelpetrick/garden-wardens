# Changelog

## 0.4.3

- Document the complete fork workflow, current UI, scripts and refresh checklist.
- Include game and dependency license notices in every published build; record final review.

## 0.4.2

- Fix energy collection during pause and after a match ends.
- Strengthen edge-case tests and coverage gates.

## 0.4.1

- Package a digest-pinned, unprivileged Docker image and publish validated builds to GHCR.
- Gate this fork's Pages deployment and image publication on the same local pipeline.
- Pin workflow actions and optional artwork dependencies.
- Distribute under GPLv3 or later while retaining the upstream MIT notice.

## 0.4.0

- Cycle between 1×, 2× and 4× from the game or accessible page controls.
- Bound simulation steps and synchronize timers, animations, pause and restart.

## 0.3.0

- Add a live English language switch; keep Mandarin as the initial default.
- Translate loading, game controls, tools, hints, notifications and results.

## 0.2.1

- Upgrade Phaser 3.90.0 → 4.2.1 and Vite 7.3.6 → 8.3.5 with exact pins.
- Remove known vulnerable dependencies and establish local/CI validation.

## 0.2.0

- Original upstream game baseline, commit `247fba5`.
