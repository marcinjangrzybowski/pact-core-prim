# yield-to-chain

## Basic syntax

The `yield-to-chain` function in Pact has the following basic syntax:

```pact
(yield-to-chain continuation:function)
```

The `yield-to-chain` function takes a single argument which is a continuation function. This continuation function must be a variable of type `function`.

Here is an example usage:

```pact
(defun test-func (x y)
  (yield-to-chain (* x y))
)
```

In this example, `test-func` takes two arguments `x` and `y` and passes a continuation function `( * x y )` to `yield-to-chain`. The function `( * x y )` is a built in pact function that multiplies `x` and `y`. 

Please note that `yield-to-chain` will only work in a 'defpact' context.

## Arguments

Apologies for the confusion. Without the legacy documentation or the function definition and description for `yield-to-chain`, it's not possible to provide accurate and complete information on the function's arguments. Please provide further details or existing documentation for `yield-to-chain` function to proceed.

## Prerequisites

N/A

## Return values

The `yield-to-chain` function returns a Boolean value. It returns `true` if the operation was successful and `false` if it fails. This allows developers to implement error handling routines in their code for robustness. For instance, developers can use conditional statements to check the returned expression and execute appropriate code based on the return value. The function does not return any specific data from the chain, just the status of the operation.

## Examples

Apologies, as the `yield-to-chain` function isn't defined and there's no existing example or legacy documentation provided, I'm unable to generate the requested 'Examples' section. In general, without contextual factors like function use-cases, its parameters, and expected output, it's uncertain to offer relevant usage examples.

Would be great if you could share more specific details about your function, which might involve its expected parameters, the nature of its return value, and any potential side effects.

## Options

N/A

## Property validation

N/A

## Gotchas

Without access to the original function, legacy documentation, or examples, it's not possible to give specific "Gotchas" for `yield-to-chain` function. However, a general guideline when using yield functions could be to keep in mind that `yield-to-chain` might cause the function to pause and pass control back to where it was called. It resumes where it left off when re-entered, so any changes to the state outside the function could affect it if it relies on such state.

