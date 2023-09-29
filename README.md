
<!-- README.md is generated from README.Rmd. Please edit that file -->
<!-- badges: start -->

[![R-CMD-check](https://github.com/poissonconsulting/newdata/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/poissonconsulting/newdata/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/poissonconsulting/newdata/branch/main/graph/badge.svg)](https://codecov.io/gh/poissonconsulting/newdata?branch=main)
[![License:
MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
[![CRAN
status](https://www.r-pkg.org/badges/version/newdata)](https://CRAN.R-project.org/package=newdata)
<!-- badges: end -->

# newdata

## Introduction

`newdata` is an R package to generate new data frames for predictive
purposes. By default, all specified variables vary across their range
while all other variables are held constant. The user can specify the
length of each sequence, require that only observed values are used and
add new variables.

By default all variables are held constant at the default reference
value. Types, classes, factor levels and time zones are always
preserved.

``` r
library(newdata)

data <- tibble::tibble(
  lgl = c(TRUE, FALSE, NA),
  int = c(1L, 4L, 6L),
  dbl = c(1, 4.5, 8.2),
  chr = c("most", "most", "a rarity"),
  fct = factor(chr, levels = c("bonus", "a rarity", "most")),
  ord = ordered(chr, levels = c("a rarity", "most")),
  dte = as.Date(int),
  dtt = as.POSIXct(int, tz = "PST8PDT"),
  hms = hms::as_hms(int)
)

xnew_data(data)
#> # A tibble: 1 × 9
#>   lgl     int   dbl chr   fct   ord      dte        dtt                 hms   
#>   <lgl> <int> <dbl> <chr> <fct> <ord>    <date>     <dttm>              <time>
#> 1 FALSE     3  4.57 most  bonus a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
```

Specifying a variable causes it to vary across its range.

``` r
xnew_data(data, int)
#> # A tibble: 6 × 9
#>   lgl     int   dbl chr   fct   ord      dte        dtt                 hms   
#>   <lgl> <int> <dbl> <chr> <fct> <ord>    <date>     <dttm>              <time>
#> 1 FALSE     1  4.57 most  bonus a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
#> 2 FALSE     2  4.57 most  bonus a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
#> 3 FALSE     3  4.57 most  bonus a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
#> 4 FALSE     4  4.57 most  bonus a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
#> 5 FALSE     5  4.57 most  bonus a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
#> 6 FALSE     6  4.57 most  bonus a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
```

The user can specify the length of each sequence.

``` r
xnew_data(data, xnew_seq(int, length_out = 3))
#> # A tibble: 3 × 9
#>   lgl     int   dbl chr   fct   ord      dte        dtt                 hms   
#>   <lgl> <int> <dbl> <chr> <fct> <ord>    <date>     <dttm>              <time>
#> 1 FALSE     1  4.57 most  bonus a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
#> 2 FALSE     3  4.57 most  bonus a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
#> 3 FALSE     6  4.57 most  bonus a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
```

and indicate whether only observed values should be used.

``` r
xnew_data(data, xnew_seq(int, length_out = 3, obs_only = TRUE))
#> # A tibble: 3 × 9
#>   lgl     int   dbl chr   fct   ord      dte        dtt                 hms   
#>   <lgl> <int> <dbl> <chr> <fct> <ord>    <date>     <dttm>              <time>
#> 1 FALSE     1  4.57 most  bonus a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
#> 2 FALSE     4  4.57 most  bonus a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
#> 3 FALSE     6  4.57 most  bonus a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
```

With two or more variables all combinations are used.

``` r
xnew_data(data, int, fct)
#> # A tibble: 18 × 9
#>    lgl     int   dbl chr   fct      ord    dte        dtt                 hms   
#>    <lgl> <int> <dbl> <chr> <fct>    <ord>  <date>     <dttm>              <time>
#>  1 FALSE     1  4.57 most  bonus    a rar… 1970-01-04 1969-12-31 16:00:03 00'03"
#>  2 FALSE     1  4.57 most  a rarity a rar… 1970-01-04 1969-12-31 16:00:03 00'03"
#>  3 FALSE     1  4.57 most  most     a rar… 1970-01-04 1969-12-31 16:00:03 00'03"
#>  4 FALSE     2  4.57 most  bonus    a rar… 1970-01-04 1969-12-31 16:00:03 00'03"
#>  5 FALSE     2  4.57 most  a rarity a rar… 1970-01-04 1969-12-31 16:00:03 00'03"
#>  6 FALSE     2  4.57 most  most     a rar… 1970-01-04 1969-12-31 16:00:03 00'03"
#>  7 FALSE     3  4.57 most  bonus    a rar… 1970-01-04 1969-12-31 16:00:03 00'03"
#>  8 FALSE     3  4.57 most  a rarity a rar… 1970-01-04 1969-12-31 16:00:03 00'03"
#>  9 FALSE     3  4.57 most  most     a rar… 1970-01-04 1969-12-31 16:00:03 00'03"
#> 10 FALSE     4  4.57 most  bonus    a rar… 1970-01-04 1969-12-31 16:00:03 00'03"
#> 11 FALSE     4  4.57 most  a rarity a rar… 1970-01-04 1969-12-31 16:00:03 00'03"
#> 12 FALSE     4  4.57 most  most     a rar… 1970-01-04 1969-12-31 16:00:03 00'03"
#> 13 FALSE     5  4.57 most  bonus    a rar… 1970-01-04 1969-12-31 16:00:03 00'03"
#> 14 FALSE     5  4.57 most  a rarity a rar… 1970-01-04 1969-12-31 16:00:03 00'03"
#> 15 FALSE     5  4.57 most  most     a rar… 1970-01-04 1969-12-31 16:00:03 00'03"
#> 16 FALSE     6  4.57 most  bonus    a rar… 1970-01-04 1969-12-31 16:00:03 00'03"
#> 17 FALSE     6  4.57 most  a rarity a rar… 1970-01-04 1969-12-31 16:00:03 00'03"
#> 18 FALSE     6  4.57 most  most     a rar… 1970-01-04 1969-12-31 16:00:03 00'03"
```

To only get observed combinations use `xobs_only()`

``` r
xnew_data(data, xobs_only(int, fct))
#> # A tibble: 3 × 9
#>   lgl     int   dbl chr   fct      ord     dte        dtt                 hms   
#>   <lgl> <int> <dbl> <chr> <fct>    <ord>   <date>     <dttm>              <time>
#> 1 FALSE     1  4.57 most  most     a rari… 1970-01-04 1969-12-31 16:00:03 00'03"
#> 2 FALSE     4  4.57 most  most     a rari… 1970-01-04 1969-12-31 16:00:03 00'03"
#> 3 FALSE     6  4.57 most  a rarity a rari… 1970-01-04 1969-12-31 16:00:03 00'03"
```

Adding a new variable is simple.

``` r
xnew_data(data, new = c(TRUE, FALSE))
#> # A tibble: 2 × 10
#>   lgl     int   dbl chr   fct   ord      dte        dtt                 hms   
#>   <lgl> <int> <dbl> <chr> <fct> <ord>    <date>     <dttm>              <time>
#> 1 FALSE     3  4.57 most  bonus a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
#> 2 FALSE     3  4.57 most  bonus a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
#> # ℹ 1 more variable: new <lgl>
```

## Installation

To install the latest release version from CRAN.

``` r
install.packages("newdata")
```

To install the latest development version from
[r-universe](https://poissonconsulting.r-universe.dev/newdata).

``` r
install.packages("newdata", repos = c("https://poissonconsulting.r-universe.dev", "https://cloud.r-project.org"))
```

To install the latest development version from
[GitHub](https://github.com/poissonconsulting/newdata)

``` r
# install.packages("pak", repos = sprintf("https://r-lib.github.io/p/pak/stable/%s/%s/%s", .Platform$pkgType, R.Version()$os, R.Version()$arch))
pak::pak("newdata")
```

## Contribution

Please report any
[issues](https://github.com/poissonconsulting/newdata/issues).

[Pull requests](https://github.com/poissonconsulting/newdata/pulls) are
always welcome.

## Code of Conduct

Please note that the newdata project is released with a [Contributor
Code of
Conduct](https://contributor-covenant.org/version/2/1/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
