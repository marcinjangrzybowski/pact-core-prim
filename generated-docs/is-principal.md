# is-principal

## 
Generate a clear and concise explanation of the basic syntax for your function. This section should contain at least one code snippet demonstrating how to use the function. The code should be provided in the format: 

'''pact
your function syntax
'''

If your function can be overloaded, provide additional code snippets to reflect its multiple uses. Overall, aim to describe the syntax in a way that is easy to comprehend, including any necessary arguments and acceptable data types.


Could not generate content.
## 
In this section, provide a detailed explanation of all the arguments of your function. Create a markdown table with each row representing a different argument. Your table should include the following fields:

| Argument | Type | Description |

Make sure the 'Argument' field contains the name of the argument, 'Type' lists the data type of the argument, and 'Description' holds a clear, concise explanation of what the argument means in the context of your function. 

Ensure the number of rows in your table matches the arity of your function. 


Could not generate content.
## 
If your function needs any prerequisites to run successfully, describe them here. If there are no prerequisites, respond with 'N/A'.


Could not generate content.
## 
In this section, detail what your function returns. Describe the type and purpose of the returned value, and explain in what context this return value would be useful. 

Remember, this section should not be left empty - if the function does not return anything, clearly state that this is the case.


Could not generate content.
## Examples

```pact
;; Checking if the string is a principal
(is-principal 'k:462e97a099987f55f6a2b52e7bfd52a36b4b5b470fed0816a3d9b26f9450ba69)
```

This example checks if the given string is a principal. If valid, the function will return true.

```pact
;; Enforcing that rotation is only allowed for non-principal accounts
(enforce 
  (or 
    (not (is-principal account))
    (validate-principal new-guard account)
  ) 
  "It is unsafe for principal accounts to rotate their guard"
)
```

In this example, the function `is-principal` is used to enforce the safety of account guard rotation. If the account is a principal, the new guard needs to be validated for the account.

## 
If your function has any configurable options, describe them here in the format similar to the 'Arguments'. That is, a markdown table with 'Option', 'Type' and 'Description' as columns. Make sure to clearly explain the effect of each option on your function's execution. If there are no options, respond with 'N/A'.


Could not generate content.
## Property validation

`is-principal` can be used to verify if a string corresponds to a proper principal format. The function takes a string as an argument and returns a boolean value. It checks if the string follows the required standard format for principals and returns True if it does, and False if it doesn’t.

For instance, in property enforcement checks, `is-principal` can be utilized to ensure that a given account entry does confirm to the principal format. If it does not, the enforcement will fail and an error message, e.g. "Invalid account structure: non-principal account" is returned as per the execution rule.

Refer to the code snippets for examples of usage in property validation. The function is used to enforce that account rotation is allowed only for vanity accounts, or re-rotating a principal account back to its proper guard.

Note: This function does not validate the principal, it only checks if the format is correct.

## 
In this section, discuss any unintuitive behavior, potential pitfalls, or common mistakes to avoid while using your function. Make sure to present this information in a clear and concise manner to help your users avoid these issues. If there are no known gotchas associated with your function, respond with 'N/A'.


Could not generate content.
