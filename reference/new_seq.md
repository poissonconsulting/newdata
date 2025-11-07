# Generate New Sequence

Generate a new sequence of values. A sequence of values is used to
predict the effect of a variable.

## Usage

``` r
new_seq(x, length_out = NULL, ..., obs_only = NULL)

# S3 method for class 'logical'
new_seq(x, length_out = NULL, ..., obs_only = NULL)

# S3 method for class 'integer'
new_seq(x, length_out = NULL, ..., obs_only = NULL)

# S3 method for class 'double'
new_seq(x, length_out = NULL, ..., obs_only = NULL)

# S3 method for class 'character'
new_seq(x, length_out = NULL, ..., obs_only = NULL)

# S3 method for class 'factor'
new_seq(x, length_out = NULL, ..., obs_only = NULL)

# S3 method for class 'ordered'
new_seq(x, length_out = NULL, ..., obs_only = NULL)

# S3 method for class 'Date'
new_seq(x, length_out = NULL, ..., obs_only = NULL)

# S3 method for class 'POSIXct'
new_seq(x, length_out = NULL, ..., obs_only = NULL)

# S3 method for class 'hms'
new_seq(x, length_out = NULL, ..., obs_only = NULL)
```

## Arguments

- x:

  The object to generate the sequence from.

- length_out:

  The maximum length of the sequence.

- ...:

  These dots are for future extensions and must be empty.

- obs_only:

  A flag specifying whether to only use observed values.

## Value

A vector of the same class as the object.

## Details

By default the sequence of values for objects of class numeric is 30
evenly space values across the range of the data. Missing values are
always removed unless it's the only value or the object is zero length.
The length of the sequence can be varied using the `length_out` argument
which gives the reference value when 1 and can even be 0. For integer
objects the sequence is the unique integers. For character objects it's
the actual values sorted by how common they are followed by their actual
value. For factors it's the factor levels in order with the trailing
levels dropped first. For ordered factors the intermediate levels are
dropped first. For Date vectors it's the unique dates; same for hms
vectors. For POSIXct vectors the time zone is preserved. For logical
objects the longest possible sequence is `c(TRUE, FALSE)`.

## Methods (by class)

- `new_seq(logical)`: Generate new sequence of values for logical
  objects

- `new_seq(integer)`: Generate new sequence of values for integer
  objects

- `new_seq(double)`: Generate new sequence of values for double objects

- `new_seq(character)`: Generate new sequence of values for character
  objects

- `new_seq(factor)`: Generate new sequence of values for factors

- `new_seq(ordered)`: Generate new sequence of values for ordered
  factors

- `new_seq(Date)`: Generate new sequence of values for Date vectors

- `new_seq(POSIXct)`: Generate new sequence of values for POSIXct
  vectors

- `new_seq(hms)`: Generate new sequence of values for hms vectors

## See also

[`new_value()`](https://poissonconsulting.github.io/newdata/reference/new_value.md)
and
[`new_data()`](https://poissonconsulting.github.io/newdata/reference/new_data.md).

## Examples

``` r
# by default the sequence of values for objects of class numeric
# is 30 evenly space values across the range of the data
new_seq(c(1, 4))
#>  [1] 1.000000 1.103448 1.206897 1.310345 1.413793 1.517241 1.620690 1.724138
#>  [9] 1.827586 1.931034 2.034483 2.137931 2.241379 2.344828 2.448276 2.551724
#> [17] 2.655172 2.758621 2.862069 2.965517 3.068966 3.172414 3.275862 3.379310
#> [25] 3.482759 3.586207 3.689655 3.793103 3.896552 4.000000
# missing values are always removed
new_seq(c(1, 4, NA))
#>  [1] 1.000000 1.103448 1.206897 1.310345 1.413793 1.517241 1.620690 1.724138
#>  [9] 1.827586 1.931034 2.034483 2.137931 2.241379 2.344828 2.448276 2.551724
#> [17] 2.655172 2.758621 2.862069 2.965517 3.068966 3.172414 3.275862 3.379310
#> [25] 3.482759 3.586207 3.689655 3.793103 3.896552 4.000000
# unless it's the only value
new_seq(NA_real_)
#> [1] NA
# or the object is zero length
new_seq(numeric())
#> [1] NA
# the length of the sequence can be varied using the length_out argument
new_seq(c(1, 4), length_out = 3)
#> [1] 1.0 2.5 4.0
new_seq(c(1, 4), length_out = 2)
#> [1] 1 4
# which gives the reference value when 1
new_seq(c(1, 4), length_out = 1)
#> [1] 2.5
# and can even be 0
new_seq(c(1, 4), length_out = 0)
#> numeric(0)
# for integer objects the sequence is the unique integers
new_seq(c(1L, 4L))
#> [1] 1 2 3 4
new_seq(c(1L, 100L))
#>  [1]   1   4   7  11  14  18  21  24  28  31  35  38  41  45  48  52  55  59  62
#> [20]  65  69  72  76  79  82  86  89  93  96 100
# for character objects it's the actual values sorted by
# how common they are followed by their actual value
new_seq(c("a", "c", "c", "b", "b"))
#> [1] "b" "c" "a"
new_seq(c("a", "c", "c", "b", "b"), length_out = 2)
#> [1] "b" "c"
# for factors its the factor levels in order
new_seq(factor(c("a", "b", "c", "c"), levels = c("b", "a", "g")))
#> [1] b a g
#> Levels: b a g
# with the trailing levels dropped first
new_seq(factor(c("a", "b", "c", "c"), levels = c("b", "a", "g")),
  length_out = 2
)
#> [1] b a
#> Levels: b a g
# for ordered factors the intermediate levels are dropped first
new_seq(ordered(c("a", "b", "c", "c"), levels = c("b", "a", "g")),
  length_out = 2
)
#> [1] b g
#> Levels: b < a < g
# for Date vectors it's the unique dates
new_seq(as.Date(c("2000-01-01", "2000-01-04")))
#> [1] "2000-01-01" "2000-01-02" "2000-01-03" "2000-01-04"
# same for hms vectors
new_seq(hms::as_hms(c("00:00:01", "00:00:04")))
#> 00:00:01
#> 00:00:02
#> 00:00:03
#> 00:00:04
# for POSIXct vectors the time zone is preserved
new_seq(as.POSIXct(c("2000-01-01 00:00:01", "2000-01-01 00:00:04"),
  tz = "PST8PDT"
))
#> [1] "2000-01-01 00:00:01 PST" "2000-01-01 00:00:02 PST"
#> [3] "2000-01-01 00:00:03 PST" "2000-01-01 00:00:04 PST"
# for logical objects the longest possible sequence is `c(TRUE, FALSE)`
new_seq(c(TRUE, TRUE, FALSE), length_out = 3)
#> [1] FALSE  TRUE
```
