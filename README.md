# r-indent [![Build Status](https://travis-ci.org/DSpeckhals/python-indent.svg?branch=master)](https://travis-ci.org/DSpeckhals/python-indent)

_Atom with easy indentation for piping R code blocks with dplyr and ggplot2_

This is a fork of [Distuin Speckhals' python-indent](https://github.com/DSpeckhals/python-indent)

![example from python-indent](https://raw.githubusercontent.com/DSpeckhals/python-indent/master/resources/img/python-indent-demonstration.gif)

__R Indent__ is the indentation behavior you've been waiting for in Atom! You should no longer
have to worry about mashing your tab/space/backspace key every time you press `enter` in the middle
of coding. Also, compared to other editors, there is no need to change an app configuration if you
want to have a mixture of different types of indents (namely hanging and opening-delimiter-aligned).

A main obstacle with Atom's native indentation behavior is that it doesn't yet have the necessary
API's to do line up R code chunks when using pipes `%>%` or using the `+`
sign to put together lines of ggplot code. In addition, when using lots of arguments in a function, it is generally recommended that all arguments are
aligned with the opening delimiter, which Atom's native indentation
does not recognize.

- language-python - [Auto indent on line continuation with list/tuple](https://github.com/atom/language-python/issues/22)
- atom - [Autoindent not working properly](https://github.com/atom/atom/issues/6655)

This package was made to give you expected indentation behavior; __r-indent__ listens for
`editor:newline` events in R source files, and when triggered, adjusts the indentation to
be lined up relative to the opening delimiter of the statement _or_ "hanging" (for parameters,
tuples, or lists). In addition, this should give you correct indentation
if you are piping together ggplot code
```r
plot <-
  ggplot(df) +
  geom_point()
```

or using the piping in the dplyr package
```r
### One way
df <-
  df %>%
  select() %>%
  mutate()
### Another way
df <- df %>%
        select() %>%
        mutate()
```
after pressing enter at the end of both of these commands, the r-indent package
will take your cursor to the indentation of the line that started these
chained blocks of code, rather than continue with the current indentation.

### TO DO
* Update examples below
* Update testing
* Clean up and comment code

### Indent Types


  - Aligned with Opening Delimiter

    ```r
    def function_with_lots_of_params(param_1, param_2,
                                     param_3, param_4,
                                     very_long_parameter_name,
                                     param_6)
    ```
  - Hanging

      ```python
      def function_with_lots_of_params(
          param_1, param_2,
          param_3, param_4,
          very_long_parameter_name,
          param_6)
      ```

### Setting
- __Hanging Indent Tabs__: Number of tabs used for _hanging_ indents

### Examples

```python
def current_language_python_package(first_parameter, second_parameter,#<newline>
third_parameter):#<---default Atom language-python
    pass

def with_python_indent_package_added(first_parameter, second_parameter,
                                     third_parameter):
    #<--properly dedents to here
    pass

def with_hanging_indent(
    first_parameter, second_parameter, third_parameter):
    pass

also_works_with_lists = ["apples", "oranges", "pears", "peaches", "mangoes",
                         "clementines", "etc."]#<--PEP8 continued indentation
or_like_this = [
    "apples", "oranges", "pears",
    "peaches", "mangoes", "clementines",
    "etc."
]

```

There are plenty of other examples (ordinary and extraordinary) in the
[test_file](https://github.com/DSpeckhals/python-indent/blob/master/spec/test_file.py).
