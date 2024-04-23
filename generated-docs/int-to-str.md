## Basic syntax

The `int-to-str` function in Pact uses the following syntax:

```pact
(int-to-str *base*:integer *val*:integer)
```
This function takes two integer parameters. The first one, `base` specifies the base to which the integer value `val` should be converted for string representation. The valid `base` can be any integer from 2-16, or 64 for unpadded base64URL representation of the integer value. Note that only positive values are allowed for base64URL conversions.

Example usage:

```pact
(int-to-str 16 65535)
```
This will represent the integer `65535`  as a string in base 16.

Another example that represents the integer `43981` as an unpadded base64URL string:
```pact
(int-to-str 64 43981)
```

## Arguments

The `int-to-str` function takes two arguments as follows:

| Argument | Type | Description |
| --- | --- | --- |
| base | integer | Specifies the base to which the integer conversion will take place. The base can be between 2 and 16, inclusive, or 64 for an unpadded base64URL string. |
| val | integer | Specifies the integer you want to convert into a string. The function represents this integer as a string in the specified base. Note that only positive values are allowed for base64URL conversion. |

## Prerequisites

To use `int-to-str` successfully, the user should have a basic understanding of integer values and their conversion to string. For BASE, only values ranging from 2 to 16 and 64 for unpadded base64URL are accepted. For the VAL input, it must be a positive integer. Misunderstanding these prerequisites may lead to function misuse and unexpected results.

## Return values

The `int-to-str` function returns a string representation of the specified integer value, converted into the provided base. The return value is a string, utilizable in any context where a string representation of an integer is required. This could include debugging operations, displaying the value to a user, or generating identifiers, extents of use are not limited to these examples.

## Examples

The following example demonstrates the conversion of the integer 65535 to a hexadecimal string:

```pact
(int-to-str 16 65535)
"ffff"
```
The base 16 in the function argument specifies that the conversion is to hexadecimal. The function thus returns 'ffff' which is the hexadecimal string representation of 65535.

Next, let's convert an integer to a base64URL string:

```pact
(int-to-str 64 43981)
"q80"
```
The base 64 in the function argument specifies that the conversion is to base64URL. Therefore, the function returns 'q80' which is the base64URL string representation of 43981.

In the following example, we convert a list of integers (from 0 to 19) to strings with base 10:
```pact
(defconst VALID_CHAIN_IDS (map (int-to-str 10) (enumerate 0 19)))
```
This generates an array of strings representing numbers from 0 to 19.

For converting compute hash to string, the following example can be used: 

```pact
(take 40 (int-to-str 16 (str-to-int 64 (hash g))))
```
This example demonstrates the conversion of a hash value to an integer with base 64, then to a hexadecimal string using 'int-to-str' function and finally it takes the first 40 characters from the resulting string.

The `int-to-str` function does not have any configurable options. The function's execution can only be altered by providing different arguments, but not through options. Therefore:

`Options: N/A`

## Property validation

The `int-to-str` function validates its `base` and `val` arguments in the following ways:

1. `base`: Must be an integer that falls within the range 2-16 or must be 64. Any other values input for `base` will result in an error.

2. `val`: Must be a positive integer. The function will return an error for negative integers or non-integer types. 

Also note that when `base` is 64 for unpadded base64URL conversion, `val` is only allowed to be a positive value.

If both arguments are valid, the function will successfully convert the integer `val` to a string representation in the designated `base`. If either argument fails validation, the function will return an error and explain which argument was invalid and why.

For instance, the code `(int-to-str 16 -65535)`, will result in an error because `val` is not a positive integer. Similarly, `(int-to-str 18 104)` will result in an error because the `base` is out of the valid range.

## Gotchas

1. When using `int-to-str` function, keep in mind that the only accepted values for the base are between 2-16 and 64 (only for unpadded base64URL conversion).

2. Make sure the integer value being converted is positive especially for base64URL conversion, as only positive values are allowed. 

3. `int-to-str` function does not pad the result with zeros on the left. For example, `int-to-str 16 15` will return "f" instead of "0f". If a specific format is needed, you should handle the formatting yourself after the conversion. 

4. For base64URL conversion, the input is interpreted as a big-endian integer, so `int-to-str 64 43981` would return 'q80'.

5. If an invalid base is used, the function will throw an error. Ensure that the base is valid before conversion. 

Please review the EDGE CASES and VALIDATION section for further information regarding the use of `int-to-str` function.

