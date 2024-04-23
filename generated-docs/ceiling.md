## Basic syntax

The `ceiling` function is used to round up a decimal value. This function can be used in two ways:

To round up the decimal value to the nearest integer:

```pact
(ceiling *x*:decimal)
```

To round up the decimal value to a specified precision:

```pact
(ceiling *x*:decimal *prec*:integer)
```

In both uses, the `*x*` argument must be a decimal number. If specifying precision, the `*prec*` argument must be an integer.


## Arguments

The `ceiling` function accepts up to two arguments as defined below:

| Argument | Type | Description |
| --- | --- | --- |
| x | decimal | The decimal number to be rounded up. |
| prec | integer | (Optional) Specifies the precision to which the decimal x should be rounded up. If this parameter is omitted, the function defaults to rounding up to the nearest integer. |

## Prerequisites

Before using the `ceiling` function, ensure that you have the necessary input decimal number (`x`) to be input into the function. This decimal (`x`) can either be rounded up as an integer or to a given precision (`prec`) which is also an integer. You should also make sure that you understand the usage of the function which is to round up the decimal number to the next integer or to the given precision as decimal. It's also important to note that the function can be supported in either invariants or properties.

## Return values

The `ceiling` function returns the rounded up value of the input. The return type could be either a decimal or an integer, depending on the arguments provided.

- In the case of `ceiling` applied with a single argument, the function returns an integer which represents the rounded up value of the initial decimal.

- For `ceiling` applied with two arguments (a decimal and an integer representing the precision), the function returns a decimal that represents the rounded up value of the initial decimal to the specified precision.

This rounded-up value could be useful in instances where the upward rounding behavior is desired, such as in math operations, financial computations, or anywhere precision adjustment is required.

## Examples

In this example, the `ceiling` function is used to round up the decimal number to the next integer.   

```pact
(ceiling 3.5)
```
Returns: `4` 

In the following example, the `ceiling` function also rounds up the decimal number but to a specific precision that is defined as `2`.

```pact
(ceiling 100.15234 2)
```
Returns: `100.16`

Note: `ceiling` function can be used within invariants or properties for rounding up decimal values.

## Options

The `ceiling` function doesn't have any configurable options.

## Property validation

For property validation, you can use the `ceiling` function when specifying an invariant or a property to test your mathematical calculations or rounding functionalities in your code. The `ceiling` function checks if its arguments are of correct types - the first argument should be a decimal, while the second optional argument should be an integer specifying the precision level. 

When the `ceiling` function is called with a single argument, it rounds the decimal number up to the next integer. If called with two arguments, it rounds the decimal to the specified precision as decimal. Incorrect data type or passing more arguments than necessary will result in an error.

Error conditions include: wrong number of arguments provided, wrong types of arguments provided, or a non-numeric value for precision.

## Gotchas

- The `ceiling` function in Pact works with decimal numbers. If an integer is passed as an argument, it will return the same integer, with no apparent rounding up. Thus, it might not behave as expected if used with whole numbers. 
- When using the version of `ceiling` that takes a precision argument, remember that it rounds up to the specified number of decimal places, and not to the closest whole number. This might lead to unexpected results if you're thinking in terms of traditional rounding methods. 
- Always ensure that the precision argument passed is a positive integer. Negative values or non-integer decimal values could lead to unexpected outcomes or errors.

