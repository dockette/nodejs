# Dockette / Node.js

Node.js images with npm and git, one tag per Node.js major version.

## Stack

- Docker image built with `docker buildx`, base `dockette/alpine` (older majors use `node:<n>-alpine`)
- Node.js 6 to 26 from Alpine packages, with npm and git
- Published to Docker Hub as `dockette/nodejs` for linux/amd64 and linux/arm64 by GitHub Actions

## Development

```bash
make build-v24   # build one version (v6 to v26)
docker run --rm dockette/nodejs:v24 node --version   # smoke test it
```

There are no `build`, `test` or `run` targets. Run `make` to list every target.

## Principles

- KISS: one image does one job; no extra services or tools.
- DRY: shared steps live in the base image, not copied into every Dockerfile.
- YAGNI: add a package only when the image needs it.
- Pin versions, keep layers small, clean package caches in the same `RUN`.
- Every change is built and smoke tested with `make build-v<n>` before a commit.
