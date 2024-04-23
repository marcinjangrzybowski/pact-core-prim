## Basic syntax

To get the smallest integer greater than or equal to the given number with precision, use the following syntax:

```pact
(ceiling-prec *number*:decimal *precision*:integer)
```

## Arguments

Use the following arguments to define the precision of the ceiling operation you want to perform using the `ceiling-prec` Pact function.

| Argument | Type | Description |
| --- | --- | --- |
| number | decimal | Specifies the number you want to retrieve the ceiling value of. |
| precision | integer | Specifies the precision of the decimal places |

## Return values

The `ceiling-prec` function returns the smallest integer greater than or equal to the given number at the specified precision. The return value is a decimal.

## Examples

The following example returns the ceiling value of a decimal number at the specified precision:

```pact
(ceiling-prec 3.1459 2)
3.15
```

You can use the `ceiling-prec` function to round up any decimal number to the nearest whole number or to any precision of your choice.
For example:

```pact
(ceiling-prec 7.834 0)
8
```

The `ceiling-prec` function takes in the following arguments:

| Argument | Type | Description |
| --- | --- | --- |
| number | decimal | The decimal number to be rounded up. |
| precision | integer | The number of decimal places to keep in the result. |

N/A

## Return values

The `ceiling-prec` function returns the smallest integer greater than or equal to the provided value, with precision after the decimal point set by the precision value. The return value is a decimal. 

Understanding the return value of `ceiling-prec` is essential when you need exact or approximated rounding. For numerous tasks in finance, physics, statistics and math, working with the `ceiling-prec` function is a must.

## Examples

Here are some examples demonstrating the use of `ceiling-prec` function:

Example 1: In this basic usage, we are rounding up to the nearest whole number with precision of 0:
```pact
(ceiling-prec 0 123.456)
124
```

Example 2: Here, we're rounding up to the nearest whole number with precision of 1:
```pact
(ceiling-prec 1 123.456)
123.5
```

Example 3: In this case, rounding up to the nearest ten with precision of -1:
```pact
(ceiling-prec -1 123.456)
130
```

Example 4: Here, we're rounding up to the nearest hundred with precision of -2:
```pact
(ceiling-prec -2 123.456)
200
```

N/A

N/A

## Gotchas

The `ceiling-prec` function operates with precision to the decimal level. Thus, it is important to note that it might not return expected results with floating-point numbers due to the inherent imprecision of these numbers.

Another thing to note is that `ceiling-prec` always rounds up, regardless of the original value. Therefore, even a small fraction over a whole number result in the next higher whole number.

Always keep in mind the inherent behavior and properties of this function when using it in your code or calculations to prevent unexpected results or inaccuracies.

