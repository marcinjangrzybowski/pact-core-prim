
# ⚠️ ☠️ 🔮 🤖 CRITICAL DISCLAIMER ⚠️

 
This document is **AUTO-GENERATED** using a Large Language Model. While the generation process employs legacy documentation, code snippets, and human-like AI language processing, it is **NOT GUARANTEED TO BE ACCURATE OR COMPLETE.** The AI is fundamentally limited, being incapable of understanding the nuances of human-written code in the way a skilled developer would. This document exists primarily as an initial draft meant to *assist* technical writers, not to replace their essential work. It is *critical* for all contents presented here to be meticulously reviewed, cross-checked, and validated against the original source code. 🚫 **DO NOT REMOVE** this disclaimer without comprehensive and informed review of the entire document. Proceed with extreme caution! Do not trust this document without verification!

# str-to-int-base

## Basic syntax

The `str-to-int-base` function takes two arguments: a string and an integer that represents the base to which the string should be converted.

Here is the basic syntax:

```pact
(str-to-int-base base:string str:integer)
```

In this syntax, `base` is the base to which you want to convert the string `str`. The `base` must be an integer between 2 and 16 (both inclusive). 

The `str` argument is the string that you want to convert. It should consist of digits and/or letters, depending on the base you have specified. For bases greater than 10, the letters A-F can be used to signify the digits 10-15. 

The function returns the integer representation of the string in the specified base. 

Here is an example of using this function:

```pact
(str-to-int-base 2 "1011")
11
```

In this example, the binary string "1011" is converted to a decimal integer, which is 11.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| str | string | The string representation of the number you want to convert. |
| base | integer | The base of the number system that the string represents. This should be a positive integer between 2 and 36, inclusive. |

## Prerequisites

N/A

## Return values

The `str-to-int-base` function returns an integer. This integer is the result of converting the provided string into an integer of the provided base. The function will return `null` if the conversion is not possible due to invalid input, such as non-numeric characters in the string (for number bases 2-10) or characters outside the range A-F (for number bases 11-16). 

For instance, in a scenario where a hexadecimal string needs to be converted into an integer for further calculations, `str-to-int-base` can be used to perform this conversion. The return value then aids in these additional operations.

## Examples

```pact
(str-to-int-base 16 "FF")
255
```
This example converts the hexadecimal (base 16) string "FF" to an integer and the output is 255. 

```pact
(str-to-int-base 10 "12345")
12345
```
This example converts the decimal (base 10) string "12345" to an integer and the output is 12345.

```pact
(str-to-int-base 8 "77")
63
```
This example converts the octal (base 8) string "77" to an integer and the output is 63.

```pact
(str-to-int-base 2 "11111111")
255
```
This example converts binary (base 2) string "11111111" to an integer and the output is 255.

## Options

N/A

## Property validation

N/A

## Gotchas

N/A

