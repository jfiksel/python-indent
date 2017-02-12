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
tuples, or lists).

```r
f <- function(longarg1,
              longarg2, # would have to mash space to get longarg2 here
              longarg3){

            # } <- this is where the closed bracket wants to go
  #<--properly dedents to here
}
```

Without the r-indent package, the second argument would not have been
indented to line up with the first. In addition, the closed bracket would
have been lined up with the arguments, since Atom sets the indentation level
to the second argument after you have mashed the tab/space bar to line
it up with the first argument.

This package should also give you correct indentation
if you are piping together ggplot code
```r
plot <-
  ggplot(df) +
  geom_point()
#<--properly dedents to here
```

or using the piping in the dplyr package
```r
### One way
df <-
  df %>%
  select() %>%
  mutate()
#<--properly dedents to here
### Another way
df <- df %>%
        select() %>%
        mutate()
#<--properly dedents to here
```
after pressing enter at the end of both of these commands, the r-indent package
will take your cursor to the indentation of the line that started these
chained blocks of code, rather than continue with the current indentation.

### TO DO
* Come up with more examples
* Update testing
* Clean up and comment code


There are plenty of other examples for Python (not R yet) (ordinary and extraordinary) in the
[test_file](https://github.com/DSpeckhals/python-indent/blob/master/spec/test_file.py).
