# read-msg-default

## Basic syntax

To use the `read-msg-default` function, use the following basic syntax:

```pact
(read-msg-default key:Key value)
```

In this syntax:

- `key` is a Key that you specify, which can be any acceptable data type.
- `value` is the default value that function returns if the message does not contain the key.

Here is an example:

```pact
(defschema Message
  "Schema representing a simple message with a title and body."
  (title:string
   body:string))

(defun process-message (msg:Message)
  "Processes a message, defaults title if not present."
  (let ((title (read-msg-default 'title "No Title" msg))
        (body (read-msg-default 'body "No Body" msg)))
    (print title)
    (print body)))
```

In this example, if the `msg` object doesn't contain `'title'` or `'body'`, the function `process-message` will print "No Title" and "No Body" respectively.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| key | string | The key for the specific value you want to retrieve |
| default | string | The default value to return in case the key does not exist in the message |

## Prerequisites

N/A

## Return values

The `read-msg-default` function returns the value associated with the given key from the message data. The key for this data is case-sensitive. If no value is found for the provided key, the function returns a default value specified by the user. The return data type depends on the data associated with the key or the default value if no data exists for the key. This return value assists in ensuring that there are no null or undefined values causing unexpected errors in the program by providing a substitute value for missing data.

## Examples

Here are some example scenarios for the `read-msg-default` function:

Scenario 1: Return a default value when the key does not exist in the message

The `read-msg-default` function is particularly useful when you want to provide a default value for a key that might not be present in the message. Here's an example that showcases this:

```pact
(read-msg-default "non-existing-key" "This is a default value")
```

When the key "non-existing-key" does not exist in the message, the function returns: "This is a default value".

Scenario 2: Return the available value for a key in the message

When the key is available in the message, the `read-msg-default` function returns the value of the key, ignoring the default value. Here's an example:

```pact
(read-msg-default "existing-key" "This is a default value")
```

When the key "existing-key" is present in the message with a value "Available value", the function returns: "Available value".


## Options

N/A

## Property validation

N/A

## Gotchas

N/A

