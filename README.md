
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![lifecycle](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![Travis-CI Build
Status](https://travis-ci.org/poissonconsulting/newdata.svg?branch=master)](https://travis-ci.org/poissonconsulting/newdata)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/poissonconsulting/newdata?branch=master&svg=true)](https://ci.appveyor.com/project/poissonconsulting/newdata)
[![Coverage
Status](https://img.shields.io/codecov/c/github/poissonconsulting/newdata/master.svg)](https://codecov.io/github/poissonconsulting/newdata?branch=master)
[![License:
MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)

# newdata

## Introduction

`newdata` is an R package to generate new data frames for passing to
`predict` functions. In the new data the column or columns of interest
vary across their range while the remaining columns are held constant at
their reference value.

The reference value for a factor is its first level, while the reference
level for columns of other types are the mean or rounded mean in the
case of logicals, integers, Dates or POSIXcts.

## Demonstration

``` r
library(ggplot2)
library(newdata)

mtcars <- datasets::mtcars

model <- lm(mpg ~ wt + hp + poly(disp,2), data = mtcars)
summary(model)
#> 
#> Call:
#> lm(formula = mpg ~ wt + hp + poly(disp, 2), data = mtcars)
#> 
#> Residuals:
#>     Min      1Q  Median      3Q     Max 
#> -3.3887 -1.6079 -0.3997  1.7992  4.2331 
#> 
#> Coefficients:
#>                Estimate Std. Error t value Pr(>|t|)    
#> (Intercept)    35.13941    3.53184   9.949 1.58e-10 ***
#> wt             -3.71314    0.91483  -4.059 0.000379 ***
#> hp             -0.02115    0.01026  -2.062 0.048978 *  
#> poly(disp, 2)1 -4.09195    6.21246  -0.659 0.515687    
#> poly(disp, 2)2  7.87570    2.36778   3.326 0.002546 ** 
#> ---
#> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#> 
#> Residual standard error: 2.263 on 27 degrees of freedom
#> Multiple R-squared:  0.8772, Adjusted R-squared:  0.859 
#> F-statistic:  48.2 on 4 and 27 DF,  p-value: 6.521e-12

# generate a data frame across range of wt with other predictor
# variables held constant
wt <- new_data(mtcars, "wt")
head(wt)
#> # A tibble: 6 x 11
#>     mpg   cyl  disp    hp  drat    wt  qsec    vs    am  gear  carb
#>   <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
#> 1  20.1  6.19  231.  147.  3.60  1.51  17.8 0.438 0.406  3.69  2.81
#> 2  20.1  6.19  231.  147.  3.60  1.65  17.8 0.438 0.406  3.69  2.81
#> 3  20.1  6.19  231.  147.  3.60  1.78  17.8 0.438 0.406  3.69  2.81
#> 4  20.1  6.19  231.  147.  3.60  1.92  17.8 0.438 0.406  3.69  2.81
#> 5  20.1  6.19  231.  147.  3.60  2.05  17.8 0.438 0.406  3.69  2.81
#> 6  20.1  6.19  231.  147.  3.60  2.19  17.8 0.438 0.406  3.69  2.81

wt <- cbind(wt, predict(model, newdata = wt, interval = "confidence"))

ggplot(data = wt, aes(x = wt, y = fit)) + 
  geom_point(data = mtcars, aes(y = mpg)) + 
  geom_line() +
  geom_line(aes(y = lwr), linetype = "dotted") +
  geom_line(aes(y = upr), linetype = "dotted") +
  ylab("mpg")
```

![](tools/README-unnamed-chunk-2-1.png)<!-- -->

``` r

# generate a data frame across range of disp with other predictor
# variables held constant
disp <- new_data(mtcars, "disp")
head(disp)
#> # A tibble: 6 x 11
#>     mpg   cyl  disp    hp  drat    wt  qsec    vs    am  gear  carb
#>   <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
#> 1  20.1  6.19  71.1  147.  3.60  3.22  17.8 0.438 0.406  3.69  2.81
#> 2  20.1  6.19  84.9  147.  3.60  3.22  17.8 0.438 0.406  3.69  2.81
#> 3  20.1  6.19  98.7  147.  3.60  3.22  17.8 0.438 0.406  3.69  2.81
#> 4  20.1  6.19 113.   147.  3.60  3.22  17.8 0.438 0.406  3.69  2.81
#> 5  20.1  6.19 126.   147.  3.60  3.22  17.8 0.438 0.406  3.69  2.81
#> 6  20.1  6.19 140.   147.  3.60  3.22  17.8 0.438 0.406  3.69  2.81

disp <- cbind(disp, predict(model, newdata = disp, interval = "confidence"))

ggplot(data = disp, aes(x = disp, y = fit)) + 
  geom_point(data = mtcars, aes(y = mpg)) + 
  geom_line() +
  geom_line(aes(y = lwr), linetype = "dotted") +
  geom_line(aes(y = upr), linetype = "dotted") +
  ylab("mpg")
```

![](tools/README-unnamed-chunk-2-2.png)<!-- -->

## Installation

To install the latest development version from
[GitHub](https://github.com/poissonconsulting/rpdo)

    # install.packages("devtools")
    devtools::install_github("poissonconsulting/rpdo")

To install the latest development version from the Poisson drat
[repository](https://github.com/poissonconsulting/drat)

    # install.packages("drat")
    drat::addRepo("poissonconsulting")
    install.packages("rpdo")

## Contribution

Please report any
[issues](https://github.com/poissonconsulting/newdata/issues).

[Pull requests](https://github.com/poissonconsulting/newdata/pulls) are
always welcome.

Please note that this project is released with a [Contributor Code of
Conduct](CONDUCT.md). By participating in this project you agree to
abide by its terms.
