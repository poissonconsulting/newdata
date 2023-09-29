# newdata

    Code
      chickwts
    Output
         weight      feed
      1     179 horsebean
      2     160 horsebean
      3     136 horsebean
      4     227 horsebean
      5     217 horsebean
      6     168 horsebean
      7     108 horsebean
      8     124 horsebean
      9     143 horsebean
      10    140 horsebean
      11    309   linseed
      12    229   linseed
      13    181   linseed
      14    141   linseed
      15    260   linseed
      16    203   linseed
      17    148   linseed
      18    169   linseed
      19    213   linseed
      20    257   linseed
      21    244   linseed
      22    271   linseed
      23    243   soybean
      24    230   soybean
      25    248   soybean
      26    327   soybean
      27    329   soybean
      28    250   soybean
      29    193   soybean
      30    271   soybean
      31    316   soybean
      32    267   soybean
      33    199   soybean
      34    171   soybean
      35    158   soybean
      36    248   soybean
      37    423 sunflower
      38    340 sunflower
      39    392 sunflower
      40    339 sunflower
      41    341 sunflower
      42    226 sunflower
      43    320 sunflower
      44    295 sunflower
      45    334 sunflower
      46    322 sunflower
      47    297 sunflower
      48    318 sunflower
      49    325  meatmeal
      50    257  meatmeal
      51    303  meatmeal
      52    315  meatmeal
      53    380  meatmeal
      54    153  meatmeal
      55    263  meatmeal
      56    242  meatmeal
      57    206  meatmeal
      58    344  meatmeal
      59    258  meatmeal
      60    368    casein
      61    390    casein
      62    379    casein
      63    260    casein
      64    404    casein
      65    318    casein
      66    352    casein
      67    359    casein
      68    216    casein
      69    222    casein
      70    283    casein
      71    332    casein
    Code
      new_data(chickwts)
    Output
      # A tibble: 1 x 2
        weight feed  
         <dbl> <fct> 
      1   261. casein
    Code
      new_data(datasets::chickwts, "feed")
    Output
      # A tibble: 6 x 2
        weight feed     
         <dbl> <fct>    
      1   261. casein   
      2   261. horsebean
      3   261. linseed  
      4   261. meatmeal 
      5   261. soybean  
      6   261. sunflower
    Code
      new_data(datasets::chickwts, "weight")
    Output
      # A tibble: 30 x 2
         weight feed  
          <dbl> <fct> 
       1   108  casein
       2   119. casein
       3   130. casein
       4   141. casein
       5   151. casein
       6   162. casein
       7   173. casein
       8   184. casein
       9   195. casein
      10   206. casein
      # i 20 more rows
    Code
      new_data(datasets::chickwts, c("weight", "feed"))
    Output
      # A tibble: 180 x 2
         weight feed  
          <dbl> <fct> 
       1   108  casein
       2   119. casein
       3   130. casein
       4   141. casein
       5   151. casein
       6   162. casein
       7   173. casein
       8   184. casein
       9   195. casein
      10   206. casein
      # i 170 more rows

