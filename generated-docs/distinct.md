
# ⚠️ ☠️ 🔮 🤖 CRITICAL DISCLAIMER ⚠️

 
This document is **AUTO-GENERATED** using a Large Language Model. While the generation process employs legacy documentation, code snippets, and human-like AI language processing, it is **NOT GUARANTEED TO BE ACCURATE OR COMPLETE.** The AI is fundamentally limited, being incapable of understanding the nuances of human-written code in the way a skilled developer would. This document exists primarily as an initial draft meant to *assist* technical writers, not to replace their essential work. It is *critical* for all contents presented here to be meticulously reviewed, cross-checked, and validated against the original source code. 🚫 **DO NOT REMOVE** this disclaimer without comprehensive and informed review of the entire document. Proceed with extreme caution! Do not trust this document without verification!

# distinct

## Basic syntax

The `distinct` function is used to remove duplicate values from a homogeneous list, keeping the order of original values. This function works with single argument which is a list.

Here is the basic syntax:

```pact
(distinct [list])
```

This function accepts a list of any data type ([]). You simply call `distinct` followed by the list.

For example:

```pact
(distinct [3 3 2 1 1 2])
```

This would return `[3 2 1]`, a list of the distinct values from the original list, preserving their original order.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| values | [a] | A list from which to remove duplicates. The list should contain homogeneous data types. |

## Prerequisites

N/A

## Return values

The `distinct` function returns a list of values with duplicates removed while preserving the original order. The returned list contains distinct values from the original list. This can be useful in cases where unique instances of all values in a list are needed while maintaining their sequence.

## Examples

The following examples demonstrate the use of `distinct` function:

```pact
distinct [3 3 1 1 2 2]
```
Produces:
```pact
[3 1 2]
```

This function call returns a list of distinct values from the list `[3 3 1 1 2 2]`. The original order of the list is preserved.

Here's another example with strings:

```pact
distinct ["apple" "banana" "apple" "orange" "banana"]
```
Produces:
```pact
["apple" "banana" "orange"]
```

In this example, `distinct` function returns a list of distinct strings from the list `["apple" "banana" "apple" "orange" "banana"]`.

The `distinct` function can also be used in invariants or properties like so: 

```pact
(defproperty test-distinct
  (distinct [4 5 5 6 7] ))
```
In the example above, the property `test-distinct` checks if the function `distinct` returns a list with distinct values: `[4, 5, 6, 7]`.

## Options

N/A

## Property validation

The `distinct` function can be used within invariants or properties for validation purposes. It aids in ensuring that a specific collection maintains uniqueness among its elements. However, the function does not perform any explicit error checking or validation on the input collection itself - it operates under the assumption that the input is already a valid homogeneous list. In case of invalid or inappropriate input types, the function would yield an error as per the underlying language rules.

## Gotchas

For the `distinct` function, please consider the following:

1. For structured values like lists or objects, the entire structure is considered when determining distinctness. This means that two distinct objects with the same values but different arrangements will not be considered duplicates.

2. The original order of values is preserved in the output list. A new list is returned and the input list will remain unchanged.

3. Bear in mind that `distinct` can only take a homogenous list. Ensure that you are not passing a list of mixed types.

4. `distinct` does not directly support comparison for user-defined data types. Therefore, distinctiveness for these types might not work as expected. 

Remember, the above are potential areas of misunderstood intentions and your code might not misbehave in some scenarios. Always test your code and ensure it’s working as expected!

