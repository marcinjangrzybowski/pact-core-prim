
# ⚠️ ☠️ 🔮 🤖 CRITICAL DISCLAIMER ⚠️

 
This document is **AUTO-GENERATED** using a Large Language Model. While the generation process employs legacy documentation, code snippets, and human-like AI language processing, it is **NOT GUARANTEED TO BE ACCURATE OR COMPLETE.** The AI is fundamentally limited, being incapable of understanding the nuances of human-written code in the way a skilled developer would. This document exists primarily as an initial draft meant to *assist* technical writers, not to replace their essential work. It is *critical* for all contents presented here to be meticulously reviewed, cross-checked, and validated against the original source code. 🚫 **DO NOT REMOVE** this disclaimer without comprehensive and informed review of the entire document. Proceed with extreme caution! Do not trust this document without verification!

# keys

## Basic syntax

To get all the keys from a table, use the following syntax:

```pact
(keys *table*:table)
```

Here, *table* is the table from which you want to get the keys. 

For example:

```pact
(keys accounts)
```
This would return all keys present in the 'accounts' table.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| table | table: <{row}> | The table from which keys are to be retrieved. It specifies the table you want to retrieve all keys from. |

## Prerequisites

N/A

## Return values

The `keys` function returns a list containing all the keys of the given _table_. The list items are of type `string`. This is particularly useful when iterating over a _table_ or when you need to access all rows (records) in a _table_. Note that the order of keys in the returned list is not guaranteed.

## Examples

```pact
(keys { "Key1": "Value1", "Key2": "Value2", "Key3": "Value3" })
```

In the example above, the function call `keys` will return an array of strings containing all the keys of the given object, i.e., `["Key1", "Key2", "Key3"]`.

```pact
(define user-account-table (read-decimal "user-account-table"))
(keys user-account-table)
```

In this slightly more complex example, we read a table from the database and use the `keys` function to retrieve all the keys in that table. The result will be a list of keys depending on the state of your database.

## Options

N/A

## Property validation

N/A

## Gotchas

The `keys` function does not have any known gotchas or unintuitive behavior associated with it as per the provided legacy documentation and code snippets. It simply returns all keys present in a given table. However, users should be mindful of the fact that the order of keys returned is not guaranteed to be in any specific order.

