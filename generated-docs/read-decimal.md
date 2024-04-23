## Basic Syntax

To read a decimal from the message data body using a specified key, use the `read-decimal` function in the following way:

```pact
(read-decimal *key*:string)
```

where `*key*` is a string value representing the key whose associated value in the top level of message data body you want to parse as a decimal.

This function can be typically used in financial computations where precision is required. Here's an example:

```pact
(let*
  ((fee (read-decimal "fee"))
    (refund (- total fee)))
)
```

In this usage, `read-decimal` retrieves the value associated with the key "fee" (from the message data body) as a decimal and assigns it to the variable `fee` which is then used in subsequent computations.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| key | string | Specifies the key string, which is used to parse a numeric value from the top level of the message data body into a decimal. |

Prerequisites:

To use the `read-decimal` function, you need a key string available in the message data body that you can parse into a decimal. This key string corresponds to the parameter that you pass into the `read-decimal` function. Ensure that the value associated with this key string in the message data body is a string or number value that can be parsed into a decimal.

## Return values

The `read-decimal` function returns a decimal value. Specifically, it parses a provided key or string from the top level of the message data body and returns it as a decimal. This return value is often useful in financial calculations requiring precision, as in transferring funds or calculating fees.

## Examples

The following examples demonstrate the usage of `read-decimal` function.

Example 1:
Parse "fee" string from the message data body to get the fee amount in decimal.

```pact
(let*
  ((fee (read-decimal "fee"))
    (refund (- total fee)))
)
```

In this example, `(read-decimal "fee")` reads the "fee" from the message and parses it as a decimal. The fee is then subtracted from the total to get the refund amount.

Example 2:
Use `read-decimal` in a function to transfer an "amount" between two accounts

```pact
(defun exec ()
  (transfer (read-msg "from") (read-msg "to") (read-decimal "amount"))
)
```

In this example, `(read-decimal "amount")` would read the "amount" from the message and parse it as a decimal. The amount is then transferred from the "from" account to the "to" account.

N/A

N/A

## Gotchas

While using `read-decimal` function, it is important to remember:

- The function expects a key string as an argument. If the argument is not present in the top level of the message data body, the function will error out. Always ensure the key exists before attempting to read it as a decimal.
- The function will try to parse the value corresponding to the key from the message data body as a decimal. If the value is not a valid representation of a decimal, this can result in unexpected behavior or errors. Be sure the value can be interpreted as a decimal before using this function.
- The function will fail if the input value overflows the limits of the decimal data type. Ensure the input values are within the acceptable range for decimals.
- Data loss may occur if the input value has more decimal precision than what the decimal data type can handle. Align your precision requirements with the capabilities of the decimal data type.

Always handle potential errors to make sure your Pact code is robust and safe.

