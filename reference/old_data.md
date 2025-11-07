# Example Data

An example tibble of example 'old' data.

## Usage

``` r
old_data
```

## Format

An object of class `tbl_df` (inherits from `tbl`, `data.frame`) with 3
rows and 9 columns.

## Details

- lgl:

  A logical vector.

- int:

  An integer vector.

- dbl:

  A double vector.

- chr:

  A character vector.

- fct:

  A factor.

- ord:

  An ordered factor.

- dte:

  A Date vector.

- dtt:

  A POSIXct vector.

- hms:

  A hms vector.

## Examples

``` r
old_data
#> # A tibble: 3 × 9
#>   lgl     int   dbl chr      fct     ord   dte        dtt                 hms   
#>   <lgl> <int> <dbl> <chr>    <fct>   <ord> <date>     <dttm>              <time>
#> 1 TRUE      1   1   most     most    most  1970-01-02 1969-12-31 16:00:01 00'01"
#> 2 FALSE     4   4.5 most     most    most  1970-01-05 1969-12-31 16:00:04 00'04"
#> 3 NA        6   8.2 a rarity a rari… a ra… 1970-01-07 1969-12-31 16:00:06 00'06"
```
