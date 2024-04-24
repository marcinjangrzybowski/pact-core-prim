# keyset-ref-guard

## Basic syntax

The `keyset-ref-guard` is used to create a guard for a keyset that has been registered with `define-keyset`. It's primarily used to store references alongside other guards in the database. 

Here's the basic syntax for the `keyset-ref-guard` function:

```pact
(keyset-ref-guard keyset-ref)
```

The `keyset-ref-guard` function accepts one argument:

- `keyset-ref`: a string that indicates the reference to the keyset you want to create a guard for. 

Here's an example of usage:

```pact
(let ((guard:guard (keyset-ref-guard "your-keyset-ref")))
  (create-account account guard))
```

In this example, `keyset-ref-guard` creates a guard for `"your-keyset-ref"`. This guard is then used in conjunction with the `create-account` function.


## Arguments

| Argument    | Type     | Description                                                                                                                                      |
|-------------|----------|--------------------------------------------------------------------------------------------------------------------------------------------------|
| keyset-ref  | string   | The reference to the keyset that was registered with 'define-keyset'. The function will create a Guard for the keyset associated with this reference.                                              |

## Prerequisites

Before using the `keyset-ref-guard` function, a keyset with the specified keyset-ref must have been defined using the 'define-keyset' function. The function will then create a guard for the registered keyset. If the keyset with the provided keyset-ref has not been defined, the function will not find the keyset and will fail to create the guard.

## Return values

The `keyset-ref-guard` function returns a guard object associated with the specified keyset reference. This guard follows the established rules set by the keyset. If the provided guard is invalid or non-existent within the context of the transaction, the function will result in a failure. This returned guard can then be used to control access and permissions within other parts of your contract, such as restricting certain operations to authorized keys.

## Examples

The `keyset-ref-guard` function is used to create a guard object for a named keyset that can be stored in a database or used as a security measure. In the examples below, assume that `keyset-ref` is a named keyset that has already been defined.

In the first use-case, the `keyset-ref-guard` is used in conjunction with the `create-account` function to create an account using a guard based on the `keyset-ref`. 

```pact
(let
   ((guard:guard (keyset-ref-guard "keyset-ref" )))
   (create-account "new-account" guard)
)
```

Here, a `let` clause is used to bind the guard object created by `(keyset-ref-guard "keyset-ref")` to `guard:guard`. This guard is then passed into `create-account` to create a new account.

In the second use-case, `keyset-ref-guard` is used with `gas-guard` to ensure that a certain transaction is allowed. 

```pact
(gas-guard (keyset-ref-guard "keyset-ref"))
```

In the third use-case, the `keyset-ref-guard` is used to ensure the presence of a certain keyset or to handle its absence.

```pact
(expect 
  "allocation creates empty account"
   {"account" : "brandon", "balance":0.0, "guard":(keyset-ref-guard "brandon")}
   (details "brandon")
)
```

In this case, the guard created by `(keyset-ref-guard "brandon")` is part of an account object, which is expected to create an empty account given that keyset `brandon` is present.

## Options

N/A

## Property validation

N/A

## Gotchas

Currently, there are no known gotchas or pitfalls associated with the `keyset-ref-guard` function when used properly.

However, as a general precaution, ensure that the keyset reference given to `keyset-ref-guard` must have been defined beforehand using 'define-keyset'. If an undefined or invalid keyset reference is provided, `keyset-ref-guard` might lead to undefined behaviour or errors. 

Always ensure that the keyset you are referencing is established and valid in the given context.

