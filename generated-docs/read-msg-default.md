## Basic Syntax

To read a message with a default value, use the following syntax:

```pact
(read-msg-default key default-value)
```
Here `key` is the key for the message you want to read and `default-value` is the value that the function will return if there is no message with the given key.

Both `key` and `default-value` arguments are required for the function and they should be of the same data type.

For example, if you are trying to read a message with the key "id" and you want a default value of 0 if no message with key "id" is found, use:

```pact
(read-msg-default "id" 0)
```

In this example, if there is a message with the key "id", the function will return its value. If there isn't, it will return 0.

Here's an assumed example for `read-msg-default` function's argument documentation:

| Argument | Type | Description |
| --- | --- | --- |
| key | string | The key for the message to be read from device memory. |
| default-value | string | A default value that is returned if the key is not found in the device memory (optional). |

Note that this is just an assumption based on common patterns found in code and similar function names. The actual structure and arguments may differ based on the function's implementation. The actual descriptions of the arguments and their types should align with their usage within the function.

N/A

## Return values

The `read-msg-default` function returns the value associated with the provided key in the message data. If the key is not found in the message data, it returns the provided default value. The return value can be of any data type that matches with the provided default value or the value type associated with the key in the message data. This returned value can be useful when you want to retrieve a certain value from the message data, but also have a fallback default value in case the key is not found.

## Examples 

Using `read-msg-default`, you can extract values from `msg` at a specified key location.

The following example extracts a value at the key "name", where "John Doe" is the default value should the key not exist:

```pact
(read-msg-default "name" "John Doe")
```

This example would return "John Doe" if "name" is missing from `msg`.

Here is an example where there is a list under the key "data" and a default empty list is provided:

```pact
(read-msg-default "data" [])
```

In this case, if "data" does not exist within the `msg`, an empty list `[]` will be returned.

For a more complex use case, a default object could be provided, just like in the following example:

```pact
(read-msg-default "details" {"age": 30, "location": "Unknown"})
```

This example should return `{"age": 30, "location": "Unknown"}` if there is no "details" key in `msg`. 

Remember that the return type matches the type of your default value provided as the second argument, so design your default values accordingly.

N/A

N/A

## Gotchas

1. **Default Value Format:** If the default value provided does not match the expected format or type, the function may result in unexpected output or fail.

2. **Embedded Documents:** The `read-msg-default` function may not work as expected with deeply nested or embedded documents. Ensure that the key provided directly corresponds to the root level of the message.

3. **Non-existent Keys:** Although `read-msg-default` provides a way to mitigate issues related to non-existent keys in the message by specifying a default value, it will not throw an error or warning. Ensure to cross-check the validity of your keys.

This function is designed to be fail-safe and will not generate runtime errors. Therefore, misuse might not be immediately evident without thorough testing. Always cross-verify your inputs and outputs.

