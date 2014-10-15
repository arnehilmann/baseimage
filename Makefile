VSN = 0.1
IMG = arne/baseimage:$(VSN)
IMG_LATEST = arne/baseimage:latest

.PHONY: all image clean

all: latest

latest:	image
	docker tag "$(IMG)" "$(IMG_LATEST)"

image: image/Dockerfile
	docker build -t "$(IMG)" image

image/Dockerfile: image/*
	image/create-dockerfile

clean:
	rm -f image/$(PREFIX).tar.gz
