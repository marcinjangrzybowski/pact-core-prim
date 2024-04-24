# resume

## Basic syntax

To use the `resume` function in Pact, use the following syntax:

```pact
(resume bindings:<{binding}>)
```

The `resume` function is a special form which binds to a yielded object value from the prior step execution in a Pact command.

You have to provide an argument (bindings) which is a key-value pair. Each key corresponds to a element in the yielded result from a prior step in the command. The value is the name you wish to bind the yielded value to in the context of this step's execution scope.

```pact
(resume
  { "element1" := binding1
  , "element2" := binding2
  ,...
  , "elementN" := bindingN
  })
```

In the above example, "element1" through "elementN" are keys in the yield object, while "binding1" through "bindingN" are the names you wish to bind these values to. Each binding is available for referencing under its given name within the scope of this step's execution.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| binding | object | An object defining the information that the `resume` pact function needs to continue its execution. The keys and values of this object depend on what was yielded in the previous step. Commonly seen keys include "receiver", "receiver-guard" and others depending on the context. |

## Prerequisites

The `resume` function relies on a prior `yield` step within the same function execution that provides the data to be consumed by `resume`. The `yield` function has to be part of the same transaction in the blockchain as `resume`. More concretely, `yield` must have been called to store values in a pact before using `resume` to retrieve them.

## Return values

The `resume` function does not explicitly return any values. Instead, it resumes the deferred execution of a process, using the previously stored state captured in the `yield` step. The actual output of the `resume` function will then depend on the resumed computation that it is triggering. It's worth noting that the yielded state used to resume the execution should have the same chain of origin, otherwise an endorsement via SPV is enforced.

## Examples

```pact
(step
  (resume
    { "receiver" := receiver
    , "receiver-guard" := receiver-guard
    })) 
```
In the above example, `resume` is used in a `step` form to yield execution to a secondary `step` form in a pact. The `resume` function binds to an object containing key-value pairs for `"receiver"` and `"receiver-guard"` which were yielded from the previous step execution.

Note: The `resume` function would be used after a `yield` function in the same `pact` context, which would have previously paused the execution and yielded the values that `resume` is binding to.

```pact
(defpact operation ()
  (step
      (yield
        { "receiver": "receiver-name"
        , "receiver-guard": { "keys": ["some-key"], 
                              "pred": "keys-any"
                            }
        }
      )
  )
  (step
      (resume
        { "receiver" := receiver
        , "receiver-guard" := receiver-guard
        })) 
  )
)
```
In this example, `resume` is used after a `yield` function in a `pact` form named `operation`. The `yield` statement pauses execution and yields key-value pairs for `"receiver"` and `"receiver-guard"` which `resume` then binds to continue the execution of `operation`.

## Options

N/A

## Property validation

In the function `resume`, there is an implicit property validation. The argument to `resume` is expected to be the *binding* object that was yielded in the prior step of the execution. If this is not the case, the `resume` operation will fail. This is an important safeguard to ensure the integrity of the Pact workflow. 

In scenarios where the yield step was executed on a foreign chain, the `resume` function enforces endorsements via Simplified Payment Verification (SPV), providing a further layer of property validation.

In the provided snippets, we can see property validation, where the `resume` function argument is expected to contain the keys `"receiver"` and `"receiver-guard"` within the binding object. In the absence of these keys, the `resume` operation would not be allowed to proceed.

## Gotchas

When using the `resume` function, you should be aware of the following points:

1. If the `yield` function was not executed in the previous step, attempting to `resume` without a `yield` would likely throw an error as there is no yielded value to resume from.

2. `resume` function will not work properly if the yielded object value does not match the specified input in the `resume` function. It should precisely correspond to the values and structure of the yielded object.

3. The `resume` function does not inherently enforce any endorsement checks on its own. Endorsement checks need to manually take place before the `resume` function is called.

4. In a multi-step pact, if a non-last `resume` is not followed by a `yield` in the next step, any yielded values in the `resume` step would not persist to subsequent steps.

5. The `resume` function is typically used within the `step` control structure of a pact. Do remember that the function will fail if used outside this context.

Always ensure to use the `resume` function in the correct manner to avoid undesired behavior or potential errors.

