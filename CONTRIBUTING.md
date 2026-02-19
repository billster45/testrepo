# Contributing

Thank you for your interest in contributing to MyApp!

## Getting Started

1. Fork the repository
2. Clone your fork: `git clone https://github.com/yourusername/testrepo.git`
3. Create a feature branch: `git checkout -b feature/your-feature`
4. Install development dependencies: `make install-dev`
5. Install pre-commit hooks: `make pre-commit-install`

## Development Workflow

1. Make your changes
2. Write or update tests
3. Run tests: `make test`
4. Run linters: `make lint`
5. Format code: `make format`
6. Commit your changes (pre-commit hooks will run)
7. Push to your fork
8. Create a Pull Request

## Coding Standards

- Follow PEP 8 style guide
- Use type hints for all functions
- Write docstrings for public functions and classes
- Keep functions small and focused
- Add tests for new functionality

## Running Tests

```bash
# Run all tests
make test

# Run tests with coverage
make test-cov

# Run specific test file
pytest tests/test_main.py -v

# Run tests matching pattern
pytest tests/ -k "test_greet" -v
```

## Code Quality

```bash
# Format code
make format

# Run linters
make lint

# Type check
make type

# Security check
make security
```

## Building Documentation

```bash
make docs
```

## Pull Request Process

1. Update the README.md with details of changes
2. Ensure all tests pass
3. Ensure code is formatted and linted
4. Request review from maintainers

## License

By contributing to MyApp, you agree that your contributions will be licensed under its MIT License.
