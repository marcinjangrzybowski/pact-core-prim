# keylog

## Basic syntax

The `keylog` function can be used to retrieve updates to a specific table for a certain key in transactions that occurred at or after a specified transaction id (TXID). The basic syntax for using the `keylog` function is as follows:

```pact
(keylog table:<{row}> key:string txid:integer)
```

Here's a breakdown of the arguments:

| Argument | Type | Description |
| --- | --- | --- |
| table | table:<{row}> | The table from which updates are to be retrieved. |
| key   | string | The key for which updates are to be retrieved. |
| txid  | integer | The transaction id from which point updates are to be retrieved. |

A real-life example of using `keylog` function is:

```pact
(keylog accounts "Alice" 123485945)
```

In this example, `keylog` function is retrieving updates made to the `accounts` table for the key "Alice" from the transaction with id 123485945 onwards. The updates are returned in a list of objects which are indexed by transaction id.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| table | table:<{row}> | The table in which you want to look for updates. It uses the schema `{row}`. |
| key | string | The key for which you want to retrieve updates. This key corresponds to a specific row in the table. |
| txid | integer | The transaction ID from which you want to start looking for updates. The function will return all updates at or after this transaction ID. |

## Prerequisites

N/A

## Return values

The `keylog` function returns a list of objects representing updates made to a specific table for a given key in transactions at or after the specified transaction ID (txid). Each object in the list is indexed by its transaction ID. This return value can be useful in tracking changes and updates made over time to a particular key in a table.

## Examples

```pact
(keylog 'accounts "Alice" 123485945)
```

In this example, updates to the table 'accounts' for the key 'Alice' in transactions at or after the transaction id '123485945' are returned in a list of objects indexed by transaction id.

## Options

N/A

## Property validation

N/A

## Gotchas

N/A

