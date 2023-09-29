# simple dataset

    Code
      data
    Output
      # A tibble: 5 x 5
            a     b c     d     e         
        <dbl> <int> <fct> <lgl> <date>    
      1   1.5     3 a     TRUE  2023-09-27
      2   2.5     4 b     FALSE 2023-09-28
      3   3.5     5 c     FALSE 2023-09-29
      4   4.5     6 d     TRUE  2023-09-30
      5   5.5     7 e     FALSE 2023-10-01
    Code
      auto_expand(data)
    Output
      # A tibble: 1 x 5
            a     b c     d     e         
        <dbl> <int> <fct> <lgl> <date>    
      1   3.5     5 a     FALSE 2023-09-29
    Code
      auto_expand(data, a)
    Output
      # A tibble: 5 x 5
            a     b c     d     e         
        <dbl> <int> <fct> <lgl> <date>    
      1   1.5     5 a     FALSE 2023-09-29
      2   2.5     5 a     FALSE 2023-09-29
      3   3.5     5 a     FALSE 2023-09-29
      4   4.5     5 a     FALSE 2023-09-29
      5   5.5     5 a     FALSE 2023-09-29
    Code
      auto_expand(data, a = new_value(a))
    Output
      # A tibble: 1 x 5
            a     b c     d     e         
        <dbl> <int> <fct> <lgl> <date>    
      1   3.5     5 a     FALSE 2023-09-29
    Code
      auto_expand(data, new_valuex(a))
    Output
      # A tibble: 1 x 5
            a     b c     d     e         
        <dbl> <int> <fct> <lgl> <date>    
      1   3.5     5 a     FALSE 2023-09-29
    Code
      auto_expand(data, a = dplyr::last(a))
    Output
      # A tibble: 1 x 5
            a     b c     d     e         
        <dbl> <int> <fct> <lgl> <date>    
      1   5.5     5 a     FALSE 2023-09-29
    Code
      auto_expand(data, b)
    Output
      # A tibble: 5 x 5
            a     b c     d     e         
        <dbl> <int> <fct> <lgl> <date>    
      1   3.5     3 a     FALSE 2023-09-29
      2   3.5     4 a     FALSE 2023-09-29
      3   3.5     5 a     FALSE 2023-09-29
      4   3.5     6 a     FALSE 2023-09-29
      5   3.5     7 a     FALSE 2023-09-29
    Code
      auto_expand(data, c)
    Output
      # A tibble: 5 x 5
            a     b c     d     e         
        <dbl> <int> <fct> <lgl> <date>    
      1   3.5     5 a     FALSE 2023-09-29
      2   3.5     5 b     FALSE 2023-09-29
      3   3.5     5 c     FALSE 2023-09-29
      4   3.5     5 d     FALSE 2023-09-29
      5   3.5     5 e     FALSE 2023-09-29
    Code
      auto_expand(data, new_seqx(c))
    Output
      # A tibble: 5 x 5
            a     b c     d     e         
        <dbl> <int> <fct> <lgl> <date>    
      1   3.5     5 a     FALSE 2023-09-29
      2   3.5     5 b     FALSE 2023-09-29
      3   3.5     5 c     FALSE 2023-09-29
      4   3.5     5 d     FALSE 2023-09-29
      5   3.5     5 e     FALSE 2023-09-29
    Code
      auto_expand(data, new_seqx(a))
    Output
      # A tibble: 30 x 5
             a     b c     d     e         
         <dbl> <int> <fct> <lgl> <date>    
       1  1.5      5 a     FALSE 2023-09-29
       2  1.64     5 a     FALSE 2023-09-29
       3  1.78     5 a     FALSE 2023-09-29
       4  1.91     5 a     FALSE 2023-09-29
       5  2.05     5 a     FALSE 2023-09-29
       6  2.19     5 a     FALSE 2023-09-29
       7  2.33     5 a     FALSE 2023-09-29
       8  2.47     5 a     FALSE 2023-09-29
       9  2.60     5 a     FALSE 2023-09-29
      10  2.74     5 a     FALSE 2023-09-29
      # i 20 more rows
    Code
      auto_expand(data, new_seqx(a, length_out = 12))
    Output
      # A tibble: 12 x 5
             a     b c     d     e         
         <dbl> <int> <fct> <lgl> <date>    
       1  1.5      5 a     FALSE 2023-09-29
       2  1.86     5 a     FALSE 2023-09-29
       3  2.23     5 a     FALSE 2023-09-29
       4  2.59     5 a     FALSE 2023-09-29
       5  2.95     5 a     FALSE 2023-09-29
       6  3.32     5 a     FALSE 2023-09-29
       7  3.68     5 a     FALSE 2023-09-29
       8  4.05     5 a     FALSE 2023-09-29
       9  4.41     5 a     FALSE 2023-09-29
      10  4.77     5 a     FALSE 2023-09-29
      11  5.14     5 a     FALSE 2023-09-29
      12  5.5      5 a     FALSE 2023-09-29
    Code
      auto_expand(data, new_seqx(a, length_out = 12, obs_only = TRUE))
    Output
      # A tibble: 5 x 5
            a     b c     d     e         
        <dbl> <int> <fct> <lgl> <date>    
      1   1.5     5 a     FALSE 2023-09-29
      2   2.5     5 a     FALSE 2023-09-29
      3   3.5     5 a     FALSE 2023-09-29
      4   4.5     5 a     FALSE 2023-09-29
      5   5.5     5 a     FALSE 2023-09-29
    Code
      auto_expand(data, new_seqx(a, length_out = 12), b)
    Output
      # A tibble: 60 x 5
             a     b c     d     e         
         <dbl> <int> <fct> <lgl> <date>    
       1  1.5      3 a     FALSE 2023-09-29
       2  1.5      4 a     FALSE 2023-09-29
       3  1.5      5 a     FALSE 2023-09-29
       4  1.5      6 a     FALSE 2023-09-29
       5  1.5      7 a     FALSE 2023-09-29
       6  1.86     3 a     FALSE 2023-09-29
       7  1.86     4 a     FALSE 2023-09-29
       8  1.86     5 a     FALSE 2023-09-29
       9  1.86     6 a     FALSE 2023-09-29
      10  1.86     7 a     FALSE 2023-09-29
      # i 50 more rows
    Code
      auto_expand(data, b, new_seqx(a, length_out = 12))
    Output
      # A tibble: 60 x 5
             a     b c     d     e         
         <dbl> <int> <fct> <lgl> <date>    
       1  1.5      3 a     FALSE 2023-09-29
       2  1.86     3 a     FALSE 2023-09-29
       3  2.23     3 a     FALSE 2023-09-29
       4  2.59     3 a     FALSE 2023-09-29
       5  2.95     3 a     FALSE 2023-09-29
       6  3.32     3 a     FALSE 2023-09-29
       7  3.68     3 a     FALSE 2023-09-29
       8  4.05     3 a     FALSE 2023-09-29
       9  4.41     3 a     FALSE 2023-09-29
      10  4.77     3 a     FALSE 2023-09-29
      # i 50 more rows
    Code
      auto_expand(data, tidyr::nesting(c, d))
    Output
      # A tibble: 5 x 5
            a     b c     d     e         
        <dbl> <int> <fct> <lgl> <date>    
      1   3.5     5 a     TRUE  2023-09-29
      2   3.5     5 b     FALSE 2023-09-29
      3   3.5     5 c     FALSE 2023-09-29
      4   3.5     5 d     TRUE  2023-09-29
      5   3.5     5 e     FALSE 2023-09-29
    Code
      auto_expand(data, tidyr::nesting(c, d), .filter = c %in% c("a", "b", "c"))
    Output
      # A tibble: 3 x 5
            a     b c     d     e         
        <dbl> <int> <fct> <lgl> <date>    
      1   3.5     5 a     TRUE  2023-09-29
      2   3.5     5 b     FALSE 2023-09-29
      3   3.5     5 c     FALSE 2023-09-29
    Code
      auto_expand(data, b = 8:10, z = "zed", tidyr::nesting(c, d), .filter = c %in% c(
        "a", "b", "c"))
    Output
      # A tibble: 9 x 6
            a     b c     d     e          z    
        <dbl> <int> <fct> <lgl> <date>     <chr>
      1   3.5     8 a     TRUE  2023-09-29 zed  
      2   3.5     8 b     FALSE 2023-09-29 zed  
      3   3.5     8 c     FALSE 2023-09-29 zed  
      4   3.5     9 a     TRUE  2023-09-29 zed  
      5   3.5     9 b     FALSE 2023-09-29 zed  
      6   3.5     9 c     FALSE 2023-09-29 zed  
      7   3.5    10 a     TRUE  2023-09-29 zed  
      8   3.5    10 b     FALSE 2023-09-29 zed  
      9   3.5    10 c     FALSE 2023-09-29 zed  

