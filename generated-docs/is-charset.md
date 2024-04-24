# is-charset

## 
Generate a clear and concise explanation of the basic syntax for your function. This section should contain at least one code snippet demonstrating how to use the function. The code should be provided in the format: 

'''pact
your function syntax
'''

If your function can be overloaded, provide additional code snippets to reflect its multiple uses. Overall, aim to describe the syntax in a way that is easy to comprehend, including any necessary arguments and acceptable data types.


Could not generate content.
## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| CHARSET | integer | Specifies the character set to check the input against. Character sets currently supported are 'CHARSET_LATIN1' (ISO-8859-1), and 'CHARSET_ASCII' (ASCII) |
| INPUT | string | The string input to check conformity against the specified character set |

## 
If your function needs any prerequisites to run successfully, describe them here. If there are no prerequisites, respond with 'N/A'.


Could not generate content.
## 
In this section, detail what your function returns. Describe the type and purpose of the returned value, and explain in what context this return value would be useful. 

Remember, this section should not be left empty - if the function does not return anything, clearly state that this is the case.


Could not generate content.
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
## 
If your function includes any form of property validation, explain it here. Clearly explain the rules that the function follows to verify its arguments and error conditions. If there is no property validation involved in your function, respond with 'N/A'.


Could not generate content.
## Gotchas

The `is-charset` function currently only supports two character sets: 'CHARSET_LATIN1' (ISO-8859-1), and 'CHARSET_ASCII' (ASCII). Be cautious not to use it with any other character sets expecting it to return accurate results. 

Moreover, it will return `false` if any character in the input string lies outside the specified charset. For instance, special characters or diacritics which aren't a part of a charset would cause the function to return `false`.

Remember, the character comparison is case-sensitive. Ensure appropriate character case while checking the charset.

Additionally, the `is-charset` function doesn't consider an empty string as a valid character set. Make sure the input string is not empty when using this function.

