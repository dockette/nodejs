RELEASE_VERSION:=$(shell cat VERSION)
DOCKER_IMAGE=dockette/nodejs

_docker-build-%: VERSION=$*
_docker-build-%:
	docker buildx \
		build \
		--platform linux/amd64,linux/arm64 \
		--pull \
		-t ${DOCKER_IMAGE}:${VERSION} \
		./${VERSION}

build-v6: _docker-build-v6
build-v7: _docker-build-v7
build-v8: _docker-build-v8
build-v9: _docker-build-v9
build-v10: _docker-build-v10
build-v11: _docker-build-v11
build-v12: _docker-build-v12
build-v13: _docker-build-v13
build-v14: _docker-build-v14
build-v15: _docker-build-v15
build-v16: _docker-build-v16
build-v17: _docker-build-v17
build-v18: _docker-build-v18
build-v19: _docker-build-v19
build-v20: _docker-build-v20
build-v21: _docker-build-v21
build-v22: _docker-build-v22
build-v23: _docker-build-v23
build-v24: _docker-build-v24
build-v25: _docker-build-v25
build-v26: _docker-build-v26

.PHONY: version
version:
	@echo ${RELEASE_VERSION}

# Sets VERSION to today's date (UTC), YYYY.MM.DD, or YYYY.MM.DD.N when that
# date is already released (tagged). Commit and push to master to publish.
.PHONY: release
release:
	@git fetch -q --tags origin 2>/dev/null || true; \
	v=$$(date -u +%Y.%m.%d); n=0; \
	while git rev-parse -q --verify "refs/tags/$$v" >/dev/null; do n=$$((n+1)); v=$$(date -u +%Y.%m.%d).$$n; done; \
	echo "$$v" > VERSION; \
	echo "VERSION: ${RELEASE_VERSION} -> $$v"; \
	echo "next: git commit -am 'Release: $$v' && git push"
