
# ⚠️ ☠️ 🔮 🤖 CRITICAL DISCLAIMER ⚠️

 
This document is **AUTO-GENERATED** using a Large Language Model. While the generation process employs legacy documentation, code snippets, and human-like AI language processing, it is **NOT GUARANTEED TO BE ACCURATE OR COMPLETE.** The AI is fundamentally limited, being incapable of understanding the nuances of human-written code in the way a skilled developer would. This document exists primarily as an initial draft meant to *assist* technical writers, not to replace their essential work. It is *critical* for all contents presented here to be meticulously reviewed, cross-checked, and validated against the original source code. 🚫 **DO NOT REMOVE** this disclaimer without comprehensive and informed review of the entire document. Proceed with extreme caution! Do not trust this document without verification!

# int-to-str

## Basic syntax

The `int-to-str` function is used to represent integer values as a string in a specific base. Here is the basic syntax:

```pact
(int-to-str *base*:integer *value*:integer)
```

In this syntax:

- *base* is the base in which you want to represent the integer. This can be any integer from 2 to 16 or 64 for unpadded base64URL representation.
- *value* is the integer that you want to represent as a string.

Here are some examples:

```pact
(int-to-str 16 65535)  ; it will return "ffff"
(int-to-str 64 43981)  ; it will return "q80"
```

Please note that only positive values are allowed for base64URL conversion.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| base | integer | Specifies the base in which to represent the integer value as a string. The base can be a value between 2 and 16, or 64 for an unpadded base64URL representation. |
| val | integer | The integer value to be represented as a string. Only positive values are allowed for base64URL conversion. |

## Prerequisites

For the `int-to-str` function to run successfully, it requires two integers as input: the base and the value. The base can be any integer between 2-16, or use 64 for unpadded base64URL conversions. Keep in mind that only positive values are allowed for base64URL conversions. An understanding of different numeral systems (binary, decimal, hexadecimal, base64) may be required to use this function effectively.

## Return values

The `int-to-str` function returns a string representation of the given integer, `val`, in the specified base. The returned string can be useful anywhere a string representation of the given integer in the specified base is needed. If the function operates correctly, it does not return null or any error. If a base64URL conversion is being made, it should be noted that only positive values are allowed.

## Examples

The `int-to-str` function can be used in many ways. Here are some usage examples:

1. By turning an integer into a hexadecimal string (base 16):

```pact
(int-to-str 16 65535)
"ffff"
```

2. By changing an integer into a base64URL string (base 64):

```pact
(int-to-str 64 43981)
"q80"
```

3. It can also be used with the `map` function for generating a list of strings representing numbers in a given base. Here's an example where it's used to turn a range of integers from 0 through 19 into their base 10 representations:

```pact
(map (int-to-str 10) (enumerate 0 19))
```

4. Converting the hash of a guard 'g' into integer, then into a hexadecimal string (base 16), and taking the first 40 characters:

```pact
(take 40 (int-to-str 16 (str-to-int 64 (hash g))))
```

Remember, the base of the conversion can be ranged from 2 to 16, and also can be 64 for base64URL conversion. When the base is 64, only positive values are allowed.

## Options

N/A

## Property validation

The `int-to-str` function validates its `base` argument to ensure it is an integer within the range of 2 to 16, or specifically 64 for base64URL encoding. The `val` argument must also be a positive integer. This is especially important when converting to base64URL, as negative values are not accepted. Any violations of these constraints will return an error during the function call.-


## Gotchas

1. While using the `int-to-str` function, be aware that the base can only be numbers from 2 to 16 or 64 for unpadded base64URL.
2. The `int-to-str` function only allows positive values for base64URL conversion; negative values will result in an error.
3. `int-to-str` does not add leading zeroes when converting integer values. For example, `(int-to-str 10 1)` returns "1", not "01".
4. Using a base outside the permitted range will result in an error; it must be between 2 and 16, or 64 for unpadded base64URL strings.
5. If you are using this function to create identifiers or names (as seen in the provided snippets), ensure that the resulting strings are properly validated and sanitized. Input values that create long strings might exceed database or other limits.

