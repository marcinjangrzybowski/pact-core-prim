# show

## Basic syntax

The `show` function in Pact is used to convert a value of any type to a string. This can be particularly useful when you need to display or print a value.

Here is the basic syntax for using the `show` function:

```pact
(show *value*)
```

Where *value* can be any data type that can be converted into a string. This includes integers, decimal numbers, booleans, lists, and objects.

For example, the use of `show` function is as follows:

```pact
(show 123)
```

The above line of code will convert the integer 123 into a string.

You can also use `show` function with other data types:

```pact
(show 123.456)     ; Converts a decimal number into a string
(show true)        ; Converts a boolean value into a string
(show [1 2 3])     ; Converts a list of integers into a string
(show {"name": "John Doe"})  ; Converts an object into a string
```

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| value | Any | The value you want to convert into a string representation. `show` function can take any data type as input: string, number, boolean, etc. |

## Prerequisites

N/A

## Return values

The `show` function returns a string representation of the input value. This returned value can be of any data type that can be converted into a string, including numbers, boolean values, null values, and even complex data structures like lists or objects. The main purpose of this function is to facilitate the display or logging of these values, which can be especially useful for debugging purposes. If the function fails to convert the input value into a string, it returns an error message indicating the reason for the failure.

## Examples

```pact
(show "Hello World!")
"Hello World!"

(show 1234)
"1234"

(show true)
"true"

(show [1 2 3 4])
"[1,2,3,4]"

(show { "name": "Alice", "age": 30 })
"{\"name\":\"Alice\",\"age\":30}"
```
These examples demonstrate `show` usage with string, numeric, boolean, list, and object inputs. The `show` function converts and returns its given input as a string.

## Options

N/A

## Property validation

N/A

## Gotchas

While using the `show` function, be mindful of the following:

1. The `show` function will not check if the type you're trying to convert it to is valid. It will make the conversion without throwing an error. This can lead to unexpected results or data loss if proper checks are not in place.

2. If `show` is used with an empty list or object, it will return an empty string. This might be an unexpected behavior in cases where you want to differentiate between empty objects and their `show` representation.

3. Using `show` on circular references, like complex nested object structures, can result in endless loops or stack overflow errors. It’s recommended to ensure the objects passed to `show` function are acyclic.

4. The `show` function does not perform a deep conversion for nested structures such as objects contained in a list. The contained object will be returned in its original form rather than converted to a string.

5. Although `show` performs type conversion, it should not be used as a replacement for proper type casting and validation functions or techniques in your code.

