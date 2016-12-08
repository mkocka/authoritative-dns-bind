.PHONY: build run

IMAGE_NAME = bind
IMAGE_OPTIONS = \
    --privileged \
    -p 127.0.0.1:53:53 \
    -p 127.0.0.1:53:53/udp \
    -v /var/named:/var/named:rw \
    -v /etc/named:/etc/named:ro

run: build
	docker run -d $(IMAGE_OPTIONS) $(IMAGE_NAME)

debug: build
	docker run -t -i $(IMAGE_OPTIONS) $(IMAGE_NAME)

build: Dockerfile files/*
	docker build --tag=$(IMAGE_NAME) .

test:
	run_test.sh