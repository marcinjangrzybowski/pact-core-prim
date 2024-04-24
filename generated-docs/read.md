
# ⚠️ ☠️ 🔮 🤖 CRITICAL DISCLAIMER ⚠️

 
This document is **AUTO-GENERATED** using a Large Language Model. While the generation process employs legacy documentation, code snippets, and human-like AI language processing, it is **NOT GUARANTEED TO BE ACCURATE OR COMPLETE.** The AI is fundamentally limited, being incapable of understanding the nuances of human-written code in the way a skilled developer would. This document exists primarily as an initial draft meant to *assist* technical writers, not to replace their essential work. It is *critical* for all contents presented here to be meticulously reviewed, cross-checked, and validated against the original source code. 🚫 **DO NOT REMOVE** this disclaimer without comprehensive and informed review of the entire document. Proceed with extreme caution! Do not trust this document without verification!

# read

## Basic syntax

To retrieve the row from a table for a specified key, use the `read` function with the following syntax:

```pact
(read accounts key)
```

In this case, `accounts` is the table from which the row is being read and `key` is the specific identifier of the row to be returned. Ensure that `key` is given as a `string`.

If you only want specific columns from the row, you can specify them as a list with the `columns` argument like so:

```pact
(read accounts key ['balance 'ccy])
```

In this case, only the 'balance' and 'ccy' columns would be returned for the row. If the `columns` parameter is not provided, all columns will be returned. 

Note: All column names must be provided as `string` types within the list.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| table | table:{row} or string | Specifies the table from which to read. Can be a table object or a string representing the table's name. |
| key | string | The identifier of the row to be read. It is the indexing value by which entries in the table are differentiated. |
| columns (optional) | list [string] | A list of specific columns to return from the row. If not provided, all columns from the row will be returned. |


## Prerequisites

To use the `read` function in your Pact code, you must have an existing table or object from which data can be read. The key for the data to be retrieved must be known and it should refer to an actual entry within the table or object. The data types of the arguments must also match those expected by the function i.e., the table or object name must be a string and key must be of the appropriate datatype for that table or object.

## Return values

The `read` function returns an object of type `{row}` extracted from the specified table on the basis of the key or keys provided. If specific columns are specified, the `{row}` object will only contain the values for those columns.

This function is useful in numerous situations where there is a need to fetch data stored in a specific row of a table. The data fetched in this manner can be used for various scenarios from simple retrieval and display to complex manipulations or computations.

Note: In the cases where there is no matching row in the table for the specified key or keys, the `read` function will return an empty object.

## Examples

```pact
(read myTable "myKey")
```
This example reads the row from table 'myTable' for key 'myKey', returning the respective database record object.

```pact
(read myTable "myKey" ['column1 'column2])
```
In this example, the function reads the row from table 'myTable' for key 'myKey', but instead of returning the full database record object, it only returns the specified columns: 'column1' and 'column2'.

```pact
(read t r)
```
This function reads the value before or after a transaction, where 't' is a table or a string, and 'r' is a string. This function can only be used in properties.

## Options

N/A

## Property validation

The `read` function in Pact can be used in property testing for invariant enforcement. By enabling the retrieval of database records, it aids in validating various conditions that may be defined within a contract. For example, ensuring that a user's balance does not fall below a certain value or that a transferred amount does not exceed the sender's balance. It can also be used to check for attribute existence in a database record.

`read` performs a lookup in the specified table with the provided key. If the key does not exist, the function will result in failure. It's important to note that invalid table or key arguments will also cause the function to fail.

In terms of property validation, the arguments passed to the `read` function need to fulfill the requirement of referencing an existing table and key. Particularly, the table needs to be a valid object with the `{row}` format, and the key needs to be of a `string` type.

Since `read` function inherently checks whether the provided arguments reference an existing record, it implicitly performs property validation, and could be used to ensure correctness of your contract's state.

## Gotchas

Here are some of the potential issues or confusion points that users may encounter whilst using the read function:

1. Non-existent keys: If you attempt to read a key that doesn't exist in the TABLE, the read operation will return an error. Always ensure that the key you wish to read is present in the TABLE.

2. Type mismatches: The read function requires you to pass an object key and a string for the TABLE. Be sure to input the arguments according to the specified types; otherwise, a type mismatch error will occur.

3. Transaction time: The `time` argument in the legacy documentation pertains to reading a value before or after a transaction. This is specific to properties, and if used elsewhere, it might not function as intended.

Please note that the behavior might vary depending on the context in which the `read` function is used. Always refer back to the corresponding section in the documentation for the specific use case you are working with. 

During testing or development, consider using test cases to confirm the functionality of the `read` function within your specific use case.

