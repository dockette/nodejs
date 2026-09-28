# Dockette / Node.js

Instructions for AI coding agents working in this repository.

## Overview

`dockette/nodejs` builds Alpine based Node.js images with `npm` and `git`, one tag per Node.js major. It is a
runtime image (see IMAGES.md) for CI jobs and build steps. It ships no application code and no process manager.

- **Image**: `dockette/nodejs`, tags `v6` to `v26` (one per major). CI publishes no `latest` tag
- **Base**: `dockette/alpine:<x.y>` for `v6`, `v7` and `v11` to `v26`; the official `node:<n>-alpine` for `v8`,
  `v9` and `v10`. Node.js comes from the Alpine packages, not from nodejs.org
- **Platforms**: `linux/amd64`, `linux/arm64`
- **Layout**: one folder per tag (`v24/`, `v26/`), each with only a `Dockerfile`

## Documentation

- `README.md` lists every tag with its Alpine version. No workflow job syncs it to Docker Hub; update the Hub
  description by hand after changing it.
- Supported versions and the deprecation steps are in
  [IMAGES.md](https://github.com/dockette/dockette/blob/master/specs/IMAGES.md).

## Commands

```bash
# Build one tag for linux/amd64 and linux/arm64
make build-v26
make build-v24

# Smoke test the way CI does (the tag must appear in `node -v`)
docker run --rm dockette/nodejs:v26 node -v
```

The `Makefile` has only `help` and one `build-v<n>` target per folder; there is no `build`, `test`, `run`,
`build-all` or `VERSION`. `make build-v<n>` builds both platforms at once, which needs a builder with
multi-platform support (the containerd image store or a `docker-container` builder).

CI does not call `make`. The single `docker` job runs per matrix tag, with `fail-fast: false`: it builds both
platforms, loads a `linux/amd64` copy, checks that `node -v` contains the tag, then builds and pushes. It runs
only on a push to `master`.

## Conventions

- The tag is `v` plus the Node.js major (`v24`), an older naming scheme that stays because users pin it
  (IMAGES.md, Tag Naming). The folder name is the tag.
- A new major is a new folder, a `build-v<n>` target in the `Makefile`, a matrix entry in
  `.github/workflows/docker.yml` and a README row.
- From `v12` on, even majors install `nodejs` from the Alpine main repository. Odd majors from `v13` on, and
  `v26`, install `nodejs-current@community` from a community repository line added in the `Dockerfile`.

## Traps

- **The Node.js version is whatever the Alpine release ships.** Nothing pins it; the major is chosen by the
  `FROM dockette/alpine:<x.y>` line. Moving a tag to another Alpine release can change its major, and only the CI
  `node -v` check catches it.
- **The community repository line must match the `FROM` version.** `v26` uses `FROM dockette/alpine:3.24` and
  `.../alpine/v3.24/community`; a mismatch mixes packages from two releases. The lines use plain `http://` and
  the `nl.alpinelinux.org` mirror.
- **`v8`, `v9` and `v10` are different.** They build on the official `node` image, rename its `node` user to
  `dfx` and install no `git`. `v6` to `v10` start `node`; `v11` and later start `nodejs`.
- **Most tags run on an EOL Alpine or an EOL Node.js.** Only `v22`, `v24` and `v26` are supported Node.js
  majors. Don't add features to the others; fix only what breaks the build.
- **Every push to `master` republishes all 21 tags.** There is no weekly `schedule` and no `workflow_dispatch`,
  so a tag is only rebuilt when something is merged.
- **`latest` is not built.** Don't add it without choosing a supported major and writing it in the README.
- Usage for image users (tags, Alpine versions, `npm`) lives in `README.md`, not here.
