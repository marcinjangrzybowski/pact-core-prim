# sqrt

## Basic syntax

The `sqrt` function in Pact takes one argument which represents the value you want to find the square root of. This value can either be an integer or decimal. Here is the basic syntax:

```pact
(sqrt *value*:integer)
```
Or using a decimal:

```pact
(sqrt *value*:decimal)
```

Here, `value` is the number you want to find the square root of. The function then returns the square root of the given `value`.

## 
In this section, provide a detailed explanation of all the arguments of your function. Create a markdown table with each row representing a different argument. Your table should include the following fields:

| Argument | Type | Description |

Make sure the 'Argument' field contains the name of the argument, 'Type' lists the data type of the argument, and 'Description' holds a clear, concise explanation of what the argument means in the context of your function. 

Ensure the number of rows in your table matches the arity of your function. 


Could not generate content.
## Prerequisites

N/A

## Return values

The `sqrt` function returns the square root of the input value. The returned value is of the same type as the input value, either integer or decimal. This return value would be particularly useful in mathematical computations or algorithmic logic where root value calculation is needed. For instance, it can be used in statistical calculations, physics simulations, or even for certain game mechanics.

## Examples

The following examples show how to use the `sqrt` function:

```pact
(sqrt 25)
```
Output: `5.0`

This example returns the square root of an integer value 25:
   
```pact
(sqrt 30.25)
```
Output: `5.5`

This example returns the square root of a decimal value 30.25.

These examples suggest that the `sqrt` function can return either an integer or a decimal number as the square root of the input value.

Please note that while using `sqrt` in the context of invariants or properties, the input value should be a `decimal` or `integer`.

## Options

N/A

## Property validation

The `sqrt` function in Pact validates that the input is of type `integer` or `decimal`. If the input is of any other type, the function will fail. It will also fail for negative numbers as there is no real-number square root of a negative number.

Bear in mind that the result will always be of type `decimal`, even if you supply an integer number. This is due to the square root of a number not always being an integer. 

For example, `(sqrt 4)` would return `2.0`, not `2`. This function does not provide an error message if you input a negative argument; it will silently fail. If you wish to ensure your code has a robust defensive strategy, you may want to include checks to ensure the input is never a negative number.

Please note that this function returns the square root of integers and decimals, and can be used in either invariants or properties for validation, testing, or expressive purposes.

## Gotchas

The `sqrt` function only accepts non-negative numerical inputs. Passing a negative number to the function will produce an error.

The result of the `sqrt` function is a floating point number. Even when the function is applied to a perfect square (which, mathematically speaking, should reproduce an exact integer), the result will be presented as a floating point number, not an integer. 

For example, while the square root of 25 is indeed 5, `sqrt` will return 5.0. Please bear this in mind if your code assumes integer input.

