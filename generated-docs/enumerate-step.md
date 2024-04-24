# enumerate-step

## Basic syntax

To use the `enumerate-step` function in Pact, the basic syntax is:

```pact
(enumerate-step integer-start:integer integer-step:integer integer-end:integer)
```

Here: 
- `integer-start` is the initial index number where the loop should start.
- `integer-step` is the number by which the loop index increments on each iteration.
- `integer-end` is the final index number where loop should stop. 

The function generates a list of integers, beginning with `integer-start`, incrementing by `integer-step` and ending at `integer-end`.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| start | integer | Specifies the starting point of the enumeration, represented by an integer. |
| end | integer | Specifies the end point of the enumeration, represented by an integer. |
| step | integer | Specifies the step value for the enumeration. Each subsequent value will be increased by this step amount from the start point until the end point is reached. |

## Prerequisites

N/A

## Return values

The `enumerate-step` function returns a series of tuples. Each tuple contains two elements: the first is a count that starts from 0 and increments by the step value for each item in the list, and the second is the value of the corresponding item in the list. This return format can be particularly useful when dealing with lists where you need to keep track both value and its' ordered position with custom stepping.

## Examples

```pact
(enumerate-step 1 4)
```
Output: `[1 2 3 4]`

Here an enumeration of numbers from 1 to 4 with step size of 1 is performed.

```pact
(enumerate-step 2 7)
```
Output: `[2 4 6]`

Here an enumeration of numbers from 2 to 7 with step size of 2 is performed. Note how 7 isn't included in the list since it's not reachable with step size of 2 from the starting number (2).

```pact
(enumerate-step 10 50)
```
Output: `[10 20 30 40]`

This example enumerates numbers from 10 to 50 with a step size of 10. Note, the ending number 50 isn't included in the list since the function enumerates up to, but not including, the end number.

## Options

N/A

## Property validation

N/A

## Gotchas

N/A

