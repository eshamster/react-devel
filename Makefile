.PHONY: common/build common/run

COMMON_IMAGE = react-devel-common

common/build:
	(cd common ; docker build -t $(COMMON_IMAGE):latest .)

common/run:
	docker run --rm -it $(COMMON_IMAGE):latest /bin/ash -l
