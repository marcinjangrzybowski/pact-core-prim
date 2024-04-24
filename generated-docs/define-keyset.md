# define-keyset

## Basic syntax

The `define-keyset` function is used to create a keyset with a specified name, and optionally, a keyset value. Its general syntax is as follows:

```pact
(define-keyset 'keyset-name (read-keyset "keyset"))
```

Here, 'keyset-name' is a string that specifies the name of the keyset you want to create. If a keyset value is not specified, the function reads the name from the message payload as the keyset, similar to 'read-keyset'. 

If the keyset's name already exists, the keyset will be enforced before updating to the new value. 

Let's take a look at a simple example:

```pact
(define-keyset "admin" (read-keyset "keyset1"))
```

In this case, we are defining a keyset named "admin" with a keyset value obtained from reading "keyset1".

Note that this function is for top level only and will fail if used in module code.

## Arguments

| Argument | Type | Description |
| -------- | ---- | ----------- |
| name     | string | The name of the keyset you want to define or update. |
| keyset   | string | (Optional) The keyset you want to associate with the given name. If not provided, the function will read the specified name from the message payload as keyset, similar to 'read-keyset'. |


## Prerequisites

For the `define-keyset` function, the following prerequisites must be met:

- The function should be used at the top level only and will fail if used in module code.
- The keyset name and the keyset to be associated with the name need to be specified. If the keyset name already exists, the current keyset will be enforced before being updated to a new value.
  
Optional: 

- If you do not specify a keyset directly, it can be read from the message payload using the specified keyset name. In this scenario, the behavior is the same as the 'read-keyset' operation.

## Return values

The `define-keyset` function does not return a value. Instead, it performs the action of defining a keyset with the NAME provided and assigning the KEYSET value to it. If keyset NAME already exists, the function performs an enforcement check before updating to the new value. This function is used to define or re-define a keyset in the global keyset registry.

## Examples

```pact
(define-keyset 'admin-keyset (read-keyset "keyset"))
```

The above example defines a keyset called `'admin-keyset'` using the `read-keyset` function. The `"keyset"` string is the name of the message payload containing the keyset data.

```pact
(define-keyset 'coin-operate)
```

In this example, `'coin-operate'` keyset is defined without specifying a keyset. The function will attempt to read `'coin-operate'` keyset from the message payload.


```pact
(env-data { "emily" : ["keys1"], "doug": ["keys2"], "stuart": ["keys3"] })
(env-keys ["keys1", "keys2", "keys3", "keys4"])
(define-keyset 'emily (read-keyset "emily"))
(define-keyset 'doug (read-keyset "doug"))
(define-keyset 'stuart (read-keyset "stuart"))
```

Here multiple keysets are being defined simultaneously. Environment data is set using `env-data`, followed by `env-keys`. After that, three keysets: `'emily'`, `'doug'`, and `'stuart'` are defined using the `define-keyset` function. Each of these keysets is reading data from the corresponding environment data.


## Options

N/A

## Property validation

N/A

## Gotchas

The `define-keyset` has several nuances to remember:

1) This function will fail if used inside a module, it can only be executed at top level.

2) It uses the `read-keyset` function to define its keyset. So, its behavior is dependent on the result of `read-keyset` and how the "keyset" is formatted in the payload.

3) If a keyset with passed name already exists, it will be enforced before updating to its new value, potentially causing execution to halt if the enforcement fails. 

Be sure to thoroughly test your application of `define-keyset` considering these factors to ensure the expected behavior.

