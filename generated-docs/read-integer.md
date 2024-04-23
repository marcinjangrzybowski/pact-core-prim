## Basic Syntax

The `read-integer` function accepts a key as a string argument, which is used to parse a number value from the message data body. The number is then returned as an integer.


Here's a simple example of how to use the `read-integer` function:

```pact
(read-integer "key")
```

In this example, "key" is a string representing the key, which is used to retrieve the number value from the top level of the message data body.

This function cannot be overloaded, and only accepts a single argument.

## Arguments

In the `read-integer` function, there is one argument that needs to be specified.

| Argument | Type | Description |
| --- | --- | --- |
| key | string | Specifies the key string or number value to parse from the top level of the message data body as an integer. |

## Prerequisites

To use the `read-integer` function, the key of the integer value you want to read must be available in the top level of the message data body. If the key is not present or if its associated value is not an integer type, then the `read-integer` function will not operate as desired. 

The `read-integer` function does not have any prerequisites in terms of importing libraries or having a specific setup in your Pact environment. 

Note: The function is case-sensitive and you must make sure the key you are passing as a parameter to the function matches exactly with the key in your message data body.

## Return values

The `read-integer` function returns the parsed integer from the specified key string or number value. This integer can then be used in various contexts depending on the purpose of the script such as in mathematical operations, condition checks, or as parameters for other function calls etc. 

For example, if the specified key in the message data body contains an integer value "23", the function will parse and return `23` as an integer.

If the specified key is not found or its corresponding value cannot be parsed into an integer, the function will return an error.

## Examples

The `read-integer` function is mainly used to parse a string or number value from the top level of a message data body into an integer. 

Here is a basic usage where "age" key string value from the top level of a message data body is parsed as an integer:

```pact
(read-integer "age")
```

In this following example, the `read-integer` function is used to load the gas cost of a coin contract. The string "coin-load-gas" is used as an argument for the `read-integer` function:

```pact
(expect
   "Gas cost of loading coin contract"
   (try 3301 (read-integer "coin-load-gas"))
   (env-gas))
```
In the above example, it is expected that `read-integer "coin-load-gas"` will return 3301, which is then compared with the result of `env-gas`. If both are equal, the code proceeds, else, it throws an error.

N/A

## Property Validation

In the case of the `read-integer` function, property validation refers to ensuring that the provided key is both present and correctly interprets to an integer in the top level of the message data body.

The `read-integer` function expects a string as an argument, which should correlate to a key in the provided message data body. The function will then attempt to parse the corresponding value as an integer.

It's crucial to note that if the key is missing, or the associated value cannot be parsed into an integer, the `read-integer` function will halt the execution and throw an error. Therefore, validation of proper key existence and correct value type (integer-parsable) falls into the responsibility of the `read-integer` function.

## Gotchas

1. String input format: The `read-integer` function expects the input data in string format. If the input data is a number and not in string format, an error will be thrown.

2. Key existence: `read-integer` acts on the top level of the message data body. If the specified key does not exist in the data body, the function will fail.

3. Integer Parsing: Keep in mind that this function parses the string input it is given to an integer. If the string cannot be parsed into an integer (e.g. "abc", "1.23", etc.), this will result in a runtime error.

4. Negative and large integers: If the string input can be parsed into a negative integer or a very large integer beyond the maximum representable integer size in the specific system, it may lead to unexpected results.

Always ensure that the inputs to this function are valid and well-formed to prevent runtime errors. Check the existence of keys before running the function and validate that the input can correctly be parsed into an integer.

