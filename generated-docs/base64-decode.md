# base64-decode

## Basic syntax

The basic syntax to decode a Base64 encoded string using the `base64-decode` function in Pact is as follows:

```pact
(base64-decode *string*:string)
```

In the syntax, the `*string*` is a placeholder for the Base64-encoded string that you want to decode. If you call the `base64-decode` function and pass 'aGVsbG8gd29ybGQh' as the argument, the function decodes the Base64-encoded string, returning 'hello world!'. 

Here's an example:

```pact
(base64-decode "aGVsbG8gd29ybGQh")
```

This code will return: 
```pact
"hello world!"
```

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| STRING | string | A base64 encoded string that needs to be decoded. The function will take this string, decode it from base64 and return the decoded string. |

## Prerequisites

N/A

## Return values

The `base64-decode` function returns a string that represents the decoded version of the input base64 string. This return value is useful whenever you want to decode base64 string to the original text.

## Examples

Below are some examples illustrating how the `base64-decode` function can be used:

This example decodes a base64 encoded string "aGVsbG8gd29ybGQh" which represents "hello world!" in plaintext:

```pact
(base64-decode "aGVsbG8gd29ybGQh")
"hello world!"
```

Another example with different base64 encoded string "SGVsbG8gdGhlcmUh" which represents "Hello there!":

```pact
(base64-decode "SGVsbG8gdGhlcmUh")
"Hello there!"
```

Note: The `base64-decode` function decodes string from unpadded base64 format.

## Options

N/A

## Property validation

The `base64-decode` function does not perform explicit property validation within the function itself. However, it assumes that the input is a properly formatted base64 encoded string without any padding. If the input is incorrectly formatted, not a string, or includes padding, the function will return an error. In cases where you need to ensure that your base64 encoded strings are correctly formatted before calling `base64-decode`, you should perform your own property validation checks prior to calling this function.

## Gotchas

The `base64-decode` function does not handle padded base64 strings; it only works with unpadded base64 strings. If you attempt to decode a base64 string that includes padding characters (usually `=` or `==` at the end), the function will return an error.

Also, be aware that the function only decodes valid base64 strings. If the input string is not a valid base64 string, the function will fail. Always ensure that the input to this function is valid unpadded base64-encoded data.

