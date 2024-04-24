# select-with-fields

## Basic syntax

The `select-with-fields` function allows you to execute a database query and return the results as specified fields. Here is the basic syntax for using it:

```pact
(select-with-fields ['field1 'field2 ...] tablename predicate)
```

In this example, `['field1 'field2 ...]` is the set of fields you want to return. It must be a list of column names represented as strings.

`tablename` is the name of the table you want to query. It must be in string format.

`predicate` is a function that specifies the conditions for data retrieval. It should return `true` for the rows you want to select and `false` for the rows you want to exclude.

Here is a more specific example:

```pact
(select-with-fields ['first_name 'age] 'employees (= 'department "Sales"))
```

In this example, the function returns the `first_name` and `age` of all employees in the "Sales" department.

## 
In this section, provide a detailed explanation of all the arguments of your function. Create a markdown table with each row representing a different argument. Your table should include the following fields:

| Argument | Type | Description |

Make sure the 'Argument' field contains the name of the argument, 'Type' lists the data type of the argument, and 'Description' holds a clear, concise explanation of what the argument means in the context of your function. 

Ensure the number of rows in your table matches the arity of your function. 


Could not generate content.
## Prerequisites

N/A

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
## 
In this section, discuss any unintuitive behavior, potential pitfalls, or common mistakes to avoid while using your function. Make sure to present this information in a clear and concise manner to help your users avoid these issues. If there are no known gotchas associated with your function, respond with 'N/A'.


Could not generate content.
