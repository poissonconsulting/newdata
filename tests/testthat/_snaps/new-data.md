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
      # A tibble: 50 x 6
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
      # i 40 more rows
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

---

    Code
      new_data(ToothGrowth, ref = list(dose = 4))
    Output
      # A tibble: 1 x 3
          len supp   dose
        <dbl> <fct> <dbl>
      1  18.8 OJ        4

---

    Code
      new_data(ToothGrowth, ref = list(dose = c(3, 4)))
    Output
      # A tibble: 2 x 3
          len supp   dose
        <dbl> <fct> <dbl>
      1  18.8 OJ        3
      2  18.8 OJ        4

---

    Code
      new_data(ToothGrowth, ref = list(dose = c(3, 4), len = c(10.1, 12, 13)))
    Output
      # A tibble: 6 x 3
          len supp   dose
        <dbl> <fct> <dbl>
      1  10.1 OJ        3
      2  10.1 OJ        4
      3  12   OJ        3
      4  12   OJ        4
      5  13   OJ        3
      6  13   OJ        4

---

    Code
      new_data(ToothGrowth, ref = list(supp = factor("VC")))
    Output
      # A tibble: 1 x 3
          len supp   dose
        <dbl> <fct> <dbl>
      1  18.8 VC     1.17

---

    Code
      new_data(ToothGrowth, ref = list(supp = factor("TP")))
    Output
      # A tibble: 1 x 3
          len supp   dose
        <dbl> <fct> <dbl>
      1  18.8 TP     1.17

---

    Code
      new_data(ToothGrowth, ref = list(supp = factor(c("VC", "OJ"))))
    Output
      # A tibble: 2 x 3
          len supp   dose
        <dbl> <fct> <dbl>
      1  18.8 VC     1.17
      2  18.8 OJ     1.17

# new_data ref overridden by seq

    Code
      new_data(Orange, seq = "age", ref = list(age = 118))
    Output
      # A tibble: 30 x 3
         Tree    age circumference
         <ord> <dbl>         <dbl>
       1 5      118           116.
       2 5      168.          116.
       3 5      219.          116.
       4 5      269.          116.
       5 5      320.          116.
       6 5      370.          116.
       7 5      421.          116.
       8 5      471.          116.
       9 5      522.          116.
      10 5      572.          116.
      # i 20 more rows

# new_data factor with 100 levels

    Code
      new_seq(data$fct)
    Output
        [1] 1   2   3   4   5   6   7   8   9   10  11  12  13  14  15  16  17  18 
       [19] 19  20  21  22  23  24  25  26  27  28  29  30  31  32  33  34  35  36 
       [37] 37  38  39  40  41  42  43  44  45  46  47  48  49  50  51  52  53  54 
       [55] 55  56  57  58  59  60  61  62  63  64  65  66  67  68  69  70  71  72 
       [73] 73  74  75  76  77  78  79  80  81  82  83  84  85  86  87  88  89  90 
       [91] 91  92  93  94  95  96  97  98  99  100
      100 Levels: 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 ... 100

---

    Code
      new_data(data, "fct")
    Output
      # A tibble: 100 x 1
         fct  
         <fct>
       1 1    
       2 2    
       3 3    
       4 4    
       5 5    
       6 6    
       7 7    
       8 8    
       9 9    
      10 10   
      # i 90 more rows

