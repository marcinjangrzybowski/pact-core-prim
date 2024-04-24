
# ⚠️ ☠️ 🔮 🤖 CRITICAL DISCLAIMER ⚠️

 
This document is **AUTO-GENERATED** using a Large Language Model. While the generation process employs legacy documentation, code snippets, and human-like AI language processing, it is **NOT GUARANTEED TO BE ACCURATE OR COMPLETE.** The AI is fundamentally limited, being incapable of understanding the nuances of human-written code in the way a skilled developer would. This document exists primarily as an initial draft meant to *assist* technical writers, not to replace their essential work. It is *critical* for all contents presented here to be meticulously reviewed, cross-checked, and validated against the original source code. 🚫 **DO NOT REMOVE** this disclaimer without comprehensive and informed review of the entire document. Proceed with extreme caution! Do not trust this document without verification!

# contains

## Basic syntax

The `contains` function in Pact programming language is used to test whether a given value, key or a string is present in a list, an object or a string respectively. The basic syntax for `contains` is as follows:

To check if a list contains a certain value:

```pact
(contains *value* [list])
```

To check if an object has a certain key:

```pact
(contains *key* {object})
```

To check if a string contains a certain substring:

```pact
(contains *substring* "your-string")
```

In the above syntax:

- `value` denotes the element that you want to check if it exists in the list.
- `key` denotes the key that you want to check if it exists in the object.
- `substring` denotes the string that you want to check if it exists in the larger string.

Please pay close attention to the data types of your arguments while using the `contains` function for the accurate results.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| value | <a> or string | The target value to be checked within the list, object or string. For lists and objects, it can be any type ('a). For strings, it must be a string.  |
| list | [ <a> ] | Specifies the list where to search for the target value. Applicable for list context.|
| key | string | Specifies the target key to be checked if exists within the provided object. Applicable for object context. |
| object | object: <{o}> | Specifies the object where to search for the target key. Applicable for object context. |
| string | string | Specifies the string where to check the occurrence of the target value. Applicable for string context. |

## Prerequisites

N/A

## Return values

The `contains` function returns a boolean data type. The returned value denotes whether the queried element (value or key) is present within the respective collection (list or object) or string. If the element is found, it returns `true`. If the element does not exist, it returns `false`. This allows users to perform existence checks within different types of data structures or strings.

## Examples

The `contains` function can be used in various scenarios. Here are some of them:

```pact
(contains 2 [1 2 3])
```
The above example checks if the number '2' is present in the list '[1 2 3]'. This will return 'true' because '2' is a part of the list.

```pact
(contains 'name { 'name: "Ted", 'age: 72 })
```
The next example checks if the string 'name' is a key in the object '{ 'name: "Ted", 'age: 72 }'. This will return 'true' because 'name' is a key in the object.

```pact
(contains "foo" "foobar")
```
The last example checks if the string "foo" is a part of the string "foobar". This also will return 'true' because the string "foo" is contained in the string "foobar".

```pact
(enforce (contains target-chain VALID_CHAIN_IDS)
  "target chain is not a valid chainweb chain id")
```
This example is from one of our repositories. It checks if 'target-chain' is present in 'VALID_CHAIN_IDS'. If not, it will enforce the rule that "target chain is not a valid chainweb chain id".

## Options

N/A

## Property validation

The `contains` function can be used for property validation in the context of invariants or property test code as well for checking the presence of a specific element in collections - lists and objects, or substrings in a string. It can be useful in enforcing that a desired value or key is included in the respective collection.

For example, in a list or string validation, `(contains value collection)` will return true if the provided `value` is present in the `collection`.

In object validation, `(contains key object)` will return true if the `key` is present in the `object`.

Remember, an error will be thrown if these conditions are not met during the function execution. 

Refer to provided code snippets for examples of practical usage of this function for property validation.

## Gotchas

The `contains` function behaves differently depending on the type of arguments provided. 

- With lists, it checks if a particular element is present in the list.
- With string, it checks if a specific substring is present within the string.
- With objects, it checks if a specific key is present in the object.

Passing an incorrect argument type can lead to unexpected behavior or runtime errors. Ensure the 'contain' value and the 'in' value are of correct and compatible types.

The function `contains` performs case-sensitive checks. This feature can be a potential pitfall when comparing strings if not handled with care. Make sure that the strings are in the correct case to get the expected result. 

Remember that `contains` works with zero-based index, so it counts from 0 and not from 1. This might lead to off-by-one errors in your implementations if you're coming from a 1-based index environment.

Also, please note that in the use of `contains` to make some certain operations like searching through a list for a match, it might lead to inefficiencies especially with large data sets. So consideration for efficiency should be taken into account when using `contains`.

For property checking, you can use `contains` while specifying an invariant or property to test your code against. 

Finally, remember that `contains` function along with the argument cannot be null. Make sure the arguments provided to the function are always valid and non-null.

