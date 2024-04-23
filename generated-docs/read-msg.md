## Basic syntax

The `read-msg` function is used to read specific keys from the top level of a message data body. 
If the specified key is not provided, it reads the data body itself. 

```pact
(read-msg "key")
```

In the above example, "key" is a string that specifies which key you want to read from the message data body. 

The function is also used without providing any key, as shown below:

```pact
(read-msg)
```

In this case, the function will read the data body itself. 

Please note that the `read-msg` function automatically coverts the data values into their corresponding pact types: String -> string, Number -> integer, Boolean -> bool, List -> list, and Object -> object.

## Arguments

The `read-msg` function takes one argument which is used to specify the data you want to retrieve.

| Argument | Type | Description |
| --- | --- | --- |
| KEY | string | Specifies the information you want to retrieve. By default, it reads from the top level of the message data body. If no KEY is provided, it returns the entire data body. Coerces the value to their corresponding Pact type: String to string, Number to integer, Boolean to bool, List to list, Object to object. |

## Prerequisites

Before using the `read-msg` function, ensure that a message data is available from which the function can read the keys. The message data could be provided by the user when the function is invoked. If the key is not found, the function will return the whole message data body. 

Also, the `read-msg` function expects the keys used for retrieving data are of the type `string`.

## Return values

The `read-msg` function returns the value associated with the specified key in the top level of the message data body. If no key is provided, it returns the entire data body itself. It also coverts the value to the corresponding Pact data type:
- A String value will be converted to a `string`
- A Number value will be converted to an `integer`
- A Boolean value will be converted to a `bool`
- A List value will be converted to a `list`
- An Object value will be converted to an `object`. 

This is particularly useful when you need to retrieve specific parts of the data body or need to use the coerced values for operations that require specific Pact data types.

## Examples

The `read-msg` function is primarily used to retrieve information passed into a Pact smart contract. This makes it very critical in transferring tokens or interacting with the message data body of the smart contract.

The following example shows how to read data from the message body using specified keys `from`, `to`, and `amount`.

```pact
(defun exec ()
  (transfer (read-msg "from") (read-msg "to") (read-decimal "amount")))
```

In this example, `read-msg` returns the information associated with `from`, `to`, and `amount` from the message data.

The `read-msg` function also allows you to retrieve the entire message body if no key is provided. This is shown in the example below:

```pact
(read-msg)
```

This will return the entire message data body.

Lastly, `read-msg` automatically coerces the retrieved value to their corresponding Pact type. This makes it very useful in a situation where you want to ensure the values you are working with are of a specific type.

N/A

## Property validation

The `read-msg` function validates the *key* argument by checking if it exists in the message data body. If the key is not provided, it reads the data body itself. If the specified key is not present in the message data body, the function will return a null value. The function also validates the value associated with the key by coercing it to the corresponding pact type.

Please note that error conditions occur when attempting to convert a value to a non-matching pact type, or trying to access a non-existent key.

## Gotchas

- `read-msg` reads from the top level of the message data body. It's important to ensure that the key exists in the top level, as it won't be able to access nested keys. 
- If no key is provided, `read-msg` will read the entire body itself. Be cautious with this, especially if the data body is large, as it might cause performance issues. 
- `read-msg` coerces values to corresponding pact types (String -> string, Number -> integer, Boolean -> bool, List -> list, Object -> object). This coercion might not always be desirable, especially when dealing with numeric values where precision matters. Consequently, consider using `read-decimal` function for decimal amounts instead.
- Trying to read a key that doesn't exist will not throw an error but will instead return a null value. Always ensure the key exists in the message data body before calling `read-msg`.
- Be careful when reading keys that have similar names as common Lisp keywords or functions; this may cause unexpected behavior. Always double-check the key names to ensure they're not conflicting with other Lisp constructs.

