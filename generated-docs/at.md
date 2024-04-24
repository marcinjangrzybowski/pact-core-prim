# at

## Basic syntax

The basic syntax of the `at` function is used to select a value from a list or key-value pair in an object. It can be defined by its two main use-cases:

1. Selecting an item from a list by its index. Here is the basic syntax:

    ```pact
    (at *index* *list*)
    ```

    Where:
    - *index* is an integer specifying the zero-based position of the item in the list.
    - *list* is a list of values.

2. Selecting a value from an object by its key. Here is the basic syntax:

    ```pact
    (at *key* *object*)
    ```

    Where:
    - *key* is a string that matches one of the keys in the object.
    - *object* is an object containing key-value pairs.

In both cases, the `at` function will return the value corresponding to the inputted index or key.

Here are some example usages:

Indexing into a list:

```pact
(at 2 ["apple" "banana" "cherry" "date"])  // Returns "cherry"
```

Getting a value from an object:

```pact
(at "name" { "name" : "John", "age" : 30 })  // Returns "John"
```

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| index | Integer | The index location in the list from where the value needs to be retrieved. Indexing starts at 0. |
| key | String | The key from the object to retrieve the value from. This is typically used when the collection is an object or a map. |
| list | [Any] | The list of values from which a value needs to be retrieved using its index position. |
| object | Object | The object from which a value with matching key will be retrieved. |


## Prerequisites

There are no direct prerequisites for using the `at` function. However, before using, ensure that the collection (list or object) you want to apply the `at` function to is properly defined and populated. The index or key you are targeting should also be present within the collection.

## Return values

The `at` function returns the value found at the specified index or using the specified key. The return type isn't specified, as it's utterly dependent on the data type of the elements in the collection that we're operating on. For example, if we're trying to retrieve a value from a list of integers using an integer index, then the return value will be an integer. If we're operating on a collection of strings, the return value will be a string. In the case of key-based lookup in an object, again the return data type will be the same as that of the value paired with a given key.

## Examples

Here are some examples showing the usage of the `at` function:

Get an element at a particular index in a list:

```pact
(at 1 [1 2 3])
```
In this example, it will return `2` as it lies at the first index in the list `[1 2 3]`.

Access a value of a certain key in an object:

```pact
(at "bar" { "foo": 1, "bar": 2 })
```
In this example, it returns the value `2` which is the value corresponding to the key `bar` in the object `{ "foo": 1, "bar": 2 }`.

Use as a projection within properties for data validation:

```pact
(property (< (at "age" data) 18))
```
This example will verify if the value associated with the key `age` in object `data` is less than 18. The function `at` is used here to project the value of "age" from the object for comparison.

## Options

N/A

## Property validation

The `at` function can be used for property validation by specifying it as an invariant or a property in your contract. This is especially useful to ensure that the specified index or key exists within the collection before running the contract, thus minimizing potential runtime errors. It is important to note that the function itself does not have any built-in validation checks and will fail if an invalid index or key is specified. For example, if you were to specify an index that is not within the bounds of the list or a key that does not exist within the object, the `at` function would return an error. Therefore, it is recommended to include necessary checks in your code prior to calling this function to ensure that the specified index or key is valid. 

Additionally, using `at` as part of a property or invariant would allow for testing code. This can ensure the code has handled boundary conditions correctly or that certain properties about the collection remain true after the execution of your contract. For example, you might specify a property that the length of the collection stays the same after certain operations, and use `at` to check values within the collection.

## Gotchas

While using the `at` function, it's crucial to keep in mind the indexing behavior and type checks. Here are a few potential pitfalls:

- Index Starts from Zero: When retrieving from lists, note that the indexing starts from 0, similar to most programming languages. So, the first element would be retrieved using the index 0. Using the index equal to the list size will result in an error as that index does not exist.

- Understanding 'at' with key: The `at` function can also get the value from an object using a string key. When using a key, ensure that the key exists in the object. If the key does not exist within the object, it will result in an error.

- 'at' on an empty list or object: Be careful when using `at` on empty list or objects. When you are unsure whether a list or object includes any elements, it is good practice to check its size before using `at`.

- Type Check: `at` function will not do any implicit type conversions. Therefore, confirm that the type of the index is `integer` for list and `string` for object to ensure no unexpected error occurs. 

Always ensure that the index or key used with the `at` function is valid to prevent runtime errors.

