# fold

## Basic syntax

The `fold` function in Pact allows you to reduce a list by applying a function to each element and the cumulative result. Here's the basic syntax:

```pact
(fold app:a->b->a init:a [list]:b) -> a
```

In the syntax:

- `app` is a function that takes two arguments: an element from the list and a cumulative result. This function is applied to each element in the list along with the cumulative result.
  
- `init` is the initial value used for the cumulative result. This value should be of the same type as the intended final result.
  
- `[list]` is the list to be reduced. The type of elements in this list should match the second argument type expected by the `app` function.

The fold function will return a single value which is of the same type as `init`.

For instance, if you would like to compute a sum of a list of integers, you can use the `+` function as `app`, 0 for `init`, and your list of integers for `[list]`:

```pact
(fold (+) 0 [100 10 5])
```

In this example, `fold` iteratively applies `+` to each element in the list `[100 10 5]` with the cumulative sum, starting at `0`, and finally returns the total sum, `115`.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| f | <a> y:<b> -> <a> | A function which takes two arguments and returns a single value which will be used as the first element ('accumulator') in the next iteration. |
| a | <a> | The initial value for the function 'f'. This is the 'accumulator' used in the first invocation of 'f'. |
| bs | [\<b>] | A list of elements to apply the function 'f' to. These are the 'values' in the iterations of 'f'. |

## Prerequisites

To use the `fold` function successfully, the user needs an established understanding of iterative functions and collection handling in the Pact programming language. The user should be aware of how to create and manipulate collections, including lists and objects. A basic understanding of a lambda or a function is essential, as it is used in the `fold` function to iteratively apply a function to the elements of a list. Knowledge of different datatypes in Pact can also be useful, as `fold` can work with any datatype for the application function, initial value and collection elements. However, the Pact environment does not require any setup or special module imports for `fold` to operate, it is a built-in function available in any scope.

## Return values

The `fold` function returns the accumulated results of iteratively applying the function on the list elements, starting with the initial value. This resultant value is of the same type as the initial value. The returned value is the final result obtained after all the elements in the list have been processed by the function. The `fold` function is beneficial when you need to reduce a collection of values to a single resultant value, such as calculating the sum of elements in a list or concatenating a sequence of strings.

## Examples

The following examples demonstrate the use of the `fold` function:

Reducing a list of integers by applying a plus operator:

```pact
(fold (+) 0 [100 10 5])
```
In this case, 100, 10, and 5 are added together producing a result of 115. 

You can also use `fold` with other operators:
Multiplying a list of integers together:

```pact
(fold (*) 1 [2 3 4])
```
In this example, we start with 1 and multiply each value in the list (2, 3, 4). The result is 24.

Additionally, `fold` is not limited to numerical operations. Here is an example using `fold` with strings:

```pact
(fold (++) "" ["Hello " "World!" " This " "is " "Pact."])
```
This example concatenates a list of strings into a single string: "Hello World! This is Pact."

For property checking, you can use the `fold` when specifying an invariant or a property to test your code against.

Please make sure that the function you are using as the first argument of `fold` is binary (accepts two parameters). The final output of each step is the input for the next one. 

Please note that examples using specific Kadena repositories are intended to serve as general guidance and may not work without the specific context and data of that repository.


## Options

N/A

## Property validation

The `fold` function can be used for property validation by defining invariants or properties to test your code against. This is useful when you want to incrementally calculate some value or reduce a list based on certain conditions or a particular function. As `fold` iteratively applies a specified function to each element of the list along with the result of the last iteration, this can be helpful in checking cumulative properties.

For instance, you could use a `fold` function to check whether all elements in a list meet a certain property. Alternatively, `fold` could also be used to calculate and check some cumulative or aggregated property of the elements in the list.

If there is an error during the process, the function will stop and return the error. It is necessary to ensure that the function provided with the `fold` complies with the type requirements, i.e., it takes two arguments of any type and returns a result of the same type as the first argument. The initial value provided should also be of the same type as the first argument of the function. 

Remember, as a property validator, `fold` can only test a condition to be validated or refuted, it cannot modify or correct properties.

## Gotchas

- Using `fold` without a valid initial value can lead to unpredictable results. Ensure that your initial value is logical and applicable in the context of your application.
- The function applied must correctly handle the input types provided. Mismatched data types can lead to runtime errors.
- Be aware that the fold function will return the initial value if applied to an empty list. Ensure to handle this case properly in your code.
- Bear in mind the order of arguments in the folding function. The first argument is always the accumulating result, and the second is the current list item. Confusing these can lead to unexpected results.
- `fold` does not provide guarantees about the order of operations, especially in the case of concurrent or parallel programming environments. If the operations have side-effects or depend on certain ordering, `fold` may not behave as expected.

Please always ensure to correctly validate and test your functions under various conditions.

