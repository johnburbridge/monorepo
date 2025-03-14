import unittest
from example.calculator import Calculator

class TestCalculator(unittest.TestCase):
    def setUp(self):
        self.calculator = Calculator()

    def test_add(self):
        self.assertEqual(4, self.calculator.add(2, 2))
        self.assertEqual(-1, self.calculator.add(-3, 2))

    def test_subtract(self):
        self.assertEqual(0, self.calculator.subtract(2, 2))
        self.assertEqual(-5, self.calculator.subtract(-3, 2))

    def test_multiply(self):
        self.assertEqual(4, self.calculator.multiply(2, 2))
        self.assertEqual(-6, self.calculator.multiply(-3, 2))

    def test_divide(self):
        self.assertAlmostEqual(1.0, self.calculator.divide(2, 2), places=4)
        self.assertAlmostEqual(-1.5, self.calculator.divide(-3, 2), places=4)

    def test_divide_by_zero(self):
        with self.assertRaises(ArithmeticError):
            self.calculator.divide(1, 0)

if __name__ == '__main__':
    unittest.main() 