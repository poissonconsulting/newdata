# Cast New Values for `xnew_data()`

Casts a sequence of values to the same class as the original vector.

## Usage

``` r
xcast(..., .data = xnew_data_env$data)
```

## Arguments

- ...:

  TBD

- .data:

  Normally defined by
  [`xnew_data()`](https://poissonconsulting.github.io/newdata/reference/xnew_data.md),
  users must pass a data frame or tibble if using this function
  directly.

## Details

[`xnew_seq()`](https://poissonconsulting.github.io/newdata/reference/xnew_seq.md)
is a wrapper function on
[`vctrs::vec_cast()`](https://vctrs.r-lib.org/reference/vec_cast.html)
for use in
[`xnew_data()`](https://poissonconsulting.github.io/newdata/reference/xnew_data.md)
to avoid having to repeating the column name.

## See also

[`vctrs::vec_cast()`](https://vctrs.r-lib.org/reference/vec_cast.html)
and
[`xnew_data()`](https://poissonconsulting.github.io/newdata/reference/xnew_data.md)

## Examples

``` r
data <- tibble::tibble(
  period = factor(c("before", "before", "after", "after"),
    levels = c("before", "after")
  ),
  annual = factor(c(1, 3, 5, 8), levels = c(1, 3, 5, 8))
)

xnew_data(data, xcast(period = "before"))
#> # A tibble: 1 × 2
#>   period annual
#>   <fct>  <fct> 
#> 1 before 1     
xnew_data(data, xcast(period = "before", annual = c("1", "3")))
#> # A tibble: 2 × 2
#>   period annual
#>   <fct>  <fct> 
#> 1 before 1     
#> 2 before 3     
```
