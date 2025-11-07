# Generate New Reference Value for `xnew_data()`

Generate a new reference value for a vector.

## Usage

``` r
xnew_value(x, ...)
```

## Arguments

- x:

  The object to generate the reference value from.

- ...:

  Additional arguments passed to
  [`new_value()`](https://poissonconsulting.github.io/newdata/reference/new_value.md).

## Details

`xnew_value()` is a wrapper function on
[`new_value()`](https://poissonconsulting.github.io/newdata/reference/new_value.md)
for use in
[`xnew_data()`](https://poissonconsulting.github.io/newdata/reference/xnew_data.md)
to avoid having to repeating the column name.

## See also

[`new_value()`](https://poissonconsulting.github.io/newdata/reference/new_value.md)
and
[`xnew_data()`](https://poissonconsulting.github.io/newdata/reference/xnew_data.md).

## Examples

``` r
data <- tibble::tibble(
  a = c(1L, 3L, 4L),
  b = c(4, 4.5, 6),
  d = c("a", "b", "c")
)

xnew_data(data, a, b = new_value(b), xnew_value(d))
#> # A tibble: 4 × 3
#>       a     b d    
#>   <int> <dbl> <chr>
#> 1     1  4.83 a    
#> 2     2  4.83 a    
#> 3     3  4.83 a    
#> 4     4  4.83 a    
```
