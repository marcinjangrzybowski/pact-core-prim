# sort-object

## Basic syntax

The `sort-object` function is used to sort an array of complex objects. The function takes a single parameter: a string representing the property of objects used to sort the array.

Here is the basic syntax:

```pact
(sort-object *propertyname*:string [list])
```

You need to replace `*propertyname*` with the name of the object's property you want to use for sorting. The function will return a sorted list of objects based on the specified property.

If the function can sort objects based on multiple properties, you can provide multiple property names separated by a comma:

```pact
(sort-object *propertyname1*, *propertyname2*:string [list])
```

In the above syntax, the function will first sort objects based on `propertyname1`. If two or more objects have the same `propertyname1` value, the function will use `propertyname2` to sort them.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| Object | List or Hashtable | The object that needs to be sorted. It can either be a list of values or a hashtable of key-value pairs. |
| Property | String (optional) | The property that should be used for sorting if the object is a hashtable. This is optional and should only be provided if the object is a hashtable. |
| Ascending | Boolean (optional) | A flag to determine the sort order. If true, the object will be sorted in ascending order. If false or not provided, the object will be sorted in descending order. |
| CaseSensitive | Boolean (optional) | A flag to determine whether the sort should be case-sensitive or not. If true, the sorting will be done considering the case difference. If false or not provided, the sort will ignore the case difference. |


## 
If your function needs any prerequisites to run successfully, describe them here. If there are no prerequisites, respond with 'N/A'.


Could not generate content.
## 
In this section, detail what your function returns. Describe the type and purpose of the returned value, and explain in what context this return value would be useful. 

Remember, this section should not be left empty - if the function does not return anything, clearly state that this is the case.


Could not generate content.
## Examples

Here are few examples demonstrating the use of `sort-object` function:

```pact
(sort-object "age" [{ "name": "Alice", "age": 27 },{ "name": "Bob", "age": 29 },{ "name": "Charlie", "age": 22 }])
```

In above example, `sort-object` sorts the list of objects based on the key `"age"`. So the output shall present the objects sorted by ages in ascending order.

```pact
(sort-object "age" DESCENDING [{ "name": "Alice", "age": 27 },{ "name": "Bob", "age": 29 },{ "name": "Charlie", "age": 22 }])
```

Just by adding `DESCENDING`, `sort-object` can also sort in descending order. Here, the objects will be sorted by age in descending order.

```pact
(sort-object "name" [{ "name": "Alice", "age": 27 },{ "name": "Bob", "age": 29 },{ "name": "Charlie", "age": 22 }])
```

Here in this example we are sorting based on names, hence objects will be sorted alphabetically by names.

## Options

N/A

## Property validation

N/A

## Gotchas

N/A

