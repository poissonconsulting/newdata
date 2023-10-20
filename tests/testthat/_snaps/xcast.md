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
      xnew_data(data, xcast(a = 1L))
    Output
      # A tibble: 1 x 5
            a     b c     d     e         
        <dbl> <int> <fct> <lgl> <date>    
      1     1     5 a     FALSE 2023-09-29
    Code
      xnew_data(data, xcast(a = 1:2))
    Output
      # A tibble: 2 x 5
            a     b c     d     e         
        <dbl> <int> <fct> <lgl> <date>    
      1     1     5 a     FALSE 2023-09-29
      2     2     5 a     FALSE 2023-09-29
    Code
      xnew_data(data, xcast(a = c(2, 1)))
    Output
      # A tibble: 2 x 5
            a     b c     d     e         
        <dbl> <int> <fct> <lgl> <date>    
      1     1     5 a     FALSE 2023-09-29
      2     2     5 a     FALSE 2023-09-29
    Code
      xnew_data(data, xcast(a = c(1, 1)))
    Output
      # A tibble: 1 x 5
            a     b c     d     e         
        <dbl> <int> <fct> <lgl> <date>    
      1     1     5 a     FALSE 2023-09-29
    Code
      xnew_data(data, xcast(a = c(1, 1, NA)))
    Output
      # A tibble: 2 x 5
            a     b c     d     e         
        <dbl> <int> <fct> <lgl> <date>    
      1     1     5 a     FALSE 2023-09-29
      2    NA     5 a     FALSE 2023-09-29
    Code
      xnew_data(data, xcast(a = c(1, 1, NA, NA)))
    Output
      # A tibble: 2 x 5
            a     b c     d     e         
        <dbl> <int> <fct> <lgl> <date>    
      1     1     5 a     FALSE 2023-09-29
      2    NA     5 a     FALSE 2023-09-29
    Code
      xnew_data(data, xcast(a = NA))
    Output
      # A tibble: 1 x 5
            a     b c     d     e         
        <dbl> <int> <fct> <lgl> <date>    
      1    NA     5 a     FALSE 2023-09-29
    Code
      xnew_data(data, xcast(a = numeric()))
    Output
      # A tibble: 0 x 5
      # i 5 variables: a <dbl>, b <int>, c <fct>, d <lgl>, e <date>
    Code
      xnew_data(data, xcast(a = 1, b = 6))
    Output
      # A tibble: 1 x 5
            a     b c     d     e         
        <dbl> <int> <fct> <lgl> <date>    
      1     1     6 a     FALSE 2023-09-29
    Code
      expect_error(xnew_data(data, xcast(a = 1, b = 6.5)))
      xnew_data(data, xcast(a = 1, b = 6, c = "e"))
    Output
      # A tibble: 1 x 5
            a     b c     d     e         
        <dbl> <int> <fct> <lgl> <date>    
      1     1     6 e     FALSE 2023-09-29
    Code
      expect_error(xnew_data(data, xcast(c = "f")))
      xnew_data(data, xcast(c = c("b", "a")))
    Output
      # A tibble: 2 x 5
            a     b c     d     e         
        <dbl> <int> <fct> <lgl> <date>    
      1   3.5     5 a     FALSE 2023-09-29
      2   3.5     5 b     FALSE 2023-09-29
    Code
      xnew_data(data, xcast(a = 1, b = 6, c = factor("a", levels = "a")))
    Output
      # A tibble: 1 x 5
            a     b c     d     e         
        <dbl> <int> <fct> <lgl> <date>    
      1     1     6 a     FALSE 2023-09-29
    Code
      xnew_data(data, xcast(a = 1, b = 6, c = factor("a", levels = "a")))$c
    Output
      [1] a
      Levels: a b c d e
    Code
      xnew_data(data, xobs_only(xcast(b = 2:3)))
    Output
      # A tibble: 1 x 5
            a     b c     d     e         
        <dbl> <int> <fct> <lgl> <date>    
      1   3.5     3 a     FALSE 2023-09-29
    Code
      xnew_data(data, xobs_only(xcast(b = new_value(b))))
    Output
      # A tibble: 1 x 5
            a     b c     d     e         
        <dbl> <int> <fct> <lgl> <date>    
      1   3.5     5 a     FALSE 2023-09-29
    Code
      xnew_data(data, xobs_only(xcast(b = new_seq(b))))
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
      xnew_data(data, xcast(a = new_seq(a)))
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
      xnew_data(data, xobs_only(xcast(a = new_seq(a))))
    Output
      # A tibble: 2 x 5
            a     b c     d     e         
        <dbl> <int> <fct> <lgl> <date>    
      1   1.5     5 a     FALSE 2023-09-29
      2   5.5     5 a     FALSE 2023-09-29
    Code
      xnew_data(data, xobs_only(xcast(b = 2L)))
    Output
      # A tibble: 0 x 5
      # i 5 variables: a <dbl>, b <int>, c <fct>, d <lgl>, e <date>
    Code
      xnew_data(data, xobs_only(xcast(b = 1:3)), xobs_only(c = c("a", "b")))
    Output
      # A tibble: 2 x 5
            a     b c     d     e         
        <dbl> <int> <chr> <lgl> <date>    
      1   3.5     3 a     FALSE 2023-09-29
      2   3.5     3 b     FALSE 2023-09-29
    Code
      xnew_data(data, xobs_only(xcast(b = 1:4), c = c("a", "b", "c")))
    Output
      # A tibble: 2 x 5
            a     b c     d     e         
        <dbl> <int> <chr> <lgl> <date>    
      1   3.5     3 a     FALSE 2023-09-29
      2   3.5     4 b     FALSE 2023-09-29

