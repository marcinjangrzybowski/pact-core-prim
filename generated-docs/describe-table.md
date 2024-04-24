
# ⚠️ ☠️ 🔮 🤖 CRITICAL DISCLAIMER ⚠️

 
This document is **AUTO-GENERATED** using a Large Language Model. While the generation process employs legacy documentation, code snippets, and human-like AI language processing, it is **NOT GUARANTEED TO BE ACCURATE OR COMPLETE.** The AI is fundamentally limited, being incapable of understanding the nuances of human-written code in the way a skilled developer would. This document exists primarily as an initial draft meant to *assist* technical writers, not to replace their essential work. It is *critical* for all contents presented here to be meticulously reviewed, cross-checked, and validated against the original source code. 🚫 **DO NOT REMOVE** this disclaimer without comprehensive and informed review of the entire document. Proceed with extreme caution! Do not trust this document without verification!

# describe-table

## Basic syntax

The `describe-table` function is used to retrieve metadata about a specified table in the form of an object. The object contains 'name', 'hash', 'blessed', 'code', and 'keyset' fields. 

The basic syntax of the function is as follows:

```pact
(describe-table *table*:{row})
```

In the syntax,arg `*table*` is the specific table you want to describe.

For example, if you want to describe a table named 'accounts', you would use the following syntax:

```pact
(describe-table accounts)
```

Important: The function can be used only at the top level and will fail if used within a module.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| table | table:{row} | Represents the table you want to retrieve metadata for. The function will return an object with 'name', 'hash', 'blessed', 'code', and 'keyset' fields derived from this table. Note: This function is top level only and will fail if used in module code. |


## Prerequisites

The `describe-table` function must be used in top-level code only. It cannot be used within module code. This is to ensure it is only used when necessary to retrieve metadata for a specified table. Users must have access rights to the table they wish to describe. Additionally, the table must exist, otherwise the function will fail to retrieve the metadata.

## Return values

The `describe-table` function returns an object containing metadata for the given table. The returned object includes the following fields: 'name' (the name of the table), 'hash' (the unique identifier of the table), 'blessed' (marking whether or not the table is blessed), 'code' (the code that manages the table), and 'keyset' (the set of keys for the table). This returned information can be useful when you need to access detailed information about a specific table within the code execution context.

## Examples

Here are some example usages of the `describe-table` function:

To get the metadata for a table named `accounts`:

```pact
(describe-table accounts)
```

This would return an object with 'name', 'hash', 'blessed', 'code', and 'keyset' fields for the 'accounts' table.

Please note, `describe-table` is top-level only and this function will fail if used in module code.

## Options

N/A

## Property validation

N/A

## Gotchas

The primary gotcha of `describe-table` is its scope of use. It can only be used at the top level. Meaning, invoking it within a module code would result in a failure. This might seem limiting and counter-intuitive especially when one needs to inspect a table metadata from within a module. Therefore, while designing your pact programs, you should place any `describe-table` function calls at the top level to avoid this issue.

