<h1 align=center>Dockette / NodeJS</h1>

<p align=center>
   <a href="https://github.com/dockette/nodejs/actions"><img src="https://github.com/dockette/nodejs/actions/workflows/docker.yml/badge.svg" alt="GitHub Actions"></a>
   <a href="https://hub.docker.com/r/dockette/nodejs"><img src="https://img.shields.io/docker/pulls/dockette/nodejs.svg" alt="Docker Hub pulls"></a>
   <a href="https://github.com/sponsors/f3l1x"><img src="https://img.shields.io/badge/sponsor-GitHub%20Sponsors-ea4aaa" alt="GitHub Sponsors"></a>
   <a href="https://github.com/orgs/dockette/discussions"><img src="https://img.shields.io/badge/support-discussions-6f42c1" alt="Support/Discussions"></a>
</p>

<p align=center>
   Ready-to-use images for NodeJS.
</p>

-----

## Usage

| NodeJS          | Base image              | Tag           |
|-----------------|-------------------------|---------------|
| NodeJS 18       | Alpine v3.17            | v18           |
| NodeJS 17       | Alpine v3.15            | v17           |
| NodeJS 16       | Alpine v3.16            | v16           |
| NodeJS 15       | Alpine v3.13            | v15           |
| NodeJS 14       | Alpine v3.14            | v14           |
| NodeJS 13       | Alpine v3.11            | v13           |
| NodeJS 12       | Alpine v3.12            | v12           |
| NodeJS 11       | Alpine v3.9             | v11           |
| NodeJS 10       | `node:10-alpine`        | v10           |
| NodeJS 9        | `node:9-alpine`         | v9            |
| NodeJS 8        | `node:8-alpine`         | v8            |
| NodeJS 7        | Alpine v3.6             | v7            |
| NodeJS 6        | Alpine v3.6             | v6            |

These tags are kept for legacy projects. All published NodeJS versions in this repository are EOL upstream.

Tags `v8`, `v9`, and `v10` use the floating official Node Alpine images above, so the exact Alpine minor version is determined by Docker Hub when those images are resolved.

## Makefile

- `make build` builds `dockette/nodejs:${DOCKER_VERSION}` with Docker Buildx.
- `make build-all` builds all versioned tags from `v6` through `v18`.
- `make test` runs smoke tests for `dockette/nodejs:${DOCKER_VERSION}`.
- `make test-all` runs smoke tests for all versioned tags.
- `make run` starts `dockette/nodejs:${DOCKER_VERSION}` interactively.
- `DOCKER_VERSION` selects the tag for `build`, `test`, and `run`; it defaults to `v18`.

## Maintenance
See [how to contribute](https://github.com/dockette/.github/blob/master/CONTRIBUTING.md) to this package. Consider to [support](https://github.com/sponsors/f3l1x) **f3l1x**. Thank you for using this package.
