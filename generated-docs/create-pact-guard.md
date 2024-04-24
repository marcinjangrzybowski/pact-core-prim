# create-pact-guard

## Basic syntax

The basic syntax for the 'create-pact-guard' function is as follows:

```pact
(create-pact-guard *pactName*:string)
```

This function takes one argument:

- pactName: `string` - The unique identifier for the guard predicate that you want to define.

Here is a basic usage example:

```pact
(create-pact-guard "myPact")
```

This code creates a guard predicate that captures the results of 'myPact'. The success condition at enforcement time is that at that time 'myPact' must return the same value. This ensures that the guard will only succeed within the multi-transaction identified by the pact id 'myPact'.


## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| name | string | Defines the guard predicate by NAME that captures the results of 'pact-id'. |


## Prerequisites

Prerequisites for using `create-pact-guard` are:

1. A valid identifier in string format. This identifier serves as the name for the guard predicate.
2. A functioning 'pact-id' operation in the code. The success of the guard predicate created by `create-pact-guard` is tied to the return value of 'pact-id'. If 'pact-id' does not return the expected value, the guard fails.

Please note: 'pact-id' should be returning the same value at the execution time of `create-pact-guard` for the successful condition enforcement. Make sure to understand and maintain this invariant during code development.

## Return values

The `create-pact-guard` function returns a guard predicate. This guard will be successful if the return value of 'pact-id' at enforcement time matches its return value captured at the time of defining the guard using `create-pact-guard`. This ability to capture and bind the 'pact-id' return state is useful in multi-transaction scenarios, where we need to ensure the unaltered state of a certain pact throughout multiple transactions. In other words, the function essentially returns a "pact passport" that verify the multi-transaction identity through 'pact-id'.

## Examples

The following examples demonstrate the usage of the `create-pact-guard` function in Pact:

Example 1: Basic use case
```pact
(create-pact-guard "pactId")
```
In this example, we define a guard with the name "pactId". The success condition of this guard at enforcement time is that the 'pact-id' must return the same value as when it was captured.

Example 2: In a transaction
```pact
(defun transaction ()
   (let ((my-guard (create-pact-guard "pactId")))
     (enforce-guard my-guard))
(transaction)
```
In this use case, we created a guard within a transaction. The condition of this guard will hold only within the multi-transaction identified by the pact id.

Please note: The guard is useless on its own and should be used in conjunction with the `enforce-guard` function to enforce the guard's condition.

## Options

N/A

## Property validation

For the `create-pact-guard` function, property validation checks if the input argument is a string. If an incorrect datatype, like an integer or a list, is passed instead of a string to the function, it will throw an error. This validation ensures that the guard predicate can be correctly defined by the specified name. The function also ensures that it returns the same value as the 'pact-id' at the time of enforcement. If this is not the case, the function will fail. Therefore, a valid property must always be a string that corresponds to a 'pact-id', and the value of 'pact-id' should remain consistent for the function to succeed.

## Gotchas

When using `create-pact-guard`, beware of the following potential issues:

- This function relies heavily on the results of `pact-id`. Make sure `pact-id` is correctly set and returns the intended values as inconsistencies or errors in `pact-id` will directly impact the guard creation.
- The function enforces the condition at the point of time `pact-id` is invoked. Any changes in data after that point will not be reflected in the guard created by `create-pact-guard`.
- If used carelessly, because this function inherently provides security measures by only succeeding within the multi-transaction identified by the pact id, it could inadvertently restrict access or permissions incorrectly. Make sure to thoroughly test all possible conditions and use cases in your pact code.
- `create-pact-guard` captures the results only at the moment of invocation. It does not track changes in `pact-id` beyond that point. Therefore, it is not suitable for situations where `pact-id` values are expected to change within the life of the guard.

Remember to use these insights as precautions to prevent your guard functions from leading to unintended and unexpected behaviors in your pact code.

