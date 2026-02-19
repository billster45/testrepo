# MyApp

A production-ready Python application with Docker support and pre-commit hooks.

## Features

- ✅ Production-ready Docker setup with multi-stage builds
- ✅ Pre-commit hooks for code quality (Black, isort, Ruff, mypy, bandit)
- ✅ Comprehensive test suite with pytest
- ✅ CI/CD pipeline with GitHub Actions
- ✅ Type hints for better code quality
- ✅ Professional documentation setup
- ✅ Makefiles for common tasks

## Quick Start

### Prerequisites

- Python 3.11+
- Docker and Docker Compose (optional)
- pre-commit (for development)

### Local Development

1. Clone the repository:
```bash
git clone https://github.com/yourusername/testrepo.git
cd testrepo
```

2. Run the setup script:
```bash
bash scripts/setup.sh
```

Or manually:

```bash
# Create and activate virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements-dev.txt

# Install pre-commit hooks
pre-commit install

# Run tests
pytest tests/ -v
```

### Docker Setup

```bash
# Build and start containers
make docker-build
make docker-up

# View logs
make docker-logs

# Stop containers
make docker-down
```

Or with docker-compose directly:

```bash
docker-compose up -d
docker-compose logs -f app
docker-compose down
```

## Project Structure

```
testrepo/
├── .github/
│   └── workflows/          # GitHub Actions CI/CD
├── .pre-commit-config.yaml # Pre-commit hooks configuration
├── src/
│   └── myapp/              # Main application package
│       ├── __init__.py
│       └── main.py
├── tests/                  # Test suite
│   ├── __init__.py
│   └── test_main.py
├── scripts/                # Utility scripts
│   └── setup.sh
├── docs/                   # Documentation
├── Dockerfile              # Docker configuration
├── docker-compose.yml      # Docker Compose configuration
├── requirements.txt        # Production dependencies
├── requirements-dev.txt    # Development dependencies
├── pyproject.toml         # Project metadata and tool configuration
├── tox.ini                # Tox configuration for testing
├── Makefile               # Common development tasks
└── README.md              # This file
```

## Available Commands

```bash
make help              # Show all available commands
make install           # Install production dependencies
make install-dev       # Install development dependencies
make clean             # Remove build artifacts and cache
make test              # Run tests
make test-cov          # Run tests with coverage report
make lint              # Run all linters
make format            # Auto-format code
make type              # Run type checking
make security          # Run security checks
make pre-commit        # Run pre-commit hooks
make pre-commit-install # Install pre-commit hooks
make docs              # Build documentation
make build             # Build distribution packages
make docker-build      # Build Docker image
make docker-up         # Start Docker containers
make docker-down       # Stop Docker containers
```

## Code Quality

This project uses several tools to maintain code quality:

### Linting and Formatting
- **Black**: Code formatter
- **isort**: Import sorter
- **Ruff**: Fast Python linter
- **Flake8**: Style guide enforcement

### Type Checking
- **mypy**: Static type checker

### Security
- **bandit**: Security issue scanner

### Testing
- **pytest**: Testing framework
- **pytest-cov**: Coverage reporting

### Pre-commit Hooks
Pre-commit hooks automatically check code quality before commits. Install them with:
```bash
make pre-commit-install
```

## Testing

Run all tests:
```bash
make test
```

Run tests with coverage:
```bash
make test-cov
```

View HTML coverage report:
```bash
open htmlcov/index.html
```

## CI/CD Pipeline

The project includes a comprehensive GitHub Actions CI/CD pipeline that:
- Runs tests on Python 3.11 and 3.12
- Checks code formatting
- Performs linting
- Runs type checking
- Performs security scanning
- Builds Docker images (on main branch)
- Builds documentation
- Uploads coverage reports

See [.github/workflows/ci.yml](.github/workflows/ci.yml) for details.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on how to contribute to this project.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Documentation

Full documentation is available in the `docs/` directory. Build it with:
```bash
make docs
```

## Support

For bug reports and feature requests, please open an issue on GitHub.