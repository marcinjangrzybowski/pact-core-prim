# concat

## Basic syntax

The `concat` function in Pact takes a list of strings and concatenates them into a single string. The basic syntax for the `concat` function is as follows:

```pact
(concat [str-list]:[string])
```

In this syntax, `[str-list]` is a list of strings you want to concatenate. The function will return a combined string as the result.

Here is an example usage:

```pact
(concat ["Hello" " " "World"])
"Hello World"
```

This will return `Hello World` as a single string. The input list can consist of any number of string elements.


## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| str-list | [string] |  An array that contains the strings you wish to concatenate. The function goes through each string from left to right in the list to form the resulting string. |


## Prerequisites

N/A

## Return values

The `concat` function returns a single string that is the concatenation of all the strings in the input list. The order of concatenation follows the order of strings in the given list. The returned value can be used in scenarios where various segments of data need to be combined into a single, contiguous string. If an empty list is passed into `concat`, it will return an empty string.

## Examples

Here are some examples showcasing the `concat` function:

```pact
(concat ["Hello," "world!"])
"Hello,world!"
```

The above example showcases how the `concat` function merges all string elements in the list, returning a single string.

```pact
(concat ["k" "d" "a"])
"kda"
```

This example demonstrates the `concat` function returning the union of all string elements in the list into a single string without spaces.

```pact
(concat (map (+ " ") (str-to-list "abcde")))
" a b c d e"
```

This example demonstrates the use of `concat` with other functions. Here, the `str-to-list` function is used to convert a string into a list of individual characters. The `map` function prefixed each character with a space, and then the `concat` function merged the modified elements, creating a new string where each character is separated by a space.

Remember, the `concat` function does not add spaces between elements; if required, they must be added before using `concat` as shown in the last example.

## Options

N/A

## Property validation

N/A

## Gotchas

The `concat` function is straightforward to use, but there are a few things to keep in mind:

1. The `concat` function takes a list of strings as a single argument. If you attempt to pass multiple strings as separate arguments, you will get an error.

2. An empty string is valid in the list of strings to concat. 

3. If the list contains a non-string value, the function will throw an error. Make sure your list only consists of strings.

4. Since concat joins strings without any separator, make sure your strings are formatted appropriately to prevent unintentional merging of words.

For example:

Wrong usage:
```pact
(concat "Hello" "World") --> This will throw an error.
```

Right usage:
```pact
(concat ["Hello" "World"]) --> "HelloWorld"
```

