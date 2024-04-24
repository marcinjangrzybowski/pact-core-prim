# pact-id

## 
Generate a clear and concise explanation of the basic syntax for your function. This section should contain at least one code snippet demonstrating how to use the function. The code should be provided in the format: 

'''pact
your function syntax
'''

If your function can be overloaded, provide additional code snippets to reflect its multiple uses. Overall, aim to describe the syntax in a way that is easy to comprehend, including any necessary arguments and acceptable data types.


Could not generate content.
## Arguments

The `pact-id` function does not take any arguments.

## 
If your function needs any prerequisites to run successfully, describe them here. If there are no prerequisites, respond with 'N/A'.


Could not generate content.
## 
In this section, detail what your function returns. Describe the type and purpose of the returned value, and explain in what context this return value would be useful. 

Remember, this section should not be left empty - if the function does not return anything, clearly state that this is the case.


Could not generate content.
## Examples

Example 1: Basic usage

```pact
(pact-id)
"ExamplePact"
```

In this example, `(pact-id)` is used during the execution of a pact with id "ExamplePact". It returns the ID "ExamplePact".

Example 2: Failing example

```pact
(pact-id)
```

In this case, `(pact-id)` is not used during a pact execution, thus it fails.

Please be aware that examples cannot be fully reproduced as it requires a live Pact execution.

## 
If your function has any configurable options, describe them here in the format similar to the 'Arguments'. That is, a markdown table with 'Option', 'Type' and 'Description' as columns. Make sure to clearly explain the effect of each option on your function's execution. If there are no options, respond with 'N/A'.


Could not generate content.
## 
If your function includes any form of property validation, explain it here. Clearly explain the rules that the function follows to verify its arguments and error conditions. If there is no property validation involved in your function, respond with 'N/A'.


Could not generate content.
## Gotchas

The `pact-id` function is fail-able in cases where it is called outside the scope of an existing pact execution. Therefore, ensure to handle potential failure scenarios appropriately in your code. Attempting to retrieve a pact ID when there's no active pact may cause an error or unexpected behavior.

