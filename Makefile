DOCKER_IMAGE=dockette/nodejs

.DEFAULT_GOAL := help

##@ Help

.PHONY: help
help: ## Show this help
	@awk 'BEGIN {FS = ":.*##"; printf "Usage: make \033[36m<target>\033[0m\n"} /^[a-zA-Z0-9_.-]+:.*##/ { sub(/^ +/, "", $$2); printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) }' $(firstword $(MAKEFILE_LIST))

##@ Versions

_docker-build-%: VERSION=$*
_docker-build-%:
	docker buildx \
		build \
		--platform linux/amd64,linux/arm64 \
		--pull \
		-t ${DOCKER_IMAGE}:${VERSION} \
		./${VERSION}

.PHONY: build-v6
build-v6: _docker-build-v6 ## Build the Node.js 6 image (v6)

.PHONY: build-v7
build-v7: _docker-build-v7 ## Build the Node.js 7 image (v7)

.PHONY: build-v8
build-v8: _docker-build-v8 ## Build the Node.js 8 image (v8)

.PHONY: build-v9
build-v9: _docker-build-v9 ## Build the Node.js 9 image (v9)

.PHONY: build-v10
build-v10: _docker-build-v10 ## Build the Node.js 10 image (v10)

.PHONY: build-v11
build-v11: _docker-build-v11 ## Build the Node.js 11 image (v11)

.PHONY: build-v12
build-v12: _docker-build-v12 ## Build the Node.js 12 image (v12)

.PHONY: build-v13
build-v13: _docker-build-v13 ## Build the Node.js 13 image (v13)

.PHONY: build-v14
build-v14: _docker-build-v14 ## Build the Node.js 14 image (v14)

.PHONY: build-v15
build-v15: _docker-build-v15 ## Build the Node.js 15 image (v15)

.PHONY: build-v16
build-v16: _docker-build-v16 ## Build the Node.js 16 image (v16)

.PHONY: build-v17
build-v17: _docker-build-v17 ## Build the Node.js 17 image (v17)

.PHONY: build-v18
build-v18: _docker-build-v18 ## Build the Node.js 18 image (v18)

.PHONY: build-v19
build-v19: _docker-build-v19 ## Build the Node.js 19 image (v19)

.PHONY: build-v20
build-v20: _docker-build-v20 ## Build the Node.js 20 image (v20)

.PHONY: build-v21
build-v21: _docker-build-v21 ## Build the Node.js 21 image (v21)

.PHONY: build-v22
build-v22: _docker-build-v22 ## Build the Node.js 22 image (v22)

.PHONY: build-v23
build-v23: _docker-build-v23 ## Build the Node.js 23 image (v23)

.PHONY: build-v24
build-v24: _docker-build-v24 ## Build the Node.js 24 image (v24)

.PHONY: build-v25
build-v25: _docker-build-v25 ## Build the Node.js 25 image (v25)

.PHONY: build-v26
build-v26: _docker-build-v26 ## Build the Node.js 26 image (v26)
