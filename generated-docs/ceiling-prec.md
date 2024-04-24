# ceiling-prec

## Basic syntax

Here is an example of how to document the basic syntax of the `ceiling-prec` function:

```pact
(ceiling-prec value precision)
```

The `ceiling-prec` function has 2 parameters - `value` and `precision`. Both are required and should be given as arguments when calling the function.

- `value` is a decimal or integer representing the number you wish to round up.
- `precision` is an integer that defines the precision of the rounding operation.

Here is an example code snippet to demonstrate how to use this function:

```pact
(ceiling-prec 12.3456 2)
```

This code will round the number 12.3456 up to nearest hundredths place, resulting in 12.35.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| decimal | decimal | This is the decimal number input that you want to calculate the ceiling value for. |
| precision | integer | Specifies the precision for the decimal place up to which you want to calculate the ceiling value. It determines how many digits to the right of the decimal point in the number should be considered for the ceiling calculation. |

## Prerequisites

N/A

## Return values

The `ceiling-prec` function returns a value with a higher precision rounded to its nearest whole number. If the provided number already is a whole number, it will return that number as is. The return value will be of a decimal type. If the precision is higher than the decimal number, the function rounds the number to the nearest whole number. The returned value can be utilized in mathematical operations requiring precision or where rounding off to the nearest whole number is required. If the function encounters an error during calculations, it will stop execution and return the error.

## Examples

```pact
(ceiling-prec 1.1234567 2)
1.13
```

In this example, the fractional part of 1.1234567 is rounded off, leaving 1.13

```pact
(ceiling-prec 3.9876543 3)
3.988
```

In this example, the fractional part of 3.9876543 is rounded off, leaving 3.988

```pact
(ceiling-prec 4.9999999 0)
5.0
```

In this example, the fractional part of 4.9999999 is fully rounded off, leaving 5.0

## Options

N/A

## Property validation

The `ceiling-prec` function performs a validation check to confirm that the input passed is a decimal number. If the input provided isn't a decimal, the function will throw an error. This reinforces the property that `ceiling-prec` will only take decimal numbers as valid inputs to round up to the nearest whole number. The precision of this is always best assumed as 0. Please ensure your input is of the suitable and intended type to avoid any runtime errors.

## Gotchas

N/A

