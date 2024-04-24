# read-msg-default

## Basic syntax

The `read-msg-default` function retrieves a value from an input message or returns a provided default value if the key isn't found in the message.

In basic syntax, you can use `read-msg-default` in the following way:

```pact
(read-msg-default *key*:string *default-value*)
```

This function accepts two arguments:

- `*key*`: This is a string value, represent the key to retrieve from the message.
- `*default-value*`: This is the default value to be returned if the key is not present in the message.

Note that the `*default-value*` can be of any datatype as per the requirements of the function.

Let's illustrate with a couple of examples:

```pact
(read-msg-default "email" "default.email@example.com")
```

In this example, the function will look for the `email` key in the message, and if it doesn't find it, it will return the default value "default.email@example.com".

```pact
(read-msg-default "age" 20)
```

In this example, the function will look for the `age` in the message, and if it isn't present, it will return the default value `20`.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| key | string | Specifies the key of the message data you want to retrieve. |
| default | any | If the key is not found or its associated value is `null`, the `read-msg-default` function will return this default value. |

## 
If your function needs any prerequisites to run successfully, describe them here. If there are no prerequisites, respond with 'N/A'.


Could not generate content.
## Return values

The `read-msg-default` function returns the value associated with the provided key from the message data. If no such key exists within the message data, it instead returns the default value provided. This return value is useful in cases where the presence of certain attributes isn't guaranteed in the message data. The data type of the return value can vary and is contingent on the data type of the input default value and the value associated with the key in the message data.

## Examples

```pact
(read-msg-default "color" "green")
```
In this example, `read-msg-default` is called with key "color" and a default value of "green". If the message does not contain a "color" key, then "green" is returned.

```pact
(read-msg-default "age" 30)
```
In this example, `read-msg-default` is looking for a value associated with the 'age' key in a message. If 'age' is not found within the message, the function will return the default value which is '30'.

These examples illustrate the use of read-msg-default function where the first argument is the key to look for in the message, and the second argument is the default value to return if the key is not found.

## Options

N/A

## Property validation

N/A

## Gotchas

'N/A'

