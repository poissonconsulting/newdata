# xnew_value

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
      xnew_data(data, a)
    Output
      # A tibble: 4 x 3
            a     b d    
        <int> <dbl> <chr>
      1     1  4.83 a    
      2     2  4.83 a    
      3     3  4.83 a    
      4     4  4.83 a    
    Code
      xnew_data(data, a, b = new_value(b), xnew_value(d))
    Output
      # A tibble: 4 x 3
            a     b d    
        <int> <dbl> <chr>
      1     1  4.83 a    
      2     2  4.83 a    
      3     3  4.83 a    
      4     4  4.83 a    

