
# ⚠️ ☠️ 🔮 🤖 CRITICAL DISCLAIMER ⚠️

 
This document is **AUTO-GENERATED** using a Large Language Model. While the generation process employs legacy documentation, code snippets, and human-like AI language processing, it is **NOT GUARANTEED TO BE ACCURATE OR COMPLETE.** The AI is fundamentally limited, being incapable of understanding the nuances of human-written code in the way a skilled developer would. This document exists primarily as an initial draft meant to *assist* technical writers, not to replace their essential work. It is *critical* for all contents presented here to be meticulously reviewed, cross-checked, and validated against the original source code. 🚫 **DO NOT REMOVE** this disclaimer without comprehensive and informed review of the entire document. Proceed with extreme caution! Do not trust this document without verification!

# read-decimal

## Basic syntax

The syntax for the `read-decimal` function is as follows:

```pact
(read-decimal *key*: string)
```
In the above syntax, `*key*` is a string that specifies the key of the data you want to parse as a decimal from the top level of a message data body.

For example:

```pact
(defun exec ()
   (transfer (read-msg "from") (read-msg "to") (read-decimal "amount")))
```

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| key | string | This represents the key for the value to be parsed as a decimal from the top level of the message data body. The key must be a string. |

## Prerequisites

Before using the `read-decimal` function, a top-level message data body should be prepared where a key-value pair exists. The key should be of string type and associated value can be a single value which is either string or number. This value will be parsed as a decimal by the `read-decimal` function. A non-existent or a non-numeric value can lead to an error.

## Return values

The `read-decimal` function returns a decimal value. This decimal value is parsed from the *key* string or number value specified, retrieved from the top level of the displayed message data body. In the context of Pact programming, the returned decimal value could be useful in various situations where numerical calculations or manipulations are required, such as transferring a specific amount of digital currency between users or calculating a fee amount.

## Examples

```pact
;; Example 1: Read a decimal number from a message data body
(let*
  ((amount (read-decimal "amount")))
)

;; Example 2: Transfer fee from a message data body using read-decimal
(defun exec ()
 (transfer (read-msg "from") (read-msg "to") (read-decimal "amount"))
)

;; Example 3: Retrieve fee and calculate refund from a message data body using read-decimal
(require-capability (GAS))
(let*
  ((fee (read-decimal "fee"))
  (refund (- total fee)))
)
```

## Options

N/A

## Property validation

N/A

## Gotchas

While using the `read-decimal` function, it's important to note that the input argument must be a string key that refers to a decimal value in the top-level of the message data body. If the key is incorrect or if the corresponding value is not a decimal, the function will fail. Also, if the value associated with the key is not present in the message data, the `read-decimal` function will return an error. The function expects a numerical value but it will attempt to parse a string value into a decimal, which can lead to unexpected results if the string is not a valid numerical representation. Additionally, ensure that the decimals you are passing are within the bounds of the Pact decimal type.

