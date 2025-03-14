package com.example;

public class TestRunner {
    public static void main(String[] args) {
        StringUtilsTest test = new StringUtilsTest();
        try {
            test.testReverse();
            test.testIsPalindrome();
            test.testCountWords();
            System.out.println("All tests passed!");
        } catch (Throwable e) {
            System.out.println("Test failed: " + e.getMessage());
            System.exit(1);
        }
    }
} 