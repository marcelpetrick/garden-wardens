#!/usr/bin/env bash
# Build the production image, run it unprivileged/read-only, check health and
# corresponding source availability, then run the same production browser suite.
# DOCKER_IMAGE overrides the local image tag; CHROMIUM_PATH selects the browser.
set -euo pipefail
cd "$(dirname "$0")/.."
image="${DOCKER_IMAGE:-garden-wardens:local}"
container=""
source_list=$(mktemp)
cleanup() { if [[ -n "$container" ]]; then docker rm -f "$container" >/dev/null; fi; rm -f "$source_list"; }
trap cleanup EXIT
if [[ "${DOCKER_SKIP_BUILD:-0}" != 1 ]]; then docker build -t "$image" .; fi
container=$(docker run -d --read-only --tmpfs /tmp --cap-drop ALL --security-opt no-new-privileges:true -p 127.0.0.1::8080 "$image")
port=$(docker port "$container" 8080/tcp | awk -F: '{print $NF}')
url="http://127.0.0.1:$port"
for attempt in {1..30}; do
  if curl --fail --silent "$url/healthz" >/dev/null; then break; fi
  sleep 1
done
curl --fail --silent "$url/healthz"
curl --fail --silent "$url/source.tar.gz" | tar -tzf - > "$source_list"
rg -q './src/main.js' "$source_list"
rm "$source_list"
[[ "$(docker inspect --format '{{.Config.User}}' "$container")" == 101 ]]
E2E_BASE_URL="$url" npm run test:e2e
