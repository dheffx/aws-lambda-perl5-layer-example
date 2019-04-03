.PHONY: clean build

FUNC_NAME ?= simple
ROOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
CONTAINER_BASE_DIR := /tmp/func

clean:
	rm -rf \
		local \
		func.zip

build: clean
ifndef CONTAINER_TAG
	@echo '[ERROR] $$CONTAINER_TAG must be specified'
	@echo 'usage: make build CONTAINER_TAG=x.x'
	exit 255
endif
	docker run --rm \
		-v $(ROOT_DIR):$(CONTAINER_BASE_DIR) \
		-e FUNC_NAME=$(FUNC_NAME) \
		-e TAG=$(CONTAINER_TAG) \
		-e BASE_DIR=$(CONTAINER_BASE_DIR)/$(FUNC_NAME) \
		$(DOCKER_HUB)lambda-perl-layer-foundation:$(CONTAINER_TAG) \
		$(CONTAINER_BASE_DIR)/build.sh