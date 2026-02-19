# Installation Guide

## System Requirements

- Python 3.11 or higher
- pip (Python package installer)
- virtualenv (recommended)

## Installation Steps

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/testrepo.git
cd testrepo
```

### 2. Create Virtual Environment

```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

### 3. Install Dependencies

For production use:
```bash
pip install -r requirements.txt
```

For development:
```bash
pip install -r requirements-dev.txt
```

### 4. Install Package

```bash
pip install -e .
```

## Docker Installation

### Prerequisites

- Docker
- Docker Compose

### Steps

1. Build the Docker image:
```bash
docker-compose build
```

2. Start the container:
```bash
docker-compose up -d
```

3. Check logs:
```bash
docker-compose logs -f app
```

4. Stop the container:
```bash
docker-compose down
```

## Verification

Verify the installation by running:

```bash
# Check version
python -m myapp.main --version

# Run health check
python -m myapp.main health

# Run tests (development only)
pytest tests/ -v
```

## Troubleshooting

### Python version mismatch
Ensure you have Python 3.11+ installed:
```bash
python --version
```

### Virtual environment issues
Recreate the virtual environment:
```bash
rm -rf venv
python -m venv venv
source venv/bin/activate
pip install -r requirements-dev.txt
```

### Docker issues
Clear Docker cache and rebuild:
```bash
docker-compose down
docker system prune -a
docker-compose build --no-cache
```
