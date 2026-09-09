# Generate New Data **\[superseded\]**

Generates a new data frame (in the form of a tibble) with each variable
held constant or varying as a unique ordered sequence.

## Usage

``` r
new_data(
  data,
  seq = character(0),
  ref = list(),
  obs_only = list(character(0)),
  length_out = 30
)
```

## Arguments

- data:

  The data frame to generate the new data from.

- seq:

  A character vector of the names of the variables in `data` to generate
  sequences for. All other variables are held constant at their
  reference value.

- ref:

  **\[deprecated\]** A named list of reference values for variables that
  are not in `seq`. Using it produces a warning. Instead name the value
  in
  [`xnew_data()`](https://poissonconsulting.github.io/newdata/dev/reference/xnew_data.md),
  for example `xnew_data(data, a, b = 1)`.

- obs_only:

  **\[deprecated\]** A list of character vectors indicating the sets of
  variables to only allow observed combinations for. If `TRUE` then
  `obs_only` is set to be `seq`. Using it produces a warning. Instead
  use
  [`xobs_only()`](https://poissonconsulting.github.io/newdata/dev/reference/xobs_only.md)
  in
  [`xnew_data()`](https://poissonconsulting.github.io/newdata/dev/reference/xnew_data.md),
  for example `xnew_data(data, xobs_only(a, b))`.

- length_out:

  A count indicating the maximum length of sequences for all types of
  variables except logical, character, factor and ordered factors.

## Value

A tibble of the new data.

## Details

`new_data()` has been superseded by
[`xnew_data()`](https://poissonconsulting.github.io/newdata/dev/reference/xnew_data.md),
which accepts bare column names and provides finer control through
[`xnew_seq()`](https://poissonconsulting.github.io/newdata/dev/reference/xnew_seq.md),
[`xnew_value()`](https://poissonconsulting.github.io/newdata/dev/reference/xnew_value.md),
[`xobs_only()`](https://poissonconsulting.github.io/newdata/dev/reference/xobs_only.md)
and
[`xcast()`](https://poissonconsulting.github.io/newdata/dev/reference/xcast.md).
`new_data()` remains fully functional and is maintained for backwards
compatibility with existing code. All of its arguments continue to work.
The `ref` and `obs_only` arguments are deprecated, which means that
using them produces a warning but they still behave as documented.

The call `new_data(data, seq = c("a", "b"), length_out = 30)` is
equivalent to `xnew_data(data, a, b, .length_out = 30)`.

## See also

[`xnew_data()`](https://poissonconsulting.github.io/newdata/dev/reference/xnew_data.md)

## Examples

``` r
new_data(old_data, "int")
#> # A tibble: 6 × 9
#>   lgl     int   dbl chr   fct     ord      dte        dtt                 hms   
#>   <lgl> <int> <dbl> <chr> <fct>   <ord>    <date>     <dttm>              <time>
#> 1 FALSE     1  4.57 most  not obs a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
#> 2 FALSE     2  4.57 most  not obs a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
#> 3 FALSE     3  4.57 most  not obs a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
#> 4 FALSE     4  4.57 most  not obs a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
#> 5 FALSE     5  4.57 most  not obs a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
#> 6 FALSE     6  4.57 most  not obs a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
new_data(old_data, "dbl")
#> # A tibble: 30 × 9
#>    lgl     int   dbl chr   fct     ord     dte        dtt                 hms   
#>    <lgl> <int> <dbl> <chr> <fct>   <ord>   <date>     <dttm>              <time>
#>  1 FALSE     3  1    most  not obs a rari… 1970-01-04 1969-12-31 16:00:03 00'03"
#>  2 FALSE     3  1.25 most  not obs a rari… 1970-01-04 1969-12-31 16:00:03 00'03"
#>  3 FALSE     3  1.50 most  not obs a rari… 1970-01-04 1969-12-31 16:00:03 00'03"
#>  4 FALSE     3  1.74 most  not obs a rari… 1970-01-04 1969-12-31 16:00:03 00'03"
#>  5 FALSE     3  1.99 most  not obs a rari… 1970-01-04 1969-12-31 16:00:03 00'03"
#>  6 FALSE     3  2.24 most  not obs a rari… 1970-01-04 1969-12-31 16:00:03 00'03"
#>  7 FALSE     3  2.49 most  not obs a rari… 1970-01-04 1969-12-31 16:00:03 00'03"
#>  8 FALSE     3  2.74 most  not obs a rari… 1970-01-04 1969-12-31 16:00:03 00'03"
#>  9 FALSE     3  2.99 most  not obs a rari… 1970-01-04 1969-12-31 16:00:03 00'03"
#> 10 FALSE     3  3.23 most  not obs a rari… 1970-01-04 1969-12-31 16:00:03 00'03"
#> # ℹ 20 more rows
new_data(old_data, c("int", "dbl"))
#> # A tibble: 180 × 9
#>    lgl     int   dbl chr   fct     ord     dte        dtt                 hms   
#>    <lgl> <int> <dbl> <chr> <fct>   <ord>   <date>     <dttm>              <time>
#>  1 FALSE     1  1    most  not obs a rari… 1970-01-04 1969-12-31 16:00:03 00'03"
#>  2 FALSE     1  1.25 most  not obs a rari… 1970-01-04 1969-12-31 16:00:03 00'03"
#>  3 FALSE     1  1.50 most  not obs a rari… 1970-01-04 1969-12-31 16:00:03 00'03"
#>  4 FALSE     1  1.74 most  not obs a rari… 1970-01-04 1969-12-31 16:00:03 00'03"
#>  5 FALSE     1  1.99 most  not obs a rari… 1970-01-04 1969-12-31 16:00:03 00'03"
#>  6 FALSE     1  2.24 most  not obs a rari… 1970-01-04 1969-12-31 16:00:03 00'03"
#>  7 FALSE     1  2.49 most  not obs a rari… 1970-01-04 1969-12-31 16:00:03 00'03"
#>  8 FALSE     1  2.74 most  not obs a rari… 1970-01-04 1969-12-31 16:00:03 00'03"
#>  9 FALSE     1  2.99 most  not obs a rari… 1970-01-04 1969-12-31 16:00:03 00'03"
#> 10 FALSE     1  3.23 most  not obs a rari… 1970-01-04 1969-12-31 16:00:03 00'03"
#> # ℹ 170 more rows

# equivalent using xnew_data()
xnew_data(old_data, int)
#> # A tibble: 6 × 9
#>   lgl     int   dbl chr   fct     ord      dte        dtt                 hms   
#>   <lgl> <int> <dbl> <chr> <fct>   <ord>    <date>     <dttm>              <time>
#> 1 FALSE     1  4.57 most  not obs a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
#> 2 FALSE     2  4.57 most  not obs a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
#> 3 FALSE     3  4.57 most  not obs a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
#> 4 FALSE     4  4.57 most  not obs a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
#> 5 FALSE     5  4.57 most  not obs a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
#> 6 FALSE     6  4.57 most  not obs a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
xnew_data(old_data, dbl)
#> # A tibble: 30 × 9
#>    lgl     int   dbl chr   fct     ord     dte        dtt                 hms   
#>    <lgl> <int> <dbl> <chr> <fct>   <ord>   <date>     <dttm>              <time>
#>  1 FALSE     3  1    most  not obs a rari… 1970-01-04 1969-12-31 16:00:03 00'03"
#>  2 FALSE     3  1.25 most  not obs a rari… 1970-01-04 1969-12-31 16:00:03 00'03"
#>  3 FALSE     3  1.50 most  not obs a rari… 1970-01-04 1969-12-31 16:00:03 00'03"
#>  4 FALSE     3  1.74 most  not obs a rari… 1970-01-04 1969-12-31 16:00:03 00'03"
#>  5 FALSE     3  1.99 most  not obs a rari… 1970-01-04 1969-12-31 16:00:03 00'03"
#>  6 FALSE     3  2.24 most  not obs a rari… 1970-01-04 1969-12-31 16:00:03 00'03"
#>  7 FALSE     3  2.49 most  not obs a rari… 1970-01-04 1969-12-31 16:00:03 00'03"
#>  8 FALSE     3  2.74 most  not obs a rari… 1970-01-04 1969-12-31 16:00:03 00'03"
#>  9 FALSE     3  2.99 most  not obs a rari… 1970-01-04 1969-12-31 16:00:03 00'03"
#> 10 FALSE     3  3.23 most  not obs a rari… 1970-01-04 1969-12-31 16:00:03 00'03"
#> # ℹ 20 more rows
xnew_data(old_data, int, dbl)
#> # A tibble: 180 × 9
#>    lgl     int   dbl chr   fct     ord     dte        dtt                 hms   
#>    <lgl> <int> <dbl> <chr> <fct>   <ord>   <date>     <dttm>              <time>
#>  1 FALSE     1  1    most  not obs a rari… 1970-01-04 1969-12-31 16:00:03 00'03"
#>  2 FALSE     1  1.25 most  not obs a rari… 1970-01-04 1969-12-31 16:00:03 00'03"
#>  3 FALSE     1  1.50 most  not obs a rari… 1970-01-04 1969-12-31 16:00:03 00'03"
#>  4 FALSE     1  1.74 most  not obs a rari… 1970-01-04 1969-12-31 16:00:03 00'03"
#>  5 FALSE     1  1.99 most  not obs a rari… 1970-01-04 1969-12-31 16:00:03 00'03"
#>  6 FALSE     1  2.24 most  not obs a rari… 1970-01-04 1969-12-31 16:00:03 00'03"
#>  7 FALSE     1  2.49 most  not obs a rari… 1970-01-04 1969-12-31 16:00:03 00'03"
#>  8 FALSE     1  2.74 most  not obs a rari… 1970-01-04 1969-12-31 16:00:03 00'03"
#>  9 FALSE     1  2.99 most  not obs a rari… 1970-01-04 1969-12-31 16:00:03 00'03"
#> 10 FALSE     1  3.23 most  not obs a rari… 1970-01-04 1969-12-31 16:00:03 00'03"
#> # ℹ 170 more rows
```
