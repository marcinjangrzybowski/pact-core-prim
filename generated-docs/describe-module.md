
# ⚠️ ☠️ 🔮 🤖 CRITICAL DISCLAIMER ⚠️

 
This document is **AUTO-GENERATED** using a Large Language Model. While the generation process employs legacy documentation, code snippets, and human-like AI language processing, it is **NOT GUARANTEED TO BE ACCURATE OR COMPLETE.** The AI is fundamentally limited, being incapable of understanding the nuances of human-written code in the way a skilled developer would. This document exists primarily as an initial draft meant to *assist* technical writers, not to replace their essential work. It is *critical* for all contents presented here to be meticulously reviewed, cross-checked, and validated against the original source code. 🚫 **DO NOT REMOVE** this disclaimer without comprehensive and informed review of the entire document. Proceed with extreme caution! Do not trust this document without verification!

# describe-module

## Basic syntax

The `describe-module` function can be used to retrieve the metadata for a specific module. The basic syntax is as follows:

```pact
(describe-module 'module-name)
```

The 'module-name is a string argument that specifies the module name for which you want to retrieve the metadata.

Example usage for `describe-module` function would be:

```pact
(describe-module 'my-module)
```

This will return an object with metadata for `my-module`, containing 'name', 'hash', 'blessed', 'code', and 'keyset' fields.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| module | string | Specifies the name of the module for which the metadata is to be retrieved. The function will fail if used in module code, it can only be used for top level modules. |

## Prerequisites

The `describe-module` function is designed to be used only at the top level. Using it in module code would result in a failure. 

Additionally, for the function to yield desired results, it is necessary that the invoked module, specified by its 'name' as a string, exists and has metadata to be retrieved.

## Return values

The `describe-module` function returns an object containing metadata for a given module. The returned object includes the following fields: 

- 'name' - A string indicating the name of the module.
- 'hash' - A string representing a unique hash code of the module.
- 'blessed' - A list of strings, each representing a blessed hash key of the module.
- 'code' - A string containing the actual code of the module.
- 'keyset' - A keyset that has been assigned to the module during its creation.

This information can be used to retrieve specific details about the module or for validation purposes, as seen in the provided code snippet where the 'hash' of the specified module was verified.

## Examples

Here are examples demonstrating the use of the `describe-module` function:

This example demonstrates basic usage of `describe-module`:

```pact
(describe-module 'myModule)
```

This code will return an object containing metadata for `myModule`. The object returned includes 'name', 'hash', 'blessed', 'code', and 'keyset' fields.

This example shows how you can use the `describe-module` function with the `at` function to extract specific information from a module. In this case, the example fetches the 'hash' value of the module named 'coin'.

```pact
(at 'hash (describe-module 'coin))
```

This code will return the 'hash' of the 'coin' module.

Please note: `describe-module` function is for top level usage only. It will fail if used in module code.

## Options

N/A

## Property validation

The `describe-module` function does perform some validation on its arguments. Specifically, it requires a single argument that must be a string denoting the name of the module for which information is being requested.

If a non-string argument or an invalid module name is passed to `describe-module`, it will throw an error. It's crucial to ensure that the name of the module passed as an argument should exist to avoid any runtime errors.

Example('coin' is the pre-existing module):

```pact
(describe-module 'coin)
```

Property validation becomes particularly useful while handling invariants in smart contracts. For instance, you could use the `describe-module` function to validate the hash of a module in an invariant clause, as shown in the code snippet from the coin contract shown earlier:

```pact
(=
  "ut_J_ZNkoyaPUEJhiwVeWnkSQn9JT9sQCWKdjjVVrWo"
  (at 'hash (describe-module 'coin)))
"hash mismatch"
```

In this example, `describe-module` retrieves the metadata for the 'coin' module, and the 'hash' attribute of the metadata is checked against a specific string value for validation. In case of any inconsistencies, the smart contract would fail with the message "hash mismatch".

## Gotchas

The `describe-module` function should only be used at the top level, it will fail if used in module code. This means `describe-module` cannot be used inside any module definitions or other pact constructs that are not at the top level. Be also mindful that the string parameter should be the exact name of the module you wish to describe; it doesn't support any sort of wildcard or partial matching. Additionally, remember that the function returns an object with specific fields - 'name', 'hash', 'blessed', 'code', and 'keyset'. If you try to access any other field using this function it will return null.

