# length

## Basic syntax

To retrieve the length of an object such as a list, a string or an object using the `length` function, use the following syntax:
```pact
(length *collection*)
```
where `collection` is a list, a string or an object. 

For example, to get the length of a list or a string you may use:

```pact
(length [1 2 3 4 5])
(length "Kadena")
```

If the given collection is an object, the function will return the number of key-value pairs in the object. For example:

```pact
(length { "field1": "value1", "field2": "value2", "field3": "value3" })
```

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| X | list, string, object | X represents the collection for which the length is to be calculated. This collection can be a list, a string, or an object. |

## Prerequisites

N/A

## Return values

The `length` function returns an integer that represents the count of elements. This could be the number of elements within a list, number of characters in a string, or the number of key-value pairs in an object. It is useful when needing to determine or validate the size of collections or to control iterations over them.

## Examples

Below are some examples demonstrating the use of the `length` function in different contexts:

Calculating the length of a list:
```pact
(length [1 2 3])
```
This will output:
```pact
3
```

Calculating the length of a string:
```pact
(length "abcdefgh")
```
This will output:
```pact
8
```

Calculating the number of key-value pairs in an object:
```pact
(length { "a": 1, "b": 2 })
```
This will output:
```pact
2
```

You can combine the `length` function with other language features to validate inputs in your contracts. For example, you can enforce that a string satisfies a minimum and maximum length:
```pact
(let ((account-length (length account)))

  (enforce
    (>= account-length 3)
    (format "Account name does not conform to the min length requirement: {}" [account]))
    
  (enforce
    (<= account-length 256)
    (format "Account name does not conform to the max length requirement: {}" [account]))
)
```

In this example, the string `account` is measured for its length, then it checks if the length is within a specified range (between 3 and 256, inclusive). It it's not, the runtime will stop execution and display an error message.

## Options

N/A

## Property validation

The `length` function in Pact can be utilized for property validations, particularly when checking the length constraints of lists, strings, or objects. For example, in the context of an account name validation, you can use the `length` function to enforce that the name conforms to the minimum and maximum length requirements:

```pact
(enforce
  (and (>= (length account) MINIMUM_ACCOUNT_LENGTH)
       (<= (length account) MAXIMUM_ACCOUNT_LENGTH))
  "Account name does not meet length requirements")
```

In this case, if 'account' does not meet the specified length requirements, an error message is returned. This practical application makes `length` a useful tool for property validation in a variety of contexts.

## Gotchas

1. Note that in most languages, the index starts from 0. However, with regards to the `length` function, the count starts from 1. Hence, the returned length is always the true length of the input and not indexed based.

2. The `length` function can accept different types of inputs including lists, strings, and objects. It's crucial to ensure that you are using the correct type of input for your specific use case to avoid errors. 

3. With objects, the `length` function calculates the number of key-value pairs present, not the amount of data stored within.

4. Be aware that using the `length` function on large inputs can potentially slow down your program as it needs to iterate over the whole input to compute its length. 

Remember these gotchas to ensure the correct usage of the `length` function and to avoid any undesired results or performance issues.

