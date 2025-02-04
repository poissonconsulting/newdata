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
      xnew_data(data)
    Output
      # A tibble: 1 x 5
            a     b c     d     e         
        <dbl> <int> <fct> <lgl> <date>    
      1   3.5     5 a     FALSE 2023-09-29
    Code
      xnew_data(as.data.frame(data))
    Output
      # A tibble: 1 x 5
            a     b c     d     e         
        <dbl> <int> <fct> <lgl> <date>    
      1   3.5     5 a     FALSE 2023-09-29
    Code
      xnew_data(data, a)
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
      xnew_data(data, a = new_value(a))
    Output
      # A tibble: 1 x 5
            a     b c     d     e         
        <dbl> <int> <fct> <lgl> <date>    
      1   3.5     5 a     FALSE 2023-09-29
    Code
      xnew_data(data, xnew_value(a))
    Output
      # A tibble: 1 x 5
            a     b c     d     e         
        <dbl> <int> <fct> <lgl> <date>    
      1   3.5     5 a     FALSE 2023-09-29
    Code
      xnew_data(data, a = dplyr::last(a))
    Output
      # A tibble: 1 x 5
            a     b c     d     e         
        <dbl> <int> <fct> <lgl> <date>    
      1   5.5     5 a     FALSE 2023-09-29
    Code
      xnew_data(data, b)
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
      xnew_data(data, c)
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
      xnew_data(data, xnew_seq(c))
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
      xnew_data(data, xnew_seq(a))
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
      xnew_data(data, xnew_seq(a, length_out = 12))
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
      xnew_data(data, xnew_seq(a, length_out = 12, obs_only = TRUE))
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
      xnew_data(data, xnew_seq(a, length_out = 12), b)
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
      xnew_data(data, b, xnew_seq(a, length_out = 12))
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
      xnew_data(data, tidyr::nesting(c, d))
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
      xnew_data(data, b = 8:10, z = "zed", tidyr::nesting(c, d))
    Output
      # A tibble: 15 x 6
             a     b c     d     e          z    
         <dbl> <int> <fct> <lgl> <date>     <chr>
       1   3.5     8 a     TRUE  2023-09-29 zed  
       2   3.5     8 b     FALSE 2023-09-29 zed  
       3   3.5     8 c     FALSE 2023-09-29 zed  
       4   3.5     8 d     TRUE  2023-09-29 zed  
       5   3.5     8 e     FALSE 2023-09-29 zed  
       6   3.5     9 a     TRUE  2023-09-29 zed  
       7   3.5     9 b     FALSE 2023-09-29 zed  
       8   3.5     9 c     FALSE 2023-09-29 zed  
       9   3.5     9 d     TRUE  2023-09-29 zed  
      10   3.5     9 e     FALSE 2023-09-29 zed  
      11   3.5    10 a     TRUE  2023-09-29 zed  
      12   3.5    10 b     FALSE 2023-09-29 zed  
      13   3.5    10 c     FALSE 2023-09-29 zed  
      14   3.5    10 d     TRUE  2023-09-29 zed  
      15   3.5    10 e     FALSE 2023-09-29 zed  

# one column dataset

    Code
      data
    Output
      # A tibble: 2 x 1
            a
        <int>
      1     1
      2     2
    Code
      xnew_data(data)
    Output
      # A tibble: 1 x 1
            a
        <int>
      1     1
    Code
      xnew_data(as.data.frame(data))
    Output
      # A tibble: 1 x 1
            a
        <int>
      1     1
    Code
      xnew_data(data, a)
    Output
      # A tibble: 2 x 1
            a
        <int>
      1     1
      2     2
    Code
      xnew_data(as.data.frame(data), a)
    Output
      # A tibble: 2 x 1
            a
        <int>
      1     1
      2     2

# one column no row dataset

    Code
      data
    Output
      # A tibble: 0 x 1
      # i 1 variable: a <int>
    Code
      xnew_data(data)
    Output
      # A tibble: 1 x 1
            a
        <int>
      1    NA
    Code
      xnew_data(as.data.frame(data))
    Output
      # A tibble: 1 x 1
            a
        <int>
      1    NA
    Code
      xnew_data(data, a)
    Output
      # A tibble: 1 x 1
            a
        <int>
      1    NA
    Code
      xnew_data(as.data.frame(data), a)
    Output
      # A tibble: 1 x 1
            a
        <int>
      1    NA

