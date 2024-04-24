# round-prec

## Basic syntax

The basic syntax for the `round-prec` function in Pact is:

```pact
(round-prec value precision)
```

Here `value` is the number you want to round and `precision` is the number of decimal places to which you want to round `value`.

The 'value' argument can be of any data type that represents numeric values including decimal and integer. The 'precision' must be an integer representing the number of decimal places. Both arguments are required.

Example:

```pact
(round-prec 3.14159 2)
```
In this example, the `round-prec` function will round the value 3.14159 to two decimal places, resulting in 3.14.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| x | decimal | The number that you want to round to a specific number of decimal places. |
| prec | integer | The number of decimal places to which you want to round `x`. The value should be positive. |

## Prerequisites

N/A

## Return values

The `round-prec` function returns a numeric value. This returned value corresponds to the original input value rounded to the nearest integer, after the precision of the original number has been adjusted as per the precision value specified. The returned value can be of use in various mathematical and statistical operations where precision-adjusted values are required.

## Examples

```pact
(round-prec 2.45678 2)
2.46
```

The above example rounds the decimal number 2.45678 to a precision of 2 decimal places, resulting in 2.46.

```pact
(round-prec 2.45678 0)
2
```

The above example rounds the decimal number 2.45678 with no decimal precision, resulting in 2.

```pact
(round-prec 2.45678 3)
2.457
```

The above example rounds the decimal number 2.45678 to a precision of 3 decimal places, resulting in 2.457.

## Options

N/A

## Property validation

N/A

## Gotchas

N/A

