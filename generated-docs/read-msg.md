
# ⚠️ ☠️ 🔮 🤖 CRITICAL DISCLAIMER ⚠️

 
This document is **AUTO-GENERATED** using a Large Language Model. While the generation process employs legacy documentation, code snippets, and human-like AI language processing, it is **NOT GUARANTEED TO BE ACCURATE OR COMPLETE.** The AI is fundamentally limited, being incapable of understanding the nuances of human-written code in the way a skilled developer would. This document exists primarily as an initial draft meant to *assist* technical writers, not to replace their essential work. It is *critical* for all contents presented here to be meticulously reviewed, cross-checked, and validated against the original source code. 🚫 **DO NOT REMOVE** this disclaimer without comprehensive and informed review of the entire document. Proceed with extreme caution! Do not trust this document without verification!

# read-msg

## Basic syntax

The `read-msg` function is used to read a key from the top level of message data body or the data body itself if no key is provided. This function coerces values to their corresponding pact types.

Here is the basic syntax for the `read-msg` function:

```pact
(read-msg *key*:string)
```

In this syntax, *key* is a string argument that specifies the key you want to retrieve from the message data body.

The following is an example usage of the `read-msg` function:

```pact
(defun exec ()
   (transfer (read-msg "from") (read-msg "to") (read-decimal "amount")))
```

In this example, the `read-msg` function is used to retrieve the values `"from"`, `"to"` and the decimal `"amount"` from the message data body. These values are then used as arguments for the `transfer` function.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| key | string | Specifies the key string from the message data body to be read. If not provided, the entire data body will be read. Coerces the value retrieved to their corresponding Pact type. |

## Prerequisites

Before using the `read-msg` function, a message containing a data body should be provided. You should know the key that you want to retrieve from this data body. The key should match the available fields in the message's data body, otherwise it will not return any value. 

The function `read-msg` streamlines translation of raw JSON values into their pact equivalents: `String` to `string`, `Number` to `integer`, `Boolean` to `bool`, `List` to `list`, and `Object` to `object`. As a prerequisite, ensure that the JSON data types are compatible with the `read-msg` function.

## Return values

The `read-msg` function returns a value from the message data body based: it could be a string (if the Data Type: String), an integer (if the Data Type: Number), an boolean (if the Data Type: Boolean), a list (if the Data Type: List), or an object (if the Data Type: Object). 

If `read-msg` is called without an argument, it will return the entire data body itself, instead of a specific key-value pair.

This returned value is often useful in functions or operations that depend on specific pieces of data contained in the message, such as the `transfer` function in the example where "from", "to", and "amount" are read from the message data.

## Examples

```pact
(read-msg "key")
```

In the example above, the `read-msg` function reads data based on the key "key" from the top level of the message body.

```pact
(defun exec ()
   (transfer (read-msg "from") (read-msg "to") (read-decimal "amount")))
```

In the function 'exec' defined above, `read-msg` is used to retrieve the values corresponding to keys "from" and "to" from the message body, while `read-decimal` is used to read the value of the "amount" key. This information is then used to carry out a transfer operation. It shows how message data can be read and utilized in a non-trivial function context. 

```pact
(let ((f (try "coin.pact" (read-msg "coin-file"))))
  ...
```

In this example from the coin contract, `read-msg` function reads the "coin-file" key from the message data body. The returned value is then assigned to `f`. This example emphasizes the use of `read-msg` in conjunction with other functions and language constructs within the Pact language.

Remember, `read-msg` coerces the values read from the keys to their corresponding pact types: String -> string, Number -> integer, Boolean -> bool, List -> list, Object -> object. Hence, you should ensure the value's type corresponds with the expected pact type to avoid unnecessary type conversion complications.


## Options

N/A

## Property validation

The `read-msg` function requires key-value pairs as its argument. If there is an attempt to read a non-existing key, it will return a null value. Similarly, if an improper data type or value is entered, the function will not process and return an error. The function also ensures that the entered values conform to their corresponding Pact types: String to string, Number to integer, Boolean to bool, List to list, Object to object. An incompatible data type will not be processed and will return an error.

## Gotchas

While using `read-msg` function, remember that it requires a key as a string argument to read the data. If the key is not provided or is not available in the top-level of the message data body, `read-msg` defaults to reading the data body itself. This could result in the entire data body being returned instead of a specific value or data chunk that was intended. Always ensure that the key you pass to `read-msg` is correct and present in your data message.

Another aspect to be aware of is the automatic coercion of values from their JavaScript types into corresponding Pact types. In some cases, this could result in unexpected outcomes if the original types haven't been taken into account while writing the code.

Lastly, as Pact's `read-msg` function updates the environment state, calling `read-msg` multiple times will increment state and gas costs. It would be more efficient to call `read-msg` once, assigning the result to a variable if the data needs to be used multiple times in the function.

