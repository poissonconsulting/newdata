# Generate New Data by Expansion

Generates a new data frame (in the form of a tibble)

## Usage

``` r
xnew_data(.data, ..., .length_out = NULL)
```

## Arguments

- .data:

  The data frame to generate the new data from.

- ...:

  A list of variables to generate sequences for.

- .length_out:

  NULL or a count specifying the maximum length of all sequences.

## Details

By default, all specified variables vary across their range while all
other variables are held constant at their reference value. Types,
classes, factor levels and time zones are always preserved. The user can
specify the length of each sequence, require that only observed values
and combinations are used and add new variables.

## See also

[`xnew_value()`](https://poissonconsulting.github.io/newdata/reference/xnew_value.md),
[`xnew_seq()`](https://poissonconsulting.github.io/newdata/reference/xnew_seq.md),
[`xcast()`](https://poissonconsulting.github.io/newdata/reference/xcast.md)
and
[`xobs_only()`](https://poissonconsulting.github.io/newdata/reference/xobs_only.md)

## Examples

``` r
data <- tibble::tibble(
  period = factor(c("before", "before", "after", "after"),
    levels = c("before", "after")
  ),
  count = c(0L, 1L, 5L, 4L),
  annual = factor(c(2, 3, 5, 8), levels = c(1, 2, 3, 5, 8))
)

# By default all other variables are held constant at their reference value.
xnew_data(data)
#> # A tibble: 1 × 3
#>   period count annual
#>   <fct>  <int> <fct> 
#> 1 before     2 1     

# Specifying a variable causes it to vary across its range.
xnew_data(data, annual)
#> # A tibble: 5 × 3
#>   period count annual
#>   <fct>  <int> <fct> 
#> 1 before     2 1     
#> 2 before     2 2     
#> 3 before     2 3     
#> 4 before     2 5     
#> 5 before     2 8     

# The user can specify the length of a sequence.
xnew_data(data, xnew_seq(annual, length_out = 3))
#> # A tibble: 3 × 3
#>   period count annual
#>   <fct>  <int> <fct> 
#> 1 before     2 1     
#> 2 before     2 2     
#> 3 before     2 3     

# And only allow observed values.
xnew_data(data, xnew_seq(annual, length_out = 3, obs_only = TRUE))
#> # A tibble: 3 × 3
#>   period count annual
#>   <fct>  <int> <fct> 
#> 1 before     2 2     
#> 2 before     2 3     
#> 3 before     2 5     

# With multiple variables all combinations are produced
xnew_data(data, period, xnew_seq(annual, length_out = 3, obs_only = TRUE))
#> # A tibble: 6 × 3
#>   period count annual
#>   <fct>  <int> <fct> 
#> 1 before     2 2     
#> 2 before     2 3     
#> 3 before     2 5     
#> 4 after      2 2     
#> 5 after      2 3     
#> 6 after      2 5     

# To only preserve observed combinations use
xnew_data(data, xobs_only(period, annual))
#> # A tibble: 4 × 3
#>   period count annual
#>   <fct>  <int> <fct> 
#> 1 before     2 2     
#> 2 before     2 3     
#> 3 after      2 5     
#> 4 after      2 8     

# And to cast the values use
xnew_data(data, xcast(annual = "3"))
#> # A tibble: 1 × 3
#>   period count annual
#>   <fct>  <int> <fct> 
#> 1 before     2 3     
```