# factors

    Code
      data
    Output
      # A tibble: 10 x 4
         period  year annual ordered
         <fct>  <int> <fct>  <ord>  
       1 before  2001 2001   2001   
       2 before  2002 2002   2002   
       3 before  2003 2003   2003   
       4 before  2004 2004   2004   
       5 before  2005 2005   2005   
       6 after   2006 2006   2006   
       7 after   2007 2007   2007   
       8 after   2008 2008   2008   
       9 after   2009 2009   2009   
      10 after   2010 2010   2010   
    Code
      auto_expand(data)
    Output
      # A tibble: 1 x 4
        period  year annual ordered
        <fct>  <int> <fct>  <ord>  
      1 before  2005 2000   2005   
    Code
      auto_expand(data, tidyr::nesting(period, year))
    Output
      # A tibble: 10 x 4
         period  year annual ordered
         <fct>  <int> <fct>  <ord>  
       1 before  2001 2000   2005   
       2 before  2002 2000   2005   
       3 before  2003 2000   2005   
       4 before  2004 2000   2005   
       5 before  2005 2000   2005   
       6 after   2006 2000   2005   
       7 after   2007 2000   2005   
       8 after   2008 2000   2005   
       9 after   2009 2000   2005   
      10 after   2010 2000   2005   
    Code
      auto_expand(data, tidyr::nesting(period, year, annual))
    Output
      # A tibble: 10 x 4
         period  year annual ordered
         <fct>  <int> <fct>  <ord>  
       1 before  2001 2001   2005   
       2 before  2002 2002   2005   
       3 before  2003 2003   2005   
       4 before  2004 2004   2005   
       5 before  2005 2005   2005   
       6 after   2006 2006   2005   
       7 after   2007 2007   2005   
       8 after   2008 2008   2005   
       9 after   2009 2009   2005   
      10 after   2010 2010   2005   
    Code
      auto_expand(data, tidyr::nesting(period, year, new_valuex(annual)))
    Output
      # A tibble: 10 x 4
         period  year annual ordered
         <fct>  <int> <fct>  <ord>  
       1 before  2001 2000   2005   
       2 before  2002 2000   2005   
       3 before  2003 2000   2005   
       4 before  2004 2000   2005   
       5 before  2005 2000   2005   
       6 after   2006 2000   2005   
       7 after   2007 2000   2005   
       8 after   2008 2000   2005   
       9 after   2009 2000   2005   
      10 after   2010 2000   2005   

