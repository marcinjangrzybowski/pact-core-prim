# str-to-int

## Basic syntax

### Basic syntax

The `str-to-int` function can be used in two different ways.

1. To compute the integer value of a string in base 10:

    ```pact
    (str-to-int *str-val*:string)
    ```

2. To compute the integer value of a string in a specified base:

    ```pact
    (str-to-int *base*:integer *str-val*:string)
    ```

The `str-val` argument is the string to be converted to an integer. The `base` argument, although optional, defines the base to be used for the conversion. The base should be between 2 and 16, or 64 for an unpadded base64url conversion.

Examples for each use-case:

```pact
(str-to-int "123456") 
123456
```

```pact
(str-to-int 16 "abcdef123456")
188900967593046
```

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| base (optional) | integer | Specifies the number base for the conversion. It must be between 2 and 16, or 64 for unpadded base64url conversion. If not specified, default base 10 is used. |
| str-val | string | The string value to be converted to integer. It can be up to 512 characters in length. Each digit must be in the correct range for the base. |

## Prerequisites

To use the `str-to-int` function, there are a few prerequisites:

- A valid string that represents an integer value. This will be converted to an int data type using the function. 

- Optionally, a base integer can be provided. If included, it must be between 2 and 16, or 64. This will determine the base in which the string will be converted.

- The string input can be of up to 512 characters in length, and you should ensure that each digit in the string is within the correct range for the supplied or default base (10 if not supplied). 

- Ensure you have a proper understanding of base conversion between 2-16 and 64. 

If these prerequisites are met, expect the function to run successfully.

Please note, as usual in programming, inaccuracies in inputs or failure to meet these prerequisites may lead to errors or unintended results.

## Return values

The `str-to-int` function returns an integer value. It computes the integer value of the provided string in base 10, or in a specified base (if provided as argument). If the base is between 2 and 16, it reads the string as a number in that base. If the base is 64, it performs unpadded base64url conversion.

This return value is useful when you need to convert a string that represents a number in a certain base into an actual integer. For instance, you may have a string that represents a hex number (base 16), and you need to convert this hex number to an integer for further computation. 

It is also useful when dealing with large numerics or cryptography, where binary or hexadecimal representation is often used. In such cases, these values are often passed around as strings, and `str-to-int` function provides an easy way to convert these strings back into integers.

Be aware that if a string is provided that contains characters not valid for the specified base, or without a valid base, the function will result in an error. The function does not check if the resulting integer value is within certain limits, it is your responsibility to ensure that the returned integer can be safely used in the rest of your program.

## Examples

```pact
; Compute the integer value of a string in base 10
(str-to-int "123")

; Outputs: 123 

; Compute the integer value of a hex string
(str-to-int 16 "abcdef123456")

; Outputs: 188900967593046 

; Perform unpadded base64url conversion of a string
(str-to-int 64 "q80")

; Outputs: 43981 

; Perform string to integer conversion and use it with other functions
(+ "n_" (take 40 (int-to-str 16 (str-to-int 64 (hash "example")))))

; Outputs: "n_examplehashedandconverted"
```
Note: This last example hashes the string "example", converts the hashed value from base64 to base10, converts it back to a string in base16, and prepends "n_" to the resultant string.

## Options

N/A

## Property validation

The `str-to-int` function validates its argument properties in a specific manner. The function takes either one or two arguments. The first argument is `str-val`: a `string` representing a numerical value in a certain base. The second argument is `base`: an `integer` defining the numerical base of the first argument.

If only `str-val` is provided, the function defaults to base 10. If both `str-val` and `base` are provided, the `base` argument defines the numerical base for the conversion. 

It is mandatory that `str-val` is no longer than 512 characters. The `base` must be an integer between 2 and 16 inclusive, or 64, which specifically denotes a base64url conversion. 

Failure to meet these conditions will cause the function to throw an error. For instance, if a digit in `str-val` isn't within the acceptable range of values for the given `base`, the function throws an error. 

Please see examples of this behaviour in the 'Examples' section of this documentation.

## Gotchas

- `str-to-int` function requires the base to be between 2 and 16, or 64 for unpadded base64url conversion. Using bases outside these ranges will result in errors.
- Each digit in the input string must be within the correct range for the base.
- It is important to note that the `str-to-int` function supports only up to 512 characters in the input string.
- While using the `str-to-int` function, you cannot perform integer to string conversion directly. You need to use the `int-to-str` function after `str-to-int`.
- Finally, although `str-to-int` function is supported in both invariants and properties, it does not work with other types and can result in errors if such types are introduced.

