# Generate Observed Combinations Only

Generate Observed Combinations Only

## Usage

``` r
xobs_only(..., .length_out = NULL, .data = xnew_data_env$data)
```

## Arguments

- ...:

  One or more variables to generate combinations for.

- .length_out:

  A count to override the default length of sequences.

- .data:

  Normally defined by
  [`xnew_data()`](https://poissonconsulting.github.io/newdata/reference/xnew_data.md),
  users must pass a data frame or tibble if using this function
  directly.

## See also

[`xnew_data()`](https://poissonconsulting.github.io/newdata/reference/xnew_data.md)

## Examples

``` r
data <- tibble::tibble(
  period = factor(c("before", "before", "after", "after"),
    levels = c("before", "after")
  ),
  annual = factor(c(1, 3, 5, 8), levels = c(1, 3, 5, 8))
)
xnew_data(data, period, annual)
#> # A tibble: 8 × 2
#>   period annual
#>   <fct>  <fct> 
#> 1 before 1     
#> 2 before 3     
#> 3 before 5     
#> 4 before 8     
#> 5 after  1     
#> 6 after  3     
#> 7 after  5     
#> 8 after  8     
xnew_data(data, xobs_only(period, annual))
#> # A tibble: 4 × 2
#>   period annual
#>   <fct>  <fct> 
#> 1 before 1     
#> 2 before 3     
#> 3 after  5     
#> 4 after  8     
xnew_data(data, xobs_only(period, xnew_seq(annual, length_out = 3)))
#> # A tibble: 3 × 2
#>   period annual
#>   <fct>  <fct> 
#> 1 before 1     
#> 2 before 3     
#> 3 after  5     
```
