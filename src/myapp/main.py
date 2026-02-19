"""Main application entry point."""

import logging
from typing import Optional

import click

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(name)s - %(levelname)s - %(message)s",
)
logger = logging.getLogger(__name__)


def greet(name: str) -> str:
    """
    Generate a greeting message.

    Args:
        name: Person's name

    Returns:
        Greeting message
    """
    return f"Hello, {name}!"


@click.group()
def cli() -> None:
    """MyApp CLI."""
    pass


@cli.command()
@click.option(
    "--name",
    default="World",
    help="Name to greet",
)
def hello(name: str) -> None:
    """Greet someone."""
    message = greet(name)
    click.echo(message)
    logger.info(f"Greeted {name}")


@cli.command()
@click.option("--count", default=1, help="Number of greetings")
@click.option("--name", default="World", help="Name to greet")
def hello_multiple(count: int, name: str) -> None:
    """Greet someone multiple times."""
    for i in range(count):
        click.echo(f"{i + 1}: {greet(name)}")
    logger.info(f"Greeted {name} {count} times")


@cli.command()
def health() -> None:
    """Health check endpoint."""
    click.echo("OK")


if __name__ == "__main__":
    cli()
