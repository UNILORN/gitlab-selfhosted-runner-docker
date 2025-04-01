.PHONY: help build run stop clean logs

# Default target
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  make %-10s - %s\n", $$1, $$2}'

# Build the GitLab runner Docker image
init:
	cp .env.example .env

# Run the GitLab runner container
run:
	docker compose up -d