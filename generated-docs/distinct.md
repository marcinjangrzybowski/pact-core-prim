## Basic syntax

To get a list of distinct values from a list, use the following syntax:

```pact
(distinct list)
```

Here, `list` is a sequence of values (could be of any data type). Task of `distinct` function is to eliminate duplicates from it and return a new list where only unique elements are present. The order of the elements in the original list is preserved in the output.

Here is an example usage:

```pact
(distinct [3 3 1 1 2 2])
```

This usage of `distinct` function will return `[3 1 2]`.

Please keep in mind that the list provided to `distinct` should not be empty.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| xs | list | A list composed of any homogeneous data types, from which you want to remove duplicate values. |

N/A

## Return values

The `distinct` function returns a list with duplicate values removed from the original list. The return value preserves the original order of the values in the list. This might be useful in scenarios when you need to process only unique values from a list, for instance, when handling a list of identifiers, tags or other possible sets of non-unique data.

## Examples

Here are some examples illustrating the use of the `distinct` function:

The following example uses `distinct` to remove duplicate elements from a list of integers. The function preserves the original order of the input list:

```pact
(distinct [3 3 1 1 2 2])
[3 1 2]
```

You can also use the `distinct` function with lists of other types of elements. For example, you can use this function to remove duplicate strings from a list:
 
```pact
(distinct ["apple" "banana" "apple" "grape" "grape"])
["apple" "banana" "grape"]
```

This function can also be used for a list of booleans:

```pact
(distinct [true false false true true false])
[true false]
```
Note that `distinct` can be used wherever a list is used. However, it's often best to use it when you are certain that you need to remove duplicates from a list as it may introduce additional computational complexity.


N/A

## Property Validation

For validating properties, you can use the `distinct` operator when specifying an invariant or a property to test your code against. This function checks for the uniqueness of elements in the list supplied and removes any duplicate entries, making all elements distinct.

In case of invalid input or erroneous conditions, such as supplying a non-list type input, the function will throw an error. The validation ensures that the argument supplied is a list.

## Gotchas

1. Order Preservation: The `distinct` function preserves the original ordering of values. This might not always be the desired behavior when ordering matters. Ensure to sort the output if you need the items in a specific order.

2. Unsorted Inputs: When the input list is unsorted, the first unique occurrence is placed in the output. If your unique value logic depends on the order of the items, you may need to sort the list before applying `distinct`.

3. Immutable Data: `distinct` does not mutate the original dataset but returns a new list. Keep this in mind when working with large datasets to manage memory usage appropriately.

4. Match Case: `distinct` is case sensitive. If a list contains both "apple" and "Apple", they are treated as unique items.

If there's no specific requirement, treating these characteristics as gotchas may increase the complexity of your code. By understanding these behaviors, `distinct` can be a powerful tool in data manipulation within lists.

