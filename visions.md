# Garden Wardens refresh vision

No `visions.md` was present in the initial checkout (`247fba5`). This checklist
records the requirements supplied in the conversation, rather than claiming to
recover a missing original vision. Mandarin remains the primary game language.

## Product and contribution workflow

- [x] Review security/dependency state and report outdated versions.
- [x] File upstream issues before the three requested feature changes.
- [x] Prepare upstream PR snapshots in dependency → language → speed order.
- [x] Maintain a working fork independently of upstream responses.
- [x] Develop directly on `main`, with conventional, versioned, validated commits.
- [x] Translate the complete game and page into English via a live language switch.
- [x] Keep Mandarin as the default and preserve the match when switching language.
- [x] Add 4× speed as well as normal and 2×; preserve pause and collision behavior.

## Engineering and distribution

- [x] Establish `localPipeline.sh` early and mirror it in GitHub Actions.
- [x] Check formatting, lint, types/static analysis, coverage and builds.
- [x] Unit, integration and production browser tests where appropriate.
- [x] Enforce at least 95% application source coverage.
- [x] Get the local game working before adding Docker.
- [x] Validate an unprivileged Docker image with the same browser suite.
- [x] Publish versioned images to GHCR after the validation gate passes.
- [x] Deploy the latest validated fork to its own GitHub Pages URL.
- [x] Use GPLv3 distribution and preserve upstream MIT copyright/permission.
- [x] Document setup, controls, scripts, pipeline, Docker and contribution workflow.
- [x] README badges and a real screenshot of the current UI.
- [x] Run reviewBranch and address confirmed findings.
- [x] Run githubAbout with evidence-based wording and ten topics.
- [x] Run the final complete pipeline; verify CI, published image and deployed game.
- [x] Push all commits and leave the working tree clean.

Evidence: `docs/security-review.md`, `docs/scripts.md`, `docs/final-review.md`,
`tests/`, `vitest.config.js`, `.github/workflows/ci.yml`, and the linked README badges.
