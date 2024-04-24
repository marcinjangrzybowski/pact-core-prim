# reverse

## Basic syntax

The `reverse` function in Pact lets you return a reversed list. To use this function, you can follow the syntax below:

```pact
(reverse [list])
```

In the syntax, replace `[list]` with the list you want to reverse.

Here's an example of how to use the `reverse` function:

```pact
(reverse [1 2 3])
```

This will return a reversed list:

```pact
[3 2 1]
```

Note: The `reverse` function does not accept an object or a single variable, it only operates on lists.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| list | [a] | The list of values that will be reversed. |

## 
If your function needs any prerequisites to run successfully, describe them here. If there are no prerequisites, respond with 'N/A'.


Could not generate content.
## 
In this section, detail what your function returns. Describe the type and purpose of the returned value, and explain in what context this return value would be useful. 

Remember, this section should not be left empty - if the function does not return anything, clearly state that this is the case.


Could not generate content.
## Examples

Here are some examples of the `reverse` function in action. 

This example reverses a list of integers:

```pact
(reverse [1 2 3])
```
The function returns:

```pact
[3 2 1]
```
This example reverses a list of strings:

```pact
(reverse ["apple" "banana" "cherry"])
```
The function returns:

```pact
["cherry" "banana" "apple"]
```
In this example, we reverse a list of lists:

```pact
(reverse [[1 2 3] [4 5 6] [7 8 9]])
```
The function returns:

```pact
[[7 8 9] [4 5 6] [1 2 3]]
```
The `reverse` function can be used in a wide varity of contexts where reversing the order of a list is necessary.


## Options

N/A

## 
If your function includes any form of property validation, explain it here. Clearly explain the rules that the function follows to verify its arguments and error conditions. If there is no property validation involved in your function, respond with 'N/A'.


Could not generate content.
## Gotchas

The `reverse` function is straightforward and does not have known pitfalls or unintuitive behavior. However, you might want to note the following:
- While using `reverse`, beware that reversing a large list could be a performance intensive operation. If the list is too large, you might experience slow performance.
- The function expects a list as input. If you pass in an empty list, it will return an empty list without any errors. But if you provide a different data type as argument (like a single integer or a string), it will cause an error. Always ensure the correctness of your input.

