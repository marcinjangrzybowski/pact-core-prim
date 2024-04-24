# read

## Basic syntax

The `read` function retrieves data from a database based on the supplied table name and key identifiers.
There are two main forms of syntax for the `read` operation:

1. Read the full record from a table:

```pact
(read tableName:keyType keyString)
```

In this form, `tableName` is the name of the table to read from, and `keyString` is the key of the record that you want to retrieve. 

2. Read specific columns from a row in a table:

```pact
(read tableName:keyType keyString [columnName1, columnName2,...])
```

In this form, in addition to `tableName` and `keyString`, you specify an array of column names that you want to retrieve. Only these specified columns will be returned from the indicated row of the table.

In both forms, the `read` function will return the requested data as a Pact object.

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
## Property validation

The `read` function ensures the validity of its arguments as part of its operation. Before a `read` operation is executed, it validates the table and key provided as arguments. 

The table must be of a recognized data structure that supports key-value pairs, while the key provided must exist within the specified table. If these conditions are not met, the `read` operation will fail and return an error.

In case of `read-before` or `read-after` function, the transaction time is verified to be either "before" or "after".

In most of the examples, there's also enforcement that the user or account associated with the key has the correct permissions or matches other necessary conditions in order to proceed with the operation. 

Please remember, error messages should be descriptive to help the users debug any issues swiftly. 

This validation enhances the reliability of the system by ensuring proper data handling and access control.

## 
In this section, discuss any unintuitive behavior, potential pitfalls, or common mistakes to avoid while using your function. Make sure to present this information in a clear and concise manner to help your users avoid these issues. If there are no known gotchas associated with your function, respond with 'N/A'.


Could not generate content.
