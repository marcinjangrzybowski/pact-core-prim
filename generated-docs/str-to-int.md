# str-to-int

## Basic syntax

The `str-to-int` function in Pact can be used in one of two ways, depending on whether you want to specify a base for the conversion.

The basic syntax when the base is not specified is:

```pact
(str-to-int *str-val*:string)
```

In this case, the function will convert the string `str-val` to integer in base 10.

If you want to specify a base for the conversion, the syntax is:

```pact
(str-to-int *base*:integer *str-val*:string)
```

Here, the `base` argument can be a any integer between 2 and 16, or 64 for unpadded base64url conversion. 

The `str-val` string you pass to the function to convert into an integer can be up to 512 characters long, and each digit must be in the correct range for the base. If these requirements are not met, the function will return an error.

Here's an example of how to use `str-to-int` function:

```pact
(str-to-int "123456")
```
This will return the integer `123456`.

```pact
(str-to-int 16 "abcdef123456")
```
This will return the integer `188900967593046` which is the base 16 equivalent of the input string 'abcdef123456'.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| b (optional) | Integer | Specifies the base of the string number you want to convert. This argument is optional. If omitted, the function will convert the string to an integer in base 10. The value for the base must be a valid base number, it should be between 2 and 16, or 64 for unpadded base64url conversion. |
| str-val (required) | String | The string to convert to an integer. The string can be up to 512 characters in length. Each digit in the string must be in the correct range for the base. |

## Prerequisites

To use the `str-to-int` function, there are two prerequisites:

1. The operand provided as a string should represent a valid number. This can be either in base 10 or any base between 2 and 16, or 64 for unpadded base64url conversion. Str-Val can be up to 512 characters in length.

2. If converting from a base other than 10, the base value should be provided as an integer and it must be between 2 and 16, or 64. 

The function does not require any specific environment setup, library, or package to run successfully. It's a built-in function in Pact and ready to use out of the box.

## Return values

The `str-to-int` function returns an integer. This result is the conversion of the given string into an integer form. The output value can be useful in situations where numeric operations are needed to be performed on string-formed numbers. A key point to note is that the function returns the computed integer value in base 10 or in a specified base. In case the function cannot perform a successful conversion (such as invalid input or base), it will result in an error.

## Examples

The `str-to-int` function can be used to convert a string to an integer. When called with a single argument, it converts the string to base 10 integer. When called with two arguments, it converts the string to an integer in the specified base. The base must range from 2 and 16, or 64 for unpadded base64url conversion. Each digit in the string must be within the specified base's range.

To convert a string to a base 10 integer, use the following syntax:

```pact
(str-to-int "123456")
```

This will output: 123456

To convert a string to a base 16 integer, use the following syntax:

```pact
(str-to-int 16 "abcdef123456")
```

This will output: 188900967593046

To convert a string to a base 64 integer, use the following syntax:

```pact
(str-to-int 64 "q80")
```

This will output: 43981

You can also hash a string first before converting it to an integer. For example:

```pact
(str-to-int 64 (hash "guard"))
```

This will output an integer representation of the hashed string "guard". Notice that the function `hash` is used to hash the string before passing it to `str-to-int` function. 

The `str-to-int` function can be used in any contexts, including `invariant` or `property` settings. However, it does not perform any error handling, and will fail if the string cannot be converted to an integer.

## Options

The `str-to-int` function does not inherently have additional configurable parameters, but it does accept a base value as an optional argument. Here's the detail:

| Option | Type    | Description |
|------  |-------  |------------  |
| base   | integer | Specifies the base in which the string value is interpreted when being converted into an integer. This must be between 2 and 16, or 64 to perform unpadded base64url conversion. If no base is specified, the function assumes a base of 10. |

Please note: The base value is not exactly an option but is considered as an optional argument in the context of this function.

## Property validation

The `str-to-int` function performs a range of property validations. 

For the first version of the function which has only a single parameter, the parameter should be a string which can be converted to an integer. If the string cannot be converted to an integer value, the function will fail and throw an error.

For the second version of the function that includes a base and a string value, the function validates two properties. The base value must be an integer ranging between 2 to 16, or it can be 64 for an unpadded base64url conversion. The string value should be convertible into an integer under the given base. 

If any of these property validations fail, the function will throw an error.

In both versions, the string value to be converted can be up to 512 characters in length. If the string exceeds this limit, the function will again fail and throw an error.

It's crucial to note that the `str-to-int` function is supported both in invariants and properties. 

In property checking, the `str-to-int` function can be used when specifying an invariant or a property to test your code against. This enables you to ascertain the correctness of your Pendulum contracts and mitigate potential vulnerabilities.

## Gotchas

While the `str-to-int` function is straightforward in conversion of strings to integers, there are some potential pitfalls you should be aware of:

- The function computes the integer value of a string in base 10 by default. Specify the base if you need conversion in other bases. The base must be between 2 and 16, or 64 to perform unpadded base64url conversion.
- If you provide the base, ensure the string digits are in the correct range for the given base. Failure to do so will result in an incorrect conversion.
- The `str-to-int` function has a character limit for the string being converted. The string can be up to 512 characters in length. Be careful of passing strings that exceed this limit. 
- When used in a pact, only "w:" and "k:" guard protocols are currently supported. Internally, the function hashes the guard protocols and converts it to base 64 before converting it to an integer. If an unsupported guard protocol is provided, the function will enforce an error. Ensure that you are using one of the supported guard protocols to avoid running into this issue.

