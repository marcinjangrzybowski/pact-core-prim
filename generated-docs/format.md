# format

## Basic syntax

The `format` function is used to replace placeholders denoted by `{}` in a string with the values specified. The function takes in two arguments, a template string and a list of values.

Here is the basic syntax:

```pact
(format TEMPLATE VARS)
```

- `TEMPLATE`: This is a string that contains one or more `{}` placeholders that you want to replace with specific values. 
- `VARS`: This is a list of values to replace the placeholders in the template string with. The values in this list are inserted into the template string in the order they appear.

Here is an example usage:

```pact
(format "My {} has {}" ["dog" "fleas"])
```

This will output: `"My dog has fleas"` because `"dog"` replaces the first `{}` and `"fleas"` replaces the second `{}` in the template string.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| Template | string | Specifies the format of the output as a string with `{}` placeholders. |
| Vars | list | Specifies the values list which will replace the `{}` placeholders in the Template string in the order they are provided. |

## Prerequisites

For using the `format` function in Pact, there are no specific prerequisites. Users should just have a basic understanding of the language syntax and data types like strings and lists. This function is built-in and can be accessed directly without needing any specific libraries or modules to be included beforehand.

## Return values

The `format` function returns a formatted string as per the specified template and arguments. The function takes a string as a template and an array to place within the template brackets `{}`. It will replace instances of `{}` in the template string with sequential values from the supplied list. The result is a string where the placeholders in the template are replaced with the corresponding values from the list. This is useful for generating customized string messages or for data representation purposes.

## Examples

'''pact
(format "My {} has {}" ["dog" "fleas"])
"My dog has fleas"
'''
In this example, the `format` function interpolates the items in the list ["dog", "fleas"] into the placeholders `{}` in the string template "My {} has {}". The result is: "My dog has fleas".

```pact
(format "The sum of {} and {} is {}" [2 3 (+ 2 3)])
"The sum of 2 and 3 is 5"
```
In this example, the `format` function interpolates the items in the list [2, 3, (+ 2 3)] into the placeholders `{}` in the string template "The sum of {} and {} is {}". The result is: "The sum of 2 and 3 is 5".

```pact
(enforce (>= bal amount)
  (format "Insufficient gas balance: {} < {}" [bal amount]))
```
In this example, the `format` function is used in an `enforce` statement. If the balance (`bal`) is less than the amount, `format` will produce an informative error message: "Insufficient gas balance: {bal} < {amount}".

```pact
(enforce false
  (format "Reserved protocol guard violation: {}" [r]))
```
In this example, `format` is used to create a custom error message indicating a guard violation. The placeholder `{}` is replaced with the value of `r`.

## Options

N/A

## Property validation

The `format` function does not include explicit property validation in terms of data types as it inherently accepts a list of any type (as denoted by `[*]`). However, the function conducts an internal validation to ensure the number of placeholders `{}` in the template string corresponds to the number of elements present in the passed list. If there is a mismatch, it will result in an error condition. This is intrinsic validation handled by the function logic itself.

For instance:
```pact
(format "My {} has {}" ["dog"])
```
The call above will fail as there are more placeholders in the string than the elements in the list. 

Please note that the order is important as well. The elements in the array are injected into the string in the order they appear. If the order does not logically match the sentence structure, it will result in an incorrect or nonsensical output, however, no error will be triggered.

## Gotchas

- The `format` function works with string placeholders `{}` within the *template* argument. It doesn't support index-based or named placeholders. If you attempt to use these, it may not result in the expected output.
  
- List of *vars* should match the number of placeholders in the *template* string. Providing excess or inadequate parameters can lead to incorrect output or runtime failures.

- The `format` function doesn't provide any sanitization or escaping mechanism for the interpolated values, this might be a security risk in scenarios such as construction of database queries or generation of HTML content. 

- Ensure all interpolated variables can be successfully converted to string format. If not, this may raise a type error during runtime. 

- Use caution when formatting large numbers or floating point values as rounding errors can occur.

- If using `format` for error messages, ensure the output does not leak sensitive information, as these might be logged or exposed externally.

- Values in the *vars* list are not type checked and will be implicitly converted to strings, this can lead to unexpected results if not accounted for.

- The `format` function respects object ownership and row-level permissions in the database as expected. However, when used incorrectly, this function can produce SQL statements that unintentionally bypass these security checks.

