# install-capability

## Basic syntax

To specify and provision the installation of a managed capability, use the following syntax:

```pact
(install-capability CAPABILITY)
```

In this syntax, `CAPABILITY` is a managed capability that is defined in a `defcap` with a `@managed` tag designating a single parameter to be managed by a specified function.

For example:

```pact
(install-capability (PAY "alice" "bob" 10.0))
```

In the above example, the `PAY` capability along with its parameters `"alice"`, `"bob"`, and `10.0` is being specified for installation.

## Arguments

| Argument   | Type   | Description |
| ---- | ---- | ---- |
| capability | boolean | This argument is a _managed_ capability defined in the `defcap` with the associated '@managed' tag. It designates a single parameter to be managed by a specified function. The capability argument must still be brought into scope using 'with-capability' after install. |

## Prerequisites

Before using `install-capability`, a capability must be defined using a 'defcap' where a '@managed' tag designates a single parameter to be managed by a specified function. This function known as the 'manager function' plays an important role in requesting and handling the capability. The manager function is of type 'managed:<p> requested:<p> -> <p>', where '<p>' indicates the type of the managed parameter. 

For example, for a capability defined as '(defcap FOO (bar:string baz:integer) @managed baz FOO-mgr ...)', the manager function could be '(defun FOO-mgr:integer (managed:integer requested:integer) ...)'. This function will be invoked whenever a capability matching the static parameters is requested and it's the function duty to validate the request and return the new managed value representing the 'balance' of the request. 

Please note that the `install-capability` function also requires signature scope to a managed capability for automatic provision, similar to one installed with this function. Ensure that you have familiarized yourself with the usage of the '@managed' tag and are aware of how to create a manager function, before using `install-capability` function.

## Return values

The `install-capability` function does not return any value. Instead, it performs the function of specifying and provisioning the installation of a managed capability. It’s used mainly for setting up and validating the requested capability. After install, the capability must still be brought into scope using 'with-capability', and at that time the 'manager function' is invoked to validate the request.

## Examples

```pact
(env-sigs [{'key: "keys1", 'caps: [(coin.ROTATE "emily")]}])
(install-capability (ROTATE "emily"))
```

In this example, `install-capability` is used to install a capability that was defined elsewhere. The capability is `ROTATE` and it takes a single parameter, `emily`. The `env-sigs` function is used to specify the signatures for the module in which the capability is defined.

```pact
(install-capability (PAY "alice" "bob" 10.0))
```

In this example, `install-capability` is used to install a capability called `PAY`. This capability takes three parameters: `alice`, `bob`, and `10.0`. `alice` and `bob` are presumably the names of two accounts, and `10.0` is presumably an amount of money to be transferred from `alice` to `bob`.

## Options

N/A

## Property validation

The `install-capability` function requires a 'defcap' capability for execution. The specified 'defcap' capability must contain a '@managed' tag designating a single parameter to be managed by a specified function. Once the capability is installed, the capability should be brought into scope using 'with-capability'. During this process, a 'manager function' is invoked to validate the request. The invoked function should return the new managed value considering the request.

To ensure the correct implementation of the `install-capability` function, an appropriate property validation could include the presence of the '@managed' tag, the functioning of the 'manager function' and correct usage of the 'with-capability' function. Proper usage and results can be validated with the linear logic executed by the 'manager function'.

## Gotchas

1. When using the `install-capability` function, remember that it merely specifies and provisions the install of a managed capability, but the capability still needs to be brought into scope using `with-capability`.

2. The manager function is invoked to validate the request only when the capability is brought into scope. Don't assume that the validation has been done just after you call `install-capability`.

3. Be careful when defining your manager function. It should be of type 'managed:<p> requested:<p> -> <p>', where '<p>' indicates the type of the managed parameter.

4. Also note that the manager function, when called, is passed the current managed value and that of the requested capability. The function should validate the request and return the new managed value representing the 'balance' of the request.

5. Be aware that signatures scoped to a managed capability cause the capability to be automatically provisioned for install, similar to one installed with this function.

6. Make sure that your use of `install-capability` matches the version noted in your program or module. Syntax, usage, and expected results may vary between versions.

