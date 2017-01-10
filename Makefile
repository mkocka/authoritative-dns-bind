.PHONY: build run

IMAGE_NAME = authoritative-dns-bind
IMAGE_OPTIONS = \
    -v $(shell pwd)/config.yaml:/config.yaml:ro \
    -p 127.0.0.1:53:53 \
    -p 127.0.0.1:53:53/udp

run: build
	docker run -d $(IMAGE_OPTIONS) $(IMAGE_NAME)

debug: build
	docker run -t -i $(IMAGE_OPTIONS) $(IMAGE_NAME)

build: Makefile Dockerfile files/*
	docker build --tag=$(IMAGE_NAME) .

test:
	run_test.sh
