# read-msg

## Basic syntax

The `read-msg` function is used to read a value from the top level of a message data body, or the entire data body if no key is provided. It allows you to comfortably access data from a received message. The `read-msg` function can be overloaded to handle different types of data input.

The basic syntax for the `read-msg` function is:

```pact
(read-msg *key*:string)
```

In this syntax, `key` is a string that represents the key of the value you want to retrieve from the message data body. If no key is provided, the function returns the entire data body.

Example:

```pact
(defun exec ()
   (transfer (read-msg "from") (read-msg "to") (read-decimal "amount")))
```

In the above example, the `read-msg` function is used to retrieve the values for keys "from", "to", and "amount" from a message data body for a money transfer execution.

This function can handle different data types, it can read string, integer, boolean, list, and object data types. Remember that this function will coerce the received data into their corresponding pact types. For example, JavaScript String will be returned as a pact string, JavaScript Number as a pact integer, and so on.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| key | string | The key string specifies the information you want to retrieve from the message data body. If not provided, the entire data body itself is read. |

## Prerequisites

N/A

## Return values

The `read-msg` function returns the value corresponding to a specified key from the top level of the message data body. If no key is provided, the function returns the entire data body as an object. The data is automatically coerced to their corresponding pact types — specifically, Strings to strings, Numbers to integers, Booleans to bool, Lists to list, and Objects to objects. This value can then be used as a parameter in other functions or operations, as demonstrated in the provided examples.

## 
Provide few code examples demonstrating the use of your function. Each example should be contained within the markdown code block: 

'''pact
your function usage example
'''

The examples should be clear and easy to understand. They should demonstrate the use of different arguments or use cases where applicable.


Could not generate content.
## Options

N/A

## Property validation

The `read-msg` function performs inbuilt property validation where the argument must be a string representing the key whose corresponding value you want to retrieve. If the function cannot find the specified key in the message data body, an error is returned. The function also automatically coerces the returned value to their corresponding Pact type: String to string, Number to integer, Boolean to bool, List to list, and Object to object. If an unsupported or invalid type is contained within the data body of the message, an error will be thrown.

## 
In this section, discuss any unintuitive behavior, potential pitfalls, or common mistakes to avoid while using your function. Make sure to present this information in a clear and concise manner to help your users avoid these issues. If there are no known gotchas associated with your function, respond with 'N/A'.


Could not generate content.
