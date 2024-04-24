# log

## Basic syntax

To calculate the logarithm of a number with a specific base using the `log` function, use the following syntax:

```pact
(log *b*:a<integer,decimal> *x*:a<integer,decimal>)
```

Here, '*b*' is the base of the logarithm, and '*x*' is the number. Both arguments '*b*' and '*x*' can be either integers or decimals.
 
## Overloaded versions

If you have different types for the base or the number, the `log` function provides support with an overloaded version that operates with a mix of decimal and integer types:

```pact
(log *b*:a<integer,decimal> *x*:b<integer,decimal>)
```
On this occasion, '*b*' and '*x*' values are coerced into decimal values to execute the logarithm operation. The result of the operation is a decimal value. 

In both cases, the `log` function is used to compute and return the logarithm (in base '*b*') of '*x*'. 

Here is a simple example:

```pact
(log 2 256)
```
This returns 8, since 2 to the power of 8 equals 256.


## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| b | integer or decimal | The base of the logarithm. |
| x | integer or decimal | The value of which the logarithm is calculated. |

## Prerequisites

N/A

## Return values

The `log` function returns a value representing the logarithm of `y` to the base `x`. The return type is `decimal` if any of the input is of decimal type, otherwise, it's an `integer` if both inputs are integers. This return value is useful in mathematical and scientific computations where logarithmic calculations are required.

## Examples

```pact
(log 2 256) 
;returns: 8
```

In the example above, the log function calculates the log base 2 of 256, which returns 8.

```pact
(log 3 81)
;returns: 4
```

In this example, the `log` function calculates the log base 3 of 81, which returns 4. 

```pact
(log 10 1000)
;returns: 3
```

In this example, the `log` function calculates the log base 10 of 1000, which returns 3.

## Options

N/A

## 
If your function includes any form of property validation, explain it here. Clearly explain the rules that the function follows to verify its arguments and error conditions. If there is no property validation involved in your function, respond with 'N/A'.


Could not generate content.
## 
In this section, discuss any unintuitive behavior, potential pitfalls, or common mistakes to avoid while using your function. Make sure to present this information in a clear and concise manner to help your users avoid these issues. If there are no known gotchas associated with your function, respond with 'N/A'.


Could not generate content.
