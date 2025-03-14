package com.example

object TestRunner {
    @JvmStatic
    fun main(args: Array<String>) {
        val test = StringUtilsTest()
        try {
            test.testReverse()
            test.testIsPalindrome()
            test.testCountWords()
            println("All tests passed!")
        } catch (e: Throwable) {
            println("Test failed: ${e.message}")
            System.exit(1)
        }
    }
} 