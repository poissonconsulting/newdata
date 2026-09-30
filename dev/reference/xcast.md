# Cast New Values for `xnew_data()`

Casts a sequence of values to the same class as the original vector.

## Usage

``` r
xcast(..., .data = xnew_data_env$data)
```

## Arguments

- ...:

  Named vectors of values to cast to the class of the identically named
  columns in `.data`.

- .data:

  Normally defined by
  [`xnew_data()`](https://poissonconsulting.github.io/newdata/dev/reference/xnew_data.md),
  users must pass a data frame or tibble if using this function
  directly.

## Value

A tibble of the cast values.

## Details

`xcast()` is a wrapper function on
[`vctrs::vec_cast()`](https://vctrs.r-lib.org/reference/vec_cast.html)
for use in
[`xnew_data()`](https://poissonconsulting.github.io/newdata/dev/reference/xnew_data.md)
to avoid having to repeating the column name.

The casts that are possible are those defined by vctrs and the packages
that provide the classes. For example, numeric and character values can
be cast to hms because the hms package provides those casts, but vctrs
does not provide casts from numeric or character values to Date or
POSIXct as they require an origin, format or time zone. Date and POSIXct
values must therefore be created with the required class, for example
using [`as.Date()`](https://rdrr.io/r/base/as.Date.html) or
[`as.POSIXct()`](https://rdrr.io/r/base/as.POSIXlt.html). POSIXct values
are converted to the time zone of the column.

## See also

[`vctrs::vec_cast()`](https://vctrs.r-lib.org/reference/vec_cast.html)
and
[`xnew_data()`](https://poissonconsulting.github.io/newdata/dev/reference/xnew_data.md)

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

# numeric and character values can be cast to hms
xnew_data(old_data, xcast(hms = "01:01:11"))
#> # A tibble: 1 × 9
#>   lgl     int   dbl chr   fct     ord    dte        dtt                 hms     
#>   <lgl> <int> <dbl> <chr> <fct>   <ord>  <date>     <dttm>              <time>  
#> 1 FALSE     3  4.57 most  not obs a rar… 1970-01-04 1969-12-31 16:00:03 01:01:11
# but Date and POSIXct values must be created with the required class
xnew_data(
  old_data,
  xcast(
    dte = as.Date("2024-01-01"),
    dtt = as.POSIXct("2024-01-01 10:30:42", tz = "PST8PDT")
  )
)
#> # A tibble: 1 × 9
#>   lgl     int   dbl chr   fct     ord      dte        dtt                 hms   
#>   <lgl> <int> <dbl> <chr> <fct>   <ord>    <date>     <dttm>              <time>
#> 1 FALSE     3  4.57 most  not obs a rarity 2024-01-01 2024-01-01 10:30:42 00'03"
```
