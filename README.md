
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

Consider the following observed ‘old’ data frame.

``` r
library(newdata)

newdata::old_data
#> # A tibble: 3 × 9
#>   lgl     int   dbl chr      fct     ord   dte        dtt                 hms   
#>   <lgl> <int> <dbl> <chr>    <fct>   <ord> <date>     <dttm>              <time>
#> 1 TRUE      1   1   most     most    most  1970-01-02 1969-12-31 16:00:01 00'01"
#> 2 FALSE     4   4.5 most     most    most  1970-01-05 1969-12-31 16:00:04 00'04"
#> 3 NA        6   8.2 a rarity a rari… a ra… 1970-01-07 1969-12-31 16:00:06 00'06"
```

### Reference Value

By default all variables are set to a reference value.

``` r
xnew_data(old_data)
#> # A tibble: 1 × 9
#>   lgl     int   dbl chr   fct     ord      dte        dtt                 hms   
#>   <lgl> <int> <dbl> <chr> <fct>   <ord>    <date>     <dttm>              <time>
#> 1 FALSE     3  4.57 most  not obs a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
```

The reference value depends on the class of the variable, by default:

- logical vectors are FALSE;
- double vectors are the mean;
- integer, Date, POSIXct and hms vectors are the floored mean;
- character vectors are the most common value or the first when sorted
  of the most common values;
- factor and ordered vectors are the first level.

### Sequences

Specifying a variable causes it to vary sequentially across its range.

``` r
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
```

By default the sequence depends on the class of the variable:

- logical vectors are length 2 (TRUE and FALSE);
- double vectors are 30 equally spaced values from the minimum value to
  the maximum value;
- integer, Date, POSIXct and hms vectors are up to 30 discrete values
  from the minimum to the maximum value as evenly spaced as possible;
- character vectors are the number of unique values.
- factor and ordered vectors are the number of levels.

These values can be overridden by setting the following options:

- `new_data.length_out_lgl`, which is 2 by default, for logical vectors;
- `new_data.length_out_dbl`, which is 30 by default, for double vectors;
- `new_data.length_out_int`, which is 30 by default, for integer, Date,
  POSIXct and hms vectors^1;
- `new_data.length_out_chr`, which is Inf by default, for character,
  factor and ordered vectors.

1.  The length of Date, POSIXct and hms sequences are controlled by
    `new_data.length_out_int` as they are treated as integers for the
    purpose of generating a sequence.

When programming it is strongly recommended that the user explicitly
specify the length of each sequence individually.

``` r
xnew_data(old_data, lgl, xnew_seq(int, length_out = 3))
#> # A tibble: 6 × 9
#>   lgl     int   dbl chr   fct     ord      dte        dtt                 hms   
#>   <lgl> <int> <dbl> <chr> <fct>   <ord>    <date>     <dttm>              <time>
#> 1 FALSE     1  4.57 most  not obs a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
#> 2 FALSE     3  4.57 most  not obs a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
#> 3 FALSE     6  4.57 most  not obs a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
#> 4 TRUE      1  4.57 most  not obs a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
#> 5 TRUE      3  4.57 most  not obs a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
#> 6 TRUE      6  4.57 most  not obs a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
```

A third alternative is to specify the length of all the sequences in the
data set but this can result in less common character strings or later
factor or ordered levels being dropped.

``` r
xnew_data(old_data, dbl, int, .length_out = 2)
#> # A tibble: 4 × 9
#>   lgl     int   dbl chr   fct     ord      dte        dtt                 hms   
#>   <lgl> <int> <dbl> <chr> <fct>   <ord>    <date>     <dttm>              <time>
#> 1 FALSE     1   1   most  not obs a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
#> 2 FALSE     6   1   most  not obs a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
#> 3 FALSE     1   8.2 most  not obs a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
#> 4 FALSE     6   8.2 most  not obs a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
```

### Observed Values

