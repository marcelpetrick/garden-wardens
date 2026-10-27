# SPDX-License-Identifier: GPL-3.0-or-later
FROM node:24-alpine@sha256:06d7adf3e0ef61a13f1d28682726366f97a15aa1888c934d3ecec86c33918b53 AS build
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci
COPY . .
RUN npm run build && tar --exclude=node_modules --exclude=dist --exclude=coverage --exclude=test-results --exclude=.git -czf /tmp/source.tar.gz .

FROM nginxinc/nginx-unprivileged:stable-alpine@sha256:f5116ed4606f3eb015dd4a8e28cb9b351476dc0ad4bc6e9f93b19cec130cdf03
LABEL org.opencontainers.image.source="https://github.com/marcelpetrick/garden-wardens" \
      org.opencontainers.image.licenses="GPL-3.0-or-later" \
      org.opencontainers.image.title="Garden Wardens"
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/dist /usr/share/nginx/html
COPY --from=build /tmp/source.tar.gz /usr/share/nginx/html/source.tar.gz
COPY LICENSE /usr/share/nginx/html/LICENSE
COPY LICENSES /usr/share/nginx/html/LICENSES
EXPOSE 8080
HEALTHCHECK --interval=10s --timeout=3s --start-period=5s --retries=3 CMD wget -q -O /dev/null http://127.0.0.1:8080/healthz || exit 1
