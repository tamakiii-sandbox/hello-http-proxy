ROOT_DIR := $$(dirname $(realpath $(lastword $(MAKEFILE_LIST))/../..))
DOCKER_ROOT_DIR := /app/docker/openssl
SERVICE := openssl
TARGET :=

%:
	make -f $(realpath $(lastword $(MAKEFILE_LIST))) run TARGET=$@

run:
	cd $(ROOT_DIR) && docker-compose run --rm --entrypoint "make -C $(DOCKER_ROOT_DIR) $(TARGET)" $(SERVICE)

