# str-to-list

## Basic syntax

To convert a string into a list of single-character strings with the `str-to-list` function, use the following syntax:

```pact
(str-to-list *string*)
```
Where, *string* (required) is the input string that you want to convert. The input string can be formed from any set of characters, and the function will return a list of strings where each string represents a single character from the input.

For example:

```pact
(str-to-list "hello")
```
The above example will return `["h" "e" "l" "l" "o"]`.

## Arguments

| Argument | Type | Description |
| --- | --- | --- |
| str | string | The string that you want to convert into a list of single-character strings. |

## Prerequisites

N/A

## Return values

The `str-to-list` function returns a list of single character strings derived from the input string. Each character in the input string is converted into a string and these strings are collectively returned as a list. For instance, an input of "hello" would return ["h", "e", "l", "l", "o"]. The return value is useful when individual characters of a string need to be processed or manipulated separately.

## Examples

The `str-to-list` function can be used to transform a given string into a list of single character strings. Here are some examples:

The following example returns a list of character strings from a single string:

'''pact
(str-to-list "hello")
["h" "e" "l" "l" "o"]
'''

The `str-to-list` function allows manipulation of the string as a list. Here is an example where each character is separated with a space:

'''pact
(concat (map (+ " ") (str-to-list "abcde")))
" a b c d e"
'''

Notice how each character of the original string is now an entity of its own within a list and the original order is preserved. This allows flexibility of further manipulation of the string, as demonstrated above.

## Options

N/A

## Property validation

N/A

## Gotchas

While using the `str-to-list` function, it's vital to remember that it operates strictly on strings. If you pass non-string arguments, unexpected behavior or function errors may occur. 

Also, this function breaks down the input string into its constituent characters, creating a list of single-character strings. It would not return a list of words from a sentence, for instance. Misinterpreting this behavior might lead to incorrect implementation.

Lastly, special characters in the string will be treated as individual elements when transforming into a list. It's crucial to consider this when working with strings that may contain punctuation or other special characters. 

Please keep these points in mind while utilizing `str-to-list` function to avoid any potential issues.

