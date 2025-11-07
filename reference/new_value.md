# Generate New Reference Value

Generate a new reference value for a vector.

## Usage

``` r
new_value(x, ..., obs_only = NULL)
```

## Arguments

- x:

  The object to generate the reference value from.

- ...:

  These dots are for future extensions and must be empty.

- obs_only:

  A flag specifying whether to only use observed values.

## Value

A scalar of the same class as the object.

## Details

By default the reference value for double vectors is the mean, unless
obs_only = TRUE, in which case its the median of the unique values. For
integer vectors it's the floored mean unless obs_only = TRUE, in which
case it's also the median of the unique values. For character vectors
it's the minimum of the most common values while for factors it's the
first level. Ordered factors, Dates, times (hms), POSIXct and logical
vectors are treated like integers. The factor levels and time zone are
preserved.

## See also

[`xnew_value()`](https://poissonconsulting.github.io/newdata/reference/xnew_value.md)
and
[`new_seq()`](https://poissonconsulting.github.io/newdata/reference/new_seq.md).

## Examples

``` r
# the reference value for objects of class numeric is the mean
new_value(c(1, 4))
#> [1] 2.5
# unless obs_only = TRUE, in which case its the median of the unique values
new_value(c(1, 4), obs_only = TRUE)
#> [1] 1

# for integer objects it's the floored mean
new_value(c(1L, 4L))
#> [1] 2

# for character objects it's the minimum of the most common values
new_value(c("a", "b", "c", "c", "b"))
#> [1] "b"

# for factors its the first level and the factor levels are preserved
new_value(factor(c("a", "b", "c", "c"), levels = c("b", "a", "g")))
#> [1] b
#> Levels: b a g

# other classes are treated like integers
new_value(ordered(c("a", "b", "c", "c"), levels = c("b", "a", "g")))
#> [1] a
#> Levels: b < a < g
new_value(as.Date(c("2000-01-01", "2000-01-04")))
#> [1] "2000-01-02"
new_value(hms::as_hms(c("00:00:01", "00:00:04")))
#> 00:00:02
new_value(as.POSIXct(c("2000-01-01 00:00:01", "2000-01-01 00:00:04")),
  tzone = "PST8PDT"
)
#> [1] "2000-01-01 00:00:02 UTC"
new_value(c(TRUE, FALSE, TRUE))
#> [1] FALSE
```
