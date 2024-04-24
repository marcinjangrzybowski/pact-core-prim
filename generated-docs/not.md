# not

## Basic syntax

To negate a boolean value, use the following syntax with the `not` function:

```pact
(not *x*:bool)
```

This means that if `x` is `true`, `not` will return `false`, and if `x` is `false`, `not` will return `true`.

Here is an example:

```pact
(not true)
```

This will return `false`. Similarly,

```pact
(not false)
```

This will return `true`. 

Remember that `not` only accepts boolean values (`true` or `false`) as its argument.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| x | boolean | The argument 'x' is a boolean value that you need to negate. The `not` function takes this as argument and returns the opposite boolean value.|

## Prerequisites

N/A

## Return values

The `not` function returns a boolean value. It will return `true` if the input is `false` and `false` if the input is `true`. The returned boolean is typically used to negate or reverse a boolean condition in the control flow of a program.

## Examples

Here are the examples for the built-in function `not`:

```pact
(not true)
```

This example returns `false`, because `not` negates the `true` input.

```pact
(not false)
```

This example returns `true`, because `not` negates the `false` input.

```pact
(not (> 1 2))
```

This example returns `true` because 1 is not greater than 2. Thus, `not` negates the `false` result of the comparison, returning `true`. 

```pact
(not (= 1 2))
```
This example returns `true` because 1 is not equal to 2. Thus, `not` negates the `false` result of the equality check, returning `true`.


## Options

N/A

## Property validation

The `not` function can be used in property checks, particularly when defining invariants or properties for testing. As `not` is an essential logical function, it plays a crucial role in checks that validate the non-existence of a condition or assert that a particular situation is not true. The function's argument must be a boolean expression, and it will return the opposite boolean value. 

Example use-cases for property validation could include ensuring an actor does not possess certain capabilities or negating conditions. If the boolean check inside the `not` function results in an error, the `not` function will stop execution and will not return a value.

## 
In this section, discuss any unintuitive behavior, potential pitfalls, or common mistakes to avoid while using your function. Make sure to present this information in a clear and concise manner to help your users avoid these issues. If there are no known gotchas associated with your function, respond with 'N/A'.


Could not generate content.
