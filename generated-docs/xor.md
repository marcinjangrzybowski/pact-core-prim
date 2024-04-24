# xor

## Basic syntax

The `xor` function in Pact takes two integer arguments and performs a bitwise xor operation, returning consequently an integer. The arguments can be positive or negative.

Basic syntax of the `xor` function is as follows:

```pact
(xor x:y)
```

Here, `x` and `y` are both integers. The function will return the result of bitwise exclusive or operation between `x` and `y`.

An example of its basic usage could be:

```pact
(xor 5 -7)
```

This will output `-4`, as bitwise xor of `5` and `-7` is `-4`.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| x | integer | The first operand in the bitwise XOR operation. |
| y | integer | The second operand in the bitwise XOR operation. |

## Prerequisites

N/A

## Return values

The `xor` function returns an integer that is the result of the bitwise exclusive-or operation between the two provided integer arguments. The resulting value represents the bit-by-bit XOR operation of the binary representation of the input values. The returned integer can be used in any context where bitwise manipulation of values is necessary.

## Examples

The following examples demonstrate the use of the `xor` function which performs bitwise exclusive-or (XOR) operation on two integer inputs to produce an integer output.

Example 1: XOR operation on positive integers
```pact
(xor 127 64)
```
Output: 
63
Here, the binary of 127 is `1111111` and that of 64 is `1000000`. The XOR operation gives `0111111` which is 63 in decimals.

Example 2: XOR operation involving negative integer
```pact
(xor 5 -7)
```
Output:
-4
Here, the binary of 5 is `101` and that of -7 is `-111`. The XOR operation gives `-100` which is -4 in decimals. 

These examples show that the function can operate on both positive and negative integers.

## Options

N/A

## Property validation

The `xor` function can be used in property checks such as in invariants or property-based testing within your code. It checks if the provided arguments are integers and performs the XOR operation on them. This function will throw an error if the arguments are not integers.

## Gotchas

Here are a few potential gotchas to keep in mind while using the `xor` function:

- The `xor` function performs a bitwise operation. Therefore, if you are not familiar with bitwise operations, the results may seem unpredictable or counter-intuitive. In particular, it's important to remember that `xor` operates on the binary representations of numbers, not the numbers themselves. Hence, even though you pass in integers, the function treats them as binary data which can lead to unexpected results.

- As a bitwise operation, the `xor` function operates on each bit in the binary representation of a number. This means that negative numbers, which are often represented using two's complement, may give you seemingly counter-intuitive results. It's essential to be aware of this when working with negative numbers.

- The `xor` function can only operate on integer values. If you attempt to use the `xor` function with non-integer values, you'll get an error. Ensure you validate or convert your data to integers before using this function.

- The `xor` does not check for overflow. If the result of your operation exceeds the maximum integer size, you may not get an error, but your result will be incorrect. Be sure to be aware of this limitation when working with large numbers.

If these are not relevant for your use cases or if there are no known gotchas with your function, please respond with 'N/A'.

