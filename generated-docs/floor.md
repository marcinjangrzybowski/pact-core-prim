# floor

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
| x | decimal | The decimal number to be rounded down |
| prec | integer | Optional. Specifies the precision to which the decimal number should be rounded down. If not specified, the function defaults to rounding down to the nearest integer. |


## Prerequisites

N/A

## 
In this section, detail what your function returns. Describe the type and purpose of the returned value, and explain in what context this return value would be useful. 

Remember, this section should not be left empty - if the function does not return anything, clearly state that this is the case.


Could not generate content.
## Examples

Below are examples demonstrating the correct usage of `floor` function in Pact:

To rounds down the decimal value to an integer:

```pact
(floor 3.5)
3
```

You can also specify a precision to which the decimal should be rounded:

```pact
(floor 100.15234 2)
100.15
```

You can enforce precision using the `floor` function:

```pact
(enforce
  (= (floor amount MINIMUM_PRECISION)
     amount)
  (format "Amount violates minimum precision: {}" [amount]))
```

In this example, if the value doesn't meet the precision defined by `MINIMUM_PRECISION` it will fail the enforcement and return an error message. Make sure to replace `amount` and `MINIMUM_PRECISION` with your own variables.

Remember that `floor` can be supported in either invariants or properties.

## Options

N/A

## Property validation

The `floor` function in Pact can be used within property validations in your code. This is especially useful when you need to enforce that certain values conform to specific conditions. 

For instance, you can use the `floor` function to check that a number maintains a minimum precision. This is illustrated in the code snippets provided, where `floor` is used to round down the `amount` to the `MINIMUM_PRECISION`. If the floored amount isn't equal to the original amount, an error message is returned. This helps in ensuring that values are not smaller than a certain precision.

Example:

```pact
(enforce
   (= (floor amount MINIMUM_PRECISION)
      amount)
   (format "Amount violates minimum precision: {}" [amount]))
```

This usage guarantees that the amount doesn't violate the defined minimum precision.

## 
In this section, discuss any unintuitive behavior, potential pitfalls, or common mistakes to avoid while using your function. Make sure to present this information in a clear and concise manner to help your users avoid these issues. If there are no known gotchas associated with your function, respond with 'N/A'.


Could not generate content.
