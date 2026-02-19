# API Documentation

## MyApp Module

### Functions

#### greet(name: str) -> str

Generate a greeting message.

**Parameters:**
- `name` (str): Person's name

**Returns:**
- str: Greeting message

**Example:**
```python
from myapp.main import greet

message = greet("Alice")
print(message)  # Output: Hello, Alice!
```

## CLI Commands

### hello

Greet someone.

```bash
python -m myapp.main hello --name John
```

**Options:**
- `--name`: Name to greet (default: "World")

### hello-multiple

Greet someone multiple times.

```bash
python -m myapp.main hello-multiple --count 3 --name Alice
```

**Options:**
- `--count`: Number of greetings (default: 1)
- `--name`: Name to greet (default: "World")

### health

Health check endpoint.

```bash
python -m myapp.main health
```
