# ln

## Basic syntax

```pact
(ln x)
```

The `ln` function comes with a simple syntax that requires a single argument, `x`, which represents the value that you want to compute the natural logarithm for.

As a built-in function, `ln` takes a single value, `x`, which can be of type `integer` or `decimal`. The function returns the natural logarithm of the `x` as an `integer` or `decimal` respectively.

Here is the basic usage of the `ln` function:

```pact
(ln 60) 
```

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| x | integer or decimal | Specifies the number of which you want to find the natural logarithm. The function returns the natural logarithm of the given number. |

## Prerequisites

N/A

## Return values

The `ln` function returns the natural logarithm (base e) of the input value. The return value is a number of the same type (integer or decimal) as the input number. This function can be useful in various mathematical, statistical, and data analysis situations that require calculations involving the natural logarithm.

## Examples

```pact
(ln 60)
4.094345
```

In the example above, the `ln` function takes the integer 60 and returns the natural log of it, rounded to six decimal places.

```pact
(round (ln 74) 6)
4.304065
```

In this example, the `ln` function takes the integer 74 computes its natural log. The `round` function then rounds the result to six decimal places.

```pact
(defproperty prop_ln_test 
  (let 
    ((sample_data 3.14))     
    (= (ln sample_data) 1.1442228))
)
```

In this last example, the `ln` function is used within a property test. The property `prop_ln_test` checks for equality between the natural logarithm output of the input `3.14` rounded to seven decimal places and `1.1442228`.

## 
If your function has any configurable options, describe them here in the format similar to the 'Arguments'. That is, a markdown table with 'Option', 'Type' and 'Description' as columns. Make sure to clearly explain the effect of each option on your function's execution. If there are no options, respond with 'N/A'.


Could not generate content.
## Property validation

The `ln` function in Pact language can be effectively used for property checking. You can include it as an invariant or a property in testing for natural logarithms of numbers. This allows for validating whether a certain number falls within an expected range when the natural log transformation is applied. It will gracefully handle errors if a non-numeric value is passed as an argument, or if the input is negative, returning an error in such cases.

## Gotchas

While using `ln` function, it's important to note that:

1. It only takes numeric values as input. Providing a non-numeric value will cause an error.
2. As the logarithm function is undefined for negative numbers and zero in real number set, providing these as input to `ln` will result in an error.
3. The return value of `ln` is a decimal. Regardless of whether the input is an integer or a decimal, the output will always be a decimal.
4. For very large or small inputs, the precision of the returned value may be affected due to floating point limitations.

