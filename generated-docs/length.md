# length

## Basic syntax

Here is the Basic Syntax section:

To compute the length of a list, string, or an object, use the following syntax:

```pact
length list-or-string-or-object 
```

It's important to note that `length` function can accept various arguments. It can accept list or string or object as an argument.

For instance, when computing the length of a list:
```pact
(length [1 2 3 4 5])
```

When computing the length of a string:
```pact
(length "Hello, World!")
```

And when computing the number of key-value pairs in an object:
```pact
(length { "first-name": "maya", "last-name": "tea"})
```
  
You can use the `length` function to return the length of the list, number of characters in the string, and count of key-value pairs in an object.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| X | List, String, Object | Specifies the item whose length you want to determine. If `X` is a list, the function returns the number of elements in the list. If `X` is a string, it returns the number of characters in the string. If `X` is an object, it returns the number of key-value pairs in the object. |

## Prerequisites

N/A

## Return values

The `length` function returns an integer value. This value represents the count of elements in a list, characters in a string, or key-value pairs in an object, depending on the input given to the function. The return value is particularly useful in scenarios when you need to know the number of elements in a collection, for example, when iterating over a list, validating the length of a string, or checking the size of an object.

## 
Provide few code examples demonstrating the use of your function. Each example should be contained within the markdown code block: 

'''pact
your function usage example
'''

The examples should be clear and easy to understand. They should demonstrate the use of different arguments or use cases where applicable.


Could not generate content.
## 
If your function has any configurable options, describe them here in the format similar to the 'Arguments'. That is, a markdown table with 'Option', 'Type' and 'Description' as columns. Make sure to clearly explain the effect of each option on your function's execution. If there are no options, respond with 'N/A'.


Could not generate content.
## Property validation

The `length` function can be used to perform property validation on data structures it operates on. It can be particularly useful when working with strings or lists in the context of constraints related to size.

For example, in the context of validating account identifiers, the `length` function could be used to ensure the identifier has a valid size. Property specifications could look like the following examples:

```pact
(defproperty valid-account (account:string)
  (and
    (>= (length account) MINIMUM_ACCOUNT_LENGTH)
    (<= (length account) MAXIMUM_ACCOUNT_LENGTH)))
```

In this example, `MINIMUM_ACCOUNT_LENGTH` and `MAXIMUM_ACCOUNT_LENGTH` are predefined constants. The `length` function checks whether the account identifier (represented by a string) is within these specified boundaries. If the length is beyond these boundaries, then the property constraint is violated. 

The same property validation principle can be applied to lists, validating the number of elements they contain.

Note: Pact does not throw an error for invalid lengths, but rather returns false for failed constraints. Exceptions have to be explicitly enforced in the logic implementation of the function.

## 
In this section, discuss any unintuitive behavior, potential pitfalls, or common mistakes to avoid while using your function. Make sure to present this information in a clear and concise manner to help your users avoid these issues. If there are no known gotchas associated with your function, respond with 'N/A'.


Could not generate content.
