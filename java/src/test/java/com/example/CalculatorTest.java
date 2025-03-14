package com.example;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class CalculatorTest {
    private final Calculator calculator = new Calculator();

    @Test
    public void testAdd() {
        assertEquals(4, calculator.add(2, 2));
        assertEquals(-1, calculator.add(-3, 2));
    }

    @Test
    public void testSubtract() {
        assertEquals(0, calculator.subtract(2, 2));
        assertEquals(-5, calculator.subtract(-3, 2));
    }

    @Test
    public void testMultiply() {
        assertEquals(4, calculator.multiply(2, 2));
        assertEquals(-6, calculator.multiply(-3, 2));
    }

    @Test
    public void testDivide() {
        assertEquals(1.0, calculator.divide(2, 2), 0.0001);
        assertEquals(-1.5, calculator.divide(-3, 2), 0.0001);
    }

    @Test
    public void testDivideByZero() {
        assertThrows(ArithmeticException.class, () -> calculator.divide(1, 0));
    }
} 