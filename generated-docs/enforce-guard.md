# enforce-guard

## Basic syntax

The `enforce-guard` function can be used in two forms: either with a guard or a keyset name. Both methods serve to enforce the desired predicate logic. Here are the basic syntax:

```pact
(enforce-guard *guard*:guard)
```

```pact
(enforce-guard *keysetname*:string)
```

The function takes either a `guard` or a `string` as argument. If a guard is passed, it directly enforces the guard constraint. If a keyset name is passed, it first retrieves the defined keyset using the keyset name, and then enforces that keyset. Make sure that the guard or keyset you want to enforce are correctly defined and present in the current context where the `enforce-guard` is used.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| guard | guard | The guard whose authorization you want to enforce. A guard defines authorization rules which must be met in order to continue a transaction. |
| keysetName | string | The name of the keyset defined within the pact code. The function enforces that the keys provided in the transaction must be a subset of the keys in this keyset. |

Please note that you should use either guard or keysetName argument depending on your requirement.

## Prerequisites

Before using the `enforce-guard` function, ensure that the guard or keyset name you provide exists and is adequately defined to enforce the required logic. The guard could be a keyset name (string) or another guard, usually derived from the `row` or `object` data structure. Be aware that using `enforce-guard` may yield keyset authorization logic, which could halt your transaction if it fails.

## Return values

The `enforce-guard` function does not have a return value. It operates by either enforcing the specified guard condition if it is met or aborting the transaction if it is not met. There is no computation or operation that would produce a predictable return value.

## Examples

```pact
(enforce-guard 'admin-keyset)
```
In the example above, we enforce a guard with the name `admin-keyset`.

```pact
(enforce-guard row-guard)
```
The above example demonstrates enforcement of the `row-guard`.

Here is an example usage within the `DEBIT` defcap in a coin contract:

```pact
(defcap DEBIT (sender:string)
  "Capability for managing debiting operations"
  (enforce-guard (at 'guard (read coin-table sender)))
  (enforce (!= sender "") "valid sender"))
```
In this example above, `enforce-guard` is used to ensure that the guard condition at the provided guard key 'guard' from `coin-table` is met before allowing debiting operations to proceed. 

Here is another example of usage within a coin contract's gas payment operations:

```pact
(enforce (>= bal amount)
 (format "Insufficient gas balance: {} < {}" [bal amount]))
 (enforce-guard g)
 (update ledger user
   {'balance: (- bal amount)})
```

In the example code above, the `enforce-guard` is used to ensure the guard `g` condition is met before updating the ledger balance for a specific user.


## Options

N/A

## Property validation

The 'enforce-guard' function in Pact serves to establish a secure property check by executing the provided guard or a specific keyset. It enforces that the claimed guards or keysets hold, i.e., the query or transaction has the authorization from the claimed guards or keysets. This ensures that unauthorized activities are prevented in the system and transaction security is maintained. 

In performing property validation, 'enforce-guard' primarily checks two conditions:

1. Guard Evaluation: If the passed argument is a guard (like row-guard), 'enforce-guard' checks the authentication result of the guard. The function relay an error if the guard's evaluate fails.

2. Keyset Evaluation: If the passed argument is a keyset name (like 'admin-keyset'), 'enforce-guard' retrieves the keyset by the name and checks its authentication. An error is relayed if this enforcement fails.

If 'enforce-guard' fails to enforce the guard or keyset, it stops the execution of the transaction and returns a false value. 

Please note that using 'enforce-guard' with a non-existence keyset will yield a failure. Use 'keys-authorized' if you need to apply enforcement over a dynamic list of keys.

The usage of 'enforce-guard' should be knowingly because sending guard or keysets into this function can result in granting authorization that you may not have intended to grant in your Pact code.

## Gotchas

Using the `enforce-guard` function requires that the guard to be enforced exists or is defined. If an undefined guard is specified, an error will be thrown. It is important to ensure that required guards are defined and exist within the necessary scope before invoking `enforce-guard`. 

In many cases, `enforce-guard` is used in conditional guards to restrict unauthorized access to functions. If not used appropriately, this may lead to an unintended authorization of access, undermining the security of your implementation. Therefore, accurate definition and enforcement of guards is critical for proper authorization.

It is also worth noting that when you use `enforce-guard` for keysets, the function uses the named keyset as defined at the transaction level and not in the local functional scope. Therefore, redefining the named keyset in a local scope will not change the keyset that `enforce-guard` uses for its operation. 

Finally, when using a data type that is not explicitly a guard or keyset name string as an argument for `enforce-guard`, an error will occur.

Always remember to test your code after implementing `enforce-guard` to ensure that it behaves as expected.

