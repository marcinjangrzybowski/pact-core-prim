# read-integer

## Basic syntax

The `read-integer` function in Pact is used to parse string or number values as integers from the top level of message data body. Here's how to structure the function in a basic way:

```pact
(read-integer "key")
```

In this case, `"key"` should be the name of the key you're trying to fetch a value from in the message's data body and parse it into an integer type. The key should be provided as a string.

Here's an example:

```pact
(read-integer "age")
```

In the example above, `read-integer` fetches the value associated with the key `"age"` from the top level of message data body and attempts to parse it into an integer.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| key | String | This required argument is a string or number value that is parsed from the top level of the message data body and returned as an integer. |


## Prerequisites

N/A

## Return values

The `read-integer` function returns an integer value. Specifically, the function parses a given key from the top level of the message data body and interprets that key as an integer. This return value can be valuable in contexts where numerical data entry in the form of a key string or number is required from the message data body. If the key does not exist or is not interpretable as an integer, an error is returned.

## 
Provide few code examples demonstrating the use of your function. Each example should be contained within the markdown code block: 

'''pact
your function usage example
'''

The examples should be clear and easy to understand. They should demonstrate the use of different arguments or use cases where applicable.


Could not generate content.
## 
If your function has any configurable options, describe them here in the format similar to the 'Arguments'. That is, a markdown table with 'Option', 'Type' and 'Description' as columns. Make sure to clearly explain the effect of each option on your function's execution. If there are no options, respond with 'N/A'.


Could not generate content.
## Property validation

N/A

## Gotchas

Here are some potential pitfalls or common mistakes to be aware of when using the `read-integer` function:

1. The `read-integer` function expects the input to be a string that can be parsed into an integer. If another data type such as an object or array is passed, it will result in an error. Be mindful of the data types you are working with to avoid unexpected errors.

2. The function will attempt to read the key from the top level of the message data body. If the key isn't located at the top, an error will occur. To avoid this, make sure the hierarchy of your data structure is known and the specified key is indeed at the top level.

3. If the value corresponding to the key in the message data body is a string that doesn't represent a numerical value, the function will throw an error. Always ensure that the value is a stringified integer before trying to parse it with `read-integer`.

4. The function cannot handle numbers that exceed the safe integer range in JavaScript. Attempting to process such numbers can lead to incorrect results. Make sure the integers you are working with are within the safe range. 

Remember, to debug effectively, always check the data type and structure of your inputs before using the `read-integer` function.

