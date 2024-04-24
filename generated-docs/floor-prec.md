# floor-prec

## Basic syntax

The `floor-prec` function in Pact takes two arguments: a decimal value and an integer value representing precision. It rounds the given decimal value downward to the nearest number that can be represented with the specified precision.

The basic syntax of the `floor-prec` function is:

```pact
(floor-prec decimal-value:decimal precision:integer)
```

Here 'decimal-value' is the decimal number you want to round down and 'precision' is the number of decimal places to which you wish to round.

For example:

```pact
(floor-prec 57.46735 2)
```

This will round the decimal number 57.46735 down to the nearest number that can be represented with two decimal places, resulting in 57.46.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| x | decimal | The decimal number you want to perform the operation on. |
| prec | integer | The precision level to which you want to floor the decimal. This dictates the number of decimal places the result will retain. |

## Prerequisites

N/A

## Return values

The `floor-prec` function returns a decimal number. The return value is the provided number rounded down to the nearest decimal based on the specified precision. The returned value is especially helpful in contexts where specific decimal precision is required like financial calculations, scientific computations, and precision-based comparisons.

## Examples

Apologies for any confusion, but it seems there are no provided legacy documentation or code snippets for the `floor-prec` function to form the examples section. However, once those details are available, the examples would look something like:

```pact
(floor-prec 1 2.45)
2.4
```

This example demonstrates the `floor-prec` function which rounds down the decimal number `2.45` to the nearest `1` decimal place.

```pact
(floor-prec 0 2.45)
2
```

This example demonstrates the `floor-prec` function rounding down the decimal number `2.45` to the nearest whole number.

```pact
(floor-prec 2 2.4567)
2.45
```

This example demonstrates the `floor-prec` function rounding down the decimal number `2.4567` to `2` decimal places.

Please, replace the examples with the actual ones based on existing code snippets or legacy documentation.

## 
If your function has any configurable options, describe them here in the format similar to the 'Arguments'. That is, a markdown table with 'Option', 'Type' and 'Description' as columns. Make sure to clearly explain the effect of each option on your function's execution. If there are no options, respond with 'N/A'.


Could not generate content.
## Property validation

N/A

## Gotchas

N/A

