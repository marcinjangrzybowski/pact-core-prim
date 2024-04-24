# continue

## 
Generate a clear and concise explanation of the basic syntax for your function. This section should contain at least one code snippet demonstrating how to use the function. The code should be provided in the format: 

'''pact
your function syntax
'''

If your function can be overloaded, provide additional code snippets to reflect its multiple uses. Overall, aim to describe the syntax in a way that is easy to comprehend, including any necessary arguments and acceptable data types.


Could not generate content.
## Arguments

The `continue` function does not explicitly take any arguments. However, it is commonly used along with a previously started nested defpact which is enclosed within parenthesis. This is represented as:

| Argument | Type | Description |
| -------- | ---- | ----------- |
| nested defpact | any | A previously started defpact which the `continue` function resumes execution on. |

## 
If your function needs any prerequisites to run successfully, describe them here. If there are no prerequisites, respond with 'N/A'.


Could not generate content.
## 
In this section, detail what your function returns. Describe the type and purpose of the returned value, and explain in what context this return value would be useful. 

Remember, this section should not be left empty - if the function does not return anything, clearly state that this is the case.


Could not generate content.
## Examples

Here are some examples of the 'continue' function used in different contexts:

```pact
;; Continuing a previously started nested defpact.
(continue (coin.transfer-crosschain "bob" "alice" 10.0))
```

Based on the snippets provided, 'continue' is mainly used in the context of the 'coin' contract:

```pact
;; Example of continuing a pact in a coin contract where a transaction fee is involved.
(coin.fund-tx 'doug 'emily (read-keyset 'k) 0.0005)
(env-data { 'fee: 0.0004 })
(continue-pact 1)
```

```pact
;; Example of continuing a pact in a coin contract where an inter-chain transfer is involved.
(env-chain-data {'chain-id: "1"})
(continue-pact 1)
```

```pact
;; Example of preventing double spends in a coin contract by continuing a pact.
(continue-pact 1 false (hash "burn-create"))
```

These examples should give you an idea of how the 'continue' function can be used. Remember, the exact usage depends heavily on the context and the specific requirements of your pact.

## 
If your function has any configurable options, describe them here in the format similar to the 'Arguments'. That is, a markdown table with 'Option', 'Type' and 'Description' as columns. Make sure to clearly explain the effect of each option on your function's execution. If there are no options, respond with 'N/A'.


Could not generate content.
## 
If your function includes any form of property validation, explain it here. Clearly explain the rules that the function follows to verify its arguments and error conditions. If there is no property validation involved in your function, respond with 'N/A'.


Could not generate content.
## 
In this section, discuss any unintuitive behavior, potential pitfalls, or common mistakes to avoid while using your function. Make sure to present this information in a clear and concise manner to help your users avoid these issues. If there are no known gotchas associated with your function, respond with 'N/A'.


Could not generate content.
