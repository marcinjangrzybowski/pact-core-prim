
# ⚠️ ☠️ 🔮 🤖 CRITICAL DISCLAIMER ⚠️

 
This document is **AUTO-GENERATED** using a Large Language Model. While the generation process employs legacy documentation, code snippets, and human-like AI language processing, it is **NOT GUARANTEED TO BE ACCURATE OR COMPLETE.** The AI is fundamentally limited, being incapable of understanding the nuances of human-written code in the way a skilled developer would. This document exists primarily as an initial draft meant to *assist* technical writers, not to replace their essential work. It is *critical* for all contents presented here to be meticulously reviewed, cross-checked, and validated against the original source code. 🚫 **DO NOT REMOVE** this disclaimer without comprehensive and informed review of the entire document. Proceed with extreme caution! Do not trust this document without verification!

# read-keyset

## Basic syntax

To use the `read-keyset` function, use the following syntax:

```pact
(read-keyset *key*:string)
```

This would extract the keyset from the message data body with a specified key. Keyset is defined by an object with "keys" and "pred" fields like `{ "keys": KEYLIST, "pred": PREDFUN }`. PREDFUN should resolve to a keys predicate.

Example usage:

```pact
(read-keyset "admin-keyset")
```

In the above example, "admin-keyset" is the specified string key used to retrieve the keyset from the message data body.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| key | string | The key used to refer to the keyset in the message data body. This should point to a keyset in the format `({ "keys": KEYLIST, "pred": PREDFUN })`, where PREDFUN is a key predicate. |

## Prerequisites

Before using the `read-keyset` function, a keyset must be defined and added to the message data body. This should be in the format `{"keys": KEYLIST, "pred": PREDFUN}` where KEYLIST is a list of keys and PREDFUN is a keys predicate. Keep in mind that the keysets are expected to be represented as a string.

## Return values

The `read-keyset` function returns a `keyset` object. The `keyset` object consists of `"keys"` which is a list of public keys, and `"pred"` which is a keys predicate. This returned value is useful when you need to get a keyset from the message data body for operations such as defining keysets or creating accounts in the blockchain.

## Examples

Sure, here are a few examples demonstrating the `read-keyset` function: 

```pact
(read-keyset "admin-keyset")
```
In this example, it's reading the KEY from "admin-keyset". 

Here are a few more examples from the repositories:

```pact
(fund-user "alice" (read-keyset "alice") 10.0)
```
In this example, it's reading the KEY from "alice" and is associated with `fund-user` function. 

```pact
(coin.create-account "gas-buyer" (read-keyset 'buyer))
```
In this example, `read-keyset` is reading the KEY from 'buyer' to provide the second argument for `create-account` function.

```pact
(coin.rotate "emily" (read-keyset "k1"))
```
In this example, `read-keyset` is reading the KEY from "k1" to provide the second argument for `rotate` function.

Please, alter those examples to your need, including different arguments or use cases where applicable.


## Options

N/A

## Property validation

The `read-keyset` function inherently performs property validation to ensure the correct retrieval of keysets. The function checks if the specified key is present in the message data body and whether it corresponds to a valid keyset structure i.e., `{ "keys": KEYLIST, "pred": PREDFUN }`, where `KEYLIST` stands for a list of keys and `PREDFUN` represents a keys predicate.

In case, the specified key does not exist in the message data body, or the associated value does not represent a valid keyset `{ "keys": KEYLIST, "pred": PREDFUN }`, the function will fail.

## Gotchas

- `read-keyset` can only read keysets from message data in the body of the smart contract. It will cause an error if the specified key is not defined in the message data.

- Avoid using the `read-keyset` function if the keyset will be used only for validation checks and not for capabilities specification since there's potential for keyset hijacking. Use `enforce-keyset` or `require-capability` instead for enforcing authorization rules.

- This function expects the keysets to be structured as JSON objects in the form { "keys": KEYLIST, "pred": PREDFUN }. If input data is not properly structured, it could lead to unexpected behavior or errors. 

- `read-keyset` fetches and enforces the provided keyset, meaning that it asserts that the transaction was signed by someone in the keyset. Consequently, misuse or misunderstanding about its enforcement nature could inadvertently open up security vulnerabilities. 

These are misconceptions and issues that users could potentially run into while using `read-keyset`. Proper understanding and careful handling of keysets is crucial for building secure and efficient smart contracts.

