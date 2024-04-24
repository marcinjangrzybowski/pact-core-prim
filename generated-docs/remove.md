
# ⚠️ ☠️ 🔮 🤖 CRITICAL DISCLAIMER ⚠️

 
This document is **AUTO-GENERATED** using a Large Language Model. While the generation process employs legacy documentation, code snippets, and human-like AI language processing, it is **NOT GUARANTEED TO BE ACCURATE OR COMPLETE.** The AI is fundamentally limited, being incapable of understanding the nuances of human-written code in the way a skilled developer would. This document exists primarily as an initial draft meant to *assist* technical writers, not to replace their essential work. It is *critical* for all contents presented here to be meticulously reviewed, cross-checked, and validated against the original source code. 🚫 **DO NOT REMOVE** this disclaimer without comprehensive and informed review of the entire document. Proceed with extreme caution! Do not trust this document without verification!

# remove

## Basic syntax

To remove a key-value pair from an object, use the following syntax:

```pact
(remove *key*:string {object})
```

Where:
- `key`: a string that specifies the key in the object that you want to remove.

The `remove` function modifies the given object by removing the specified key-value pair. If the object does not contain the given key, the function returns the original object without any modification.

Here's an example of how to use `remove`:

```pact
(remove "bar" { "foo": 1, "bar": 2 })
```

This function call will return: `{"foo": 1}`

It's worth noting that the original object isn't modified — the function returns a new object.

If the key doesn't exist in the object, the function will simply return the original object:

```pact
(remove "baz" { "foo": 1, "bar": 2 })
```

This function call will return: `{ "foo": 1, "bar": 2 }`

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| key | string | Refers to the key of the entry that you want to remove from the object.|
| object| object:<{o}> | Specifies the object whose specified key-value pair is to be removed. This must be an object datatype.|

## Prerequisites

N/A

## Return values

The `remove` function returns a new object that is a copy of the original object, but with the property specified by the key string removed. If the specified key does not exist in the original object, the function simply returns a copy of the original object. The return value is useful when you want to produce a new object that excludes certain properties from the existing one.

## Examples

```pact
(remove "bar" { "foo": 1, "bar": 2 })
```
In this example, the key "bar" is removed from the object. The function `remove` leaves an object with the remaining key-value pair of "foo":1 .The output will be `{"foo": 1}`

```pact
(map (remove 'module-hash) (env-events true))
```
In this example from the code snippets, the `remove` function is used with `map` to iterate through the list of events returned by `env-events true` function and remove the 'module-hash' from each event object.

Note: Remember that the `remove` function does not modify the original object but returns a new object with the specified key-value pair removed.


## Options

N/A

## Property validation

The 'remove' function doesn't have any explicit property validation. Instead, it functions based on the inherent properties of maps or objects. Specifically, it operates under the assumption that the provided argument is a valid object with a defined key-value pair. If the object doesn't contain the specified key, or if the arguments are not of correct datatype (string key and an object), the function will return an error.

## Gotchas

N/A

