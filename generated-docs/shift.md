# shift

## Basic syntax

Here's the basic syntax for the `shift` function:

```pact
(shift *x*:integer *y*:integer)
```

This function takes two arguments, `x` and `y`, both of which should be integers. The function will perform a left shift by `y` bits on `x` if `y` is positive; if `y` is negative, it will perform a right shift by `-y` bits on `x`. The output of this function is also an integer. 

Here are some example uses:

```pact
(shift 255 8)
(shift 255 -1)
(shift -255 8)
(shift -255 -1)
```

This demonstrates that the `shift` function can be used with positive and negative numbers for both `x` and `y`.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| x | integer | The value whose bits are shifted. |
| y | integer | If positive, indicates the amount by which `x` is to be left-shifted (i.e., each bit in `x` is moved `y` places to the left). If negative, indicates the amount by which `x` is to be right-shifted (i.e., each bit in `x` is moved `-y` places to the right). |

## Prerequisites

N/A

## Return values

The `shift` function returns an integer. The result is the value of `x` shifted left by `y` bits if `y` is positive, or shifted right if `y` is negative. This can be used for bit manipulation in various algorithms where bit shifting is required. It should be noted that right shifts perform sign extension on signed number types, filling the top bits with 1 if `x` is negative and with 0 otherwise.

## Examples

The following examples illustrate usage of the `shift` function:

```pact
(shift 255 8)
```
In this example, the function shifts the binary representation of `255` to the left by `8` bits. The output is `65280`.

```pact
(shift 255 -1)
```
Here, the function shifts the binary representation of `255` to the right by `1` bit. The result is `127`.

```pact
(shift -255 8)
```
In this case, the function shifts the binary representation of `-255` to the left by `8` bits. The result is `-65280`.

```pact
(shift -255 -1)
```
In this last example, the function shifts the binary representation of `-255` to the right by `1` bit. The result is `-128`.

Remember, a positive second argument results in a left shift, while a negative second argument results in a right shift.

## Options

N/A

## Property validation

For property validation, the `shift` function can be used while specifying an invariant or a property to test your code against. It takes two integer values `x` and `y` as input. The function shifts the `x` value `y` bits to the left if `y` is positive, or to the right by `-y` bits otherwise. It performs sign extension on signed number types, filling the top bits with either 1 if the `x` value is negative or with 0 otherwise. The function checks whether the arguments received are integer types. It returns an error if the arguments passed are not integers.

## 
In this section, discuss any unintuitive behavior, potential pitfalls, or common mistakes to avoid while using your function. Make sure to present this information in a clear and concise manner to help your users avoid these issues. If there are no known gotchas associated with your function, respond with 'N/A'.


Could not generate content.
