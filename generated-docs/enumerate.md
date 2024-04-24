# enumerate

## Basic syntax

To utilize the `enumerate` function, use the following syntax:

```pact
(enumerate *from*:integer *to*:integer *step*:integer)
```
`from`: an integer value to specify the beginning of the integer sequence.

`to`: an integer value to specify the end point of the integer sequence.

`step`: an optional integer value to determine the increment of the integer sequence. The default value is 1. 

This function generates a list of integers from `from` to `to` with increments specified in `step`. For instance, if you wanted to generate all the integers from 5 to 15 with increment of 2, you'd perform it as follows:

```pact
(enumerate 5 15 2)
```

If `step` is not specified, it defaults to 1. Here's another example where `step` isn't provided:

```pact
(enumerate 5 15)
```

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| from | integer | The starting number of the sequence |
| to | integer | The ending number of the sequence |
| inc | integer | The increment between numbers in the sequence. This is optional. If not given and 'from' is less than 'to', 'inc' is assumed to be 1. If not given and 'from' is more than 'to', 'inc' is assumed to be -1. If 'inc' is 0, the function will return a list containing just 'from'. If 'from' + 'inc' results in a value outside of 'to', the function will return a list containing just 'from'. |

## Prerequisites

N/A

## Return values

The `enumerate` function returns a list of integers. Each integer in this list forms a sequence that starts from the 'from' parameter, ends at the 'to' parameter, incremented by the 'step' parameter value. If 'step' is not provided, the function increments by 1. This return value is useful when you need a range of numbers with a specific increment. Exceptionally, if 'from' equals 'to', the function returns a list with a single element being 'from', despite the 'step' parameter's value. Similarly, when the 'step' parameter is zero, the function yields a list with a single element being 'from'.

## Examples

```pact
(enumerate 0 10 2)
```

Returns a list of integers from 0 to 10, with an increment of 2. The returned list is `[0, 2, 4, 6, 8, 10]`.

```pact
(enumerate 0 10)
```

Returns a list of integers from 0 to 10, with a default increment of 1. The returned list is `[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.

```pact
(enumerate 10 0)
```

Returns a list of integers from 10 to 0, with the default de-increment of 1 because the start number is greater than the end number. The returned list is `[10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0]`.

```pact
(defconst VALID_CHAIN_IDS (map (int-to-str 10) (enumerate 0 19)))
```

In this example, `enumerate` is used to generate a list of numbers from 0 to 19, which are then converted to strings. The resulting `VALID_CHAIN_IDS` list is `["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19"]`.

## Options

N/A

## Property validation

In the case of the `enumerate` function, property validation is implicitly performed on the provided arguments: `from`, `to`, and `step`.

1. `From` and `to` should be integers. If these are not provided or cannot be parsed as integers, the function will fail.

2. `Step`, though optional, should also be provided as an integer. If it is omitted, it defaults to 1, or -1 if `from` is greater than `to`.

3. If `step` is specified as zero, or if it is such that `from` + `step` does not fall within the `from`...`to` range, the function will only return the singleton list containing `from`.

4. If `from` equals `to`, the function will return a singleton list with the value of `from` irrespective of the `step` value.

In the context of property testing, `enumerate` can be used in both invariants and properties.
For example: 

```
(defconst VALID_CHAIN_IDS (map (int-to-str 10) (enumerate 0 19))
```

In this code snippet extracted from our repository, `enumerate` is used to generate a list of valid chain ID numbers. This invariant ensures that chain ID numbers will always be within the specified numeric range.

## Gotchas

- The `enumerate` function can fail if the `inc` parameter is set such that `from + inc` is less than `to` when `from` is less than `to`, or such that `from + inc` is greater than `to` when `from` is greater than `to`.
- If `from` equals `to`, the function will return a single-element list containing `from`, regardless of the `inc` parameter value.
- If `inc` equals zero, the function will return a single-element list containing `from`. Therefore, it is important to ensure `inc` is not set to zero when a sequence is expected.
- When the `inc` parameter is not provided and `from` is greater than `to`, the function will assume a decrement value of -1 by default, which may create a descending sequence which could be unexpected.
- The output is highly dependent on the interplay of the `from`, `to` and `inc` parameters. Misunderstanding their influence on each other can lead to erratic output.

