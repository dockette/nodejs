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
