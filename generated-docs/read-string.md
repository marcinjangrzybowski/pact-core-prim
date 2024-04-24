
# ⚠️ ☠️ 🔮 🤖 CRITICAL DISCLAIMER ⚠️

 
This document is **AUTO-GENERATED** using a Large Language Model. While the generation process employs legacy documentation, code snippets, and human-like AI language processing, it is **NOT GUARANTEED TO BE ACCURATE OR COMPLETE.** The AI is fundamentally limited, being incapable of understanding the nuances of human-written code in the way a skilled developer would. This document exists primarily as an initial draft meant to *assist* technical writers, not to replace their essential work. It is *critical* for all contents presented here to be meticulously reviewed, cross-checked, and validated against the original source code. 🚫 **DO NOT REMOVE** this disclaimer without comprehensive and informed review of the entire document. Proceed with extreme caution! Do not trust this document without verification!

# read-string

## Basic syntax

To parse a key string or number value from the top level of the message data body as a string, use the following syntax:

```pact
(read-string "key")
```

The key should be provided as a string. Replace "key" with the actual key that you want to parse. 

Note that the `read-string` function cannot be overloaded.

Example:

```pact
(read-string "sender")
```

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| key | string | The key to parse from the top level of the message data body. This can be a string or number. The function will return the corresponding value as a string. |

## Prerequisites

N/A

## Return values

The `read-string` function returns a string value. As its primary purpose is to parse a specific string or numeric key from the top level of the message data body, it will return the corresponding value associated with that key, but always as a string. For instance, if the message data body contains a key-value pair like `"user_id":12345`, calling `read-string "user_id"` will return `"12345"`. This feature is particularly useful when you want to ensure the data received is in the string format, regardless of its original type in the message body.

## Examples

```pact
(read-string "sender")
```

In this example, the `read-string` function is used to parse the "sender" value from the top level of the message data body. The parsed value will be returned as a string. 

```pact
(read-string "transaction-id")
```

In this example, the `read-string` function is parsing the "transaction-id" from the top level of the message data body. The resulting data will be returned as a string. 

Keep in mind, these examples assume that the `"sender"` and `"transaction-id"` keys exist in the top level of the data body. If not, the function will either fail or return a default value depending on your error handling setup.

## Options

N/A

## Property validation

N/A

## Gotchas

- The `read-string` function will throw an error if the key provided doesn't exist in the top-level of the message data.
- This function only works in the context of a transaction. If used outside of this context, it will throw an error.
- `read-string` treats all inputs as strings regardless of their actual type. If the original form of the input value is required, use the corresponding `read` function (for example `read-integer`, `read-decimal`, etc.).
- The parsing capability of `read-string` is limited to flat data structures. Nested or deep data structures may not be read correctly.

