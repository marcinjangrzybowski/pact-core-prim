# mod

## Basic syntax

The `mod` function in pact takes two integer parameters and returns their modulus. It is used in the following way:
```pact
(mod x y)
```
Where:
- `x`: is the first integer
- `y`: is the second integer with which `x` is divided to get the modulus.

For example:
```pact
(mod 13 8)
```
This will return `5`, which is the rest of the division of `13` by `8`.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| x | Integer | Represents the dividend, the first parameter to perform the modulus operation on. |
| y | Integer | Represents the divisor, the second parameter to perform the modulus operation on. |

## Prerequisites

N/A

## Return values

The `mod` function returns an integer result of the modular arithmetic operation between the two provided integer arguments. The returned value indicates the remainder or signed remainder of a division, after one number is divided by another. It is a common operation in many programming and mathematical calculations, especially ones involving cyclic or repetitive patterns. If there is no remainder, that means the first argument is perfectly divisible by the second and the function will return 0. The return value useful in variety of contexts including but not limited to: algorithms, cryptography, computer graphics, and in calculation of check digits such as ISBN.

## Examples

Here are some examples demonstrating the use of the `mod` function:

Example 1 -- Basic Use:
```pact
(mod 10 3)
1
```
In this example, 10 divided by 3 is 3 remainder 1, therefore `(mod 10 3)` returns 1. 

Example 2 -- Zero Remainder:
```pact
(mod 9 3)
0
```
In this example, 9 divided by 3 is 3 with no remainder, therefore `(mod 9 3)` returns 0. 

Example 3 -- Larger Denominator:
```pact
(mod 5 10)
5
```
In this example, 5 divided by 10 is 0 with a remainder of 5, therefore `(mod 5 10)` returns 5. 

Remember, the `mod` function returns the remainder after division of the first argument by the second.

## Options

N/A

## Property validation

The `mod` function in Pact does not contain specific built-in property validation. However, it is necessary that the arguments provided are both integers, with the second argument non-zero, to avoid a division by zero error. This is validated by the type checker during the function call. It ensures that the function operates on valid input, thus minimizing the occurrence of runtime errors.

Please note that as a developer, you should handle these cases manually and add validations if necessary before using the `mod` function, especially when dealing with dynamic values or user inputs.

## Gotchas

The `mod` function does not handle division by zero. If the second argument is zero, the function will throw a division by zero error. Always ensure that the divisor (second argument) is not zero to avoid this error.

Also, `mod` function results can be unexpected in negative numbers because it truncates towards zero. For example, `mod -3 10` would result in `-3` and not `7`, since `-3` is already nearer to zero. To avoid confusion, it's recommended to always use positive numbers with `mod`.

In the context of modular arithmetic, negative numbers are treated differently. So, when working with negative numbers, it is advisable to use the positive modulus. Negative indices can give unexpected results. If you are unsure, stick to positive numbers to avoid confusion.

