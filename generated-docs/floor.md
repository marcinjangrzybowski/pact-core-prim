## Basic syntax

The `floor` function in Pact can either take just one argument or two arguments.

If you only want to round down a decimal to the nearest integer, you can use the following syntax:

```pact
(floor *x*:decimal)
```

If you want to round down a decimal to a certain precision, you can use this syntax:

```pact
(floor *x*:decimal *prec*:integer)
```

In each case, the `floor` function will return a decimal number. For the first syntax, it will always be an integer. 

Here's an example of rounding down a decimal to the nearest integer: 

```pact
(floor 3.5)
3
```

And here is an example of rounding down a decimal to a certain precision:

```pact
(floor 100.15234 2)
100.15
```

## Arguments

The `floor` function can have either one or two parameters.

| Argument | Type | Description |
| --- | --- | --- |
| x | decimal | The decimal value that you want to round down. |
| prec | integer | An optional argument that specifies the precision to which you want to round `x` down. If not provided, the function returns the maximum integer less than `x`. If provided, the function returns `x` rounded down to `prec` decimal places. |

Prerequisites:
To use the `floor` function, you should have a `decimal` number type input. This can either be a standalone decimal number, or it can be contained within some kind of data structure such as a variable, array, or returned from another function. Also, if you want to round the decimal to a certain precision, you must have an additional `integer` type input to specify the precision.

## Return Values

The `floor` function will return an integer or a decimal. If used with a single argument, it will round the decimal value down to the lower integer and return it. If used with two arguments, the decimal is rounded down to the precision specified by the second integer argument, and the function will return a decimal.

## Examples

The `floor` function rounds down the decimal input to the nearest lower integer or to the specified decimal precision. It is commonly used to ensure a certain level of precision or to convert decimal numbers to integers. Below are some examples demonstrating the use of `floor` function:

#### Example 1: Simple Round Down to Integer

The function takes a decimal and rounds it down to the nearest integer.

```pact
(floor 3.5)
```
Output:
```
3
```

In the above example, `floor` rounded down `3.5` to `3`.


#### Example 2: Rounding Down with Precision 

The function can also take an extra precision argument, to round the decimal to a specified precision:

```pact
(floor 100.15234 2)
```
Output:
```
100.15
```

In the above example, `floor` rounded off `100.15234` to `100.15` up to 2 decimal places.


#### Example 3: Enforcing Minimum Precision in an Amount

In the example taken from an existing repo, `floor` is used together with the `enforce` function to make sure an amount meets the minimum precision requirements:

```pact
(enforce
  (= (floor amount MINIMUM_PRECISION)
     amount)
  (format "Amount violates minimum precision: {}" [amount]))
```

In the above example, if `amount` does not have the minimum precision, the contract execution will fail with a message indicating the current precision of `amount`.

The `floor` function does not have any configurable options, therefore this section is not applicable.

## Property validation

In the context of property testing and invariants, the `floor` function can be used to ensure data consistency and precision control in numerical computations. Specifically, it ensures that the numerical value does not exceed the specified minimum precision. For instance, in the coin contract, it is used to ensure that the amount doesn't violate the minimum precision.

Please note that it throws an error if the input value has more decimal places than allowed by the precision argument. 

For example, in the following code snippet, the `floor` function is used to ensure that 'amount' confirms to the MINIMUM_PRECISION.

```pact
(enforce
    (= (floor amount MINIMUM_PRECISION)
        amount)
    (format "Amount violates minimum precision: {}" [amount]))
```

In the above code, the function rounds down the amount to the specified MINIMUM_PRECISION, and if the resulting value is not the same as the initial value, it throws an error indicating that the "Amount violates minimum precision".

## Gotchas

When using the `floor` function in Pact, there are a few potential pitfalls to be aware of:

- **Precision:** Remember that the precision is specified as an `integer`, and will affect the decimal point location. For example, if you use `(floor 100.15234 2)`, you are specifying a precision of 2, which results in `100.15`. 

- **Minimum Precision:** The `floor` function is often used in enforcing minimum precision in financial calculations as seen in the code snippets above. Be aware of the precision requirements of your application when using this function. 

- **Non-Decimal Inputs:** The `floor` function only supports rounding down decimal values. If non-decimal inputs are used, it may lead to errors or unexpected behavior.

As always, ensure to test thoroughly when implementing to make sure it behaves as expected.

