VSN = 0.4
IMG = arne/baseimage:$(VSN)
IMG_LATEST = arne/baseimage:latest

.PHONY: all image clean

all: latest

latest:	image
	docker tag "$(IMG)" "$(IMG_LATEST)"

image: image/Dockerfile
	docker build -t "$(IMG)" image

clean:
	rm -f image/$(PREFIX).tar.gz
