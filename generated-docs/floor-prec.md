The basic syntax for the `floor-prec` function is as follows:

```pact
(floor-prec value:decimal precision:integer)
```

This function is used to return the largest integer value less than or equal to a specified decimal number, adjusting the number to the requested precision.

Here, the `value` argument is the input decimal number that you want to round down. The `precision` argument specifies the number of decimal places to preserve in the returned value.

For instance:

```pact
(floor-prec 123.4567 2)
123.45
```

In this example, the number `123.4567` is rounded down to the nearest number with a precision of 2 decimal places, which is `123.45`.

## Arguments

The `floor-prec` function takes the following arguments:

| Argument | Type   | Description |
|----------|--------|-------------|
| number   | decimal| This is the number to be rounded down.|
| precision| integer| This is the number of decimal places to which the given number will be rounded down.|

Before using the `floor-prec` function, please ensure:

- You have a numerical input for which you want to round down to the nearest specified precision level.
- Provided precision level should be a positive number, else function will round to nearest whole number.

Please note, incorrect usage can result in rounding errors or precision inaccuracies.

The `floor-prec` function returns a decimal number that represents the original number rounded down to the nearest multiple of the precision value. The return value is useful whenever you need to approximate a decimal number to a specific precision, particularly in mathematical and financial computations where controlled precision is necessary.

```pact
(floor-prec 1.237 2)
1.23
```

This example rounds down the number `1.237` to two decimal places. The result is `1.23`.

```pact
(floor-prec 1.2 3)
1.2
```

This example demonstrates how the function behaves when the original number has fewer decimal places than specified for the rounding. In this case, it keeps `1.2` unchanged.

```pact
(floor-prec 1234.5678 0)
1234
```

This last example rounds down the number `1234.5678` to zero decimal places, effectively rendering it an integer. The result is `1234`.

N/A

N/A

# floor-prec

## Gotchas

1. `floor-prec` does not handle rounding for values beyond the precision specified. Hence, the resulting value might be less than the original value, leading to potential value loss. 

2. It's important to note that a negative precision would result in an error. The precision should always be a positive integer or zero. 

3. Always ensure that a decimal place is part of the input number. If not, `floor-prec` will return the original unchanged number. 

4. Avoid using very high precision levels as it can lead to computational inaccuracies. The best practice is to use a precision level that aligns with your particular use-case requirement. 

5. There is no error handling for non-numeric inputs. Always ensure that the input parameters are numbers. 

Remember, understanding the exact requirements of your computation and a thorough testing of various edge scenarios would help avoid potential errors and inaccuracies.

