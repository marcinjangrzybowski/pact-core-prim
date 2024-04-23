## Basic syntax

To filter a list by applying a function to each element and keeping the ones for which the function returns `true`, use the following syntax:

```pact
(filter *function* *list*)
```

The `*function*` is applied to each element in the list. This function must return a boolean value. If it returns `true`, the element is kept in the output list.

Here's an example:

```pact
(filter (> 2) [1, 2, 3, 4, 5]) 
```

In this example, the function `(&gt; 2)` is applied to each element in the list `[1, 2, 3, 4, 5]`. The elements 3, 4, and 5 return `true` when the function is applied, so they are kept in the output list. The elements 1 and 2 return `false`, so they are excluded from the output list. The resulting output is `[3, 4, 5]`.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| `x` | `<a> -> bool`  | A function that takes an element of the list and returns a Boolean value. This function is applied to each element of the list. |
| `list` | `[<a>]` | The list to be filtered. Each element in this list will be passed to function `x` for evaluation. |

Prerequisites: 

Understanding of the following is required before using the `filter` function:

1. Basic knowledge of the Pact smart contract programming language.
2. Familiarity with the concept of Boolean data types (`true` or `false`) and their use in functions.
3. Understanding of how the `filter` function works in the context of list structures and its use for keeping or discarding values based on a condition.
4. Knowledge of function composition may be useful as filtering can involve complex conditions.

## Return values

The `filter` function returns a list of elements from the provided list, for which the applied function returns `true`. The returned list comprises elements of the same data type as the input list. This list can be useful in cases where specific conditions need to be met by list elements. If no elements meet the conditions specified by the function, `filter` will return an empty list.

## Examples

The following example demonstrates the usage of `filter` function. A predicate function which checks if the length of a string is less than 2 after being composed with `length` function is applied on each element of the list. The `filter` function retains those elements of the list for which the predicate function returns `true`.

```pact
(filter (compose (length) (< 2)) ["my" "dog" "has" "fleas"])
["dog" "has" "fleas"]
```

The `filter` function can also be used in conjunction with other functions to filter out specific elements from a list. For example, the following usage of `filter` uses a function that checks for even numbers:

```pact
(filter even? [1 2 3 4 5])
[2 4]
```

The `filter` function can also work with object elements, filtering out the elements of an object based on a certain characteristic. For example, filtering out the object elements whose key 'age' is greater than 25:

```pact
(filter (> (at 'age' _) 25) [{"name": "Bob", "age": 30}, {"name": "Alice", "age": 20}])
[{"name": "Bob", "age": 30}]
``` 

It is important to note that the `filter` function does not modify the original list, but instead returns a new list that contains only the filtered elements.

N/A

## Property validation

In the context of the `filter` function, property validation mainly involves the evaluation of the function `f` applied on the elements of the list. The function `f` takes elements from the list `as` and returns a Boolean value. This helps in filtering the list and keeping only those elements which satisfy the function `f`.

This allows for expressions utilizing `filter` to be used within property or invariant contexts for verifying code behavior or constraints within a Pact program. 

However, you must ensure that the function `f` is a Boolean function and that it correctly operates over the elements of the list for correct evaluation. If `f` isn't a Boolean function or if it is incompatible with the elements of the list, the `filter` function will cause an error.

In terms of property validation, the `filter` operation doesn't explicitly perform any validation checks, but rather relies on the inherent validation checks performed by the function `f` and by the list operations conducted during the filtering process.

## Gotchas

When using the `filter` function, remember:

1. The `filter` function does not modify the original list. Instead, it returns a new list that only includes the elements for which the provided function returns `true`.

2. The index of the returned elements are based on their positions in the original list. If an element was not included in the returned list, it does not affect the indices of the other elements.

3. Ensure the function `f` used for filtering returns a boolean value (`true` or `false`). Non-boolean return types may lead to unexpected results.

4. If you want to preserve the original order of elements, remember that `filter` does not automatically sort or reorder your list.

5. The `filter` function expects the first argument to be a function and the second a list. Providing arguments in the wrong order will result in an error.

6. Filter does not work with objects/dictionaries. It works solely on lists.

