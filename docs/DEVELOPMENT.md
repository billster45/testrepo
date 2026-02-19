# Development Guide

## Setting Up Development Environment

### Quick Setup

Run the automated setup script:

```bash
bash scripts/setup.sh
```

### Manual Setup

1. Create and activate a virtual environment:
```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

2. Install development dependencies:
```bash
pip install -r requirements-dev.txt
```

3. Install pre-commit hooks:
```bash
pre-commit install
```

## Development Workflow

### Code Organization

- **src/myapp/**: Main application code
- **tests/**: Test suite
- **docs/**: Documentation
- **scripts/**: Utility scripts

### Before You Commit

Always run these checks before committing:

```bash
# Format code
make format

# Run linters
make lint

# Run tests
make test
```

### Using Pre-commit Hooks

Pre-commit hooks automatically run before each commit. They check:
- Code formatting (Black)
- Import sorting (isort)
- Linting (Ruff)
- Type checking (mypy)
- Security issues (bandit)
- Docstring coverage (interrogate)

### Running Tests

```bash
# Run all tests
make test

# Run specific test file
pytest tests/test_main.py -v

# Run tests matching pattern
pytest tests/ -k "test_greet" -v

# Run with coverage
make test-cov
```

### Running Linters

```bash
# Run all linters
make lint

# Run specific linters
black --check src tests
isort --check-only src tests
ruff check src tests
mypy src
bandit -r src
```

### Formatting Code

Auto-format your code before committing:

```bash
make format
```

This will:
- Format code with Black
- Sort imports with isort
- Fix auto-fixable issues with Ruff

### Type Checking

Check type hints:

```bash
make type
```

### Security Scanning

Run security checks:

```bash
make security
```

## Database Migrations (if applicable)

```bash
# Create a new migration
alembic revision --autogenerate -m "Add new table"

# Apply migrations
alembic upgrade head

# Rollback last migration
alembic downgrade -1
```

## Debugging

### Using pdb

Add breakpoint in code:
```python
breakpoint()  # Python 3.7+
```

### Using ipdb

Install and use ipdb:
```python
import ipdb; ipdb.set_trace()
```

### Using IDE Debugger

Configure your IDE to use the remote debugger for Docker development.

## Documentation

### Building Docs

```bash
make docs
```

### Writing Docstrings

Follow Google-style docstrings:

```python
def my_function(name: str, age: int) -> str:
    """
    Brief description.

    Longer description if needed.

    Args:
        name: Person's name
        age: Person's age

    Returns:
        A greeting string

    Raises:
        ValueError: If age is negative

    Example:
        >>> my_function("Alice", 30)
        'Hello Alice, you are 30 years old'
    """
    pass
```

## Tips and Best Practices

1. **Write tests first**: Follow TDD practices
2. **Use type hints**: Makes code more maintainable
3. **Keep functions small**: Easier to test and maintain
4. **Document complex logic**: Help future contributors
5. **Run pre-commit often**: Catch issues early
6. **Review your changes**: Before committing

## Useful Commands

```bash
# Update dependencies
pip install --upgrade -r requirements-dev.txt

# Generate dependency tree
pip install pipdeptree
pipdeptree

# Check for security vulnerabilities
pip install safety
safety check

# Profile code
python -m cProfile -s cumulative src/myapp/main.py
```

## Environment Variables

Create a `.env` file in the project root:

```
DEBUG=True
LOG_LEVEL=DEBUG
DATABASE_URL=postgresql://user:password@localhost/dbname
```

Load in your code:
```python
from dotenv import load_dotenv
import os

load_dotenv()
debug = os.getenv("DEBUG", False)
```
