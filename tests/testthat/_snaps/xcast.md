# xcast old_data

    Code
      old_data
    Output
      # A tibble: 3 x 9
        lgl     int   dbl chr      fct     ord   dte        dtt                 hms   
        <lgl> <int> <dbl> <chr>    <fct>   <ord> <date>     <dttm>              <time>
      1 TRUE      1   1   most     most    most  1970-01-02 1969-12-31 16:00:01 00'01"
      2 FALSE     4   4.5 most     most    most  1970-01-05 1969-12-31 16:00:04 00'04"
      3 NA        6   8.2 a rarity a rari~ a ra~ 1970-01-07 1969-12-31 16:00:06 00'06"
    Code
      xnew_data(old_data, xcast(lgl = 1, int = 7, dbl = 10L, chr = factor("x"), fct = "a rarity",
      hms = 1))
    Output
      # A tibble: 1 x 9
        lgl     int   dbl chr   fct      ord     dte        dtt                 hms   
        <lgl> <int> <dbl> <chr> <fct>    <ord>   <date>     <dttm>              <time>
      1 TRUE      7    10 x     a rarity a rari~ 1970-01-04 1969-12-31 16:00:03 00'01"
    Code
      xnew_data(old_data, xcast(lgl = 0, hms = "01:01:11"))
    Output
      # A tibble: 1 x 9
        lgl     int   dbl chr   fct     ord    dte        dtt                 hms     
        <lgl> <int> <dbl> <chr> <fct>   <ord>  <date>     <dttm>              <time>  
      1 FALSE     3  4.57 most  not obs a rar~ 1970-01-04 1969-12-31 16:00:03 01:01:11

