package com.example

object StringUtils {
    fun reverse(input: String): String {
        return input.reversed()
    }

    fun isPalindrome(input: String): Boolean {
        val cleanInput = input.lowercase().filter { it.isLetterOrDigit() }
        return cleanInput == cleanInput.reversed()
    }

    fun countWords(input: String): Int {
        return input.split(Regex("\\s+")).filter { it.isNotBlank() }.size
    }
}
