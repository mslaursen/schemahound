default: help

.PHONY: help
help: # Show help for each of the Makefile recipes.
	@grep -E '^[a-zA-Z0-9 -]+:.*#'  Makefile | sort | while read -r l; do printf "\033[1;32m$$(echo $$l | cut -f 1 -d':')\033[00m:$$(echo $$l | cut -f 2- -d'#')\n"; done

.PHONY: lint
lint: # Run linters on the codebase.
	uv run ruff format
	uv run ruff check . --fix --unsafe-fixes
	uv run mypy schemahound

.PHONY: test
test: # Run all tests in the codebase.
	uv run pytest tests -s -v
