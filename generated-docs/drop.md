# drop

## Basic syntax

Following is the basic syntax of the `drop` function.

To drop a certain number of values from a list or a string, use the following syntax:

```pact
(drop *count*:integer [list/string])
```

In this case, the `count` argument specifies the number of values you want to drop. If the count is negative, values are dropped from the end of the list or string.


To drop entries with certain keys from an object, use the following syntax:

```pact
(drop *keys*:[string] {object})
```

Here, `keys` is a list of string keys which you want to remove from the object.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| count | integer | Specifies the number of elements to drop from the list or string. If count is negative, drop from the end. If count exceeds the interval    (-2^63,2^63), it is truncated to that range. |
| list or string | `<a[[<l>],string]>` | The list or string to drop elements from. |
| keys | `[string]` | Specifies the keys of the entries to drop from an object. |
| object | `object:<{o}>` | The object to remove entries from. |

## Prerequisites

N/A

## Return values

The `drop` function returns a modified version of the collection (list, string or object) from which the specified elements have been removed. In the context of a list or string, it will return the list or string with the first or last `COUNT` elements removed, depending on whether `COUNT` is positive or negative respectively. When used with an object, it will return another object with the key-value pairs corresponding to the keys specified in `KEYS` removed. These returned entities can be further manipulated or queried as per the needs of the program.

## Examples

The following examples demonstrate the use of the `drop` function. Each example is contained within a Pact markdown code block:

- Dropping count values from a list:

```pact
(drop 2 [1, 2, 3, 4, 5])
[3 4 5]
```

- Dropping count values from the end of a list by using a negative count:

```pact
(drop (- 2) [1, 2, 3, 4, 5])
[1 2 3]
```

- Dropping entries having keys from an object:

```pact
(drop ['name] { 'name: "Vlad", 'active: false})
{"active": false}
```

- In a more complex scenario, `drop` can be used for removing a key from a keyset within an account. This example drops a key from an account protocol:

```pact
(= (format "{}" [guard])
    (format "KeySet {keys: [{}],pred: keys-all}"
        [(drop 2 account)]))
    "Single-key account protocol violation"
```

In this example, the `drop` function is used in conjunction with other functions for formatting and equality checking. Here, 2 keys are being dropped from the account keyset.

## Options

N/A

## Property validation

The `drop` function in Pact can be used for property validation in the context of invariants or properties. If you use `drop` with a list, you need to ensure that the count does not exceed the interval (-2^63,2^63) or else it will be truncated to that range. 

If you use `drop` with an object, it can take a set of keys that are expected to exist in that object. In this case, `drop` could be used to assert that these keys do not exist in the object after the `drop` operation. If it fails, it indicates that the keys were not successfully dropped.

For example, if you have a key-value pair in your object and you want to ensure that the key does not exist in the object after a `drop` operation, you can specify it as a property to test your code against.

## 
In this section, discuss any unintuitive behavior, potential pitfalls, or common mistakes to avoid while using your function. Make sure to present this information in a clear and concise manner to help your users avoid these issues. If there are no known gotchas associated with your function, respond with 'N/A'.


Could not generate content.