The user can also indicate whether only observed values should be used
in the sequence.

``` r
xnew_data(old_data, xnew_seq(int, length_out = 3, obs_only = TRUE))
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
xnew_data(old_data, xobs_only(xnew_seq(int, length_out = 3)))
#> # A tibble: 2 × 9
#>   lgl     int   dbl chr   fct     ord      dte        dtt                 hms   
#>   <lgl> <int> <dbl> <chr> <fct>   <ord>    <date>     <dttm>              <time>
#> 1 FALSE     1  4.57 most  not obs a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
#> 2 FALSE     6  4.57 most  not obs a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
```

and when two or more variables are specified all combinations are used.

``` r
xnew_data(old_data, int, fct)
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

to only get observed combinations.

``` r
xnew_data(old_data, xobs_only(int, fct))
#> # A tibble: 3 × 9
#>   lgl     int   dbl chr   fct      ord     dte        dtt                 hms   
#>   <lgl> <int> <dbl> <chr> <fct>    <ord>   <date>     <dttm>              <time>
#> 1 FALSE     1  4.57 most  most     a rari… 1970-01-04 1969-12-31 16:00:03 00'03"
#> 2 FALSE     4  4.57 most  most     a rari… 1970-01-04 1969-12-31 16:00:03 00'03"
#> 3 FALSE     6  4.57 most  a rarity a rari… 1970-01-04 1969-12-31 16:00:03 00'03"
```

### Modifying Variables

Modifying an existing variable or changing an existing one is simple.

``` r
xnew_data(old_data, lgl = median(lgl, na.rm = TRUE), extra = c(TRUE, FALSE))
#> # A tibble: 2 × 10
#>     lgl   int   dbl chr   fct     ord      dte        dtt                 hms   
#>   <dbl> <int> <dbl> <chr> <fct>   <ord>    <date>     <dttm>              <time>
#> 1   0.5     3  4.57 most  not obs a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
#> 2   0.5     3  4.57 most  not obs a rarity 1970-01-04 1969-12-31 16:00:03 00'03"
#> # ℹ 1 more variable: extra <lgl>
```

### Casting Variables

Casting variables to be the same class as the original is achieved as
follows.

``` r
xnew_data(old_data, xcast(lgl = 1, int = 7, dbl = 10L, fct = "a rarity", hms = "00:00:02"))
#> # A tibble: 1 × 9
#>   lgl     int   dbl chr   fct      ord     dte        dtt                 hms   
#>   <lgl> <int> <dbl> <chr> <fct>    <ord>   <date>     <dttm>              <time>
#> 1 TRUE      7    10 most  a rarity a rari… 1970-01-04 1969-12-31 16:00:03 00'02"
```

### A Simple Wrapper

Although superseded, for consistency with existing code `new_data()`
which is a simple wrapper on `xnew_data()` allows the user to pass a
character vector and to specifying the length of all the sequences is
also provided.

``` r
new_data(old_data, seq = c("int", "fct"), length_out = 5)
#> # A tibble: 15 × 9
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
#> 13 FALSE     6  4.57 most  not obs  a rar… 1970-01-04 1969-12-31 16:00:03 00'03"
#> 14 FALSE     6  4.57 most  a rarity a rar… 1970-01-04 1969-12-31 16:00:03 00'03"
#> 15 FALSE     6  4.57 most  most     a rar… 1970-01-04 1969-12-31 16:00:03 00'03"
```

## Installation

To install the latest release version from CRAN.

``` r
install.packages("newdata")
```

To install the latest development version from
[GitHub](https://github.com/poissonconsulting/newdata)

``` r
# install.packages("pak")
pak::pak("poissonconsulting/newdata")
```

or from [r-universe](https://poissonconsulting.r-universe.dev/newdata).

``` r
install.packages("newdata", repos = c("https://poissonconsulting.r-universe.dev", "https://cloud.r-project.org"))
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
