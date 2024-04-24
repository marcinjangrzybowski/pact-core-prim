
# ⚠️ ☠️ 🔮 🤖 CRITICAL DISCLAIMER ⚠️

 
This document is **AUTO-GENERATED** using a Large Language Model. While the generation process employs legacy documentation, code snippets, and human-like AI language processing, it is **NOT GUARANTEED TO BE ACCURATE OR COMPLETE.** The AI is fundamentally limited, being incapable of understanding the nuances of human-written code in the way a skilled developer would. This document exists primarily as an initial draft meant to *assist* technical writers, not to replace their essential work. It is *critical* for all contents presented here to be meticulously reviewed, cross-checked, and validated against the original source code. 🚫 **DO NOT REMOVE** this disclaimer without comprehensive and informed review of the entire document. Proceed with extreme caution! Do not trust this document without verification!

# compose-capability

## Basic syntax

For specifying and granting a capability within a defcap body, use the following syntax:

```pact
(compose-capability *capability*)
```

Here, `*capability*` is the capability that you wish to compose with the outer capability. The function is typically used within a `defcap` body, which you define in your code. It is used to grant the inner capability (`*capability*`) within the scope of the outer capability. 

If `compose-capability` is invoked multiple times, each of the composed capabilities are granted. It means you can request multiple capabilities within a single environment. 

For example:
```pact
(defcap TRANSFER (src dest) 
  (compose-capability (DEBIT src)) 
  (compose-capability (CREDIT dest))
  )
```
In the code snippet above, both DEBIT and CREDIT capabilities are composed within the TRANSFER capability. Whenever TRANSFER capability is invoked, both DEBIT and CREDIT capabilities are also granted.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| capability | boolean | This is a boolean value that represents the application of a 'defcap' production. The `capability` value is used in the composition of inner and outer capabilities. |


## Prerequisites

Prerequisites for using the `compose-capability` function are:
- The function is only valid within a distinct 'defcap' body. It is not applicable outside of a 'defcap' context.
- The CAPABILITY being passed into `compose-capability` must be a valid application of a 'defcap'. 
- Ensure that the 'defcap' to be composed is defined before using `compose-capability`. 

Please note that improper usage of `compose-capability` could result in fail to import necessary capabilities which could potentially impede the execution of your program.

## Return values

The `compose-capability` function does not return a value itself. Its main purpose is to grant specific capabilities for a defined capability within a distinct body of code. This function is used to import and provide additional capabilities to a capability context. Although it doesn't produce a return value, its impact can be observed in the governing permissions within a code scope where it is implemented.

## Examples

Here are a few examples demonstrating the use of the built-in `compose-capability` function.

Example 1: 

Here is an example usage of the `compose-capability` where we are composing the `DEBIT` capability with the sender:

```pact
(compose-capability (DEBIT sender))
```

Example 2:

In this example, `CREDIT` capability is composed with the receiver:

```pact
(compose-capability (CREDIT receiver))
```

Example 3:

The `compose-capability` function can also be used within condition statements. The following example checks if the amount is greater than 0.0, and if true, `DEBIT` capability is composed with the sender:

```pact
(enforce (> amount 0.0) "Positive amount")
(compose-capability (DEBIT sender))
``` 

You can use `compose-capability` to combine capabilities that are relevant to a particular action, creating a meaningful context for that action. This makes the execution of the action safer, ensures the enforcement of necessary constraints and makes the code easier to reason about.

## Options

N/A

## Property validation

N/A

## Gotchas

1. The `compose-capability` should only be used within the body of a 'defcap' definition, misuse outside of a 'defcap' body can lead to undesired behaviour.

2. Keep in mind that when `compose-capability` is used within a nested 'defcap' body, it will "import" the capabilities of the specified 'defcap' into the scope of the surrounding 'with-capability' call. Misunderstanding or misuse of this behaviour can result in subtly incorrect capability handling.

3. `compose-capability` does not itself grant the specified capability, but rather requests its grant. Ensuring that such capability is successfully granted is up to the calling context.

4. The capabilities composed with `compose-capability` will only be valid and accessible for the lifespan of the 'defcap' body in which the `compose-capability` was called. They will not be available outside of this scope.

5. Be aware of the order in which you compose capabilities, as this may affect the execution of your program.

