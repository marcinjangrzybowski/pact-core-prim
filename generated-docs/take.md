# take

## Basic syntax

To use the `take` function to retrieve a specified number of values from a list or string, use the following syntax:

```pact
(take count:integer <list or string>)
```

If `count` is negative, it takes from the end. If `count` exceeds the interval (-2^63,2^63), it is truncated to that range.

To use `take` function to retrieve entries in an object using specified keys, use this syntax:

```pact
(take keys:[string] object:object)
```

These keys should be in string format and enclosed within square brackets. The entered object can be a user-created or a pre-defined object.

```pact
;;Example for the first use-case
(take 2 "abcd")
"ab"

;;Example for the second use-case
(take ['name] { 'name: "Vlad", 'active: false})
{"name": "Vlad"}
```

The output of the `take` function depends on the input. For the first use-case, the return value will be a list or string of the specified length, for the second, the return value will be an object with the specified key-value pairs.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| count | integer | Specifies the number of values you want to retrieve from list or string. If the count is negative, values are taken from the end. |
| list | list or string | The input from which specified number of elements will be taken. If a string is provided, a substring of specified count is returned starting from the beginning (or from the end if count is negative). |
| keys | list of strings | Used when dealing with objects to specify the keys whose corresponding entries you want to retrieve from the object. |
| object | object | Specifies the object from which entries will be taken according to the keys provided. |


## Prerequisites

To use the `take` function, the prerequisites are as follows:

1. Understanding of basic Pact syntax and language constructs.

2. Familiarity with the types of collections in Pact, especially lists and objects, as function can be applied to both.

3. Awareness of the concept and formulation of keys in an object.

For negative count values, understanding of zero-based index and the specification that the extraction will start from the end of the list or string.

Note: In Pact, string indexes are zero-based, meaning the first character in the string is at index 0, and the last character in a non-blank string is at index length-1.

## Return values

The `take` function returns a sublist or substring extracted from a list or string respectively or a subset of an object based on the specified keys. The return value is a collection (list, string, or object) which contains only the elements specified by the keys or indices. If `count` is used instead of keys, the function returns a collection with the number of elements starting from the beginning (positive count) or from the end (negative count) of the input collection.

For example, if applied on a string, the function will return another string of specified length with characters taken from the beginning or end of the source string:

```pact
(take 3 "Hello")
"Hel"
```

When applied on a list, it will return a sublist:

```pact
(take 2 [1 2 3 4 5])
[1 2]
```

And finally, when used with a key list on an object, it will return an object with only those key-pair values:

```pact
(take ['name] { 'name: "John", 'age: 30 })
{"name": "John"}
```

## Examples

The function `take` can be used both on strings/lists and on objects:

Using `take` to get the first 2 characters of a string or elements of a list
```pact
(take 2 "abcd")
```
Output: "ab"

Using `take` to get the last 3 elements from a list
```pact
(take (- 3) [1 2 3 4 5])
```
Output: [3 4 5]

Using `take` to get specific keys from an object
```pact
(take ['name] { 'name: "Vlad", 'active: false})
```
Output: {"name": "Vlad"}

In the following code snippet, `take` is used to fetch the first 2 characters of the string `account`. The returned string is used for an equality check afterwards.
```pact
(let ((pfx (take 2 account))) (if (= ":" (take -1 pfx)) (take 1 pfx) "")))
```

Another use case of `take` is to obtain a specific number of characters from a hashed string. The following snippet gets the first 40 characters from the hashed value of `g`.
```pact
(take 40 (int-to-str 16 (str-to-int 64 (hash g)))
```

## Options

N/A

## 
If your function includes any form of property validation, explain it here. Clearly explain the rules that the function follows to verify its arguments and error conditions. If there is no property validation involved in your function, respond with 'N/A'.


Could not generate content.
## 
In this section, discuss any unintuitive behavior, potential pitfalls, or common mistakes to avoid while using your function. Make sure to present this information in a clear and concise manner to help your users avoid these issues. If there are no known gotchas associated with your function, respond with 'N/A'.


Could not generate content.
