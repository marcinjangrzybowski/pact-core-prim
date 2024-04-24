# round

## Basic syntax

To round a decimal value to the nearest integer, use the following syntax:

```pact
(round *x*:decimal)
```

To round a decimal value to a specified number of decimal places, use the following syntax:

```pact
(round *x*:decimal *prec*:integer)
```

In the above syntax, `*x*` and `*prec*` are placeholders that you'll replace with real values when you use this function. 

- `*x*`: A decimal value that you want to round.
- `*prec*`: An integer value to specify the number of decimal places to round the number to. 

This function utilizes Banker's rounding methodology. That means, if the number to be rounded is precisely halfway between two possible values, it will be rounded towards the nearest even number. For example, `(round 3.5)` returns `4` and `(round 2.5)` returns `2`.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| x | decimal | The value you want to round. This could be any decimal number.|
| prec | integer | (Optional) The precision to which you want to round the decimal 'x'. This represents the number of digits after the decimal point that you want to round to. If not specified, the function will round 'x' to the nearest integer. |

## Prerequisites

N/A

## Return values

The `round` function returns a decimal or an integer depending on the input arguments. If used with a single decimal number, it will return the rounded integer value using the Banker's rounding rules. If second integer argument specifying the precision is used, the function will return a decimal rounded to the specified number of decimal places. This return value can be used for precise mathematical computations or for formatting display outputs.

## Examples

```pact
(round 3.5)
```
When no precision is specified, the `round` function performs Banker's rounding to the nearest integer on the decimal number. In this case, 3.5 is rounded to 4.

```pact
(round 100.15234 2)
```
The `round` function can also accept a second argument as precision. In this case, the decimal number 100.15234 is rounded to 100.15 which has a precision of 2.

```pact
(round 100.15584 3)
```
When the precision is specified as 3, the decimal number 100.15584 is rounded to 100.156.

Note: Supported in either invariants or properties.

## Options

N/A

## Property validation

The `round` function can be used for property testing in your contract codes. It can be particularly useful when your invariants need to confirm the rounded result of computations. For example:

```pact
(round 3.5)
```

```pact
(round 100.15234 2)
```

Please ensure that the arguments are of correct types: decimal for the value to be rounded and integer for the precision (optional). If not, the function will throw an argument type mismatch error.

## Gotchas

While using the `round` function, here are a few potential pitfalls to be mindful of:

1. Remember that `round` uses Banker's rounding, which may not behave as you'd expect if you're used to other rounding methods. A key point to keep in mind is that in Banker's rounding, half values (3.5, 4.5, etc.) are always rounded towards the nearest even number — so, for instance, 4.5 will round to 4, not 5.

2. If you're using `round` to constrain the precision of a decimal number, be mindful of the implications this may have for your calculations. Rounding can introduce subtle errors if not handled appropriately. 

3. As the rounded results can be either decimal or integer based on the parameters, ensure the data type of the return value matches your expected result in your operational context.

4. If you provide a non-decimal value to `round`, it will result in an error. Please ensure that the value used as x is a decimal number.
   
5. The precision `prec` must be an integer. Providing a non-integer value for `prec` will result in an error.

6. In the context where `round` function is used in property checking, the transaction will fail if the property condition is not met. Therefore, be aware of the conditions used alongside `round`. 

Always remember to test your code thoroughly to ensure that it behaves as expected.

