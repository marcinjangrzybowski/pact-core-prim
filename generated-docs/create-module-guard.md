# create-module-guard

## Basic syntax

To define a guard in the current module admin predicate using the `create-module-guard` function, use the following syntax:

```pact
(create-module-guard 'guard-name)
```

In this syntax, `guard-name` represents the name of the guard you want to create. It should be a string. 

This function does not accept any other arguments.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| name | string | Specifies the name of the guard to be created. This guard enforces the current module admin predicate. |

## Prerequisites

N/A

## Return values

The `create-module-guard` function returns a `guard` object that is defined by the provided NAME and enforces the current module admin predicate. The returned guard can be used in subsequent parts of the pact code to verify and enforce access control mechanisms based on the administrative rules defined in the originating module.

## Examples

```pact
;; Define a function with admin-guard 

(defun admin-only-func ()
  (enforce-guard (create-module-guard 'admin-guard)))

;; Define a module with 'admin-guard as the guard 
(module myModule 'admin-guard)

;; Within this module, any function decorated with 'admin-guard will be admin-only
(defun admin-func ()
  (create-module-guard 'admin-guard)
  (enforce-guard (read-keyset 'admin-keyset)))
```

In this example, `create-module-guard` is used to create a 'admin-guard. This guard is afterwards used to enforce admin only access in the 'admin-only-func function. It is also used as the guard when defining a module. In this module, any function that is decorated with 'admin-guard will be admin only functions.

## Options

N/A

## Property validation

As per the function usage observed, there's no explicit property validation done within the function `create-module-guard`. However, there's an implicit rule that the name provided should uniquely identify a module in the context. This is not checked inside the function itself but may lead to errors if the name cannot be resolved to a unique module. Therefore, it is imperative to ensure that the name argument passed to `create-module-guard` is valid and corresponds to a module. If this is not assured, it can lead to unexpected behavior or runtime failures.

## Gotchas

While using the `create-module-guard`, remember it creates a guard associated with the current module. This might not be intuitive at first as one might assume to be able to create a guard for any module.

Furthermore, when using this function, one should be careful about the context where it is used since the guard is set to enforce the admin predicate of the module it is used in.

There are no reported common errors when using `create-module-guard` correctly but be aware of the mentioned nuances relation to module context. The module guard creation is a powerful mechanism but it also introduces added complexity and potential for errors if misused. Always validate the correct creation and assignment of guards within the context of your module.

