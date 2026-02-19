"""Tests for main module."""

import pytest

from myapp.main import greet


class TestGreet:
    """Test greet function."""

    def test_greet_returns_greeting(self) -> None:
        """Test greet function with valid input."""
        result = greet("Alice")
        assert result == "Hello, Alice!"

    def test_greet_handles_empty_string(self) -> None:
        """Test greet function with empty string."""
        result = greet("")
        assert result == "Hello, !"

    @pytest.mark.parametrize(
        "name,expected",
        [
            ("Bob", "Hello, Bob!"),
            ("Charlie", "Hello, Charlie!"),
            ("123", "Hello, 123!"),
        ],
    )
    def test_greet_with_different_names(
        self, name: str, expected: str
    ) -> None:
        """Test greet with different names."""
        assert greet(name) == expected
