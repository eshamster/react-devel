.PHONY: common/build common/run

COMMON_IMAGE = react-devel-common
DEV_IMAGE = react-devel-dev

common/build:
	docker build -t $(COMMON_IMAGE):latest -f common/Dockerfile .

common/run:
	docker run --rm -it $(COMMON_IMAGE):latest /bin/ash -l

dev/build:
	docker build -t $(DEV_IMAGE):latest .

dev/run:
	docker run --rm \
		-p ${PORT}:3000 \
		-e "GITHUB_USER_NAME" \
		-e "GITHUB_USER_EMAIL" \
		-e "GITHUB_PAT" \
		-v $(PWD)/work:/root/work \
		-it $(DEV_IMAGE):latest /bin/ash -l
