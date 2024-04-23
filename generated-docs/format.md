# format

The `format` function in Pact allows you to interpolate variables into a string template using brackets `{}`.

## Basic Syntax

The general syntax for the `format` function is:

```pact
(format "TEMPLATE" [VARS])
```

In this syntax:

- "TEMPLATE" is a string that serves as the template into which the variables will be interpolated. This template string should contain brackets `{}` where a variable should be inserted. 

- [VARS] is a list of variables to be inserted into the TEMPLATE. The variables in the list will be interpolated into the template in the sequence they appear in the list.

A simple example of the `format` function is:
```pact
(format "My {} has {}" ["dog" "fleas"])
```
This example will output: "My dog has fleas". The `"dog"` and `"fleas"` are inserted into the places where `{}` appear in the TEMPLATE string.

Note: The number of `{}` brackets in the TEMPLATE string must match the number of elements in the VARS list.

## Arguments

The `format` function requires two arguments to insert the specified variables into the defined template.

| Argument | Type | Description |
| --- | --- | --- |
| template | string | The format string that defines the desired formatting. It should include placeholders `{}` where variables should be inserted. |
| vars | list | A list of values that will be inserted into the placeholders in the template, in the respective order.

N/A

## Return values

The `format` function returns a string data type. This returned string contains filled placeholders that were present in the initial template, using the values from the provided array. The function enables dynamic generation and manipulation of strings based on the provided variables and allows for the formatting of complex user messages, errors, or other types of string outputs.

## Examples

The `format` function allows you to arrange and insert different variables into your template string. The place where variables will be replaced is represented by curly braces `{}` inside your string. Below are few examples demonstrating the use of `format` function.

This example demonstrates a basic usage:

```pact
(format "My {} has {}" ["dog" "fleas"])
```
In this case, `format` replaces the `{}` in the string `"My {} has {}"` with the corresponding values from the list `["dog" "fleas"]`. The result would be `"My dog has fleas"`.

Here's an example where `format` is used to insert multiple variables into a string:

```pact
(format "The {} jumped over the {}" ["quick brown fox" "lazy dog"])
```
In this example, `format` replaces the first `{}` with `"quick brown fox"` and the second `{}` with `"lazy dog"`. The result would be `"The quick brown fox jumped over the lazy dog"`.


In this next example, `format` is used within a conditional check to provide detailed error messages:

```pact
(enforce (> balance 1000) (format "Insufficient funds, your balance is {}" [balance]))
```
In this example, if the condition `balance > 1000` is not met, `format` is used to build an error message that includes the current balance, which could be very useful for debugging purposes.

The `format` function doesn't have any configurable options. Therefore, N/A in this case.

## Property validation

The `format` function's properties are validated through the two arguments it takes: the template string, and the vars array. The function checks that the number of `{}` placeholders in the template string matches with the number of elements in the vars array. If they don't match, an error will occur. The function also works with an empty vars array and a template string without placeholders. If the vars array contains elements but there are no placeholders in the template string, the vars array elements will be ignored.

The most common error situation is when vars and placeholders count do not match. In this case, Pact will return an error, informing that argument to formatting is not paired with a placeholder in the template string.

While the `format` function is generally intuitive to use, there are a few potential issues to keep in mind:

1. **Mismatch in Number of Placeholders and Variables:** The `format` function relies on correct pairing of the placeholders `{}` in the template string with the variables in the list. If there are more placeholders than variables or vice versa, it may produce unexpected results. Always ensure the count of placeholders matches the count of variables.

2. **Non-string Template:** The `format` function is designed to work with string-based templates. If the template is not a string, it might not work as expected. Always ensure your template is a string.

3. **Non-existent Object Key:** When formatting strings using object keys, ensure you're referring to a key that actually exists in the object. Using a non-existent key will not provide a value to the template.

Please remember to thoroughly test your `format` strings to ensure they're producing the desired output.

