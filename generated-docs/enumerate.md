## Basic syntax

Use `enumerate` to generate a list of numbers, incrementing from the start number to the end number. If the increment is not given, it is assumed to be 1.

Use the following syntax:
```pact
(enumerate *from*:integer *to*:integer *inc*:integer)
```
`from` specifies the starting point of the enumeration. `to` specifies the end point. `inc` is the increment between numbers in the sequence.

In the case where the increment is not provided, you can use the following simpler syntax:
```pact
(enumerate *from*:integer *to*:integer)
```
Here, assume an increment of 1.

For the above syntax, if the `from` number is greater than the `to` number, it assumes an increment of -1.

```pact
(enumerate 0 10 2)
(enumerate 0 10)
(enumerate 10 0)
```

Remember, if the increment leads to a situation where `from + inc > to` (when `from < to`) or `from + inc < to` (when `from > to`), the function will return a list containing `from`. If the increment equals to zero, the function returns a singleton list containing `from`.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| from | integer | Specifies the beginning of the sequence.|
| to | integer | Specifies the end of the sequence (inclusive). |
| step | integer | (Optional) Specifies the increment between numbers in the sequence. If not provided, defaulted to 1 if `from` is less than `to`, or -1 if `from` is greater than `to`. Zero and numbers which would bypass `to` are also acceptable, but may affect the output differently.|

## Prerequisites

The `enumerate` function does not have any particular pre-requisites as it is a built-in functionality of the language itself. However, to utilize the `enumerate` function, the user must provide at least two integer type arguments. These are 'from' and 'to' which represent the starting and ending points of the sequence to be generated respectively. The third argument, 'step', is optional and it represents the increment between the numbers in the sequence. Its default value if not provided is 1.

## Return values

The `enumerate` function returns a list of integers, which contains a sequence of numbers from the `from` to `to` parameters, inclusive. The sequence increments by the `inc` parameter, if provided, or defaults to 1 if not supplied. The returned sequence can be useful in various contexts, such as generating a range of values for use in loops, mapping, or data initialization. 

Note: If the `from` parameter is greater than the `to` parameter and the `inc` increment is not provided, the list is returned in decreasing order. Furthermore, if the `inc` parameter is such that the next value in the sequence would surpass the `to` parameter (either upwards or downwards), a singleton list containing only the `from` parameter value is returned.

## Examples

The `enumerate` function in Pact is used to generate a sequence of numbers from a starting point (`from`) to an ending point (`to`) with a specified step increment (`step`). 

Here are examples of how the `enumerate` function can be used:

1. To generate a sequence of numbers from 0 to 10 with a step of 2:

    ```pact
    (enumerate 0 10 2)
    ```
    Returns: `[0 2 4 6 8 10]`
   
2. To generate a sequence of numbers from 0 to 10 with a default step of 1:

    ```pact
    (enumerate 0 10)
    ```
    Returns: `[0 1 2 3 4 5 6 7 8 9 10]`
    
3. To generate a reverse sequence of numbers from 10 to 0 with a default step of -1:

    ```pact
    (enumerate 10 0)
    ```
    Returns: `[10 9 8 7 6 5 4 3 2 1 0]`

Additionally, the `enumerate` function can be combined with other functions for more complex operations. For instance, in the following example, `enumerate` is used with `map` and `int-to-str` to generate a list of string representations of numbers from 0 to 19:

    ```pact
    (defconst VALID_CHAIN_IDS (map (int-to-str 10) (enumerate 0 19)))
    ```
    Returns: `["0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14" "15" "16" "17" "18" "19"]`

The `enumerate` function has the following configuration options:

| Option | Type | Description |
| --- | --- | --- |
| from | integer | Determines the integer value to start the sequence from. |
| to | integer | Determines the integer value to end the sequence at. If `from` > `to` and `step` option is not provided, the `enumerate` function will decrement from `from` to `to`. |
| step | integer (optional) | Determines the increment/decrement value between the integers in the sequence. If not provided, the enumerate function will use an increment of 1 or decrement of -1 based on the values of `from` and `to`. |

The `enumerate` function supports property validation within invariants or properties. It verifies the following properties:

1. The `from` and `to` arguments must be integers. The function generates a series of integers from the `from` value up to and including the `to` value.
2. The optional `step` argument must also be an integer which dictates the increment between the numbers in the generated sequence.
3. It guarantees to create a sequence of incremental integer values, including the starting point 'from' and the ending point 'to'. 
4. When `from` and `to` are the same, the function returns a single-element list with this value, disregarding the `step` value.
5. If the `step` value is such that `from` + `step` is greater than `to` (when `from` is less than `to`) or less than `to` (when `from` is greater than `to`), the function returns a single-element list with the `from` value.
6. The function fails when `from` + `step` is less than `to` (when `from` is less than `to`) or greater than `to` (when `from` is greater than `to`).

If the user tries to provide non-integer arguments, or a `step` value which makes the enumeration sequence impossible to construct as per the above rules, the function will return an error.

## Gotchas

- The `enumerate` function will fail if the increment (`inc`) is such that `from` + `inc` < `to` (when `from` is less than `to`) or `from` + `inc` > `to` (when `from` is more than `to`). So be careful while choosing the values for `from`, `to` and `inc`.
- The function expects three arguments `from`, `to` and `inc` where `inc` is optional, thus please ensure not to pass more than three arguments.
- If `from` is equal to `to`, the function will return a singleton list containing `from`, irrespective of `inc`'s value. If `inc` equals zero, the function will return a singleton list containing `from`.
- The increment (`inc`) is assumed to be 1 if not provided. If `from` is greater than `to` and no `inc` is provided, the function assumes a value for `inc` of -1.
- The `enumerate` function is designed to work with integers only, it may return unexpected results if used with other data types. Always ensure the correct data types for `from`, `to` and `inc`.
- As the output of the `enumerate` function is a list, one should be careful while dealing with long ranges. It can result in extremely large lists which can lead to out of memory errors in extreme cases.
- Keep in mind the list indexing nature of Pact where the list starts from index 0.

