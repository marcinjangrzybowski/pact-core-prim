# enumerate-step

## Basic syntax

The `enumerate-step` function is used to generate a list of integers that start from the initial value and increase by a specific step until the end value.

Here's how you use the `enumerate-step` function:

```pact
(enumerate-step START:integer END:integer STEP:integer)
```

In the syntax:

- `START`: The starting integer value
- `END`: The ending integer value
- `STEP`: The step value which the function will add to every subsequent integer until it reaches the end value.

Keep in mind that the `END` value is exclusive, that means the generated list will contain values up to but not including END.

An example of its usage can be:

```pact
(enumerate-step 1 10 2)
```

This example will return a list of integers starting from 1, with a step of 2 till it reaches 10: `[1 3 5 7 9]`.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| start | integer | Specifies the start value of the enumeration. |
| end | integer | Specifies the end value of the enumeration. |
| step | integer | Specifies the step increment (difference between each return value) in the enumeration. |

## Prerequisites

N/A

## Return values

The `enumerate-step` function returns an enumeration context object that represents a steps iterator from a given start with a specified step size to a given end value. This enumeration context can be used in Pact computation functions that work with collections for iterative operations, giving more control over the iteration sequence. The returned object itself is an internal Pact structure and is not intended to be manipulated directly.

## 
Provide few code examples demonstrating the use of your function. Each example should be contained within the markdown code block: 

'''pact
your function usage example
'''

The examples should be clear and easy to understand. They should demonstrate the use of different arguments or use cases where applicable.


Could not generate content.
## Options

N/A

## Property validation

N/A

## Gotchas

N/A

