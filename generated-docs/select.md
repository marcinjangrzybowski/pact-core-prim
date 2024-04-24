# select

## Basic syntax

For selecting full rows based on a Boolean condition, use the following syntax:

```pact
(select *table* *where*)
```

Where:
- *table* is the table you want to select rows from.
- *where* is a function that applies to each row to derive a boolean value. The function takes as input an object of the same structure as the rows in the table and returns a condition. If the condition is met, the row is included in the output.

For selecting specific columns from rows that meet a Boolean condition, use:

```pact
(select *table* *columns* *where*)
```

Where:
- *columns* is a list of column names you want to include in the selection. It is specified as a list of strings.

Example:

```pact
(select people ['firstName, 'lastName] (where 'name (= "Fatima")))
(select people (where 'age (> 30)))
```

In these examples, we are selecting rows from the `people` table. The first command returns the `firstName` and `lastName` for people named `Fatima`. The second command returns all columns for people aged over 30.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| table | `table:<{row}>` | Specifies the table from which you want to select rows.  |
| where | `row:object:<{row}> -> bool` | A boolean function to apply to each row to determine inclusion. |
| columns (optional) | `[string]` | An optional list of column names to include in the returned rows. If not specified, full rows are returned. |

## Prerequisites

Before using the `select` function, ensure you have a predefined table or database from which you wish to fetch or select data. The table should have defined rows and columns. You should also have conditions based on which you want to filter or select your rows. These conditions are to be written as boolean expressions. If there are specific columns you want to select, identify them by their string names.

## Return values

The `select` function returns a list of rows or columns from a table based on the specified condition. 

If you specify only the table and a condition in the `where` argument, `select` returns a list of full rows from the table that meet the condition. These returned rows are represented as an array of objects, where each object corresponds to a row. 

If you also specify a list of column names as the `columns` argument, `select` returns a list of objects, where each object contains only the named columns from the rows that meet the condition.

In both cases, the return value is a list that can be useful when you want to retrieve, filter and process specific data from a table.

## Examples

```pact
(select "people" ['firstName,'lastName] (where 'name (= "Fatima")))
```

In the above example, the `select` function is being used to select specific columns (in this case, 'firstName' and 'lastName') from the 'people' table where the name equals "Fatima".

```pact
(select "people" (where 'age (> 30)))
```

In this example, the `select` function is being used without specifying columns to select. This will return all columns from the 'people' table for individuals who are older than 30.

Please note that in both examples, the `where` clause is being used to apply conditions to the rows being selected. The `select` function returns the selected rows as lists of objects.

## Options

N/A

## Property validation

The 'select' function in Pact performs property validation by checking each row in the specified table against the provided 'where' condition. This condition is a function that must return a boolean value. If the 'where' condition applied to the row returns true, the row is included in the returned selection. 

For the columns variant of 'select', the function additionally validates that all specified column names are valid keys in the row objects of the table. It will return an error if any of the specified columns do not exist in the table.

Please note that validation errors will trigger runtime failures, and as such, care must be taken to ensure that the 'where' condition can be safely applied to every row, and when using the columns variant, that all specified columns exist in every row of the table.

## Gotchas

Here are some potential gotchas to consider when using the `select` function:

1. Be careful with the query on `select`. If your conditions in `where` function are not met, `select` will return an empty list. 

2. If you provide an invalid column name to `select`, the function will return a `key not found` error.

3. The argument types given to the `where` clause should match the column types. Mismatch in types could lead to runtime errors.

4. Remember, `select` will not mutate the table. It is simply retrieving data based on the conditions provided.

5. Make sure the table you're trying to select from actually exists, or a `table not found` error will be thrown.

6. The `select` function doesn’t alter the execution of the pact program. Even if the provided data to the `select` function is incorrect, it doesn’t affect the program's state.

