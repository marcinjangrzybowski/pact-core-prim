# zip

## Basic syntax

The basic syntax for the `zip` function in Pact involves passing the function to be applied, and the two lists to be combined, as arguments. Here's the syntax template:

```pact
(zip function-to-be-applied list1 list2)
```

Here, `function-to-be-applied` is a function that will be applied pair-wise to the elements from `list1` and `list2`. `list1` and `list2` are lists of values that the `function-to-be-applied` can operate on. The length of the produced list is equal to the length of the shorter of the two input lists.

Here's an example:

```pact
(zip (+) [1 2 3 4] [4 5 6 7])
```

In this example, `(+)` is the function being applied to corresponding elements from both lists ([1 2 3 4] and [4 5 6 7]). The resulting list is [5 7 9 11] which is the sum of corresponding elements from the input lists.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| f | function | Function f representing the operation to be applied to the corresponding elements of list1 and list2. This function takes two arguments, where the first is of any type a and the second of any type b, and returns a value of any type c.
| list1 | list | A list of elements of any type a for function f to operate on. | 
| list2 | list | A list of elements of any type b for function f to operate on. Function f will be applied to the corresponding elements of list1 and list2. |

## Prerequisites

N/A

## Return values

The `zip` function returns a new list that is the result of applying the specified function to pairs of elements from the two input lists. The length of the returned list will be equal to the length of the shortest input list. If one list is shorter, the excess elements of the longer list are disregarded. The type of the elements in the new list will depend on the function used to combine the elements of the input lists. This function is useful when you need to combine two lists in a way that involves more than just concatenating them, for example, adding corresponding elements or pairing elements into sublists or objects.

## Examples

Here are a few examples demonstrating the `zip` function usage in different scenarios:

```pact
(zip (+) [1 2 3 4] [4 5 6 7])
```
Output: [5 7 9 11]

In the above example, two lists are being combined using the addition `(+)` operator. Each corresponding pair of elements from the two lists are added together to form a new list.

```pact
(zip (-) [1 2 3 4] [4 5 6])
```
Output: [-3 -3 -3]

In this example, a subtraction `(-)` operator is used to combine two lists. The function subtracts elements of the second list from the corresponding elements of the first list.

```pact
(zip (+) [1 2 3] [4 5 6 7])
```
Output: [5 7 9]

In this case, the two lists have a different number of elements. The `zip` function combines elements of both lists up to the length of the shortest list.

```pact
(zip (lambda (x y) { 'x: x, 'y: y }) [1 2 3 4] [4 5 6 7])
```
Output: [{"x": 1,"y": 4} {"x": 2,"y": 5} {"x": 3,"y": 6} {"x": 4,"y": 7}]

In this example, `zip` is used with a function that takes two arguments and returns an object. Each pair of elements from the two lists is used to create an object with properties `'x'` and `'y'`. The resultant list consists of these objects.

## Options

N/A

## Property validation

In the `zip` function, property validation ensures that the arguments input correspond with the specified type. The first argument should be a function, while the second and third arguments should be lists. If any of the arguments are not of their specified type, the `zip` function will return an error. 

The `zip` function ensures that the function `f` can be applied to elements of the two input lists - if not, an error is returned. This ensures that the resulting list elements are of the correct, expected type. 

Finally, the `zip` function also validates that the two lists are of sufficient length for pairing. The function will only pair up to the length of the shortest list - any extra elements in a longer list will be disregarded. This prevents out-of-bounds errors during the execution of the `zip` function.

## Gotchas

The main gotcha to consider when using the `zip` built-in function is that it combines two lists based on the size of the shortest list. It will ignore any additional elements in the longer list. This might result in unexpected outcomes if the function is used on lists of unequal lengths unknowingly. Therefore, always make sure that the lists being combined with `zip` have the same length to ensure expected behavior.
  
Also, note that `zip` is not a variadic function. It only works with two lists. Attempting to use `zip` with more or less than two arguments will result in an error.

Finally, remember that the first argument of `zip` is a function that should accept two arguments - the current elements of the two lists being zipped. A common mistake is to pass a function that takes less or more than two arguments, which will result in an error.

