
# ⚠️ ☠️ 🔮 🤖 CRITICAL DISCLAIMER ⚠️

 
This document is **AUTO-GENERATED** using a Large Language Model. While the generation process employs legacy documentation, code snippets, and human-like AI language processing, it is **NOT GUARANTEED TO BE ACCURATE OR COMPLETE.** The AI is fundamentally limited, being incapable of understanding the nuances of human-written code in the way a skilled developer would. This document exists primarily as an initial draft meant to *assist* technical writers, not to replace their essential work. It is *critical* for all contents presented here to be meticulously reviewed, cross-checked, and validated against the original source code. 🚫 **DO NOT REMOVE** this disclaimer without comprehensive and informed review of the entire document. Proceed with extreme caution! Do not trust this document without verification!

# drop

## Basic syntax

The `drop` function in Pact can be used in two cases. 

If you wish to drop a certain number of values from a list or a string, use the below syntax:

```pact
(drop *count*:integer *list-or-string*)
```

Alternatively, if you intend to drop entries having specified keys from an object, use the following syntax:

```pact
(drop *keys*:list[string] *object*)
```

In either scenario, the `drop` function modifies the target entity - be it list or object - based on the input parameters provided.

Here are some examples of how to use the `drop` function:

```pact
(drop 2 "pact")
"ct"
```

```pact
(drop ['key'] { 'key: "value", 'otherKey: "otherValue"})
{ 'otherKey: "otherValue"}
```

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| count | integer | Specifies the number of values to drop from a list or string. If the count is negative, the function will drop from the end. If the count exceeds the interval (-2^63,2^63), it will be truncated to fall within this range.|
| list | string or list | The list or string from which the values will be dropped according to the count provided. |
| keys | list of strings | Specifies the keys of the entries to be dropped from an object. |
| object | object | The object from which the entries will be dropped according to the keys provided. |

## Prerequisites

N/A

## Return values

The `drop` function returns a modified list or object. If the first argument is an integer and the second argument is a list (or string), the function will return a new list (or string) with the specified number of values removed from the front. If the first argument is negative, the values will be removed from the end.

If the first argument is a list of keys and the second argument is an object, the function will return a new object with the entries having the specified keys removed.

In both scenarios, the returned value will have the same data type as the second argument. The returned value does not modify the original list or string.

If the count exceeds the interval (-2^63,2^63), the function will truncate it to that range and then perform the drop operation.

## Examples

Here are few examples of the usage of `drop` function:

To drop a specified number(count) of elements from a list or a string, you can use the `drop` function:

```pact
(drop 2 "vwxyz")
```

This will return "xyz" as it drops the first two characters from the string "vwxyz"

You can also drop elements from the end of a list or a string by providing a negative count:

```pact
(drop (- 2) [1 2 3 4 5])
```

This will return [1 2 3] as it drops the last two elements from the list [1 2 3 4 5]

To drop certain keys from an object, you need to provide a list of keys as the first argument and the object as the second:

```pact
(drop ['name] { 'name: "Vlad", 'active: false})
```

This will return {"active": false} as it drops the key 'name' from the object { 'name: "Vlad", 'active: false}

```pact
(drop 2 [10, 20, 30, 40, 50])
```
This will return [30, 40, 50] as it drops the first two elements from the list [10, 20, 30, 40, 50]

## Options

N/A

## Property validation

For property validation, you can use the `drop` function when specifying an invariant or a property in your code. This is useful in cases where you want to remove certain elements from a list or keys from an object while ensuring that your code abides by a particular set of conditions or rules. 

When using `drop` function for property validation, care should be taken to ensure that the provided parameters satisfy the requirements for both the number of elements and the type of elements. The function verifies these conditions and signals an error if they are not met. 

For example, when dropping keys from an object, the keys should exist in the object. Failing to observe these conditions may lead to unforeseen errors or behaviors in your code. Remember that the `drop` function can be used in both invariants and properties. 

Please note that the behavior of `drop` when provided count exceeds the interval (-2^63,2^63), results in it being truncated to that range. This is a form of range-bound validation provided by the function. 

Also, when dropping elements from a list, if the count is negative, it will drop from the end of the list. This kind of validation is important to prevent the removal of an unintended selection of elements.

## Gotchas

One potential pitfall to be mindful of while using the `drop` function is related to the `count` parameter when using it with lists or strings. If `count` is negative, the function will drop values from the end of the list/string. It's important to ensure the negative value does not exceed the length of the list/string, as this could lead to errors or unexpected results.

Additionally, when the `count` exceeds the range of (-2^63,2^63), it is truncated to that range. This means that using a value outside of this range could lead to unexpected results.

When using the `drop` function with objects and keys, be sure to specify existing keys. If you provide a key that doesn't exist in the object, no changes will be applied, which might not be the expected outcome.

Lastly, remember that the `drop` function does not mutate the original collection but instead returns a new collection. If you want to apply changes to the original collection, you'll need to assign the result of the `drop` function back to the original variable.

