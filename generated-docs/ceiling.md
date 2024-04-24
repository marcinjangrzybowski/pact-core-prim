# ceiling

## Basic syntax

To use the `ceiling` function to round up a decimal value, use the following syntax:

```pact
(ceiling *decimal-value*:decimal)
```

If you want to round up the decimal value to a certain precision, you can specify an integer as the second argument to the `ceiling` function. The integer argument defines the number of decimal places in the rounded value. Use the following syntax:

```pact
(ceiling *decimal-value*:decimal *precision*:integer)
```

In both commands, replace `*decimal-value*` with the decimal number you want to round up, and replace `*precision*` with integer number that represent number of decimal places you need.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| x | decimal | Specifies the decimal that you want to round up. |
| prec | integer | (Optional) Specifies the precision as a decimal. If not included, the function rounds up the decimal x to the next integer. |

## Prerequisites

N/A

## Return values

The `ceiling` function in Pact either returns an integer or a decimal depending on the input provided. If only one argument of type decimal is passed to the function, it rounds up the decimal to the next largest integer and returns this integer. However, if two arguments are passed, which are a decimal and an integer representing precision respectively, the function rounds up the decimal to the precision specified and returns a decimal. This returned value can be useful in situations where precise rounding up of numbers is required.

## Examples

```pact
(ceiling 3.5)
```

In this example, the decimal number 3.5 is rounded up to the next integer, resulting in 4.

```pact
(ceiling 100.15234 2)
```
In this example, the decimal number `100.15234` is rounded up to a `precision` of 2 decimal places, resulting in `100.16`. 

Note: The function `ceiling` can be used in either invariants or properties for rounding decimal values.

## Options

N/A

## Property validation

In case of the `ceiling` function, property validation is essential. In the primary form `(ceiling x)` the function verifies whether `x` is of type `decimal`. This function returns an error if `x` is not a decimal number.

In the secondary form `(ceiling x prec)`, the function validates both `x` and `prec` inputs. `x` must be a `decimal` value, and `prec` must be an `integer`. If any input deviates from their expected type, the function will return an error.

Note that with the `ceiling` function, a call with an value of `prec` more than the precision of `x` or less than 0 is permitted but does not make practical sense, as the result will be the same as the input `x`. 

In contexts like specified invariants or properties, using `ceiling` can be effective for property checking. For example, you can use the `ceiling` function to validate that an output value does not exceed a specified threshold.

## Gotchas

The `ceiling` function does not support negative precision values. If you attempt to provide a negative precision, the function will return an error. Furthermore, it's important to note how specifying decimal precision works. If you call `(ceiling 1.9999 3)` expecting it to return `2.000` because it rounds up the decimal, this is not the case. The decimal precision rounds to the nearest decimal based on the precision, and not necessarily up. So `(ceiling 1.9999 3)` will return `1.999` and not `2.000`.

