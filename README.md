
<!-- README.md is generated from README.Rmd. Please edit that file -->

# newdata <img src="man/figures/logo.png" align="right" alt= "Poisson Consulting logo"/>

<!-- badges: start -->

[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
[![R-CMD-check](https://github.com/poissonconsulting/newdata/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/poissonconsulting/newdata/actions/workflows/R-CMD-check.yaml)
[![codecov](https://codecov.io/gh/poissonconsulting/newdata/graph/badge.svg?token=pJO8edj5Wu)](https://codecov.io/gh/poissonconsulting/newdata)
[![License:
MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/license/mit)
[![CRAN
status](https://www.r-pkg.org/badges/version/newdata)](https://cran.r-project.org/package=newdata)
<!-- badges: end -->

## Introduction

`newdata` is an R package to generate new data frames by varying some
variables while holding the others constant.

By default, all specified variables vary across their range while all
other variables are held constant at a reference value. The user can
specify the length of each sequence, require that only observed values
and combinations are used and add new variables. Types, classes, factor
levels and time zones are always preserved.

Consider the following observed data frame.

``` r
library(newdata)

obs_data
#> # A tibble: 3 × 9
#>   lgl     int   dbl chr      fct     ord   dte        dtt                 hms   
#>   <lgl> <int> <dbl> <chr>    <fct>   <ord> <date>     <dttm>              <time>
#> 1 TRUE      1   1   most     most    most  1970-01-02 1969-12-31 16:00:01 00'01"
#> 2 FALSE     4   4.5 most     most    most  1970-01-05 1969-12-31 16:00:04 00'04"
#> 3 NA        6   8.2 a rarity a rari… a ra… 1970-01-07 1969-12-31 16:00:06 00'06"
```

### Length of Sequences

By default all variables are set to a reference value.

``` r
xnew_data(obs_data)
#> # A tibble: 1 × 9
#>   lgl     int   dbl chr   fct     ord      dte        dtt                 hms   
#>   <lgl> <int> <dbl> <chr> <fct>   <ord>    <date>     <dttm>              <time>
#> 1 FALSE     3  4.57 most  not obs a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
```

Specifying a variable causes it to vary sequentially across its range.

``` r
xnew_data(obs_data, int)
#> # A tibble: 6 × 9
#>   lgl     int   dbl chr   fct     ord      dte        dtt                 hms   
#>   <lgl> <int> <dbl> <chr> <fct>   <ord>    <date>     <dttm>              <time>
#> 1 FALSE     1  4.57 most  not obs a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
#> 2 FALSE     2  4.57 most  not obs a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
#> 3 FALSE     3  4.57 most  not obs a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
#> 4 FALSE     4  4.57 most  not obs a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
#> 5 FALSE     5  4.57 most  not obs a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
#> 6 FALSE     6  4.57 most  not obs a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
```

The user can specify the length of each sequence.

``` r
xnew_data(obs_data, xnew_seq(int, length_out = 3))
#> # A tibble: 3 × 9
#>   lgl     int   dbl chr   fct     ord      dte        dtt                 hms   
#>   <lgl> <int> <dbl> <chr> <fct>   <ord>    <date>     <dttm>              <time>
#> 1 FALSE     1  4.57 most  not obs a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
#> 2 FALSE     3  4.57 most  not obs a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
#> 3 FALSE     6  4.57 most  not obs a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
```

### Observed Values and Combinations

The user can also indicate whether only observed values should be used
in the sequence.

``` r
xnew_data(obs_data, xnew_seq(int, length_out = 3, obs_only = TRUE))
#> # A tibble: 3 × 9
#>   lgl     int   dbl chr   fct     ord      dte        dtt                 hms   
#>   <lgl> <int> <dbl> <chr> <fct>   <ord>    <date>     <dttm>              <time>
#> 1 FALSE     1  4.57 most  not obs a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
#> 2 FALSE     4  4.57 most  not obs a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
#> 3 FALSE     6  4.57 most  not obs a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
```

The `xobs_only()` function can be used to filter out unobserved values
after the sequence has been generated.

``` r
xnew_data(obs_data, xobs_only(xnew_seq(int, length_out = 3)))
#> # A tibble: 2 × 9
#>   lgl     int   dbl chr   fct     ord      dte        dtt                 hms   
#>   <lgl> <int> <dbl> <chr> <fct>   <ord>    <date>     <dttm>              <time>
#> 1 FALSE     1  4.57 most  not obs a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
#> 2 FALSE     6  4.57 most  not obs a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
```

When two or more variables are specified all combinations are used.

``` r
xnew_data(obs_data, int, fct)
#> # A tibble: 18 × 9
#>    lgl     int   dbl chr   fct      ord    dte        dtt                 hms   
#>    <lgl> <int> <dbl> <chr> <fct>    <ord>  <date>     <dttm>              <time>
#>  1 FALSE     1  4.57 most  not obs  a rar… 1970-01-04 1969-12-31 16:00:03 00'03"
#>  2 FALSE     1  4.57 most  a rarity a rar… 1970-01-04 1969-12-31 16:00:03 00'03"
#>  3 FALSE     1  4.57 most  most     a rar… 1970-01-04 1969-12-31 16:00:03 00'03"
#>  4 FALSE     2  4.57 most  not obs  a rar… 1970-01-04 1969-12-31 16:00:03 00'03"
#>  5 FALSE     2  4.57 most  a rarity a rar… 1970-01-04 1969-12-31 16:00:03 00'03"
#>  6 FALSE     2  4.57 most  most     a rar… 1970-01-04 1969-12-31 16:00:03 00'03"
#>  7 FALSE     3  4.57 most  not obs  a rar… 1970-01-04 1969-12-31 16:00:03 00'03"
#>  8 FALSE     3  4.57 most  a rarity a rar… 1970-01-04 1969-12-31 16:00:03 00'03"
#>  9 FALSE     3  4.57 most  most     a rar… 1970-01-04 1969-12-31 16:00:03 00'03"
#> 10 FALSE     4  4.57 most  not obs  a rar… 1970-01-04 1969-12-31 16:00:03 00'03"
#> 11 FALSE     4  4.57 most  a rarity a rar… 1970-01-04 1969-12-31 16:00:03 00'03"
#> 12 FALSE     4  4.57 most  most     a rar… 1970-01-04 1969-12-31 16:00:03 00'03"
#> 13 FALSE     5  4.57 most  not obs  a rar… 1970-01-04 1969-12-31 16:00:03 00'03"
#> 14 FALSE     5  4.57 most  a rarity a rar… 1970-01-04 1969-12-31 16:00:03 00'03"
#> 15 FALSE     5  4.57 most  most     a rar… 1970-01-04 1969-12-31 16:00:03 00'03"
#> 16 FALSE     6  4.57 most  not obs  a rar… 1970-01-04 1969-12-31 16:00:03 00'03"
#> 17 FALSE     6  4.57 most  a rarity a rar… 1970-01-04 1969-12-31 16:00:03 00'03"
#> 18 FALSE     6  4.57 most  most     a rar… 1970-01-04 1969-12-31 16:00:03 00'03"
```

To only get observed combinations use `xobs_only()`

``` r
xnew_data(obs_data, xobs_only(int, fct))
#> # A tibble: 3 × 9
#>   lgl     int   dbl chr   fct      ord     dte        dtt                 hms   
#>   <lgl> <int> <dbl> <chr> <fct>    <ord>   <date>     <dttm>              <time>
#> 1 FALSE     1  4.57 most  most     a rari… 1970-01-04 1969-12-31 16:00:03 00'03"
#> 2 FALSE     4  4.57 most  most     a rari… 1970-01-04 1969-12-31 16:00:03 00'03"
#> 3 FALSE     6  4.57 most  a rarity a rari… 1970-01-04 1969-12-31 16:00:03 00'03"
```

### Add New Variables

Adding a new variable is simple.

``` r
xnew_data(obs_data, extra = c(TRUE, FALSE))
#> # A tibble: 2 × 10
#>   lgl     int   dbl chr   fct     ord      dte        dtt                 hms   
#>   <lgl> <int> <dbl> <chr> <fct>   <ord>    <date>     <dttm>              <time>
#> 1 FALSE     3  4.57 most  not obs a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
#> 2 FALSE     3  4.57 most  not obs a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
#> # ℹ 1 more variable: extra <lgl>
```

### Casting Variables

Casting variables to be the same class as the original is achieved as
follows.

``` r
xnew_data(obs_data, xcast(int = 7, dbl = 10L, fct = "a rarity"))
#> # A tibble: 1 × 9
#>   lgl     int   dbl chr   fct      ord     dte        dtt                 hms   
#>   <lgl> <int> <dbl> <chr> <fct>    <ord>   <date>     <dttm>              <time>
#> 1 FALSE     7    10 most  a rarity a rari… 1970-01-04 1969-12-31 16:00:03 00'03"
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

or from [GitHub](https://github.com/poissonconsulting/newdata)

``` r
# install.packages("remotes")
remotes::install_github("poissonconsulting/newdata")
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
