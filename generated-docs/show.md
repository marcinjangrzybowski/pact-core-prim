# show

## Basic syntax

The `show` function in Pact has the following basic syntax:

```pact
(show value)
```

The `show` function expects one argument:

- `value`: A Pact language value or any possible data structure to convert into a human-readable string format. 

Here's a couple of examples using integers, real numbers, booleans, strings, and lists:

```pact
(show 4)
"4"

(show 4.456)
"4.456"

(show true)
"true"

(show "Hello, Pact!")
"\"Hello, Pact!\""

(show [1, 2, 3])
"[1,2,3]"
```

If none value structures or Pact language values are supplied as arguments, the `show` function will throw an error as it needs exactly 1 argument to execute.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| value | Any Type | The `show` function can accept any data type as its argument. This is the value that will be converted into a string. |

## Prerequisites

N/A

## Return values

The `show` function returns a readable string representation of the input value. The type of the return value is always a string, regardless of what input data type was provided. This function is useful when you need visual representation of data or for debugging purposes, when you need to inspect or log the values during execution.

## Examples

```pact
(show "Hello, Pact!")
"Hello, Pact!"
```

In this example, the `show` function takes a string argument and returns the same string.

```pact
(show 42)
"42"
```

In this example, the `show` function takes a numerical argument and returns a string representation of the number.

```pact
(show true)
"true"
```

In this example, the `show` function takes a Boolean argument and returns a string representation of the Boolean value.

```pact
(show [1 2 3 4 5])
"[1,2,3,4,5]"
```

In this example, the `show` function is used to convert a list of numbers to a string representation. Note how the resulting string includes the commas and brackets.

```pact
(show {"name": "John", "age": 30})
"{\"name\": \"John\", \"age\": 30}"
```

In this example, the `show` function takes an object and returns a string representation of the object. Note how the keys and values are included in the resulting string, and are enclosed in quotes.

## Options

N/A

## Property validation

N/A

## Gotchas

N/A

