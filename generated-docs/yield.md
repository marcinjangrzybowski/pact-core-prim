
# ⚠️ ☠️ 🔮 🤖 CRITICAL DISCLAIMER ⚠️

 
This document is **AUTO-GENERATED** using a Large Language Model. While the generation process employs legacy documentation, code snippets, and human-like AI language processing, it is **NOT GUARANTEED TO BE ACCURATE OR COMPLETE.** The AI is fundamentally limited, being incapable of understanding the nuances of human-written code in the way a skilled developer would. This document exists primarily as an initial draft meant to *assist* technical writers, not to replace their essential work. It is *critical* for all contents presented here to be meticulously reviewed, cross-checked, and validated against the original source code. 🚫 **DO NOT REMOVE** this disclaimer without comprehensive and informed review of the entire document. Proceed with extreme caution! Do not trust this document without verification!

# yield

## Basic syntax

The `yield` function in Pact allows execution to be paused and resumed with possibly a different entry point to a smart contract. This is mainly used for cross-chain transfers during which the function pauses execution at a certain point on one chain (the "yield"), and then it resumes on another chain (the "resume").

## Basic Syntax

```pact
(yield object)
```

The `yield` function takes an `object` parameter which is the state that is to be yield until the smart contract is resumed. 

```pact
(yield { "amount": 100.0 })
```

Optionally, you can also specify a target chain as a second argument. This targets a subsequent step to execute on the specified chain.

```pact
(yield object target-chain)
```

The `target-chain` is a string that represents the id of the chain you want to switch to.

```pact
(yield { "amount": 100.0 } "some-chain-id")
```

It's important to note that the yielded object will be usable with 'resume' in the following pact step.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| object | object | An object which you want to yield for use with the 'resume' in the following step. |
| target-chain (optional) | string | An optional string argument which allows you to target the next step to execute on a designated chain using automated SPV endorsement-based dispatch. |

## Prerequisites

Before using the `yield` function, ensure that the object argument and optional target-chain string are defined. The object argument usually corresponds to data that needs to be passed to the next pact step. The target-chain string, if used, defines a target chain for the subsequent step to execute an automated SPV endorsement-based dispatch. In the absence of a target-chain, the `yield` function would operate on the same chain. Familiarity with the flow of transactions within the smart contract and the workings of crosschain transfers can also be beneficial when using `yield`.

## Return values

The `yield` function returns the same object that is passed into it as an argument. The return value is an object that is intended to be used with the `resume` function in the subsequent step of the pact execution. This object could contain information relevant to the current transaction or any data that needs to be carried over to the next step. This will be particularly useful in scenarios where there is a need to process data or manage states across multiple steps.

If an optional argument of `target-chain` is present, the function targets the subsequent step to execute on the specified chain using automated SPV endorsement-based dispatch. However, the return value remains the same object passed to `yield`.

## Examples

Here are some examples demonstrating the use of the `yield` function:

```pact
(yield { "amount": 100.0 })
```
In this example, the "amount" object is being yielded for use with 'resume' in the subsequent Pact step. This will allow the "amount" to be utilized in the next interaction.

```pact
(yield { "amount": 100.0 } "some-chain-id")
```
In this case, an additional argument is provided to identify the chain where the upcoming steps are intended to execute. 'some-chain-id' is intended to target the step to be executed on the referring chain using automated SPV endorsement-based dispatch.

```pact
(expect-failure
  "create side of cross-chain transfer fails yield on wrong chain"
  "yield provenance"
  (continue-pact 1 false (hash "burn-create")
    { "create-account": 'doug
```
This example showcases the use of `yield` within a failure expectation. The assertion predicts the failure of a yield operation in a cross-chain transfer due to a wrong chain. The `yield` error message signifies the provenance of the yield operation is faulty.

## Options

N/A

## Property validation

The `yield` function does not expressly contain property validation within its function. However, it's utilized in scenarios requiring the temporary suspension of a transaction for a later step, particularly in cases of inter-chain transfers. In such scenarios, data validation might be necessary to ensure the correct transaction execution.

For instance, in the code snippet `(yield crosschain-details target-chain)`, the `yield` function is used to store `crosschain-details` for subsequent operations in another chain specified by `target-chain`. Here, validation of the `target-chain` id and `crosschain-details` might be necessary.

In error handling cases, the usage of `yield` in the `expect-failure` function, as seen in various coin contract cases, shows it being used to check for potential transaction execution errors.

However, such validation would not be contained within the `yield` function but would be part of the broader program logic where `yield` is utilized. Therefore, explicit property validation for `yield` is N/A.

## Gotchas

While using `yield`, keep in mind that:

1. `yield` is commonly used in a multi-step or multi-chain transaction process. Understanding the whole flow and dependency among related contract functions is essential.

2. Be careful with the target-chain argument. If you plan to use a multi-chain transaction, you should provide the correct target chain ID. Incorrectly specifying a chain ID results in errors or unexpected results.

3. Ensure that the schema for the yielded object (often defined via `defschema`) correctly defines all the necessary fields and their types. Inconsistencies in the schema or unexpected formats in OBJECT may lead to failure when attempting to `resume` the yielded pact.

4. The yielded OBJECT in a Pact step is also tracked for provenance, meaning any unauthorized modifications can potentially cause process termination or unexpected behavior.

Remember, `yield` and its counterpart `resume` are powerful tools for orchestrating complex transactions but they require careful handling. They are inherently stateful which can introduce additional complexity.

