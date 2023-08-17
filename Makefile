PHONY: build lint lint-docker lint-md run

build:
	docker build --tag awesome-lint .

lint: lint-docker lint-md

lint-docker:
	hadolint Dockerfile -V

lint-md:
	markdownlint-cli2 '**/*.md'

run:
	docker container run --rm awesome-lint
