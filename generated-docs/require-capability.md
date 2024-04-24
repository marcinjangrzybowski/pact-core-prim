# require-capability

## Basic syntax

The basic syntax for `require-capability` function is as follows:

```pact
(require-capability CAPABILITY)
```

You can encapsulate the `CAPABILITY` someone would have with parentheses in the requirement to check for its grant.

For example, if you want to specify and test for the capability of a TRANSFER between `src` and `dest`, you would write:

```pact
(require-capability (TRANSFER src dest))
```
The function will return a boolean result, indicating whether the required capability is found in the environment or not. It will fail if the required capability is not granted.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| capability | bool | Specifies the capability you want to check. The function returns true if the specified capability exists; false otherwise. |

## Prerequisites

N/A

## Return values

The `require-capability` function does not explicitly return any value. Instead, it checks if a specified capability has been granted. If the capability is found within the execution environment, execution continues. However, if the capability is not found, the `require-capability` function aborts and fails the entire transaction. In essence, the function's return value is the continued successful execution of the code block or transaction that it's incorporated in.

## Examples

Here are several examples of how `require-capability` is used in practice:

```pact
(require-capability (TRANSFER src dest))
```

In the example above, we are checking for the `TRANSFER` capability for the given source `src` and destination `dest`. If the capability does not exist in the environment, the function will fail.

```pact
(require-capability (ALLOW_GAS))
```

In the above example, we are checking if the `ALLOW_GAS` capability is granted within the environment.

```pact
(defun gas-payer-guard ()
  (require-capability (GAS))
  (require-capability (ALLOW_GAS))
)
```

In the above example, the function `gas-payer-guard` is defined which checks both the `GAS` and the `ALLOW_GAS` capabilities.

```pact
(require-capability (GAS))
```

In the above example, we are checking if the `GAS` capability is granted within the environment.

```pact
(require-capability (GENESIS))
```

In this example, we are checking for the `GENESIS` capability in the environment.

```pact
(require-capability (CREDIT account))
```

In this example, we are checking for the `CREDIT` capability for the specified `account`.

```pact
(require-capability (DEBIT account))
```

In the above example, we are checking for the `DEBIT` capability for the given `account`.

Remember, `require-capability` will fail if the checked capability is not found in the environment.


## Options

N/A

## Property validation

In the case of `require-capability`, it checks the availability of a given capability in the environment. If not found, the function will fail. It is crucial to make sure that the capability been checked is correctly spelled, exists in the environment and is accessible in the current context. 

For example:

```pact
(require-capability (TRANSFER src dest))
```
In this case, `require-capability` will validate if the `TRANSFER` capability is available in the environment before proceeding with the transfer. If `TRANSFER` capability is not found, the Pact execution will error and halt.

## Gotchas

While using the `require-capability` function, be mindful of these possible issues:

- Undefined capability: If the specified capability is not defined in the current environment, `require-capability` will fail, causing an error and termination of the smart contract execution. Always ensure that the required capability exists and is valid in the current execution environment.

- Scope of Capability: The function requires a specific *capability* to have been granted in the current environment or context. So, ensure the *capability* is in the right scope before it's required. If not, you may encounter an unexpected behavior or error.

- Silent Failure: An important thing to bear in mind when using `require-capability` is its failure mode. Unlike many functions, `require-capability` does not explicitly announce its failure. Instead, it fails silently, which means the execution doesn't halt immediately. 

Always test your contract thoroughly to ensure the required capabilities are correctly implemented.


