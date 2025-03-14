package com.example

import org.junit.jupiter.api.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue
import kotlin.test.assertFalse

class StringUtilsTest {
    @Test
    fun testReverse() {
        assertEquals("olleh", StringUtils.reverse("hello"))
        assertEquals("", StringUtils.reverse(""))
    }

    @Test
    fun testIsPalindrome() {
        assertTrue(StringUtils.isPalindrome("A man, a plan, a canal: Panama"))
        assertTrue(StringUtils.isPalindrome("racecar"))
        assertFalse(StringUtils.isPalindrome("hello"))
    }

    @Test
    fun testCountWords() {
        assertEquals(3, StringUtils.countWords("Hello   World  Test"))
        assertEquals(0, StringUtils.countWords(""))
        assertEquals(1, StringUtils.countWords("Hello"))
    }
} 