# define-keyset

## Basic syntax

The `define-keyset` function can be used in two different ways, each with a different syntax. Either a keyset can be explicitly specified or it can be read from a message payload. 

The first syntax to define a keyset with a name and a keyset is as follows:

```pact
(define-keyset *name*:string *keyset*:string)
```

The second syntax to read a keyset from a message payload with the given name is as follows:

```pact
(define-keyset *name*:string)
```

In both syntax representations, replace `*name*` and `*keyset*` with the actual variables or strings for your function. For instance:

```pact
(define-keyset 'admin-keyset (read-keyset "keyset"))
```

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
(define-keyset 'admin-keyset (read-keyset "keyset"))
```
The above example defines a keyset named 'admin-keyset' using the keys from 'keyset'.

```pact
(define-keyset 'operate (read-keyset 'gas-payer-operate))
```
The above example defines a keyset named 'operate' using the keys from 'gas-payer-operate'.

```pact
(define-keyset 'alloc)
```
This example demonstrates the operation of `define-keyset` function when one argument is passed and the keyset is supposed to be read from the message payload. If the named keyset already exists, keyset named 'alloc' will be enforced before updating to new value.

## 
If your function has any configurable options, describe them here in the format similar to the 'Arguments'. That is, a markdown table with 'Option', 'Type' and 'Description' as columns. Make sure to clearly explain the effect of each option on your function's execution. If there are no options, respond with 'N/A'.


Could not generate content.
## Property validation

The `define-keyset` function executes certain checks for property validation:

- It validates the keyset name to be defined. If a keyset with the same name already exists, the existing keyset will be enforced before updating to the new value. 
- It also validates that the function is used at the top level. Usage in module code will result in failure.
- The function accepts either a string argument for the keyset, in which case it attempts to read the keyset from message payload (similarly to 'read-keyset'), or a keyset object. 

Failure of these validations will result in an error.

## 
In this section, discuss any unintuitive behavior, potential pitfalls, or common mistakes to avoid while using your function. Make sure to present this information in a clear and concise manner to help your users avoid these issues. If there are no known gotchas associated with your function, respond with 'N/A'.


Could not generate content.
