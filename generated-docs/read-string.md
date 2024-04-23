## Basic Syntax

The `read-string` function is used to parse a key's string or number value from the top level of the message data body as a string. 

Here's the basic syntax for the `read-string` function:

```pact
(read-string "your-key")
```
In this function, "your-key" should be replaced with the actual key string.

If your key is not a string but a number, you should wrap your key in quotes to turn it into a string:

```pact
(read-string "your-key-as-integer")
```

Note that the function only accepts string argument as the key.

## Arguments

The `read-string` function takes one argument as input:

| Argument | Type | Description |
| --- | --- | --- |
| key | string | The `key` argument is the specific string or number value that needs to be parsed from the top level of the message data body. The function will return this value as a string. |

N/A

## Return values

The `read-string` function returns the value associated with the provided key from the message data body, as a string. The returned string can be utilized in any context that requires the input data from the message body. If the provided key does not exist in the message data, this function will return an error.

## Examples

The `read-string` function is primarily used to parse a value from the top level of a message data body as a string.

Here is a basic example:

```pact
(read-string "sender")
```

In this example, the function reads the value corresponding to the key "sender" from the top level of message data and converts it into a string.

Please note that the function also works with number value, which will be parsed into their string representation. For instance:

```pact
(read-string 12345)
```

In this example, the function reads the number `12345` and converts it into a string, resulting in `"12345"`. Do note that the function will return an error if the key provided does not exist in the message body.

N/A

N/A

## Gotchas

When using `read-string`, be aware of the following:

- You must ensure that the key you want to parse exists in the top level of the message data body. If the key doesn't exist, `read-string` will not be able to parse it and this will result in an error.
- The `read-string` function only parses values as strings. If the original type of the value was different (for example, a number or a boolean), `read-string` will still return it as a string. Be cautious of this behaviour if the data type of the value is important in your context.
- The behavior of `read-string` can be unintuitive if the value to parse is nested in a structure. `read-string` only operates on top level values, it can't parse keys in nested structures.
- Be cautious when using `read-string` with numbers. If a number is stored as a float (with decimals), `read-string` may truncate the value or round it up. Ensure that the number is stored as an integer, or consider using `read-decimal` where appropriate.