# new_data generates data frame with correct number of rows

    Code
      data
    Output
         dlogical dinteger dnumeric dfactor      ddate     dhms
      1     FALSE        1      1.1       1 2000-01-02 10:00:01
      2      TRUE        2      2.1       2 2000-01-03 10:00:02
      3      TRUE        3      3.1       3 2000-01-04 10:00:03
      4      TRUE        4      4.1       4 2000-01-05 10:00:04
      5      TRUE        5      5.1       5 2000-01-06 10:00:05
      6      TRUE        6      6.1       6 2000-01-07 10:00:06
      7      TRUE        7      7.1       7 2000-01-08 10:00:07
      8      TRUE        8      8.1       8 2000-01-09 10:00:08
      9      TRUE        9      9.1       9 2000-01-10 10:00:09
      10     TRUE       10     10.1      10 2000-01-11 10:00:10
    Code
      new_data(data)
    Output
      # A tibble: 1 x 6
        dlogical dinteger dnumeric dfactor ddate      dhms    
        <lgl>       <int>    <dbl> <fct>   <date>     <time>  
      1 FALSE           5      5.6 1       2000-01-06 10:00:05
    Code
      new_data(data, "dlogical")
    Output
      # A tibble: 2 x 6
        dlogical dinteger dnumeric dfactor ddate      dhms    
        <lgl>       <int>    <dbl> <fct>   <date>     <time>  
      1 FALSE           5      5.6 1       2000-01-06 10:00:05
      2 TRUE            5      5.6 1       2000-01-06 10:00:05
    Code
      new_data(data, "dnumeric")
    Output
      # A tibble: 30 x 6
         dlogical dinteger dnumeric dfactor ddate      dhms    
         <lgl>       <int>    <dbl> <fct>   <date>     <time>  
       1 FALSE           5     1.1  1       2000-01-06 10:00:05
       2 FALSE           5     1.41 1       2000-01-06 10:00:05
       3 FALSE           5     1.72 1       2000-01-06 10:00:05
       4 FALSE           5     2.03 1       2000-01-06 10:00:05
       5 FALSE           5     2.34 1       2000-01-06 10:00:05
       6 FALSE           5     2.65 1       2000-01-06 10:00:05
       7 FALSE           5     2.96 1       2000-01-06 10:00:05
       8 FALSE           5     3.27 1       2000-01-06 10:00:05
       9 FALSE           5     3.58 1       2000-01-06 10:00:05
      10 FALSE           5     3.89 1       2000-01-06 10:00:05
      # i 20 more rows
    Code
      new_data(data, c("dnumeric", "dinteger"))
    Output
      # A tibble: 300 x 6
         dlogical dinteger dnumeric dfactor ddate      dhms    
         <lgl>       <int>    <dbl> <fct>   <date>     <time>  
       1 FALSE           1      1.1 1       2000-01-06 10:00:05
       2 FALSE           2      1.1 1       2000-01-06 10:00:05
       3 FALSE           3      1.1 1       2000-01-06 10:00:05
       4 FALSE           4      1.1 1       2000-01-06 10:00:05
       5 FALSE           5      1.1 1       2000-01-06 10:00:05
       6 FALSE           6      1.1 1       2000-01-06 10:00:05
       7 FALSE           7      1.1 1       2000-01-06 10:00:05
       8 FALSE           8      1.1 1       2000-01-06 10:00:05
       9 FALSE           9      1.1 1       2000-01-06 10:00:05
      10 FALSE          10      1.1 1       2000-01-06 10:00:05
      # i 290 more rows
    Code
      new_data(data, c("dfactor", "dinteger"), length_out = 5)
    Output
      # A tibble: 25 x 6
         dlogical dinteger dnumeric dfactor ddate      dhms    
         <lgl>       <int>    <dbl> <fct>   <date>     <time>  
       1 FALSE           1      5.6 1       2000-01-06 10:00:05
       2 FALSE           3      5.6 1       2000-01-06 10:00:05
       3 FALSE           5      5.6 1       2000-01-06 10:00:05
       4 FALSE           7      5.6 1       2000-01-06 10:00:05
       5 FALSE          10      5.6 1       2000-01-06 10:00:05
       6 FALSE           1      5.6 2       2000-01-06 10:00:05
       7 FALSE           3      5.6 2       2000-01-06 10:00:05
       8 FALSE           5      5.6 2       2000-01-06 10:00:05
       9 FALSE           7      5.6 2       2000-01-06 10:00:05
      10 FALSE          10      5.6 2       2000-01-06 10:00:05
      # i 15 more rows
    Code
      new_data(data, c("dhms"), length_out = 5)
    Output
      # A tibble: 5 x 6
        dlogical dinteger dnumeric dfactor ddate      dhms    
        <lgl>       <int>    <dbl> <fct>   <date>     <time>  
      1 FALSE           5      5.6 1       2000-01-06 10:00:01
      2 FALSE           5      5.6 1       2000-01-06 10:00:03
      3 FALSE           5      5.6 1       2000-01-06 10:00:05
      4 FALSE           5      5.6 1       2000-01-06 10:00:07
      5 FALSE           5      5.6 1       2000-01-06 10:00:10

# new_data ref works

    Code
      new_data(Orange)
    Output
      # A tibble: 1 x 3
        Tree    age circumference
        <ord> <dbl>         <dbl>
      1 5      922.          116.
    Code
      new_data(Orange, ref = list(age = 1))
    Output
      # A tibble: 1 x 3
        Tree    age circumference
        <ord> <dbl>         <dbl>
      1 5         1          116.
    Code
      new_data(Orange, ref = list(age = c(1, 2)))
    Output
      # A tibble: 2 x 3
        Tree    age circumference
        <ord> <dbl>         <dbl>
      1 5         1          116.
      2 5         2          116.

