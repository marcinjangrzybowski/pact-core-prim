# read-decimal

## Basic syntax

The basic syntax for the `read-decimal` function is simple and easy to use. The function accepts a string which corresponds to a key in the message data body. This key should point to a value which can be parsed as a decimal. 

Here's a simple demonstration of the syntax:

```pact
(read-decimal "key")
```

In this example, "key" is the string value that correlates with the value to be parsed as a decimal in the message data body. 

Remember to confirm that the value associated with the given key can be successfully parsed as a decimal to prevent any runtime errors.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| key | string | This argument specifies the key used to retrieve a decimal value from the top level of a message data body. |


## Prerequisites

N/A

## Return values

The `read-decimal` function returns a decimal value parsed from a string or number from the top level of the message data body, specified by a key. If the key refers to a string that can be converted to a decimal, the function will return this decimal. If the key refers to a number, the number is casted to decimal format and returned. This conversion to decimal format could be useful when precise mathematical operations need to be performed or decimal formatting is required for the data. 

In the case when the specified key does not exist in the message data or cannot be converted to a decimal, the function will throw an error.

## Examples

```pact
(read-decimal "amount")
```
This retrieves the decimal value associated with the key `amount` in the message data. 

```pact
(defun exec ()
   (transfer (read-msg "from") (read-msg "to") (read-decimal "amount")))
```
In this example, `read-decimal` is used within a function to retrieve the value associated with `amount` key from the data passed to the function, and then use it in the `transfer` function.

```pact
(let*
  ((fee (read-decimal "fee"))
   (refund (- total fee)))
```
In this example, `read-decimal` is used to retrieve the value associated with `fee` key from the data, and calculate the refund amount by subtracting `fee` from `total`.


## Options

N/A

## Property validation

N/A

## Gotchas

The function `read-decimal` reads a decimal input. It's important to note:

1. The function `read-decimal` expects a decimal number under the `string` key in the message data body. Ensure that the input under the specified key is of decimal type. If a non-decimal value is passed, the function will throw an error.
2. This function will read the value as a decimal regardless of whether the input is a string or an actual number.
3. This function, being a built-in function had no validation for the inputs provided, as it directly attempts to parse the input as decimal. A non-valid decimal input would throw an error.
4. Moreover, if the key doesn't exist, it fails with an error rather than returning a null or default value. Please ensure the key exists in the message data body.

