<h1 align=center>Dockette / Node.js</h1>

<p align=center>
   <a href="https://github.com/dockette/nodejs/actions"><img src="https://github.com/dockette/nodejs/actions/workflows/docker.yml/badge.svg" alt="GitHub Actions"></a>
   <a href="https://hub.docker.com/r/dockette/nodejs"><img src="https://img.shields.io/docker/pulls/dockette/nodejs.svg" alt="Docker Hub pulls"></a>
   <a href="https://github.com/sponsors/f3l1x"><img src="https://img.shields.io/badge/sponsor-GitHub%20Sponsors-ea4aaa" alt="GitHub Sponsors"></a>
   <a href="https://github.com/orgs/dockette/discussions"><img src="https://img.shields.io/badge/support-discussions-6f42c1" alt="Support/Discussions"></a>
</p>

<p align=center>
   <a href="https://nodejs.org">Node.js</a> 6 to 26 with <code>npm</code> and <code>git</code>, one image per major version. Built on Alpine Linux with the Node.js package that Alpine ships, for CI jobs and build steps that need a specific Node.js major.
</p>

-----

## Usage

Mount your project and run a command in it:

```sh
docker run -v "$(pwd)":/srv -w /srv dockette/nodejs:v24 npm ci
```

The image adds `npm` and `git` to the Node.js package that Alpine ships, and sets no working directory, so pass
`-w`. The patch version moves with every rebuild; pin the major with the tag. See the
[Node.js documentation](https://nodejs.org/docs/latest/api/) for the runtime itself.

## Versions

Each tag is built for `linux/amd64` and `linux/arm64`. There is no `latest` tag; pin a major.

| Tag | Base | Upstream EOL | State |
|-----|------|--------------|-------|
| `dockette/nodejs:v26` | `dockette/alpine:3.24` | 2029-04-30 | Supported |
| `dockette/nodejs:v25` | `dockette/alpine:3.23` | 2026-06-01 | Legacy (EOL runtime) |
| `dockette/nodejs:v24` | `dockette/alpine:3.24` | 2028-04-30 | Supported |
| `dockette/nodejs:v23` | `dockette/alpine:3.21` | 2025-06-01 | Legacy (EOL runtime) |
| `dockette/nodejs:v22` | `dockette/alpine:3.22` | 2027-04-30 | Supported |
| `dockette/nodejs:v21` | `dockette/alpine:3.19` | 2024-06-01 | EOL runtime and base |
| `dockette/nodejs:v20` | `dockette/alpine:3.20` | 2026-04-30 | EOL runtime and base |
| `dockette/nodejs:v19` | `dockette/alpine:3.17` | 2023-06-01 | EOL runtime and base |
| `dockette/nodejs:v18` | `dockette/alpine:3.17` | 2025-04-30 | EOL runtime and base |
| `dockette/nodejs:v17` | `dockette/alpine:3.15` | 2022-06-01 | EOL runtime and base |
| `dockette/nodejs:v16` | `dockette/alpine:3.16` | 2023-09-11 | EOL runtime and base |
| `dockette/nodejs:v15` | `dockette/alpine:3.13` | 2021-06-01 | EOL runtime and base |
| `dockette/nodejs:v14` | `dockette/alpine:3.14` | 2023-04-30 | EOL runtime and base |
| `dockette/nodejs:v13` | `dockette/alpine:3.11` | 2020-06-01 | EOL runtime and base |
| `dockette/nodejs:v12` | `dockette/alpine:3.12` | 2022-04-30 | EOL runtime and base |
| `dockette/nodejs:v11` | `dockette/alpine:3.9` | 2019-06-01 | EOL runtime and base |
| `dockette/nodejs:v10` | `node:10-alpine` | 2021-04-30 | EOL runtime and base |
| `dockette/nodejs:v9` | `node:9-alpine` | 2018-06-30 | EOL runtime and base |
| `dockette/nodejs:v8` | `node:8-alpine` | 2019-12-31 | EOL runtime and base |
| `dockette/nodejs:v7` | `dockette/alpine:3.6` | 2017-06-30 | EOL runtime and base |
| `dockette/nodejs:v6` | `dockette/alpine:3.6` | 2019-04-30 | EOL runtime and base |

> [!WARNING]
> Only `v22`, `v24` and `v26` get security fixes from upstream. The other tags run an EOL Node.js, most of them
> on an EOL Alpine release; use them only to build old projects.

The `v8`, `v9` and `v10` tags build on the official `node` images. They rename the `node` user to `dfx` and don't
include `git`. The `v6` to `v10` tags start `node` instead of `nodejs`.

## Development

```sh
make build-v26   # build the Node.js 26 image
make build-v24   # build the Node.js 24 image
make build-v22   # build the Node.js 22 image
```

Run `make` to list every target.

## Maintenance

See [how to contribute](https://github.com/dockette/.github/blob/master/CONTRIBUTING.md) to this package. Consider [supporting](https://github.com/sponsors/f3l1x) **f3l1x**. Thank you for using this package.
