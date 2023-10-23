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
      xnew_data(data, b = 1:4, d = c(TRUE, FALSE))
    Output
      # A tibble: 8 x 5
            a     b c     d     e         
        <dbl> <int> <fct> <lgl> <date>    
      1   3.5     1 a     FALSE 2023-09-29
      2   3.5     1 a     TRUE  2023-09-29
      3   3.5     2 a     FALSE 2023-09-29
      4   3.5     2 a     TRUE  2023-09-29
      5   3.5     3 a     FALSE 2023-09-29
      6   3.5     3 a     TRUE  2023-09-29
      7   3.5     4 a     FALSE 2023-09-29
      8   3.5     4 a     TRUE  2023-09-29
    Code
      xnew_data(data, xobs_only(b = 1:4), xobs_only(d = c(TRUE, FALSE)))
    Output
      # A tibble: 4 x 5
            a     b c     d     e         
        <dbl> <int> <fct> <lgl> <date>    
      1   3.5     3 a     FALSE 2023-09-29
      2   3.5     3 a     TRUE  2023-09-29
      3   3.5     4 a     FALSE 2023-09-29
      4   3.5     4 a     TRUE  2023-09-29
    Code
      xnew_data(data, xobs_only(b = 1:4), d = c(TRUE, FALSE))
    Output
      # A tibble: 4 x 5
            a     b c     d     e         
        <dbl> <int> <fct> <lgl> <date>    
      1   3.5     3 a     FALSE 2023-09-29
      2   3.5     3 a     TRUE  2023-09-29
      3   3.5     4 a     FALSE 2023-09-29
      4   3.5     4 a     TRUE  2023-09-29
    Code
      xnew_data(data, xobs_only(b = 1:4, d = c(TRUE, FALSE)))
    Output
      # A tibble: 2 x 5
            a     b c     d     e         
        <dbl> <int> <fct> <lgl> <date>    
      1   3.5     3 a     TRUE  2023-09-29
      2   3.5     4 a     FALSE 2023-09-29
    Code
      xnew_data(data, xobs_only(b = 2:3))
    Output
      # A tibble: 1 x 5
            a     b c     d     e         
        <dbl> <int> <fct> <lgl> <date>    
      1   3.5     3 a     FALSE 2023-09-29
    Code
      xnew_data(data, xobs_only(b = new_value(b)))
    Output
      # A tibble: 1 x 5
            a     b c     d     e         
        <dbl> <int> <fct> <lgl> <date>    
      1   3.5     5 a     FALSE 2023-09-29
    Code
      xnew_data(data, xobs_only(b = new_seq(b)))
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
      xnew_data(data, xobs_only(a = new_seq(a)))
    Output
      # A tibble: 2 x 5
            a     b c     d     e         
        <dbl> <int> <fct> <lgl> <date>    
      1   1.5     5 a     FALSE 2023-09-29
      2   5.5     5 a     FALSE 2023-09-29
    Code
      xnew_data(data, xobs_only(a = new_seq(a, obs_only = TRUE), b = 1:4))
    Output
      # A tibble: 2 x 5
            a     b c     d     e         
        <dbl> <int> <fct> <lgl> <date>    
      1   1.5     3 a     FALSE 2023-09-29
      2   2.5     4 a     FALSE 2023-09-29
    Code
      expect_error(xnew_data(data, xobs_only(b = new_value(a), b = 1:4)),
      "Names must be unique.")
      xnew_data(data, xobs_only(b = new_value(a)))
    Output
      # A tibble: 0 x 5
      # i 5 variables: a <dbl>, b <dbl>, c <fct>, d <lgl>, e <date>

