# select-with-fields

## Basic syntax

To use the `select-with-fields` function, you should follow this basic syntax:

```pact
(select-with-fields ['column-name1 'column-name2 ...] 'table-name)
```

In the code above, `select-with-fields` is used to project specified columns as a list of objects from a database table. 

- `'column-name1 'column-name2 ...` is a list of column names you want to project. Each column name must be a symbol.
- `'table-name` is the name of the database table from which you want to project columns, specified as a string.

Here is an example:

```pact
(select-with-fields ['name 'age] 'people)
```

In this example, the `select-with-fields` function will return a list of objects from the 'people' table, each object representing a row and only containing the 'name' and 'age' fields.  

If you use `select-with-fields` function without any filters and column names, it will return the complete records from the specified table. 

```pact
(select-with-fields [] 'people)
``` 

In the above code snippet, `select-with-fields` function will return all records with all fields from the 'people' table.

## Arguments

|  Argument  | Type | Description |
| --- | --- | --- |
|  table   | string | Specifies the name of the table where the function will operate on. |
|   fields  | fields-spec | Reduced field set to be returned by the query. A fields-spec is either a simple field list or an assoc list of pairs with field names and their corresponding column types.|
|  filter   |  bool | An expression that returns a Boolean value. The filter limits the rows on which the function operates.|
|  limit   | integer | Limits the number of rows returned by the query. |
|  columns   |  column-spec | Specifies the columns that the function will return. A column-spec is an association list of column names and column types. |

## Prerequisites

N/A

## Return values

The `select-with-fields` function returns a list of objects. The objects in the list correspond to the rows in the database that match the specified condition. Each object in the list contains only the fields specified in the SELECT clause of the function call. If no rows in the database match the condition, the function returns an empty list. This approach can be used to efficiently query a large quantity of data, while only retrieving the necessary fields from the database.

## Examples

Here are a few examples demonstrating the usage of the `select-with-fields` function:

```pact
(select-with-fields ["name" "age"] "people" (where "age" > 18))
```
The above example will select 'name' and 'age' from the 'people' table where age is more than 18.

```pact
(select-with-fields ["title" "author"] "books" (where "year" = 2005))
```
In this another example, the function will select 'title' and 'author' from the 'books' table where the publishing year is 2005.

```pact
(select-with-fields ["address"] "users" (where "username" = "jdoe"))
```
This last example selects 'address' from 'users' table where the 'username' is 'jdoe'.

Please note that `select-with-fields` only returns the selected fields rather than the entire row from the table. Additionally, the list of fields to be selected is always the first argument. The predicate clause `(where ...)` is used to narrow down the rows selected, and it operates similarly to a filter.

## Options

N/A

## Property validation

N/A

## Gotchas

'N/A'

