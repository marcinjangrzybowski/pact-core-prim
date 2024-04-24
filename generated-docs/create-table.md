
# ⚠️ ☠️ 🔮 🤖 CRITICAL DISCLAIMER ⚠️

 
This document is **AUTO-GENERATED** using a Large Language Model. While the generation process employs legacy documentation, code snippets, and human-like AI language processing, it is **NOT GUARANTEED TO BE ACCURATE OR COMPLETE.** The AI is fundamentally limited, being incapable of understanding the nuances of human-written code in the way a skilled developer would. This document exists primarily as an initial draft meant to *assist* technical writers, not to replace their essential work. It is *critical* for all contents presented here to be meticulously reviewed, cross-checked, and validated against the original source code. 🚫 **DO NOT REMOVE** this disclaimer without comprehensive and informed review of the entire document. Proceed with extreme caution! Do not trust this document without verification!

# create-table

## Basic syntax

The `create-table` function is utilized to create a new table in the application. The function is used at top level and will encounter an error if used in module code.

Here is the basic syntax of the `create-table` function:

```pact
(create-table *table_name*:string)
```

The `create-table` function only accepts a singular argument:

- `table_name`: A string that represents the name of the table you want to create.

The function doesn't return any value.

Here are some use case examples:

```pact
(create-table "accounts")

(create-table "registry")
```
In the above examples, `create-table` is used to create new tables named "accounts" and "registry" respectively.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| table | table:<{row}> | The name of the table to be created. The table name must be a valid identifier according to naming conventions of the Pact language. |

## Prerequisites

The `create-table` function can only be run at the top level. It will fail if attempted to be used in module code. This implies that it must be part of a script that's executed independently, and not, for example, called in a user-provided transaction function.

## Return values

The `create-table` function returns the name of the table that was created. The table name is returned as a string and reflects the argument that was passed to the function. This returned value signifies that the table has been successfully created within the contract. Functions that follow in the contract, which are designed to interact with that table, can then proceed.

## Examples

The `create-table` function is used to create a new table in the database. It takes a tablename as its argument. Here are some usage examples:

```pact
(create-table accounts)
```

In this example, `create-table` is used to create a new table called "accounts".

```pact
(create-table coin-table)
```

In this example, `create-table` is used to create a new table called "coin-table".

```pact
(create-table allocation-table)
```

In this example, `create-table` is used to create a new table called "allocation-table".

```pact
(create-table registry)
```

In the last example, `create-table` is used to create a new table called "registry".

## Options

N/A

## Property validation

N/A

## Gotchas

The `create-table` function cannot be used within module code. So make sure to use it only at the top level. Attempting to use it in the wrong scope will result in a failure.

Also, ensure that the table name you are trying to create does not already exist. If a table with the same name already exists, the operation will fail, resulting in a runtime error.

