# base64-encode

## Basic syntax

The basic syntax for the `base64-encode` function in Pact programming language is as follows:

```pact
(base64-encode *string*)
```

This function take a string as argument and returns its base64 representation.

Here is an example:

```pact
(base64-encode "hello world!")
```

This will output: `"aGVsbG8gd29ybGQh"` - which is the unpadded base64 encoded representation of the string "hello world!".

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| STRING | string | Specifies the string you want to encode to unpadded base64. |

## Prerequisites

N/A

## Return values

The `base64-encode` function returns a string that represents the base64 encoded version of the provided string. This encoding helps to ensure that the data remains intact without modification during transport. The returned base64 string does not have any padding.

## Examples

The following examples demonstrate how to use the `base64-encode` function with different strings:

If you want to encode a simple text string like "hello world!", you can do so as follows:

```pact
(base64-encode "hello world!")
"aGVsbG8gd29ybGQh"
```

Or for "Lorem ipsum", you would have:

```pact
(base64-encode "Lorem ipsum")
"TG9yZW0gaXBzdW0="
```

For an empty string, this function will return an empty string as well:

```pact
(base64-encode "")
""
```

## Options

N/A

## Property validation

N/A

## Gotchas

1. `base64-encode` does not implicitly handle encoding of types other than string. Ensure you convert numeric or complex data types to strings before encoding.
2. The function returns an unpadded base64 string, different from typical base64 encoding that includes padding. Take note of this while decoding or initializing this value elsewhere, or an error may be thrown.
3. Error might be thrown if you input null or array as an argument to the `base64-encode` function. Always ensure that your input is a valid string.
4. Encoding does not automatically manage any character sets or encodings other than UTF-8. Ensure the string is UTF-8 compatible to avoid unexpected characters or corrupted Base64.
5. Empty strings are valid inputs but will output empty Base64 strings. If this behavior is not desirable, implement appropriate validation before using `base64-encode`.
6. `base64-encode` won't encrypt or securely hide your data and the output can be easily decoded. Do not use this function expecting confidentiality for sensitive data.

