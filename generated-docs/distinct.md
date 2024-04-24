# distinct

## Basic syntax

The basic syntax for the `distinct` function is as follows:

```pact
(distinct [list])
```

The `distinct` function accepts a list (homogeneous or heterogeneous) and returns a list with duplicated items removed whilst preserving the original order.

Here is an example of how to use the function:

```pact
(distinct [3 3 2 2 1 1])
```
This would return `[3 2 1]`.

Please note that the `distinct` function only applies to lists.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| xs | [a] | A list of homogeneous values from which you want to eliminate duplicates. |

## Prerequisites

N/A

## Return values

The `distinct` function returns a list containing all the unique elements from the given input list. The elements are returned in their original order from the input list. The return list maintains the same data type as the input list. This function is useful when needing to remove duplicate elements from a list while preserving their initial order.

## Examples

The following examples demonstrate the use of the `distinct` function which returns a list with duplicates removed from a given list:

```pact
(distinct [3 3 1 1 2 2])
[3 1 2]
```

In this example, the `distinct` function works on a list of numbers. When numbers are duplicated in the list, only the first instance of the number appears in the returned list.

```pact
(distinct ["apple" "banana" "apple" "pear" "banana"])
["apple" "banana" "pear"]
```

Similarly, in this example, the `distinct` function works on a list of strings. When strings are duplicated in the list, only the first appearance of the string is kept in the returned list.

```pact
(distinct [true false true false true])
[true false]
```

In this example, the `distinct` function works on a list of booleans. When booleans are duplicated in the list, only the first appearance of the boolean value is kept in the returned list.

## Options

N/A

## Property validation

The `distinct` function can be used for property validation in both invariants or properties of your code. By using `distinct`, you can assure that a given list of elements contains only unique values, with all duplicates removed, thus maintaining data integrity. However, no error conditions are explicitly handled by the `distinct` function, so it's up to the calling code to handle these situations. The function only checks for distinct elements in a list and doesn't validate the properties of the elements themselves.

## Gotchas

N/A

