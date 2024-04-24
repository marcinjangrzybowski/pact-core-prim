# negate

## Basic syntax

The `negate` function is used to return the negative of a number. This can include any sort of numeric data type such as an integer or a float. 

Here is the basic syntax for the `negate` function:

```pact
(negate value)
```

In the syntax, replace `value` with the number you want to negate. The 'value' argument represents any numeric value that you want to find the negation of. 

Here is an example usage:

```pact
(negate 5)
-5
```

In this example, `5` is the argument provided to the `negate` function, and `-5` is the result returned by the function. This function returns the negation of the number provided, which in this case is `-5`.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| x | integer, decimal | The number which will be put through the `negate` function. The function will return this number with its sign switched. If the original number is positive, the function will return a negative number. If it's originally negative, it will return a positive number. If 0 is provided, 0 will be returned. |

## Prerequisites

N/A

## Return values

The `negate` function returns the negative value of the given numerical input. It returns an integer or decimal value, depending upon what data type of the numeric input value was. This function is useful in mathematical computations and scenarios where the negative counterpart of a numeric value is required.

## Examples

```pact
(negate 5.7)
-5.7
```
The preceding example shows how the `negate` function returns the negative of a positive decimal number.

```pact
(negate -42)
42
```
This shows how `negate` can return the equivalent positive value for a negative integer.

```pact
(negate 0)
0
```
This demonstrates that the negation of zero is still zero.

```pact
(define my-var 12)
(negate my-var)
-12
```
The function can also take a variable as an argument. In this case, `my-var` is set to 12 and then negated.

```pact
(negate (add 5 7))
-12
```
The `negate` function can also be composed with other functions. Above, sum of 5 and 7 is negated, returning -12.

## Options

N/A

## Property validation

N/A

## Gotchas

The `negate` function in Pact only works with numerical values. Therefore, using it with non-numerical data types such as booleans, strings or undefined values will result in an error. Always ensure the input is a valid number to avoid runtime errors. 

If used on a list or array, `negate` does not operate element-wise, but will instead throw an error. If you need to negate all elements in a list or array, you will need to use a map function to apply `negate` to each element.

Finally, remember that `negate` doesn't alter the original value, but instead returns a new value. This means the variable you're negating needs to be re-assigned if you want it to store the negated value.

