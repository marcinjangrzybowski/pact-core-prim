# make-list

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

Here are some examples demonstrating the use of `make-list` function:

```pact
(make-list 3 "pact")
["pact" "pact" "pact"]
```

In this example, a list is created with 3 repeated instances of the string "pact".

Similarly, you could generate a list with repeating integers or booleans:

```pact
(make-list 5 100)
[100 100 100 100 100]
```

```pact
(make-list 4 false)
[false false false false]
```

In a case where you would like to generate a list with a value of `null` repeated. For example, you could generate a list of nulls to represent a row of a matrix that hasn't been initialized yet:

```pact
(make-list 3 null)
[null null null]
```

Note: If you provide a negative integer for the length, `make-list` will return an empty list. For example:

```pact
(make-list -1 "test")
[]
```

## Options

N/A

## 
If your function includes any form of property validation, explain it here. Clearly explain the rules that the function follows to verify its arguments and error conditions. If there is no property validation involved in your function, respond with 'N/A'.


Could not generate content.
## 
In this section, discuss any unintuitive behavior, potential pitfalls, or common mistakes to avoid while using your function. Make sure to present this information in a clear and concise manner to help your users avoid these issues. If there are no known gotchas associated with your function, respond with 'N/A'.


Could not generate content.
