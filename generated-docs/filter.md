# filter

## Basic syntax

The `filter` function in Pact takes two arguments: a predicate function and a list. This function applies the predicate to each element in the list, and returns a new list containing only those elements that satisfy the predicate function.

Here's the basic syntax of the `filter` function:

'''pact
(filter *predicate*:function *list*:list)
'''

Where:

- *predicate* is a function that takes an element of the list as input and returns a boolean. This function is applied to each element of the list.
- *list* is the list to filter.

For example:

```pact
(filter (> 5) [3 4 5 6 7 8])
```

This returns the list [6 7 8] as 6, 7 and 8 are the only elements greater than 5 in the original list.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| `x` | `<a> -> bool` | A boolean function to be applied to each element of the list |
| `list` | `[<a>]` | A list of values to filter. The type `a` can refer to any data types such as integer, string, etc. |

## Prerequisites

N/A

## Return values

The `filter` function returns a list of elements from the original list for which the predicate function returns `true`. The returned list may contain all, some, or none of the original elements depending on the predicate function. The function will not modify the original list. This filtered list can be useful in various scenarios where certain elements in the list need to be selected based on specific conditions, while discarding the others.

## Examples

Here are examples showing how to use `filter`:

```pact
(filter (compose (length) (< 2)) ["my" "dog" "has" "fleas"])
```
Result:
```
["dog" "has" "fleas"]
```
This example filters the array to include only elements having length less than 2.

Here's another example that filters to keep only odd numbers from the list:

```pact
(filter (compose (mod 2) (= 1)) [2,5,7,8,10])
```
Result:
```
[5,7]
```

This example demonstrates that `filter` function can work with any function that returns boolean value as the first argument for filtering logic using data from arrays.

## Options

N/A

## Property validation

The `filter` function can be utilized for property validation in Pact. You can specify it within invariants or properties to test your code against. This function applies a condition to each element of the collection, and only elements that meet this condition (where the function returns `true`) will be retained in the resulting collection. As such, `filter` can be used to check if all items in a collection meet certain criteria, effectively serving as a property validation tool. If there are no such items, the function will return an empty list.

## Gotchas

While `filter` can be an incredibly useful function, there are a couple of things to keep in mind:

1. The predicate function passed to `filter` should return a boolean (`true` or `false`). If the function does not return a boolean, you might get unexpected results. 

2. It is important to remember that filter does not mutate the list but rather creates a new list that fits the conditions. This is a common area of confusion. 

3. Keep in mind that the filter function will not execute the function for any array elements without values. If your list contains null or undefined, those elements will be skipped. 

