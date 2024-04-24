
# ⚠️ ☠️ 🔮 🤖 CRITICAL DISCLAIMER ⚠️

 
This document is **AUTO-GENERATED** using a Large Language Model. While the generation process employs legacy documentation, code snippets, and human-like AI language processing, it is **NOT GUARANTEED TO BE ACCURATE OR COMPLETE.** The AI is fundamentally limited, being incapable of understanding the nuances of human-written code in the way a skilled developer would. This document exists primarily as an initial draft meant to *assist* technical writers, not to replace their essential work. It is *critical* for all contents presented here to be meticulously reviewed, cross-checked, and validated against the original source code. 🚫 **DO NOT REMOVE** this disclaimer without comprehensive and informed review of the entire document. Proceed with extreme caution! Do not trust this document without verification!

# sort-object

## Basic syntax

The `sort-object` function in PowerShell allows you to sort objects by their properties in ascending or descending order. The basic syntax of this function is:

```powershell
Sort-Object [-Property] ObjectProperty [[-Descending] | [-Ascending]] 
[[-Culture string]] [-CaseSensitive] [-InputObject psobject] [CommonParameters]
```

- The `-Property` parameter specifies the property or properties that you wish to sort by. If you don't specify `-Property`, PowerShell uses the default sort properties as defined by the object type.
- The `-Descending` and `-Ascending` switches order the objects in ascending (lowest to highest) or descending (highest to lowest) order respectively. If neither is specified, PowerShell defaults to ascending order.
- The `-Culture` string parameter sets the cultural/country configuration for the sort operation.
- The `-CaseSensitive` switch makes the sort order case-sensitive; by default the sort order is case-insensitive.
- The `-InputObject` parameter specifies the object to be sorted. If this parameter is absent, the function will take its input from the pipeline.

Multiple properties can be sorted at once by providing a comma-separated list of property names to `-Property`. The function will then sort by the first property, and in case of ties, by the next property, and so on.

```powershell
Sort-Object -Property Property1, Property2 -Descending
```

Please consult the 'Arguments' and 'Examples' sections for more details about these parameters and their usage.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| InputObject | array | Specifies the input object that will be sorted. This is usually a collection of objects. |
| Property | string/array | Specifies the property(-ies) that will be used as a basis for sorting the InputObject. If an array of properties is provided, objects are sorted by the first property first, then the second property, and so on. |
| Descending | boolean | Optional. If set to 'true', the objects will be sorted in descending order based on the property(-ies) provided. If 'false' or not provided, the sorting order is ascending. |
| CaseSensitive | boolean | Optional. If set to 'true', case of string properties will be taken into account for sorting. If 'false' or not provided, case is ignored while sorting. |

## Prerequisites

N/A

## Return values

The `sort-object` function returns a collection sorted according to the key or keys specified in the function invocation. The return type will be the same as the type of the input collection - an array or an object. If no keys are provided, the return value will be the input collection sorted in its default order. The sorted collection can be useful in scenarios where the data order matters, such as when you need to display data to users or perform subsequent operations that rely on this certain order.

## Examples

Here are a few examples using the `Sort-Object` function in different scenarios:

1. Sorting a list of integers in ascending order:

```pact
(sort-object [3 1 4 1 5])
[1 1 3 4 5]
```

2. Sorting a list of integers in descending order by specifying the `-Descending` parameter:

```pact
(sort-object [3 1 4 1 5] -Descending)
[5 4 3 1 1]
```

3. Sorting a list of strings:

```pact
(sort-object ["apple", "orange", "banana"])
["apple", "banana", "orange"]
```

4. Sorting a list of objects based on a property:

```pact
(sort-object [{name: "John", age: 30}, {name: "Jane", age: 25}, {name: "Jack", age: 35}] -Property age)
[{name: "Jane", age: 25}, {name: "John", age: 30}, {name: "Jack", age: 35}]
```

5. Sorting a list of objects based on a property in descending order:

```pact
(sort-object [{name: "John", age: 30}, {name: "Jane", age: 25}, {name: "Jack", age: 35}] -Property age -Descending)
[{name: "Jack", age: 35}, {name: "John", age: 30}, {name: "Jane", age: 25}]
```

## Options

N/A

## Property validation

N/A

## Gotchas

## Gotchas

- `sort-object` will treat all inputs as a collection, even if the input only contains a single object. It means if you pass a singleton to `sort-object`, it will be interpreted as a collection with one item. 
- The `sort-object` function will sort the items in ascending order by default. If you wish to sort in descending order, you must explicitly specify it using the `-Descending` parameter.
- The sort operation is case-insensitive by default. To perform a case-sensitive sort, use the `-CaseSensitive` parameter.
- If multiple objects have the same sort value, `sort-object` will retain their original relative ordering (stable sorting).
- When sorting on multiple properties, `sort-object` will first sort on the first property, then the second, etc. Keep in mind that sort order of subsequent properties only comes into play when values of previous property are equal.
- Null or empty properties will be sorted at the start of the sorted collection.
- Incorrect use of `-Property` parameter could lead to unexpected results. Verify whether the given property really exists in the objects to sort.
- Sorting is not done in-place. `sort-object` will return a new sorted collection, leaving the original collection unmodified.
  
Always remember that not every object can be sorted, the objects to be sorted should have a sensible ordering defined.

