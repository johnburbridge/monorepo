"""Unit tests for the Calculator class."""

import unittest
from calculator import Calculator


class TestCalculator(unittest.TestCase):
    """Test case for the Calculator class."""

    def setUp(self):
        """Set up a Calculator instance for each test."""
        self.calculator = Calculator()

    def test_add(self):
        """Test the add method with various inputs."""
        self.assertEqual(4, self.calculator.add(2, 2))
        self.assertEqual(-1, self.calculator.add(-3, 2))

    def test_subtract(self):
        """Test the subtract method with various inputs."""
        self.assertEqual(0, self.calculator.subtract(2, 2))
        self.assertEqual(-5, self.calculator.subtract(-3, 2))

    def test_multiply(self):
        """Test the multiply method with various inputs."""
        self.assertEqual(4, self.calculator.multiply(2, 2))
        self.assertEqual(-6, self.calculator.multiply(-3, 2))

    def test_divide(self):
        """Test the divide method with various inputs."""
        self.assertAlmostEqual(1.0, self.calculator.divide(2, 2), places=4)
        self.assertAlmostEqual(-1.5, self.calculator.divide(-3, 2), places=4)

    def test_divide_by_zero(self):
        """Test that divide raises an ArithmeticError when dividing by zero."""
        with self.assertRaises(ArithmeticError):
            self.calculator.divide(1, 0)


if __name__ == "__main__":
    unittest.main()
