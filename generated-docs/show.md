# show

Use `show` to convert the argument to its string representation in Pact.

## Basic syntax

For conversion of a value to a string representation, use the following syntax:

```pact
(show value)
```

The `value` can be any type of data that you want to convert into a string representation.

## Examples

The following example converts an integer to string:

```pact
(show 42)
"42"
```

This example converts a list of values to string:

```pact
(show [1, 2, 3, 4])
"[1,2,3,4]"
```

This example converts an object to string:

```pact
(show { "name": "John", "age": 21 })
"{ \"name\": \"John\", \"age\": 21 }"
```


## Arguments

The `show` function in Pact takes one argument only.

| Argument | Type | Description |
| --- | --- | --- |
| value | Any Pact type | Specifies the value that you want to convert to a string |

The `value` can be of any Pact data type like an integer, a string, a boolean, etc. The function will convert this value into a string.

N/A

## Return values

The `show` function returns a string representation of the provided argument. This return value is useful when you want to convert and display other data types (such as integers, decimals, booleans, lists, and objects) in string format. The function can be used in various contexts when debugging or when there is a need to present or log data in a readable, textual format.

## Examples

In the examples below, we will illustrate the usage of the `show` function with various data types in Pact. 

```pact
(show "Hello, world!")
"\"Hello, world!\""
```
In the example above, `show` is used to convert a string into a string literal.

```pact
(show 2021)
"2021"
```
Here, `show` is used to convert an integer into a string.

```pact
(show true)
"true"
```
This example shows how to convert a Boolean into a string using `show`.

```pact
(show [1, 2, 3])
"[1,2,3]"
```
In this case, `show` converts a list of integers into a string.

```pact
(show {"name": "Alice", "age": 30})
"{\"name\":\"Alice\",\"age\":30}"
```
Finally, this example demonstrates converting an object into a string representation.

In each of these cases, `show` is used to convert different data types into their string representations. This can be helpful for debugging or logging purposes, among others.

N/A

The `show` function does not contain property validation as it accepts any data type and converts to its textual representation. It is up to the user to ensure that the argument passed is intended for conversion to a textual format. If the function encounters a value that doesn't have a straightforward textual representation, it may return a string in a specific Pact representation format or, in some edge cases, could potentially result in an error.

## Gotchas

- The `show` function will convert its argument to a string representation regardless of its type. This might cause unexpected results if used on complex data types, such as list or object, where the contents of these types are output as a single string. 

- When passing a numbers as argument, it returns the string representation of the number which can lead to unintended behavior if you expect an integer or decimal in return.

- If you pass a null argument to the `show` function, it will return the string "null". This might be problematic if you're using the result in a context where the string "null" and the null value itself are treated differently. 

Please use the `show` function with caution and fully understand its output before using in code.

