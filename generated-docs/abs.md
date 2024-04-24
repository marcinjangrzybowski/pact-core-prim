# abs

## Basic syntax

To use the `abs` function to return the absolute value of a number, use the following syntax:

```pact
(abs x:integer/decimal)
```
Replace `x` with the number whose absolute value you want to determine. The function accepts both decimal and integer data types.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| x | integer or decimal | Specifies the numeric value for which the absolute value is to be computed. This can be either an integer or decimal. |

## Prerequisites

N/A

## Return values

The `abs` function returns the absolute value of the input argument. The return value will be of the same type as the input argument, either an `integer` or a `decimal`. This function is useful when you need the absolute magnitude of a number, disregarding its positive or negative sign. For example, it can be used in arithmetic calculations, financial computations, or anywhere else where the sign of a number is not relevant, but its size is of interest.

## Examples

Here are a couple of examples demonstrating the use of the `abs` function with both decimal and integer input:

```pact
(abs -4.5)
4.5
```

This first example demonstrates how the `abs` function works with negative decimal numbers. The function changes the negative number into a positive one.

```pact
(abs (- 10 23))
13
```

The second example shows how the `abs` function works with negative integers. In this example, we first calculate the difference between 10 and 23, which results in -13. The `abs` function then changes this into a positive 13.


## Options

N/A

## Property validation

For property checking, you can use the `abs` function when specifying an invariant or a property to test your code against. This can be useful when you need to ensure your inputs remain within a certain range or follow a particular condition. The `abs` function itself does not enforce or validate any properties, but rather it can be used as part of expressions that do. Please note that error conditions will occur if the function’s input is not an integer or a decimal, so ensure your inputs always match these types.

## Gotchas

N/A

