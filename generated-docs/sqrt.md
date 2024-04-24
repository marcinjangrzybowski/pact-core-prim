# sqrt

## Basic syntax

To use the square root function `sqrt` in Pact, the basic syntax is as follows:

```pact
(sqrt *value*:number)
```

Here, `*value*` is the number (integer or decimal) for which you want to calculate the square root. The function will return the square root of the given value.

For example:

```pact
(sqrt 25)
```

This would return `5.0` as the square root of `25`.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| x | integer, decimal | Specifies the number you want to compute the square root of. The function returns the square root value of this input. |

## Prerequisites

N/A

## Return values

The `sqrt` function returns the square root of the integer or decimal inputted as `x`. The return value is of type `integer` or `decimal` depending on the input type. This value represents the result of the square root operation, and it can be used in various mathematical operations, complex computations, or algorithms where a square root is needed. 

For example, in the context of calculating the length of the hypotenuse in a right-angled triangle using Pythagoras' theorem.

## Examples

Here are some examples demonstrating the use of `sqrt` function:

```pact
(sqrt 25)
```

This returns a square root of 25, which is 5.0.

```pact
(sqrt 2.25)
```

This returns a square root of 2.25, which is 1.5.

```pact
(sqrt 0.64)
```

This returns a square root of 0.64, which is 0.8. The `sqrt` function can also be used to get the square root of decimal numbers.

## Options

N/A

## Property validation

The `sqrt` function verifies that its argument is a numeric value, either an integer or a decimal. If the argument is a non-numeric value, the function will throw an error. Also, it does not allow negative numbers as input because the square roots of such numbers could lead to complex results. 

The function can be used in property checking within invariants or properties to make sure a particular value adheres to a defined condition. For example, one can create an invariant to check if a certain number is a perfect square by comparing the number and the square of its square root.

## Gotchas

- The `sqrt` function can only operate on positive numbers. If a negative number is passed as an argument, the function will return an error.
- The `sqrt` function cannot accept string, boolean or other non-numeric types as an argument. It will return an error when such types are used.
- If the `sqrt` function is used with an integer, it will return a decimal. Be careful when assigning the output to an integer variable or using it in an integer context, as this could lead to unexpected behavior.

