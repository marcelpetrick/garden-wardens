# 花园守夜人 · Garden Wardens

[![Local pipeline](https://github.com/marcelpetrick/garden-wardens/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/marcelpetrick/garden-wardens/actions/workflows/ci.yml)
[![在线游玩](https://img.shields.io/badge/play-GitHub%20Pages-4c9c62)](https://marcelpetrick.github.io/garden-wardens/)
[![Docker](https://img.shields.io/badge/container-GHCR-blue)](https://github.com/marcelpetrick/garden-wardens/pkgs/container/garden-wardens)
[![License](https://img.shields.io/badge/license-GPLv3%2B-blue)](LICENSE)
[![Node](https://img.shields.io/badge/node-24-green)](.nvmrc)
[![Coverage](https://img.shields.io/badge/coverage-%E2%89%A595%25-brightgreen)](vitest.config.js)

**中文** · [English](README.en.md)

这是 [SynapShift/Garden Wardens](https://github.com/SynapShift/garden-wardens) 的独立维护分支：一款使用 Phaser 和 Vite 构建的手绘风浏览器植物塔防游戏。当前版本：**0.4.3**。

**[游玩我们的最新已验证版本 →](https://marcelpetrick.github.io/garden-wardens/)**

![维护分支的真实游戏画面](docs/screenshots/gameplay.png)

## 玩法与语言

- 默认语言为中文。使用右上角的 **语言 / Language** 选择 **English**，即时切换页面和游戏内文字，不会重置战局。刷新页面后恢复中文。
- 点击卡片或按 `1`–`4` 选择守卫，在草坪格子上点击种植。
- 在同类守卫所在位置再次种植可融合升级，最高三级。
- 点击发光能量球收集能量；打开工具箱购买自动收集、随机奖励和火力强化。
- 按空格或点击暂停按钮暂停 / 继续。
- 点击页面顶部或战场上的速度按钮，循环切换 **1× → 2× → 4× → 1×**。暂停后继续会保留速度，新一局恢复 1×。
- 支持桌面键鼠与手机触屏；页面语言和速度按钮可通过键盘操作。

五条草坪、九列种植位、四种守卫和六波敌人。昼夜每 32 游戏秒切换：辉光花白天产能更快，星雾菇夜间攻击更快。太阳雨补充能量，顺风加快弹体速度。合理融合与搭配守住花园。

## 本地运行

需要 Node **24.15+**、npm 和 Git。`.nvmrc` 指定 Node 24。

```bash
nvm use
npm ci
npm run dev
```

打开 **http://127.0.0.1:5173/**。生产构建：

```bash
npm run build
npm run preview
```

打开 **http://127.0.0.1:4173/**。默认仅监听本机；需要局域网访问时自行添加 `-- --host 0.0.0.0`。

## 测试与本地流水线

完整验证需要 Docker Engine、Python 3、curl 和 Chromium：

```bash
npx playwright install --with-deps chromium
./localPipeline.sh
```

也可使用系统浏览器：`CHROMIUM_PATH=/usr/bin/chromium ./localPipeline.sh`。

流水线依次检查格式、ESLint、工具配置与本地化模块的类型、Python 脚本语法、单元及场景集成测试与覆盖率、npm 安全审计、生产构建、桌面和手机浏览器端到端测试，再构建 Docker 镜像并对容器重复浏览器测试。任何一步失败都会退出；不会跳过 Docker。所有 `src/**/*.js` 都纳入覆盖率，行、语句、分支、函数覆盖率门槛为 95%。报告位于 `coverage/`。

常用命令：`npm run format`、`npm run format:check`、`npm run lint`、`npm run check`、`npm test`、`npm run build`、`npm run test:e2e`。完整说明见 [脚本参考](docs/scripts.md)、[安全审查](docs/security-review.md) 与 [需求清单](visions.md)。

## Docker

```bash
docker compose up --build -d
# http://127.0.0.1:8080/
docker compose down
```

或运行已发布镜像（GHCR 新包默认私有；需要先使用拥有 `read:packages` 权限的令牌执行 `docker login ghcr.io`，或由所有者将包设为 Public）：

```bash
docker run --rm --read-only --tmpfs /tmp --cap-drop ALL \
  --security-opt no-new-privileges:true \
  -p 127.0.0.1:8080:8080 ghcr.io/marcelpetrick/garden-wardens:latest
```

CI 发布后会从 GHCR 重新拉取镜像并运行同一套容器浏览器测试。

镜像同时提供版本标签和 `sha-<commit>` 标签。使用固定摘要的构建与运行基础镜像，以非 root 用户运行 nginx，提供 `/healthz` 健康检查、`/source.tar.gz` 对应源码及许可证文件。

## 持续集成与维护

GitHub Actions 执行同一套本地流水线。`main` 验证通过后，自动部署到**本分支自己的 GitHub Pages** 并发布 GHCR 镜像。PR 不会获得发布权限，Actions 使用固定提交摘要。

本维护分支不依赖上游维护者回复。已提交上游的 PR 按顺序排列：[依赖安全 #4](https://github.com/SynapShift/garden-wardens/pull/4) → [英文切换 #5](https://github.com/SynapShift/garden-wardens/pull/5) → [游戏速度 #6](https://github.com/SynapShift/garden-wardens/pull/6)。本分支 `main` 始终承载已验证的游戏；后续建议使用面向本分支的功能 PR，再按需贡献上游。

每次提交递增 patch 版本，主要功能递增 minor 版本；使用 Conventional Commits，提交与推送前必须通过完整流水线。版本记录见 [CHANGELOG.md](CHANGELOG.md)。

## 美术工具、许可与致谢

可选的资源处理脚本位于 `tools/`，依赖固定在 `requirements-assets.txt`，游玩和构建不需要安装 Python 图像库。详见 [脚本参考](docs/scripts.md)。

本维护分支采用 **GPLv3 或更新版本**，见 [LICENSE](LICENSE)。原始游戏、角色、美术和代码来自 SynapShift 与 Garden Wardens contributors；原始 MIT 声明完整保存在 [LICENSES/upstream-MIT.txt](LICENSES/upstream-MIT.txt)。第三方依赖保留各自许可。样式表会加载 Google 字体；游戏无需账号或后端服务。
