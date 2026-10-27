# GitHub About proposal

Current repository metadata: description “An original hand-painted WebGL garden
tower-defense game”; no topics. The existing description should identify this as
a maintained fork to avoid implying we originated the upstream game.

Recommended description (under 350 characters):

> A maintained browser tower-defense game with hand-painted gardens, Mandarin/English UI, plant fusion and 4× speed.

Short alternative:

> Defend a hand-painted garden with plant fusion, day/night resonance and up to 4× speed.

Technical alternative:

> A Phaser/WebGL tower-defense fork with live Mandarin/English switching, 4× simulation, Docker distribution and shared local/CI browser checks.

Recommended ten topics:

`tower-defense`, `browser-game`, `phaser`, `webgl`, `javascript`,
`strategy-game`, `game`, `github-pages`, `docker`, `playwright`.

Possible swaps: `localization`, `gpl-3-0`, `hand-painted`, `web-audio`.

| Claim / topic                           | Repository evidence                                                                  |
| --------------------------------------- | ------------------------------------------------------------------------------------ |
| Maintained fork                         | README credits, upstream remote, upstream PR links                                   |
| Browser game; Phaser; WebGL; JavaScript | `package.json`, `src/main.js`, `index.html`                                          |
| Tower defense; strategy; fusion         | Five-lane combat and fusion logic in `src/main.js`                                   |
| Hand-painted gardens                    | Original artwork in `assets/` and game assets in `public/assets/`                    |
| Mandarin/English                        | `src/i18n.js`, locale selector in `index.html`, locale tests                         |
| 4× speed                                | `GameScene.cycleSpeed`, bounded simulation steps and speed tests                     |
| Docker distribution                     | `Dockerfile`, `compose.yml`, `tools/check-docker.sh`                                 |
| Local/CI browser checks; Playwright     | `localPipeline.sh`, `playwright.config.js`, `tests/e2e/`, `.github/workflows/ci.yml` |
| GitHub Pages                            | Validated deploy job and the fork's live README play link                            |

These are proposals, not claims of independent performance certification or
security guarantees. No public About metadata was changed: the invoked skill
calls for a proposal unless applying the metadata has been explicitly requested.
