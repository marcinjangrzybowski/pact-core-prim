
# ⚠️ ☠️ 🔮 🤖 CRITICAL DISCLAIMER ⚠️

 
This document is **AUTO-GENERATED** using a Large Language Model. While the generation process employs legacy documentation, code snippets, and human-like AI language processing, it is **NOT GUARANTEED TO BE ACCURATE OR COMPLETE.** The AI is fundamentally limited, being incapable of understanding the nuances of human-written code in the way a skilled developer would. This document exists primarily as an initial draft meant to *assist* technical writers, not to replace their essential work. It is *critical* for all contents presented here to be meticulously reviewed, cross-checked, and validated against the original source code. 🚫 **DO NOT REMOVE** this disclaimer without comprehensive and informed review of the entire document. Proceed with extreme caution! Do not trust this document without verification!

# insert

## Basic syntax

The `insert` function in Pact is used to add an entry in a specified table for a given key of object column data. The function will result in a failure if data already exists for the given key.

Here's the basic syntax:

```pact
(insert tableName keyName rowObject)
```

In the syntax above:

- `tableName` is the name of the table where the entry is to be added
- `keyName` is the key for the object data
- `rowObject` is the object data that is to be inserted in the table under the specified key

The `rowObject` should match the table's column structure.

Here's an example of how the syntax would work:

```pact
(insert accounts "id" { "balance": 0.0, "note": "Created account." })
```

In this example, the function is adding an entry to the accounts table. The key for the entry is "id", and the data object of the entry is `{ "balance": 0.0, "note": "Created account." }`.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| `table` | `table:<{row}>` | Defines the table in which the record will be inserted. |
| `key` | `string` | The key associated with the data that has been inserted. |
| `object` | `object:<{row}>` | The data to be inserted into the table. The data should match the schema of the table.

## Prerequisites

Before using the `insert` function, ensure that you have a defined table in which you want to insert the data. The table should be of the type `table:<{row}>`.

A string `key` must be provided which acts as the identifier for the entry you're creating in the table.

An `object` of the format `object:<{row}>` needs to be supplied as well. This object needs to match the structure of a row in the table in which you're inserting the data, as it will be used to fill the columns of the new entry.

The `insert` function will fail if data already exists for the provided `key`.

Furthermore, as observed from the code snippets, ensure that necessary permissions and checks related to table modification within your application are appropriately handled before calling `insert`.

## Return values

The `insert` function does not return any value. Instead, the main purpose of this function is to insert a new entry into a specified table. If the operation is successful, nothing is returned. However, if an entry already exists for the provided key, the function will throw an error. It should be noted that the absence of a return value does not indicate failure, rather, exceptions are used to indicate failure in the operation. This function is typically useful in contexts where you need to add a new record to a table and ensure that the key for the record is unique.

## Examples

```pact
(insert accounts "id1" { "balance": 100.0, "note": "Created account." })
```
The above example inserts an entry in the 'accounts' table with the key string "id1". The corresponding data object contains a "balance" of 100.0 and a "note" with the value "Created account." The operation would fail if a data entry associated with the key string "id1" already exists in the 'accounts' table.


```pact
(insert coin-table "coin1" 
  { "balance" : 0.0
  , "guard" : 'keyset1
  }
)
```
The above example inserts an entry in the 'coin-table' table with the key string "coin1". The corresponding data object contains a "balance" of 0.0 and a "guard" with the value 'keyset1. The operation would fail if a data entry associated with the key string "coin1" already exists in the 'coin-table' table.


```pact
(insert allocation-table "alloc1" 
  { "balance" : 5000.0
  , "date" : "2020-01-01T00:00:00Z"
  }
)
```
The above example inserts an entry in the 'allocation-table' with the key string "alloc1". The corresponding data object contains a "balance" of 5000.0 and a "date" with the value "2020-01-01T00:00:00Z". The operation would fail if a data entry associated with the key string "alloc1" already exists in the 'allocation-table'.

## Options

N/A

## Property validation

N/A

## Gotchas

## Gotchas

- The `insert` function will fail if data already exists for the specified KEY in the TABLE. Make sure that the key you're inserting does not already exist in the table to avoid this issue.
- The function expects the table and object passed in to have matching data schemas (same fields and corresponding types). Attempting to insert an object with a schema that doesn't match the table's schema will result in an error.