# no column no row dataset

    Code
      data
    Output
      # A tibble: 0 x 0
    Code
      xnew_data(data)
    Output
      # A tibble: 1 x 0
    Code
      xnew_data(as.data.frame(data))
    Output
      # A tibble: 1 x 0

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
      xnew_data(data)
    Output
      # A tibble: 1 x 4
        period  year annual ordered
        <fct>  <int> <fct>  <ord>  
      1 before  2005 2000   2005   
    Code
      xnew_data(data, xnew_value(annual))
    Output
      # A tibble: 1 x 4
        period  year annual ordered
        <fct>  <int> <fct>  <ord>  
      1 before  2005 2000   2005   
    Code
      xnew_data(data, xnew_value(annual, obs_only = TRUE))
    Output
      # A tibble: 1 x 4
        period  year annual ordered
        <fct>  <int> <fct>  <ord>  
      1 before  2005 2001   2005   
    Code
      xnew_data(data, tidyr::nesting(period, year))
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
      xnew_data(data, tidyr::nesting(period, year, annual))
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
      xnew_data(data, tidyr::nesting(period, year, xnew_value(annual)))
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
      xnew_data(data, tidyr::nesting(period, year), xnew_value(annual))
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

# xnew_data called twice works

    Code
      data
    Output
      # A tibble: 3 x 3
            a     b d    
        <int> <dbl> <chr>
      1     1   4   a    
      2     3   4.5 b    
      3     4   6   c    
    Code
      xnew_data(xnew_data(data, a))
    Output
      # A tibble: 1 x 3
            a     b d    
        <int> <dbl> <chr>
      1     2  4.83 a    
    Code
      xnew_data(xnew_data(data, a, b = new_value(b), xnew_value(d)))
    Output
      # A tibble: 1 x 3
            a     b d    
        <int> <dbl> <chr>
      1     2  4.83 a    

# xnew_data factor with 100 levels

    Code
      data
    Output
      # A tibble: 100 x 2
         fct     dbl
         <fct> <dbl>
       1 1         1
       2 2         2
       3 3         3
       4 4         4
       5 5         5
       6 6         6
       7 7         7
       8 8         8
       9 9         9
      10 10       10
      # i 90 more rows
    Code
      xnew_data(data)
    Output
      # A tibble: 1 x 2
        fct     dbl
        <fct> <dbl>
      1 1      50.5
    Code
      xnew_data(data, fct)
    Output
      # A tibble: 100 x 2
         fct     dbl
         <fct> <dbl>
       1 1      50.5
       2 2      50.5
       3 3      50.5
       4 4      50.5
       5 5      50.5
       6 6      50.5
       7 7      50.5
       8 8      50.5
       9 9      50.5
      10 10     50.5
      # i 90 more rows
    Code
      xnew_data(data, dbl)
    Output
      # A tibble: 30 x 2
         fct     dbl
         <fct> <dbl>
       1 1      1   
       2 1      4.41
       3 1      7.83
       4 1     11.2 
       5 1     14.7 
       6 1     18.1 
       7 1     21.5 
       8 1     24.9 
       9 1     28.3 
      10 1     31.7 
      # i 20 more rows
    Code
      xnew_data(data, dbl, fct)
    Output
      # A tibble: 3,000 x 2
         fct     dbl
         <fct> <dbl>
       1 1         1
       2 2         1
       3 3         1
       4 4         1
       5 5         1
       6 6         1
       7 7         1
       8 8         1
       9 9         1
      10 10        1
      # i 2,990 more rows
    Code
      xnew_data(data, fct, dbl)
    Output
      # A tibble: 3,000 x 2
         fct     dbl
         <fct> <dbl>
       1 1      1   
       2 1      4.41
       3 1      7.83
       4 1     11.2 
       5 1     14.7 
       6 1     18.1 
       7 1     21.5 
       8 1     24.9 
       9 1     28.3 
      10 1     31.7 
      # i 2,990 more rows
    Code
      xnew_data(data, fct, dbl, .length_out = 30)
    Output
      # A tibble: 900 x 2
         fct     dbl
         <fct> <dbl>
       1 1      1   
       2 1      4.41
       3 1      7.83
       4 1     11.2 
       5 1     14.7 
       6 1     18.1 
       7 1     21.5 
       8 1     24.9 
       9 1     28.3 
      10 1     31.7 
      # i 890 more rows
    Code
      xnew_data(data, fct, dbl, .length_out = 29)
    Output
      # A tibble: 841 x 2
         fct     dbl
         <fct> <dbl>
       1 1      1   
       2 1      4.54
       3 1      8.07
       4 1     11.6 
       5 1     15.1 
       6 1     18.7 
       7 1     22.2 
       8 1     25.8 
       9 1     29.3 
      10 1     32.8 
      # i 831 more rows

