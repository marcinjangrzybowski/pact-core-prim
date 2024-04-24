# enforce-keyset

## Basic syntax

The `enforce-keyset` function is used to execute a specific guard or a defined keyset to enforce a predicate logic. Here, either a guard or a keyset name can be provided. 

Arguments: 
1. `guard` should be a built-in guard type
2. `keysetname` is a string representing a keyset name. 

```pact
(enforce-keyset 'keyset-name)
(enforce-keyset guard)
```
In the examples above:
- The first snippet `enforce-keyset` is taking a keyset name as an argument.'
- The second snippet `enforce-keyset` is taking a guard as an argument. 

Note: `enforce-keyset` function must have either a keyset name or a guard as an argument, and it returns a boolean value.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| guard/keysetname | guard/string | A guard object or name of the keyset. Guard enforces predicate logic. If a keyset name is provided, the function executes the defined keyset. |

## Prerequisites

Before you can use the `enforce-keyset` function, you need to define the required keysets used in the function. A keyset refers to a set of public keys and their associated predicate that defines how many of those keys are required to authenticate a transaction. If the keyset is not defined or doesn't exist in the system, calling `enforce-keyset` with that keyset will result in an error. 

In addition, remember that the `enforce-keyset` function does not exist in standalone mode. It only exists within a smart contract execution environment. Therefore, this function can only be used in the context of a running smart contract.

## Return values

The `enforce-keyset` function does not have a clear return value; instead, its primary function is to enforce desired predicate logic based on the guard or keyset provided. If this enforcement succeeds, execution continues normally. However, if it fails, an error is thrown which aborts the execution. This function is typically used for verifying user permissions before executing sensitive operations and does not carry a conventional return value.

## Examples

Below are code examples on how to use the `enforce-keyset` function:

Example 1:
```pact
(enforce-keyset 'admin-keyset)
```
In the context above, `enforce-keyset` is used to assert that the transaction is signed by keys defined in the 'admin-keyset'.

Example 2:
```pact
(enforce-keyset row-guard)
```
This usage demonstrates how a user-defined guard (row-guard in the context) can be used with `enforce-keyset`. 

Example 3:
```pact
(defcap OPERATE ()
  (enforce-keyset 'ns-operate-keyset))
```
In this snippet, `enforce-keyset` is used in the context of a capability (OPERATE in the context) to ensure that the capability can only be invoked by those keys in the ns-operate-keyset.

Each example demonstrates usage against a different use case: a string representing a pre-defined keyset, a user defined guard, and within a capability definition.

## Options

N/A

## Property validation

N/A

## Gotchas

When using the `enforce-keyset` function:

- Ensure that the keyset name or guard you specify exists and is properly designated. If the keyset name or guard does not exist or if it's incorrectly specified, the function will not return the desired result and may cause unexpected behavior.
  
- Keep in mind that `enforce-keyset` does not return a value, but asserts a condition, i.e., it expects the condition to be true and will abort the transaction if it's not true. If you are looking for a function that returns a boolean value indicating whether the condition was met, consider using functions like `check-keyset`.

- If `enforce-keyset` is used on a non-designated keyset which has not been created or declared prior to the use, it will result in an error.

- You must be careful when using guards. Remember that some guards, such as module guards, are not evaluated in the context where `enforce-keyset` is called. Therefore, their result may depend on other operations that have not been completed yet. Be sure to properly sequence your operations to avoid any unpredictable behavior.
  
- Always keep the permissions of the keysets in mind. If multiple parties are authorized to use a single keyset, any of them can pass the `enforce-keyset` test and execute the transaction. Make sure this is the intended behavior to prevent any unauthorized actions.

