# sort

## Basic syntax

The `sort` function can be used to sort a homogeneous list of primitive values, or to sort objects using supplied fields. Below are basic syntax examples for both uses.

If you are sorting a list of basic values:

```pact
(sort [list])
```

In the example above, `list` is a homogeneous list of primitive values.

If you are sorting objects:

```pact
(sort [fields] [object])
```

In the example above, `fields` is a list of object's keys that are used to decide the order of objects, and `object` is a list of objects to be sorted. Keep in mind the object's keys in `fields` must exist in `object` for sorting. 

Here is an example of how you might use `sort`:

```pact
(sort ['age] [{'name: "Lin"' 'age: 30} {'name: "Val" 'age: 25}])
```

The first `sort` example is sorting a list of integers, while the second `sort` example is sorting a list of objects by the 'age' key.

## 
In this section, provide a detailed explanation of all the arguments of your function. Create a markdown table with each row representing a different argument. Your table should include the following fields:

| Argument | Type | Description |

Make sure the 'Argument' field contains the name of the argument, 'Type' lists the data type of the argument, and 'Description' holds a clear, concise explanation of what the argument means in the context of your function. 

Ensure the number of rows in your table matches the arity of your function. 


Could not generate content.
## 
If your function needs any prerequisites to run successfully, describe them here. If there are no prerequisites, respond with 'N/A'.


Could not generate content.
## Return values

The `sort` function returns a sorted list in ascending order. If implemented on a list of primitive values, the sorted list of those values is returned. If implemented on a list of objects using supplied fields, it returns the list of objects sorted based on the specified field values. It is useful in contexts where arranging data in a particular sequence is required, either for proper data representation or comparative analysis.

## 
Provide few code examples demonstrating the use of your function. Each example should be contained within the markdown code block: 

'''pact
your function usage example
'''

The examples should be clear and easy to understand. They should demonstrate the use of different arguments or use cases where applicable.


Could not generate content.
## Options

N/A

## 
If your function includes any form of property validation, explain it here. Clearly explain the rules that the function follows to verify its arguments and error conditions. If there is no property validation involved in your function, respond with 'N/A'.


Could not generate content.
## 
In this section, discuss any unintuitive behavior, potential pitfalls, or common mistakes to avoid while using your function. Make sure to present this information in a clear and concise manner to help your users avoid these issues. If there are no known gotchas associated with your function, respond with 'N/A'.


Could not generate content.
