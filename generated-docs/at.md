# at

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

The `at` function in pact supports property checking, which can be particularly useful when asserting invariants in your code. 

When specifying an invariant or a property, you can leverage the `at` function to index a list and confirm whether a specific condition holds true. As the `at` function will return the value at the specified index, you can directly compare this value in your property or invariant.

For example, if you are using the `at` function within a `(property (NAME))` formulation, you can ensure that a property with the name `NAME` holds true for all values in the list at the given index. Similarly, this function can be used in invariants to assert a condition on the values indexed in a list.

An error is thrown if an invalid index type for the collection is provided or the index is out of the boundary of the list or does not exist in the object. In such cases, `at` function ensures that the index and the collection are correctly matched and valid, serving as a form of argument validation.

## Gotchas

When using the `at` function, a few things to be aware of:
- `at` function uses zero-based indexing for lists. That's why `(at 0 [1 2 3])` will return `1` and not `2`.
- For objects, `at` retrieves values based on your specified key. If this key does not exist in your object, an error will be raised. Make sure the key exists in the object before you use it.
- `at` returns the value at that index or key whether it is `null` or `undefined`. You may need to add condition to handle these values. 
- If the index number is out of range, `at` returns `null`, not an error. This can be a pitfall, as you might expect an error to be returned when you request an index that is out of range.
- Make sure the index is integer and the key is string. Feeding wrong type will cause an error.
- The data type of the output will always correspond to the data type of the item at the index or key you specify. This could potentially cause issues if you're expecting a specific data type to be returned, but the actual type of the value at the given index or key is different.

