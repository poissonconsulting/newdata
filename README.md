
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

`newdata` is an R package to generate data frames (in the form of
tibbles) for predictive purposes.

The `xnew_data()` function varies all specified variables across their
range of the observed data as a unique ordered sequence while holding
all other variables constant at their reference values.

By default all variables are held constant at their reference value with
their type preserved.

``` r
library(newdata)
data <- tibble::tibble(
  a = c(1L, 3L, 6L, 10L),
  b = c(1,4.5, 8.2, 10))


xnew_data(data)
#> # A tibble: 1 × 2
#>       a     b
#>   <int> <dbl>
#> 1     5  5.92
```

Naming a variable causes it to vary across its range

``` r
library(newdata)
xnew_data(data, a)
#> # A tibble: 4 × 2
#>       a     b
#>   <int> <dbl>
#> 1     1  5.92
#> 2     3  5.92
#> 3     6  5.92
#> 4    10  5.92
xnew_data(data, a, obs_only = TRUE)
#> # A tibble: 4 × 3
#>       a     b obs_only
#>   <int> <dbl> <lgl>   
#> 1     1  5.92 TRUE    
#> 2     3  5.92 TRUE    
#> 3     6  5.92 TRUE    
#> 4    10  5.92 TRUE
xnew_data(data, xnew_seq(a, obs_only = FALSE))
#> # A tibble: 10 × 2
#>        a     b
#>    <int> <dbl>
#>  1     1  5.92
#>  2     2  5.92
#>  3     3  5.92
#>  4     4  5.92
#>  5     5  5.92
#>  6     6  5.92
#>  7     7  5.92
#>  8     8  5.92
#>  9     9  5.92
#> 10    10  5.92
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
