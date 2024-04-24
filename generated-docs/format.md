# format

## Basic syntax

To use the `format` function to interpolate variables into a template, use the following syntax:

```pact
(format *template*:string [*vars*:list])
```

The `format` function replaces the `{}` in the template string with the respective entries of the vars list.

Here is an example usage:

```pact
(format "My {} has {}" ["dog" "fleas"])
```
The string "dog" replaces the first `{}` in the template, and the string "fleas" replaces the second `{}`. The function returns the string "My dog has fleas".

## 
In this section, provide a detailed explanation of all the arguments of your function. Create a markdown table with each row representing a different argument. Your table should include the following fields:

| Argument | Type | Description |

Make sure the 'Argument' field contains the name of the argument, 'Type' lists the data type of the argument, and 'Description' holds a clear, concise explanation of what the argument means in the context of your function. 

Ensure the number of rows in your table matches the arity of your function. 


Could not generate content.
## Prerequisites

N/A

## Return values

The `format` function returns a `string` that is the result of interpolating the `vars` into the `template`. The function replaces each `{}` within the `template` with corresponding values from the `vars`. If there are no `{}` in the `template`, the function will return the `template` as is. If there are more `{}` in the `template` than the length of `vars`, the function will return a string with remaining `{}`. This return value can be useful for generating messages or string manipulation that requires template replacements.

## Examples

The `format` function can be used in multiple scenarios, as illustrated in the following examples:

1. Simple String Interpolation:

```pact
(format "My {} has {}" ["dog" "fleas"])
```
Expected Output:
```
"My dog has fleas"
```

2. Error handling (In conjunction with the `enforce` function):

```pact
(enforce (= balance 0.0)
  (format "Expected balance is 0.0, but received {}" [balance]))
```
If `balance` is not 0, it will throw an error message like:

```
"Expected balance is 0.0, but received 100.0"
```
3. Debug information (In conjunction with the `at` function):

```pact
(let
  ((i (details 'emily)))
  (format "Account: {} Guard: {}" [(at 'balance i) (at 'guard i)]))
```
This will output a formatted string with balance and guard information if 'details' function returns a collection with 'balance' and 'guard' keys.

Remember, `format` works with any number of interpolations not just two as shown is most examples. Just make sure the number of items in the vars list is same as the number of `{}` in the string.

## Options

N/A

## Property validation

In the case of `format`, property validation concerns the conformance of the `vars` argument to the placeholders `{}` found in the `template` argument. The function goes through the template and substitutes each placeholder with the respective item from `vars`; an error occurs if there are more placeholders than provided items.

Refer to the following usage scenarios as examples:

- If the `template` is "My dog has {}" and `vars` is ["fleas"], `format` will replace the single `{}` placeholder with "fleas". Hence, it validates smoothly because there's one placeholder and one item to insert. 
- If the `template` is "My {} has {}" and `vars` is ["dog", "fleas"], again validation is successful because there are two placeholders and two items.
- However, if the `template` is "My {} has {}" but `vars` is just ["dog"], validation fails because while there are two placeholders, only one item has been provided. 
- Similarly, if `template` is "My {} has fleas" while `vars` is ["dog", "barked"], validation also fails. There's only one placeholder, but two items were provided.

Therefore, `format` validates by confirming that the number of placeholders in the `template` matches the number of items in the `vars` list, triggering an error if this property is not satisfied.

## Gotchas

`format` is a powerful function for string interpolation in Pact, but there are a couple of points to be aware of:

- `format` uses a position-based replacement mechanism. The order of arguments in the list provided to `format` matters. The first argument in the list corresponds to the first `{}`, the second argument corresponds to the second `{}`, and so on.
  
- The number of `{}` placeholders in the string has to match the number of arguments exactly. If you have more `{}` placeholders than arguments, or more arguments than `{}` placeholders, the `format` function throws an error.
  
- The function does not perform automatic type conversion. If a non-string type is provided, `format` does not automatically convert it to a string. For instance, if you pass an integer to `format`, it generates an error since `format` expects string values.

- The `{}` placeholder cannot be escaped. `format` offers no way to include literal `{}` brackets in the resulting string. 

- `format` replaces `{}` with the string representation of the corresponding argument, so be aware of how different types are converted to strings. This is especially important for objects and arrays, as their string representation might not be what you expect. 

Always test your `format` function calls carefully, especially when dealing with complex arguments or templates.

