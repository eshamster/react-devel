.PHONY: common/build common/run

COMMON_IMAGE = react-devel-common

common/build:
	docker build -t $(COMMON_IMAGE):latest -f common/Dockerfile .

common/run:
	docker run --rm -it $(COMMON_IMAGE):latest /bin/ash -l
