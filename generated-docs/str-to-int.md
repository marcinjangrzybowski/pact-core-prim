## Basic syntax

The `str-to-int` function can be used in either base 10 or in a specified base. The function takes a string as input and returns its equivalent integer value.

#### Base 10 Conversion: 
To convert a string to an integer in base 10, use the following syntax:

```pact
(str-to-int "string-value")
```

#### Specified Base Conversion: 
To convert a string value to an integer in a specified base (between 2 and 16, or 64), use the following syntax:

```pact
(str-to-int base:int "string-value")
```

Here, base is the base of the mathematical numeral system in which the string value is presented.

## Examples

Here are several examples:

Base 10 conversion:

```pact
(str-to-int "123456")
123456
```

Specified base conversion:

```pact
(str-to-int 16 "abcdef123456")
188900967593046
```

```pact
(str-to-int 64 "q80")
43981
```

| Argument | Type | Description |
| --- | --- | --- |
| base (Optional) | integer | Represents the base in which the STR-VAL should be treated. The base must be between 2 and 16, or 64 to perform unpadded base64url conversion. |
| str-val | string | Represents the string input that needs to be converted to an integer. The STR-VAL can be up to 512 chars in length. Each digit must be in the correct range for the base. |

## Prerequisites

To use the `str-to-int` function, you must:

* Have a string value that can be successfully converted into an integer. Invalid input will result in a runtime error. The string can be up to 512 characters in length.
* Optionally, a base value can be provided. If specified, it must be an integer between 2 and 16 or 64 for base64url conversion. If not specified, the function defaults to base 10.
* Ensure each digit in the string value fits into the base range. For example, a base 16 input should only include digits in the range 0-9 and letters a-f.
* The `str-to-int` function is supported in invariants or properties, based on the context and requirements of your application.

Before using the `str-to-int` function, check your input values to ensure they meet these prerequisites, as improper or invalid inputs will result in errors.

## Return values

The `str-to-int` function returns the computed integer value of the input string in base 10, or in a specified base. The function's output can be used whenever there is a need to convert string numerical values to actual integer numbers in computations or validations. Please note, for each digit in the input string, it must be within the correct range for the base. If the conversion is not possible due to incompatible values or an out of range base, the function will halt the execution with an error.

## Examples

The `str-to-int` function will return the integer value of the provided string in base 10, if no other base is specified. This can be used for standard number conversions:

```pact
(str-to-int "123456")
123456
```

Additionally, the `str-to-int` function can also handle conversions from different bases, between 2 and 16, and 64 for unpadded base64url conversion. This can be handy when processing numbers in different numeral systems:

```pact
(str-to-int 16 "abcdef123456")
188900967593046
```

For base64url conversions, the base should be set to 64:

```pact
(str-to-int 64 "q80")
43981
```

Recursive calls of `str-to-int` along with other Pact functions can also be done:

```pact
(+ "n_" (take 40 (int-to-str 16 (str-to-int 64 (hash "guard")))))
"n_00000000000000000000000024853763972308120201010"
```

The `str-to-int` function does not have any configurable options outside of the standard arguments for base and str-val. Hence, the Options section would be 'N/A'.

## Property validation

The `str-to-int` function includes the following property checks:

- `str-val` (String value) has a limit of up to 512 characters in length.
- `base` needs to be an integer value between 2 and 16, or 64 for unpadded base64url conversion.
- All digits in the string value should be within the correct range for the base.

If these conditions are not met, the operation of `str-to-int` can throw an error. Therefore, you should always ensure that the input parameters are correctly formatted. 

This function can also be used in invariants and properties for your code testing requirements. For instance, place assertions on the base value to be within the defined range, or check the length of the string value to not exceed the allowed character limit. 

Remember, it is always a good practice to handle potential exceptions while dealing with property validation.

## Gotchas

1. **Type Limitations**: The `str-to-int` function is particularly designed for string to integer conversions. Ensure that the arguments passed are in the correct format (an integer as the base, a string needing conversion) to avoid function failures or incorrect results.

2. **String Length Constraint**: The string value (`str-val`) for conversion to integer can be up to 512 characters in length. Make sure your input string does not exceed this limit.

3. **Base Range**: The `base` for conversion must be between 2 and 16, or 64 for non-padded base64url conversions. Ensure the base provided falls in the correct range. Base64url conversion follows the URL and Filename safe Base64 Alphabet (`A-Z`, `a-z`, `0-9`, `-` and `_`).

4. **Digit Range**: Each digit in the string must be within the correct range for the base. For example, for base 16, valid digits are 0-9 and A-F (inclusive).

5. **Behavior for Non-Numeric Strings**: The behavior of `str-to-int` is not defined for strings containing non-numeric characters that don't align with the base rules. For instance, converting a letter-based string in base 10 will likely yield an error or unexpected output.

6. **Unsupported Guard Protocol**: In the provided use-cases for `str-to-int`, the function fails and returns an error when non-supported guard protocols are used. Be sure to only use the function with the supported "k:" and "w:" guard protocols as shown in the examples.

Ensure to follow these guidelines while using `str-to-int` function to avoid potential pitfalls leading to incorrect results or failures.

