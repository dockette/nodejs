DOCKER_IMAGE=dockette/nodejs
DOCKER_VERSION?=v18
DOCKER_PLATFORMS?=linux/amd64,linux/arm64
DOCKER_VERSIONS=v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 v16 v17 v18


.PHONY: build
build: build-${DOCKER_VERSION}

.PHONY: build-all
build-all: $(addprefix build-,$(DOCKER_VERSIONS))

.PHONY: test
test: test-${DOCKER_VERSION}

.PHONY: test-all
test-all: $(addprefix test-,$(DOCKER_VERSIONS))

.PHONY: run
run:
	docker run --rm -it ${DOCKER_IMAGE}:${DOCKER_VERSION}

_docker-build-%: VERSION=$*
.PHONY: _docker-build-%
_docker-build-%:
	docker buildx \
		build \
		--platform ${DOCKER_PLATFORMS} \
		--pull \
		-t ${DOCKER_IMAGE}:${VERSION} \
		./${VERSION}

_docker-test-%: VERSION=$*
.PHONY: _docker-test-%
_docker-test-%:
	set -eu; \
		node_version="$$(docker run --rm ${DOCKER_IMAGE}:${VERSION} node -v)"; \
		case "$$node_version" in \
			${VERSION}*) printf 'Node version matched %s\n' "$$node_version" ;; \
			*) printf 'Invalid node version %s != ${VERSION}\n' "$$node_version"; exit 255 ;; \
		esac; \
		npm_version="$$(docker run --rm ${DOCKER_IMAGE}:${VERSION} npm -v)"; \
		test -n "$$npm_version"; \
		printf 'npm version %s\n' "$$npm_version"

.PHONY: build-v6
build-v6: _docker-build-v6
.PHONY: build-v7
build-v7: _docker-build-v7
.PHONY: build-v8
build-v8: _docker-build-v8
.PHONY: build-v9
build-v9: _docker-build-v9
.PHONY: build-v10
build-v10: _docker-build-v10
.PHONY: build-v11
build-v11: _docker-build-v11
.PHONY: build-v12
build-v12: _docker-build-v12
.PHONY: build-v13
build-v13: _docker-build-v13
.PHONY: build-v14
build-v14: _docker-build-v14
.PHONY: build-v15
build-v15: _docker-build-v15
.PHONY: build-v16
build-v16: _docker-build-v16
.PHONY: build-v17
build-v17: _docker-build-v17
.PHONY: build-v18
build-v18: _docker-build-v18

.PHONY: test-v6
test-v6: _docker-test-v6
.PHONY: test-v7
test-v7: _docker-test-v7
.PHONY: test-v8
test-v8: _docker-test-v8
.PHONY: test-v9
test-v9: _docker-test-v9
.PHONY: test-v10
test-v10: _docker-test-v10
.PHONY: test-v11
test-v11: _docker-test-v11
.PHONY: test-v12
test-v12: _docker-test-v12
.PHONY: test-v13
test-v13: _docker-test-v13
.PHONY: test-v14
test-v14: _docker-test-v14
.PHONY: test-v15
test-v15: _docker-test-v15
.PHONY: test-v16
test-v16: _docker-test-v16
.PHONY: test-v17
test-v17: _docker-test-v17
.PHONY: test-v18
test-v18: _docker-test-v18
