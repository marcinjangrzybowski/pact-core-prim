# filter

## Basic syntax

The `filter` function is used to filter lists by applying a function (boolean expression) to each element of the list and retaining only those elements for which the function returns true. The basic syntax is:

```pact
(filter *function*: 'a -> bool [list])
```

* `function` takes in each element of the list and returns a boolean value. Elements for which the function returns true are included in the resultant list.
* `list` is the list of elements to filter.

Note: The symbol "'a" is used to denote that the function can be of any TYPE. For example, it can be a function that takes an integer and returns a boolean, or a function that takes a string and returns a boolean, etc. 

Here is an example code snippet for the `filter` function:

```pact
(filter (compose (length) (< 2)) ["my" "dog" "has" "fleas"])
```

This code filters out words from the list that have length below two, resulting in a list containing only words that have more than one character: `["dog", "has", "fleas"]`. 

This function supports any data type that can be used with the provided boolean function in the specified list format.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| x | Function: a -> bool | This function, when applied to each element of the provided list, determines if that element will be included in the returned list. The function should return `true` if the element should be included, otherwise it should return `false`. |
| list | [a] | This is the list to be filtered. Only elements for which the function `x` returns `true` will be included in the returned list. |

## Prerequisites

N/A

## Return values

The `filter` function returns a new list, containing elements from the original list for which the function returned `true`. Thus, the function `filter` can return a list of any data type that was provided as input. It does not modify the original list. The return value is especially beneficial when you wish to create a sub-list from a larger list under certain conditions dictated by the function.

## Examples

The `filter` function in Pact allows you to filter a list by applying a function to each element and keeping the original values that return `true`. 

Here are some examples:

Filter a list of numbers to only keep even numbers

```pact
(filter (mod 2) [1 2 3 4 5 6])
```
This returns `[2 4 6]` as it keeps only even numbers.

You can also filter a list of strings based on length:

```pact
(filter (compose (length) (< 2)) ["my" "dog" "has" "fleas"])
```
This returns `["my"]` as it keeps only the strings with less than 2 characters.

Remember, any function that returns a boolean can be applied to the `filter` function. 

The `filter` function can also be used to filter object properties:

```pact
(filter (compose (at "age") (< 30)) [{"name": "Alice", "age": 27}, {"name": "Bob", "age": 35}, {"name": "Charlie", "age": 29}])
```
This returns `[{"name": "Alice", "age": 27}, {"name": "Charlie", "age": 29}]` as it keeps only the objects where the age is less than 30.

The `filter` function is powerful for selecting items from a list based on a testing function. Explore other uses of it within the constraints of your application.


## Options

N/A

## Property validation

The `filter` function can also be utilized when defining invariants or properties within your code. Property validation in this context would ensure that the list you are attempting to filter meets the conditions specified in the function. For example, if you were to filter a list by length, property validation would check if the elements meet the length requirement. For a successful filter operation, the predicate function should return `true`. 

Please remember to ensure that the predicate function and the list passed are compatible to avoid any type-checking conflicts or runtime errors.

## Gotchas

The `filter` function in Pact doesn't modify the original list, but returns a new one. So, any changes made using `filter` won't be reflected in the original list. Also, be aware that using `filter` with a function that has side effects could yield unpredictable results since there's no guarantee on the order of execution. Finally, recall that the `filter` function expects a function that returns a boolean value. If the provided function doesn't return `true` or `false`, you may encounter unexpected behavior.

