
# ⚠️ ☠️ 🔮 🤖 CRITICAL DISCLAIMER ⚠️

 
This document is **AUTO-GENERATED** using a Large Language Model. While the generation process employs legacy documentation, code snippets, and human-like AI language processing, it is **NOT GUARANTEED TO BE ACCURATE OR COMPLETE.** The AI is fundamentally limited, being incapable of understanding the nuances of human-written code in the way a skilled developer would. This document exists primarily as an initial draft meant to *assist* technical writers, not to replace their essential work. It is *critical* for all contents presented here to be meticulously reviewed, cross-checked, and validated against the original source code. 🚫 **DO NOT REMOVE** this disclaimer without comprehensive and informed review of the entire document. Proceed with extreme caution! Do not trust this document without verification!

# emit-event

## Basic syntax

To emit a specific event using the `emit-event` function, use the following syntax:

```pact
(emit-event CAPABILITY)
```

Here, `CAPABILITY` is an expression that represents the event being emitted. This capability expression often takes the form of a function call.

Here is an example usage:

```pact
(emit-event (TRANSFER "Bob" "Alice" 12.0))
```
In this example, the `emit-event` function is emitting a `TRANSFER` event, with "Bob", "Alice", and 12.0 being parameters of that event.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| CAPABILITY | capability -> bool | This argument specifies the capability that will be emitted as an event. This should contain an action/functionality that is truthy i.e., evaluates to true. Failures occur when the specified CAPABILITY is not a @managed or @event. |

## Prerequisites

For the `emit-event` function to run successfully, the following prerequisites have to be met:

1. You should have a defined capability on which you would like to emit an event.
2. The capability you have defined should either be @managed or @event.

Note that the `emit-event` function will fail if these prerequisites aren't met.

## Return values

The `emit-event` function does not return any value. Its purpose is to trigger a specified event, with the state change being its primary effect rather than returning a value. If the CAPABILITY specified is not @managed or @event, the function will fail. This function is typically used for logging and auditing purposes.

## Examples

Here are some examples demonstrating the use of `emit-event` function:

```pact
(emit-event (TRANSFER "" "Alice" 50.0))
```

In the above example, we are emitting an event where an amount of 50.0 is being transferred from an empty sender to the receiver "Alice".

```pact
(emit-event (TRANSFER "Bob" "" 100.0))
```

In this example, an amount of 100.0 is being transferred from the sender "Bob" to an empty receiver, representing withdrawal or removal of funds.

```pact
(emit-event (TRANSFER "Charlie" "Diane" 150.0))
```

The above example illustrates an event where an amount of 150.0 is being transferred from the sender "Charlie" to the receiver "Diane". 

Please note that `emit-event` will only successfully emit an event if the capability specified is already managed or considered an event. The `TRANSFER` operation must also be defined in your code.

## Options

N/A

## Property validation

The `emit-event` function checks whether the entered CAPABILITY argument is marked with either `@managed` or `@event`, and it fails if neither of these is present. In the context of Pact, CAPABILITY refers to a defined function that is identified by its type or schema, and it corresponds to a unique permission to perform that action.

It is important to note that the `emit-event` function does not evaluate the body of the CAPABILITY argument but rather, it checks its annotation to ensure that it is either `@managed` or `@event`.

To use `emit-event` for property checking, it can be inserted in an invariant or property block in your code. However you need to ensure that the CAPABILITY argument to `emit-event` is correctly marked with one of the aforementioned annotations. Failing to do so will result in the function failing.

## Gotchas

- The `emit-event` function will fail if the emitted CAPABILITY is not tagged with either @managed or @event.
- The function does not evaluate the body of the capability, but only emits it.
- When misused in contexts where the capability emission is not expected or monitored, it can result in unnoticed operations as it only emits the capability and does not execute it.
- This method should be used carefully to avoid creating confusing behavior in smart-contracts.

