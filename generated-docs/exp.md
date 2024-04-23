## Basic syntax

To calculate the exponential of a number using the `exp` function, use the following syntax:

```pact
(exp *number*:integer or decimal)
```

## Arguments

The `exp` function takes one argument that defines the exponent to which the mathematical constant 'e' should be raised.

| Argument | Type | Description |
| --- | --- | --- |
| number | integer or decimal | Specifies the exponent of the base 'e'. |

## Example

Let's calculate the exponential of 3:

```pact
(exp 3)
```
This returns the value `20.085537`. As the result is a decimal, you may want to round it, like the following:

```pact
(round (exp 3) 6)
```
This provides a more manageable decimal to work with.

As the exp function works with both integers and decimals, you can also use it for decimal values, like so:

```pact
(exp 3.1)
```

The exp function in Pact is used for simple and fast computation of exponentials in your smart contracts.

## Arguments

`exp` takes a single argument as input.

| Argument | Type | Description |
| --- | --- | --- |
| x | integer, decimal | The input value for which the exponential function will be computed. The function calculates `e` raised to the value of `x`. |


N/A

## Return values

The `exp` function returns the exponential of the provided integer or decimal argument. The exponential function raises Euler's number (`e`) to the power of the input argument. The result will be a number (`e` to the power of `x`). This value might be useful in scenarios requiring exponential calculations, such as in mathematical, scientific, or financial computations. The returned value will be of decimal type. 

For example, `(exp 3)` will return approximately `20.085537`, as `e` raised to the power of `3` is approximately `20.085537`.

## Examples

The `exp` function can be used to calculate the exponential function of a number. Below are a few examples of how you can use it:

### Example 1
Here is a basic example demonstrating the use of the `exp` function:

```pact
(exp 2)
7.389056
```
This will return the exponential function of the number 2, which equals to approximately 7.389056.

### Example 2
You can use `exp` function to calculate the exponential function of a decimal:

```pact
(round (exp 3.2) 6)
24.532530
```
This will return the exponential function of the number 3.2 with a precision of up to 6 decimal places.

### Example 3
The `exp` function can be used in mathematical expressions:

```pact
(+ (exp 2) (exp 3))
30.192874
```
This example calculates the sum of the exponential functions of 2 and 3. The resultant value will be approximately 30.192874.

### Example 4
The `exp` function is also useful for exponential growth calculations:

```pact
(* 1000 (exp 0.01))
1010.050167
```
This calculates the future value of 1000 units growing at an exponential rate of 1%. The result is approximately 1010.05 units.

N/A

## Property validation

The `exp` function in Pact language takes as an argument a value of type integer or decimal. It returns the exponential of the indicated value that is "e" raised to the power of the input value.

An error is thrown if the function is passed an argument that is neither an integer nor a decimal. The function does not perform any other explicit property validation checks on its input.

It is supported in both invariants and properties requirement which makes it particularly valuable when specifying an invariant or a property to test your code against.

## Gotchas

1. For `exp` function, the argument must be either of type `integer` or `decimal`. Passing any other data type will result in an error.
2. The `exp` function computes the exponential of a number which can quickly escalate for larger values. Thus, it can lead to memory or performance issues for very large inputs.
3. Precision: Floating point arithmetic is not exact, and the `exp` function may produce slightly different results across different systems or versions of the software. If absolute precision is required, consider alternative approaches. 
4. `exp` function returns positive values only. Computing the exponential of any number will never yield a negative result.
5. Lastly, keep in mind that the exponential function increases rapidly, even small inputs could yield very large outputs. So, be aware of potential overflow situations while dealing with the `exp` function. It's a good practice to add validity checks for these scenarios within your code.

