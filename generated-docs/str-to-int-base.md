## Basic syntax

The `str-to-int-base` function enables conversion of a string to an integer, based on the specified base. The base must between 2 and 16 (inclusive).

This is the fundamental structure:

```pact
(str-to-int-base *base*:integer *value-to-convert*:string)
```

This function accepts two arguments:

1. `*base*`: an integer specifying the base in which the string is to be converted. This could range between 2 and 16.

2. `*value-to-convert*`: a string containing the numerical value to be converted into an integer. 

The string is interpreted as a base-*n* integer where *n* matches the given base. Bear in mind that the base number representation must coincide with the chosen base. For example, a hex value such as "FA" can only be processed with a base of 16.

An example usage is as follows:

```pact
(str-to-int-base 16 "FA")
```

Above snippet will interpret the string "FA" as hexadecimal (base 16), and convert it into its decimal representation. The output that the function will return for this case is `250`.

## Arguments

The `str-to-int-base` function has two arguments:

| Argument | Type | Description |
| --- | --- | --- |
| str | string | The string that you want to convert into an integer. |
| base | integer | The base for the conversion - it must be an integer number between 2 and 36. |

N/A

## Return Values

The `str-to-int-base` function returns an integer that represents the original string value, converted from the specified base. The return value can range from 0 up to the maximum limit of an integer, depending on the string and base parameters provided to the function. This return value proves useful when you need to interpret a string value in a particular numeric base and convert it into an integer for arithmetic or logical operations. In case the function fails to parse the string or if the base is unsupported, the function will return a null value.

## Examples

Below are examples that demonstrate the use of the `str-to-int-base` function. 

The function converts a string to an integer using the specified integer base. For example:

```pact
(str-to-int-base "1011" 2)
11
```

In the above example, we are converting a binary value "1011" into a decimal value. In binary, "1011" is equivalent to the decimal number 11.

Another example, this function can also convert a hexadecimal to an integer. Hexadecimal is a base 16 number system. For example:

```pact
(str-to-int-base "A" 16)
10
```

In the above example, we are converting a hexadecimal value "A" into a decimal value. In hexadecimal, "A" is equivalent to the decimal number 10.

N/A

N/A

## Gotchas

- The `str-to-int-base` function only accepts strings of valid numbers. Providing a string that contains letters, special characters or spaces could lead to unexpected results or errors.
- The function is case-sensitive. Using lower case letters in base greater than 10 could yield different results from using upper case letters.
- Negative sign (-) is not supported. If you try to convert a negative number represented as a string, it could result in an error or unexpected behavior.
- The base must be between 2 and 36 inclusive. Trying to convert a string with an unsupported base would result in an error.
- If the string contains a number that is outside the range of the specified base, the function may return an improper conversion. Always assure the number in the string is within the base's range before conversion.

