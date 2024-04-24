# take

## Basic syntax

The `take` function can take either an *integer* and *list* or *keys* and *object* as arguments. 

To get values from a list (or string), use the following syntax:

```pact
(take *count*:integer [list])
```

If *count* is negative, the function will take values from the end of the list. If *count* exceeds the interval from -2^63 to 2^63, it will be truncated to that range. 

To get entries having keys from an object, use the following syntax:

```pact
(take *keys*:[string] {object})
```

In this case, *keys* is an array of strings representing the keys of the entries you want to retrieve from the object.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| count | integer | Specifies the number of values you want to retrieve from a list or string. If negative, takes from the end. If the count exceeds the range (-2^63,2^63), the argument is truncated to this range. |
| list | string or list | Refers to the collection of items from which a set number is to be retrieved. For strings, `take` will retrieve a set number of characters. |
| keys | list of strings | If working with an object, input a list of keys to retrieve the corresponding entries from the object.|
| object | object | Specifies the object from which entries corresponding to the specified keys will be retrieved. |

## Prerequisites

N/A

## Return values

The `take` function will return a subset from a list or from a string, or a part of an object. 

If used on a list or string, the return will be a sublist or substring starting from the first item or character and containing 'count' number of elements or characters. If 'count' is negative, the sublist or substring starts from the end. 

If used on an object, it will return a new object that contains only the keys specified in the 'keys' parameter and their accompanying values.

The return value of this function is either a list, string, or an object, depending on the input it was used on. It can be saved in a variable for later use, or directly used as part of other functions or expressions. 

In case 'count' or 'keys' select more elements than the input has, no error occurs - the function simply returns the whole original list, string, or object. 

While the function is commonly used for slicing lists or strings or for filtering objects, its implementation may vary depending on specific use-case scenarios.

## Examples

The `take` function enables you to extract values from a list or string, and entries by specific keys from an object. See the following examples:

### List or string

You can extract a specific number of items from the beginning of a list or a string. For instance, extracting the first 2 characters from a string:

```pact
(take 2 "abcd")
```
This will give you:
```pact
"ab"
```

You can also extract a specific number of items from the end of a list or a string by providing a negative count. For instance:

```pact
(take (- 3) [1 2 3 4 5])
```
This will result in:
```pact
[3 4 5]
```
### Object

You can also take entries having specific keys from an object. For example:

```pact
(take ['name] { 'name: "Vlad", 'active: false})
```
Results in:
```pact
{"name": "Vlad"}
```
These examples work similarly for other data types and they help illustrate the basic use of the `take` function.

## Options

N/A

## Property validation

The `take` function can be used for property checking, particularly when specifying invariants or properties to test your code against. It is primarily used for extracting specific keys from objects, where the presence or absence of the keys can guide logic paths or prove conditions. 

If taking from a list or a string, the `count` parameter must not exceed the range of (-2^63,2^63). If it does, it will be truncated to fit within that range. Invalid 'count' or 'keys' parameters lead to error conditions, returning a failure.

Ensure to use valid keys while using the `take` function with objects. Using invalid keys might not return the intended result and could potentially lead to errors. The function does not inherently validate the keys, so this needs to be handled by the user to ensure smooth operation. 

For example, in a contract test, you might use the `take` function to ensure the presence of certain keys in the returned object post-transaction execution.

## Gotchas

- When using `take` with a negative count on a list or string, it retrieves the values from the end of the list or string. It might be tempting to understand it as fetching the values from the beginning, which is not the case.
- When used with an object, `take` retrieves values corresponding to the keys. In case a non-existent key is passed, the function doesn't throw an error; it silently returns an object without the desired key-value pair.
- If the count exceeds the interval (-2^63,2^63), it is truncated to that range. Keep in mind such limitations while specifying the count.
- While using in property checking, consider the entire object has to be fetched first before using `take`. Depending on the size of your data, this might involve large computational resources.
- Be cautious that using `take` on an empty string or list or with a non-existing key on an object will result in no output rather than an error.

