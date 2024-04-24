
# ⚠️ ☠️ 🔮 🤖 CRITICAL DISCLAIMER ⚠️

 
This document is **AUTO-GENERATED** using a Large Language Model. While the generation process employs legacy documentation, code snippets, and human-like AI language processing, it is **NOT GUARANTEED TO BE ACCURATE OR COMPLETE.** The AI is fundamentally limited, being incapable of understanding the nuances of human-written code in the way a skilled developer would. This document exists primarily as an initial draft meant to *assist* technical writers, not to replace their essential work. It is *critical* for all contents presented here to be meticulously reviewed, cross-checked, and validated against the original source code. 🚫 **DO NOT REMOVE** this disclaimer without comprehensive and informed review of the entire document. Proceed with extreme caution! Do not trust this document without verification!

# read-integer

## Basic syntax

The `read-integer` function is used to parse a string or numeric value from the top level of a message data body and convert it into an integer.

Here is the basic syntax:

```pact
(read-integer *key*)
```

The `read-integer` function requires one argument:

- `key`: This is a string value that points to the key in the message data body that contains the value to be parsed and converted into an integer.

An example of how to use the `read-integer` function is as follows:

```pact
(read-integer "age")
```

In this case, `"age"` is the key in the message data body that contains the value to be parsed and turned into an integer.

If the function is able to parse the value at the provided key into an integer, it will return that integer. Otherwise, it will return an error.

Please note that keys must be unique within their scope - a duplicate key error will be raised if the same key is used more than once.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| key | string | Specifies the key string or number value from the top level of the message data body which should be parsed as an integer. |

## Prerequisites

Prerequisites: The function `read-integer` requires a string key that is present in the top level of the message data body. This string key should correspond to a value that can be parsed into an integer. Failing to meet these prerequisites can lead to unsuccessful operation of the function. It is important to ensure that the given key refers to an appropriate value before using the `read-integer` function.

## Return values

The `read-integer` function returns an integer value. This value is derived from the key string or number value that is at the top level of the message data body. The integer returned by `read-integer` is useful in situations where numerical data is needed for further computations or logical comparisons. The returned integer is a parsed version of the string or number value associated with the specified key in the message data body.

## Examples

Below are some examples of `read-integer` function usage:

This example retrieves the value associated with the key "age" from the message data body and parses it as an integer.
```pact
(read-integer "age")
```

This example is from the coin contract REPL. In this scenario, a check is made to ensure the gas cost of loading the coin contract is as expected. The 'coin-load-gas’ value is read from the message data body and parsed as an integer.
```pact
(expect
  "Gas cost of loading coin contract"
  (try 3301 (read-integer "coin-load-gas"))
  (env-gas))
```

In both examples, `read-integer` is utilized to parse string or number values from top level of message data body as integers.


## Options

N/A

## Property validation

The `read-integer` function checks whether the supplied key exists in the data body and whether its corresponding value can be parsed into an integer. If the key does not exist or if the value associated with the key cannot be parsed into an integer, an error will be thrown. Thus, the property validation for `read-integer` centers around the existence and integer-parseability of the specified key in the data body.

## Gotchas

The `read-integer` function is designed to parse a key value from the top level of a message data body. This function assumes that the specified key will yield a value that can be parsed into an integer.

- This can be a potential gotcha if the input at the specified key is not convertible to an integer. The function does not handle non-numeric or non-convertible strings which may throw an error.
  
- The function only operates at the top level of the data body, which means nested value cannot be read directly. Therefore, ensure the key refers to a top-level element.

- If the value associated with the key in the data body is not present or null, the function may throw a null exception error, so ensure the validity of data before its usage. 

- It's strictly a reading function and is not intended for data manipulation or transformation. Any attempt to modify data through it may result in unexpected outcomes. It does not check the validity of the input beyond whether it can be parsed into an integer.

- It is expected that the key provided is a string. Providing a different data type may result in an error.

- The `read-integer` function does not handle underflow and overflow conditions. Passing a number that exceeds the maximum or minimum integer value in Pact results in an undefined behavior. 

Always ensure appropriate error handling measures are put in place when using `read-integer` to anticipate and manage these potential issues.

