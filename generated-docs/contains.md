# contains

## Basic syntax

The `contains` function in Pact can be used in three different ways: checking for values in a list, keys in an object, or substrings in a string. It always returns a boolean value indicating if the value, key, or substring is present. 

Check for a value in a list:

```pact
(contains *value*:any [<list>])
```

Check for a key in an object:

```pact
(contains *key*:string {<object>})
```

Check for a substring in a string:

```pact
(contains *value*:string "<string>")
```

In these examples, `*value*` represents the value you are searching for, `<list>` is the list where you are searching for the value, `*key*` is the key you are searching for, `{<object>}` is the object where you are looking for the key, and `<string>` is the string where you are searching for the substring.
  
The arguments for `value` can be of any data type when searching in a list, while in the other two usages it should be a string. For the list and object, it can be an expression that evaluates to a list or an object respectively. For string it should be a string data type or an expression that evaluates to a string.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| value | `<a>`, `string` | Specifies the item you want to check for its presence. This could be any data type or a string. |
| list | `[<a>]` | Specifies the list in which you want to check for the presence of the value. |
| key | `string` | Specifies the key you want to check whether it exists or not in the given object. |
| object | `object` | Specifies the object where you want to check for the presence of a key. |
| string | `string` | Specifies the string in which you want to check for the presence of the value. |

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

The `contains` function can be used for property checking in invariants or properties of a contract. It validates that a given value is present within a list, object or string.

In a list, the function checks if the given value is an element of the list. In an object, it verifies whether a given key exists in the object. For a string, it checks whether the given value (sub-string) is present within the original string.

If a violation is detected, it returns `false`, otherwise it returns `true`. 

In the given code snippets, `contains` is used to enforce that the `target-chain` is included in the `VALID_CHAIN_IDS`. If `target-chain` is not in the list, it will flag an error and display the message "target chain is not a valid chainweb chain id".

Use the `contains` function for property validation when you need to ensure a specified value is included in your data set during execution of your contract.

## Gotchas

When using the function `contains`, one common mistake is not understanding its general functionality across different data types. This function can check whether a list or a string contains a certain value, or if a key is present within an object or map. Knowing the data type and accurate application of this function will aid in avoiding incorrect outputs.

For example, if `contains` is used on a list, it checks for the presence of a value, and in the case of a string, it checks for a substring. When used on an object or map, it checks for the presence of a key, not a value.

A key point to remember is that `contains` function is case sensitive, particularly when it is used with strings. Hence, it returns `false` if the cases of the input string and the searching string do not match, even if the characters are identical.

Lastly, while the `contains` function supports use in invariants and properties, it is crucial to ensure that the data types are compatible, as the function does not perform any implicit type conversion.

