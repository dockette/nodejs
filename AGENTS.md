# AGENTS.md

## Project

Dockette NodeJS publishes ready-to-use Docker images for legacy Node.js versions. All tags in this repository are EOL upstream and are kept for existing projects.

## Images

- Docker image: `dockette/nodejs`.
- Default Makefile tag: `v18`.
- Published tags and build contexts: `v6` through `v18`, each built from `./<tag>`.
- Base images are `dockette/alpine:<version>` and vary by Node.js release.
- GitHub Actions builds every tag from its matching context and publishes multi-arch images for `linux/amd64,linux/arm64`.

## Commands

- `make build` builds `dockette/nodejs:${DOCKER_VERSION}` with Docker Buildx.
- `make build-all` builds all versioned tags.
- `make test` checks `node -v` starts with the selected tag and verifies `npm -v` returns a value.
- `make test-all` runs the smoke tests for every tag.
- `make run` starts the selected image interactively.
- Override `DOCKER_VERSION`, `DOCKER_IMAGE`, or `DOCKER_PLATFORMS` when testing a specific tag or platform.

## Runtime Notes

- There are no compose files in this repository.
- The default container command is `nodejs` on newer images and `node` on older images; tests call `node -v`, so keep the executable available.
- The images install Node.js and npm from Alpine packages, not from NodeSource or upstream tarballs.

## Guidelines

- Keep README tag tables, `DOCKER_VERSIONS`, version directories, and workflow matrices aligned when adding or removing a tag.
- Prefer `DOCKER_*` names for Docker-related Makefile variables.
- Place `.PHONY: <target>` directly above each Makefile target.
- Preserve the existing lightweight Dockerfile style and cleanup of package caches.
- Do not introduce unrelated formatting or structural changes.
