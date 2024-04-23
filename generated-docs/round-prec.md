# round-prec

The `round-prec` function is used to round a given number to the specified precision.

## Basic syntax

Here is the basic syntax to use the `round-prec` function:

```pact
(round-prec number precision)
```

- `number`: The original number you want to round.
- `precision`: The number of decimal places to round to.

An example of usage would be:

```pact
(round-prec 3.14159 2)
```
This will round the number `3.14159` to `3.14`. 

Please note that both the `number` and `precision` values need to be of the `decimal` data type for this function to work properly.

| Argument | Type | Description |
| --- | --- | --- |
| value | decimal | Specifies the number you want to round.|
| precision | integer | Dictates the number of decimal places the return value will have. It determines the precision of the rounding. |

N/A

## Return values

The `round-prec` function returns a numerical value that is the original number rounded to the specified number of decimal places. This return value is useful in contexts where precision is required and only a certain number of decimal places are desirable or acceptable.

```pact
(round-prec 1.3456 2)
```
In this example, the above `round-prec` invocation would round the number 1.3456 to two decimal places, resulting 1.35.

```pact
(round-prec 2.36 0)
```
For this example, rounding the number 2.36 with precision 0 would return the number 2 as result.

```pact
(round-prec 0.6743 3)
```
In this case, rounding the number 0.6743 with precision 3 would give us 0.674 as the result.

N/A

N/A

Unfortunately, without concrete context from any legacy documentation or code snippets, writing the 'Gotchas' section for `round-prec` is not feasible. But as a general rule of thumb, here are few points that might be relevant based on the function name: 

- While using precision argument in `round-prec`, if precision is larger than the actual number of decimal places in number, it might yield unexpected results. 
- Be cautious of rounding errors. Rounding can introduce small discrepancy due to the precision of floating point representation.
- Consider the data type of numbers you're working with, as certain types may not support the precision parameter.
- Confirm the expected rounding behavior in your specific application. Different programming languages or libraries might implement rounding differently.
  
Please consider these points as assumptions and make sure to validate them as per your specific usage scenario or language constructs.

