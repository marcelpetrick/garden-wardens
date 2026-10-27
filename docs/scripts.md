# Script reference

Run commands from the repository root. Bash scripts use strict error handling and
exit nonzero when a required check fails.

| Entry point                            | Purpose                                                              | Requirements / output                                                                                   |
| -------------------------------------- | -------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- |
| `./localPipeline.sh`                   | The complete local and CI gate                                       | Node 24, npm dependencies, Chromium, Docker, Python 3, curl; reports in `coverage/` and `test-results/` |
| `npm run dev`                          | Local development with live reload                                   | Loopback port 5173                                                                                      |
| `npm run build`                        | Production bundle                                                    | `dist/`, with relative asset URLs for GitHub Pages                                                      |
| `npm run preview`                      | Serve the production build locally                                   | Loopback port 4173                                                                                      |
| `npm run format` / `format:check`      | Apply / verify formatting                                            | Prettier; generated assets/reports ignored                                                              |
| `npm run lint`                         | Static JavaScript checks                                             | ESLint, all maintained JavaScript                                                                       |
| `npm run check`                        | Type-check config and localization; validate Python and shell syntax | TypeScript, Python 3 and Bash                                                                           |
| `npm test`                             | Unit and scene integration tests with coverage                       | Vitest/V8; all application source included                                                              |
| `npm run test:e2e`                     | Real production-browser tests                                        | Playwright; builds must already exist                                                                   |
| `node tools/copy-licenses.js`          | Copy game and dependency notices into the production public assets   | Automatically run by `npm run build`; creates ignored `public/licenses/`                                |
| `./tools/check-static.sh`              | Check Bash/Python syntax without changing assets                     | Bash and Python 3; invoked by `npm run check`                                                           |
| `./tools/check-docker.sh`              | Build and validate the production container                          | Docker, curl, Chromium; temporary container automatically removed                                       |
| `python tools/process_assets.py`       | Rebuild eight transparent character sprites                          | `pip install -r requirements-assets.txt`; writes `public/assets/sprites/`                               |
| `python tools/process_enemy_sheets.py` | Rebuild enemy animation atlases                                      | Same optional Python dependencies; writes `public/assets/animations/`                                   |

Browser environment variables:

- `CHROMIUM_PATH`: use a system Chromium executable instead of Playwright's downloaded browser.
- `E2E_BASE_URL`: run browser tests against an already running server, without launching preview. Include a trailing slash for a subdirectory URL, such as `https://marcelpetrick.github.io/garden-wardens/`.
- `DOCKER_IMAGE`: image tag used by the Docker check (default `garden-wardens:local`).
- `DOCKER_SKIP_BUILD=1`: validate an already built/pulled image; used to verify the image published to GHCR. The full pipeline always builds by default.

The Docker check requests a random loopback host port, waits for `/healthz`,
checks the source archive and runtime user, runs the browser suite, and removes its
container even on failure. It does not alter any existing containers.

To update the README screenshot, use a real browser capture from the running game;
do not replace it with generated artwork. The browser suite's `test-results/gameplay.png`
is a reproducible capture of the current production build.
