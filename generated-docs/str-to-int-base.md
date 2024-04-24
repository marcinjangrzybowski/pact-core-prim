# str-to-int-base

## Basic syntax

The `str-to-int-base` function in Pact takes two arguments and converts a string of digits to an integer based on a given base. The base must be between 2 and 16, inclusive, and the digits must be valid for the given base.

Here's the syntax for the `str-to-int-base` function:

```pact
(str-to-int-base string-in-specific-base: string base: integer)
```

For example, to convert "101" in base 2 (binary) to an integer:

```pact
(str-to-int-base "101" 2) 
```

This would output the integer `5` as the binary 101 is equal to the decimal number 5. 

If the function is used with a string that contains digits not valid for the specified base, it will throw an error. For instance, attempting to convert the string "123" with base 2:

```pact
(str-to-int-base "123" 2)
```

This would cause an error as the digit `2` and `3` are not valid in base `2`.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| str | string | The input string that you want to convert to an integer. |
| base | integer | The base in which the input string is provided. The function converts this string into an integer, using this base. For example, if the base is 2, the function treats the string as a binary number, if the base is 10, it treats string as a decimal number, and so on. The valid input range for base is between 2 and 16 inclusive. |

## Prerequisites

N/A

## Return values

The `str-to-int-base` function returns an integer. This integer is the conversion of the given string according to the specified base. In cases where the specified string cannot be correctly converted into an integer (invalid characters for the given base), the function triggers an error and does not return a value. This function is useful in scenarios where you need to manipulate or calculate with numeric data that initially comes in a string format with a specific base.

## Examples

```pact
(str-to-int-base 10 "150")
150
```

In this example, the `str-to-int-base` function converts the base-10 string "150" to an integer.

```pact
(str-to-int-base 16 "FF")
255
```

In the above example, the `str-to-int-base` function converts the base-16 (hexadecimal) string "FF" to its decimal equivalent integer.

```pact
(str-to-int-base 2 "1111")
15
```

In the final example, the `str-to-int-base` function is used to convert the base-2 (binary) string "1111" into its decimal equivalent integer.

## Options

N/A

## Property validation

The `str-to-int-base` function performs property validation by checking the two input arguments. 

Firstly, it checks to see if the first argument is a string. It will throw an error if the input is not of the string data type.

Secondly, it checks if the second argument is an integer value between 2 and 16. If the input is outside of this range, an error will be thrown.

In case of incorrect input, the function will fail and return an error message describing the encountered issue which can then be handled appropriately in your code.

## Gotchas

The `str-to-int-base` function allows conversion from a string to an integer in a specific base. However, there are a few things to be extra careful about:

1. The function does not perform any validation on the input string. If the string contains any character that is not representable in the specified base, the function can return unexpected results. Make sure that your input string is correctly formatted for the base you're using.

2. The base must be between 2 and 36 (inclusive). Using a base outside this range will result in an error.

3. For bases beyond 10, the function treats both lower-case and upper-case letters as valid digits. 'a' to 'z' represent the numbers 10 to 35, and 'A' to 'Z' also represent the numbers 10 to 35. Make sure not to confuse the case of your characters.

4. The function does not handle negative numbers. If you need to work with negative numbers, you will need to handle this separately in your code. 

5. Make sure you don't confuse the base parameter with the radix. The base is the number of unique digits, including zero, used to represent numbers in a positional numeral system. The radix, on the other hand, is the base of a positional numeral system or the number of unique digits, including the digit zero, used to represent numbers.

