# remove

## Basic syntax

The `remove` function is used to remove an entry for a specified key from an object.

Here is the basic syntax for using the `remove` function:

```pact
(remove *key*:string {object})
```
The function takes a `string` type as a key and an `object` from which the key will be removed. 

If the key exists in the object, the function will return a new object that does not contain the key. If the key does not exist, it will return the original object.

Here's an example usage:

```pact
(remove "bar" { "foo": 1, "bar": 2 })
```
In this example, the key `"bar"` is removed from the object `{ "foo": 1, "bar": 2 }`, producing the object `{ "foo": 1 }` since `"bar"` was removed.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| key | string | Specifies the key of the entry you want to remove from the object. |
| object | object:<{o}> | An object from which you want to remove the entry. This object should contain the provided key. After function execution it's returned in the modified form with the specific key-value pair being removed. |

## Prerequisites

N/A

## Return values

The `remove` function returns a modified object after removing the specified key-value pair. The returned object is less the specified key-value pair. In cases where the specified key does not exist in the object, the function returns the object as is. 

This return value would be useful in cases where you would like to create a new object with select properties of the original object removed. Furthermore, it is useful in data cleaning and manipulation tasks.

## Examples

Here are few examples demonstrating the use of the `remove` function:

```pact
(remove "bar" { "foo": 1, "bar": 2 })
```
The above example removes the entry with key "bar" from the object resulting in {"foo": 1}.

Multiple uses can be seen in `coin-contract/coin.repl` file:

```pact
(map (remove 'module-hash) (env-events true))
```
In the above example, the `remove` function is used inside a `map` function in order to exclude the 'module-hash' entries from the events.

In all these examples, the `remove` function is used to eliminate specified key from an object.

## Options

N/A

## Property validation

N/A

## Gotchas

Using the `remove` function on an object that doesn't have the specified key won't cause an error, but it also won't modify the object. In other words, if you attempt to remove a key from an object, but that key doesn't exist in the object, the function simply returns the original object.

For example, 

```pact
(remove "non-existant-key" {"foo": 1, "bar": 2})
```
Would return

```pact
{"foo": 1, "bar": 2}
```

Be careful not to use this function expecting it to warn you or fail when the key doesn't exist. Always ensure that the key is present in the object before attempting to remove it, if that is necessary for your logic.

