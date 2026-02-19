# Makefile for common development tasks
.PHONY: help install install-dev clean test lint format type security docs build docker-build docker-up docker-down

help:
	@echo "Available commands:"
	@echo "  make install          - Install dependencies"
	@echo "  make install-dev      - Install development dependencies"
	@echo "  make clean            - Remove build artifacts and cache"
	@echo "  make test             - Run tests"
	@echo "  make test-cov         - Run tests with coverage report"
	@echo "  make lint             - Run all linters"
	@echo "  make format           - Auto-format code"
	@echo "  make type             - Run type checking"
	@echo "  make security         - Run security checks"
	@echo "  make pre-commit       - Run pre-commit hooks"
	@echo "  make pre-commit-install - Install pre-commit hooks"
	@echo "  make docs             - Build documentation"
	@echo "  make build            - Build distribution packages"
	@echo "  make docker-build     - Build Docker image"
	@echo "  make docker-up        - Start Docker containers"
	@echo "  make docker-down      - Stop Docker containers"

install:
	pip install --upgrade pip setuptools wheel
	pip install -r requirements.txt

install-dev:
	pip install --upgrade pip setuptools wheel
	pip install -r requirements-dev.txt

clean:
	find . -type f -name '*.pyc' -delete
	find . -type d -name '__pycache__' -delete
	find . -type d -name '*.egg-info' -exec rm -rf {} + 2>/dev/null || true
	rm -rf build/ dist/ .tox/ .mypy_cache/ .pytest_cache/ htmlcov/ .coverage

test:
	pytest tests/ -v

test-cov:
	pytest tests/ -v --cov=src --cov-report=html --cov-report=term-missing

lint:
	black --check src tests
	isort --check-only src tests
	ruff check src tests
	pylint src

format:
	black src tests
	isort src tests
	ruff check --fix src tests

type:
	mypy src

security:
	bandit -r src

pre-commit:
	pre-commit run --all-files

pre-commit-install:
	pre-commit install

docs:
	cd docs && sphinx-build -W -b html . _build/html

build: clean
	python -m build

docker-build:
	docker-compose build

docker-up:
	docker-compose up -d

docker-down:
	docker-compose down

docker-logs:
	docker-compose logs -f app

.DEFAULT_GOAL := help
