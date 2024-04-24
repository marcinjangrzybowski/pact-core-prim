# sort

## Basic syntax

The `sort` function in pact allows you to sort a list of primitive values or a list of objects based on specified fields. The function can be overloaded depending on whether you want to sort a list of primitive values or a list of objects.

To sort a list of primitives, use the following syntax:

```pact
(sort [list: a])
```

To sort a list of objects based on specified fields, use this syntax:

```pact
(sort ['field] [objects])
```

In the first usage, `[list: a]` is a homogeneous list of primitive values. In the second usage, `'field` is a list of string representing the field names to sort the objects by and `[objects]` is a list of objects.

Ensure the fields specified for sorting are actually present in the objects in the list. The sort operation might cause an error if the fields do not exist.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| values | list | A list of homogeneous primitive values that need to be sorted. |
| fields | list | (Optional) A list of strings identifying the fields from an object on the basis of which the object list needs to be sorted. Needs to be provided only in case of sorting objects. |
| object | list of objects | (Optional) A list of homogeneous objects that need to be sorted based on specified fields. This argument is used only when the 'fields' argument is also provided. |

## Prerequisites

N/A

## Return values

The `sort` function returns a list. For the primitive values, it returns a sorted list in ascending order. For objects, it returns a sorted list based on the supplied fields. The return list contains the exact same type and number of elements as the input list. The order of elements is determined according to their values, or specified fields in case of objects, in ascending order. If the function doesn't receive any input or receives an empty list, it returns an empty list. The return value is useful when you need to order a collection of elements in a specific way based on their intrinsic characteristics or based on specified fields (for objects).

## Examples

Below is an example of how you can use the `sort` function on simple lists:

```pact
(sort [3 1 2])
[1 2 3]
```

The `sort` function can also sort objects with the supplied fields, as shown in the example below:

```pact
(sort ['age] [{'name: "Lin",'age: 30} {'name: "Val",'age: 25}])
[{"name": "Val","age": 25} {"name": "Lin","age": 30}]
```

Here, the objects are sorted according to the 'age' field. Note how the function takes a list of field(s) followed by a list of objects.

Keep in mind that the `sort` function only works with homogeneous lists, meaning all elements in the list should be of the same type. This function can also be used in either invariants or properties as necessary in your code.

## Options

N/A

## Property validation

The `sort` function validates that arguments provided are either a list of primitive values or a collection of objects accompanied by the field names as per which the sort operation is to be conducted. If the arguments do not match these criteria, it will throw an error. Moreover, this function ensures that the list of values or the objects' fields are homogeneous,i.e., they are of the same data type. If there are discrepancies, it will result in an error. In case of object sorting, if the indicated fields are not present in all objects, an error will occur. In the scope of property verification, you can utilize the `sort` function when stipulating an invariant or a property to test your code against, as it supports both invariants and properties.

## Gotchas

1. Remember that the `sort` function is not designed to sort a list with different data types. If you attempt to sort a list that contains mixed data types, you will encounter an error.

2. When sorting objects in a list, ensure you provide the correct key fields. If the key field does not exist in the objects, `sort` will not produce the expected result.

3. The `sort` function uses an ascending order by default, there is currently no option to sort in descending order directly.

4. It's essential to remember that indices in most programming languages, including Pact, start with 0 and not 1. Incorrect indexing can lead to unexpected outputs or errors.

5. The list passed to the sort function will not be mutated; instead, a new sorted list will be returned. Keep this in mind in case you need the original unsorted list. 

6. Keep in mind that `sort` sorts lowercase alphabet characters after uppercase ones when sorting in ascending order.

