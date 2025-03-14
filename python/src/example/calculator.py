"""Calculator module providing basic arithmetic operations."""


class Calculator:
    """A simple calculator class that provides basic arithmetic operations."""

    def add(self, a: int, b: int) -> int:
        """Add two integers and return the result.

        Args:
            a: The first integer
            b: The second integer

        Returns:
            The sum of a and b
        """
        return a + b

    def subtract(self, a: int, b: int) -> int:
        """Subtract one integer from another and return the result.

        Args:
            a: The integer to subtract from
            b: The integer to subtract

        Returns:
            The result of a - b
        """
        return a - b

    def multiply(self, a: int, b: int) -> int:
        """Multiply two integers and return the result.

        Args:
            a: The first integer
            b: The second integer

        Returns:
            The product of a and b
        """
        return a * b

    def divide(self, a: int, b: int) -> float:
        """Divide one integer by another and return the result.

        Args:
            a: The numerator
            b: The denominator

        Returns:
            The result of a / b as a float

        Raises:
            ArithmeticError: If b is zero
        """
        if b == 0:
            raise ArithmeticError("Division by zero is not allowed")
        return a / b
