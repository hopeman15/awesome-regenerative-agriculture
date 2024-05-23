build:
	docker build --tag awesome-lint .
.PHONY: build

check-markdown: lint-md
	npx awesome-lint
.PHONY: check-markdown

lint: lint-docker lint-md
.PHONY: lint

lint-docker:
	hadolint Dockerfile -V
.PHONY: lint-docker

lint-md:
	markdownlint-cli2 '**/*.md'
.PHONY: lint-md

run:
	docker container run --rm awesome-lint
.PHONY: run
