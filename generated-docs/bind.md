
# ⚠️ ☠️ 🔮 🤖 CRITICAL DISCLAIMER ⚠️

 
This document is **AUTO-GENERATED** using a Large Language Model. While the generation process employs legacy documentation, code snippets, and human-like AI language processing, it is **NOT GUARANTEED TO BE ACCURATE OR COMPLETE.** The AI is fundamentally limited, being incapable of understanding the nuances of human-written code in the way a skilled developer would. This document exists primarily as an initial draft meant to *assist* technical writers, not to replace their essential work. It is *critical* for all contents presented here to be meticulously reviewed, cross-checked, and validated against the original source code. 🚫 **DO NOT REMOVE** this disclaimer without comprehensive and informed review of the entire document. Proceed with extreme caution! Do not trust this document without verification!

# bind

## Basic syntax

The `bind` form is used to evaluate `src` to an object and assign that object to `bindings` for use in subsequent body statements. Here is the basic syntax:

```pact
(bind src:object:<{row}> binding:<{row}>
   body-expression....
)
```

Where:
- `src` is an object to be evaluated.
- `binding` specifies how the properties of `src` will bind to identifiers within the body of `bind`.

Here is an example usage:

```pact
(bind { "a": 1, "b": 2 } { "a" := a-value } 
   a-value
)
```

In this example, `{ "a": 1, "b": 2 }` is the `src` object and `{ "a" := a-value }` is the `binding`. The property `"a"` is bound to the identifier `a-value`. The `a-value` is then accessible within the body of `bind` and the function returns the value `1`. Notice how the symbol `:=` is used for binding in `pact`.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| src | object:{row} | Represents the source object to be evaluated and bound in subsequent statements. |
| binding | binding:{row} | Represents an object which designates how values from the source object should be bound to variables within the function body. These bindings are used in subsequent statements within the function body. |

## Prerequisites

N/A

## Return values

The `bind` function returns a value derived from the bound object. The return value is tied to the expressions in the body of the `bind` form. It can be of any data type, derived from the evaluated expressions or one of the bindings' values.

Bear in mind that the return value isn't necessarily a member of the source object nor a direct result from the bindings but rather, the outcome of the expressions written within the `bind` form which have the ability to utilize the bindings' definitions. This makes the `bind` function very efficient when you want to perform a set of operations on a given object's properties in a defined scope.

## Examples

### Examples

The `bind` function allows us to bind the properties of an object to variable names, such that we can use these variables in the following operations. Here are few examples:

```pact
(bind { "a": 1, "b": 2 } { "a" := a-value, "b" := b-value } (+ a-value b-value))
3
```

In the above example, object `{ "a": 1, "b": 2 }` contains two properties "a" and "b". In the binding, we are associating "a" with `a-value` and "b" with `b-value`. In the following operation, `(+ a-value b-value)`, the `a-value` and `b-value` are replaced with the corresponding values from the object, resulting in `1 + 2`, which equals `3`.

```pact
(bind { "name": "Tom", "age": 30 } { "name" := person-name } person-name)
"Tom"
```

In the above example, object `{ "name": "Tom", "age": 30 }` contains two properties "name" and "age". In the binding, we are only associating "name" with `person-name`. In the following operation, `person-name`, the `person-name` is replaced with the corresponding value "Tom", which results in `"Tom"`.

```pact
(bind { "x": 10, "y": 20 } { "x" := x-coordinate, "y" := y-coordinate } (- y-coordinate x-coordinate))
10
```

In the above example, object `{ "x": 10, "y": 20 }` contains two properties "x" and "y". In the binding, we are associating "x" with `x-coordinate` and "y" with `y-coordinate`. In the following operation, `(- y-coordinate x-coordinate)`, the `x-coordinate` and `y-coordinate` are replaced with the corresponding values from the object, resulting in `20 - 10`, which equals `10`.


## Options

N/A

## Property validation

The `bind` function in pact does not have explicit property validation. However, it's vital to ensure that the arguments given are of correct types. The first argument should be an object with key-value pairs, and the second argument should be a binding object. Ensure that the keys referenced in the binding object are present in the source object; else, the function will fail. It is also important to remember that the bind function will bind keys present in the binding object and ignore any extra keys in the source object. The binding object cannot have additional keys not present in the source object. If any of these conditions are not met, the pact interpreter will throw an error.

## Gotchas

While using `bind`, ensure that the object being bound and the binding are of type `object:<{row}>`. If not, the function won't work as intended and may lead to unexpected results or errors. 

Another common pitfall to avoid is referencing an unbound or incorrectly bound key in the subsequent body statements. Always double-check that your keys match between the source object and the `binding` object.

Moreover, note that it's mandatory to use `:=` operator for binding keys to values in the `bind` function. Using conventional assignment (`=`) will result in syntax errors. 

Lastly, the `bind` function is a special form that doesn't evaluate its arguments in order, unlike most other functions. Be mindful of this when composing complex expressions.

