# Generate New Sequence for `xnew_data()`

Generate a new sequence of values for a vector.

## Usage

``` r
xnew_seq(x, ...)
```

## Arguments

- x:

  The object to generate the sequence from.

- ...:

  Additional arguments passed to
  [`new_seq()`](https://poissonconsulting.github.io/newdata/reference/new_seq.md).

## Details

`xnew_seq()` is a wrapper function on
[`new_seq()`](https://poissonconsulting.github.io/newdata/reference/new_seq.md)
for use in
[`xnew_data()`](https://poissonconsulting.github.io/newdata/reference/xnew_data.md)
to avoid having to repeating the column name.

## See also

[`new_seq()`](https://poissonconsulting.github.io/newdata/reference/new_seq.md)
and
[`xnew_data()`](https://poissonconsulting.github.io/newdata/reference/xnew_data.md).

## Examples

``` r
data <- tibble::tibble(
  a = c(1L, 3L, 4L),
  b = c(4, 4.5, 6),
  d = c("a", "b", "c")
)

xnew_data(data, a, b = new_seq(b, length_out = 3), xnew_seq(d, length_out = 2))
#> # A tibble: 24 × 3
#>        a     b d    
#>    <int> <dbl> <chr>
#>  1     1     4 a    
#>  2     1     4 b    
#>  3     1     5 a    
#>  4     1     5 b    
#>  5     1     6 a    
#>  6     1     6 b    
#>  7     2     4 a    
#>  8     2     4 b    
#>  9     2     5 a    
#> 10     2     5 b    
#> # ℹ 14 more rows
```
