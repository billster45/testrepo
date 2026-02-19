#!/bin/bash

# Setup script for development environment

set -e

echo "Setting up development environment..."

# Check Python version
echo "Checking Python version..."
python --version

# Create virtual environment if it doesn't exist
if [ ! -d "venv" ]; then
    echo "Creating virtual environment..."
    python -m venv venv
fi

# Activate virtual environment
echo "Activating virtual environment..."
source venv/bin/activate

# Install dependencies
echo "Installing dependencies..."
pip install --upgrade pip setuptools wheel
pip install -r requirements-dev.txt

# Install pre-commit hooks
echo "Installing pre-commit hooks..."
pre-commit install

# Run tests
echo "Running tests..."
pytest tests/ -v

echo "✓ Development environment setup complete!"
echo ""
echo "Next steps:"
echo "  1. Activate venv: source venv/bin/activate"
echo "  2. Make changes and commit (pre-commit hooks will run automatically)"
echo "  3. Run tests: make test"
echo "  4. Run linters: make lint"
