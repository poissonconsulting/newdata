# obs_only

    Code
      obs_only(newdata, data, "Tree")
    Output
         Tree age circumference
      1     1   3             7
      2     1   3             6
      3     1   1             8
      4     1   1             6
      5     1   4             7
      6     1   4             6
      7     1   2             8
      8     1   2             7
      9     1   2             6
      10    1   5             7
      11    1   5             6
      12    1   3             8
      13    1   1            10
      14    1   1             9
      15    1   4            10
      16    1   1             7
      17    1   4             8
      18    1   2            10
      19    1   2             9
      20    1   5            10
      21    1   5             9
      22    1   5             8
      23    1   3            10
      24    1   3             9
      25    1   4             9
      26    5   2             6
      27    5   5             7
      28    5   5             6
      29    5   2             7
      30    5   3             7
      31    5   3             6
      32    5   1             8
      33    5   1             7
      34    5   1             6
      35    5   4             7
      36    5   4             6
      37    5   2             8
      38    5   5             9
      39    5   5             8
      40    5   3            10
      41    5   3             9
      42    5   3             8
      43    5   1            10
      44    5   1             9
      45    5   4            10
      46    5   4             9
      47    5   4             8
      48    5   2            10
      49    5   2             9
      50    5   5            10
    Code
      obs_only(newdata, data[1, ], "Tree")
    Output
         Tree age circumference
      1     1   3             7
      2     1   3             6
      3     1   1             8
      4     1   1             7
      5     1   1             6
      6     1   4             7
      7     1   4             6
      8     1   2             8
      9     1   2             7
      10    1   2             6
      11    1   5             7
      12    1   5             6
      13    1   3             8
      14    1   1            10
      15    1   1             9
      16    1   4            10
      17    1   4             9
      18    1   4             8
      19    1   2            10
      20    1   2             9
      21    1   5            10
      22    1   5             9
      23    1   5             8
      24    1   3            10
      25    1   3             9

# new_data obs_only

    Code
      new_data(data)
    Output
      # A tibble: 1 x 4
        Fac1  Fac2  Fac3  Random
        <fct> <fct> <fct>  <int>
      1 1     1     1          1
    Code
      new_data(data, c("Fac1"))
    Output
      # A tibble: 3 x 4
        Fac1  Fac2  Fac3  Random
        <fct> <fct> <fct>  <int>
      1 1     1     1          1
      2 2     1     1          1
      3 4     1     1          1
    Code
      new_data(data, c("Fac2"))
    Output
      # A tibble: 2 x 4
        Fac1  Fac2  Fac3  Random
        <fct> <fct> <fct>  <int>
      1 1     1     1          1
      2 1     3     1          1
    Code
      new_data(data, c("Fac3"))
    Output
      # A tibble: 3 x 4
        Fac1  Fac2  Fac3  Random
        <fct> <fct> <fct>  <int>
      1 1     1     1          1
      2 1     1     2          1
      3 1     1     3          1
    Code
      new_data(data, c("Fac3"), obs_only = list("Fac3"))
    Output
      # A tibble: 2 x 4
        Fac1  Fac2  Fac3  Random
        <fct> <fct> <fct>  <int>
      1 1     1     1          1
      2 1     1     2          1
    Code
      new_data(data, c("Fac1", "Fac2"))
    Output
      # A tibble: 6 x 4
        Fac1  Fac2  Fac3  Random
        <fct> <fct> <fct>  <int>
      1 1     1     1          1
      2 2     1     1          1
      3 4     1     1          1
      4 1     3     1          1
      5 2     3     1          1
      6 4     3     1          1
    Code
      new_data(data, c("Fac1", "Fac2"), obs_only = TRUE)
    Output
      # A tibble: 5 x 4
        Fac1  Fac2  Fac3  Random
        <fct> <fct> <fct>  <int>
      1 1     3     1          1
      2 2     1     1          1
      3 2     3     1          1
      4 4     1     1          1
      5 4     3     1          1
    Code
      new_data(data, c("Fac1", "Fac2", "Fac3"))
    Output
      # A tibble: 18 x 4
         Fac1  Fac2  Fac3  Random
         <fct> <fct> <fct>  <int>
       1 1     1     1          1
       2 2     1     1          1
       3 4     1     1          1
       4 1     3     1          1
       5 2     3     1          1
       6 4     3     1          1
       7 1     1     2          1
       8 2     1     2          1
       9 4     1     2          1
      10 1     3     2          1
      11 2     3     2          1
      12 4     3     2          1
      13 1     1     3          1
      14 2     1     3          1
      15 4     1     3          1
      16 1     3     3          1
      17 2     3     3          1
      18 4     3     3          1
    Code
      new_data(data, c("Fac1", "Fac2", "Fac3"), obs_only = TRUE)
    Output
      # A tibble: 10 x 4
         Fac1  Fac2  Fac3  Random
         <fct> <fct> <fct>  <int>
       1 1     3     1          1
       2 1     3     2          1
       3 2     1     1          1
       4 2     1     2          1
       5 2     3     1          1
       6 2     3     2          1
       7 4     1     1          1
       8 4     1     2          1
       9 4     3     1          1
      10 4     3     2          1
    Code
      new_data(data, c("Random"), obs_only = TRUE)
    Output
      # A tibble: 2 x 4
        Fac1  Fac2  Fac3  Random
        <fct> <fct> <fct>  <int>
      1 1     1     1          1
      2 1     1     1          2
    Code
      new_data(data, c("Fac3", "Random"))
    Output
      # A tibble: 6 x 4
        Fac1  Fac2  Fac3  Random
        <fct> <fct> <fct>  <int>
      1 1     1     1          1
      2 1     1     2          1
      3 1     1     3          1
      4 1     1     1          2
      5 1     1     2          2
      6 1     1     3          2
    Code
      new_data(data, c("Fac3", "Random"), obs_only = TRUE)
    Output
      # A tibble: 4 x 4
        Fac1  Fac2  Fac3  Random
        <fct> <fct> <fct>  <int>
      1 1     1     1          1
      2 1     1     1          2
      3 1     1     2          1
      4 1     1     2          2
    Code
      new_data(data, c("Fac1", "Fac2", "Fac3"), obs_only = TRUE)
    Output
      # A tibble: 10 x 4
         Fac1  Fac2  Fac3  Random
         <fct> <fct> <fct>  <int>
       1 1     3     1          1
       2 1     3     2          1
       3 2     1     1          1
       4 2     1     2          1
       5 2     3     1          1
       6 2     3     2          1
       7 4     1     1          1
       8 4     1     2          1
       9 4     3     1          1
      10 4     3     2          1
    Code
      new_data(data, c("Fac1", "Fac2", "Fac3", "Random"), obs_only = TRUE)
    Output
      # A tibble: 20 x 4
         Fac1  Fac2  Fac3  Random
         <fct> <fct> <fct>  <int>
       1 1     3     1          1
       2 1     3     1          2
       3 1     3     2          1
       4 1     3     2          2
       5 2     1     1          1
       6 2     1     1          2
       7 2     1     2          1
       8 2     1     2          2
       9 2     3     1          1
      10 2     3     1          2
      11 2     3     2          1
      12 2     3     2          2
      13 4     1     1          1
      14 4     1     1          2
      15 4     1     2          1
      16 4     1     2          2
      17 4     3     1          1
      18 4     3     1          2
      19 4     3     2          1
      20 4     3     2          2
    Code
      new_data(data, c("Fac1", "Fac2", "Fac3", "Random"), obs_only = list("Fac1",
        "Fac2", "Fac3", "Random"))
    Output
      # A tibble: 24 x 4
         Fac1  Fac2  Fac3  Random
         <fct> <fct> <fct>  <int>
       1 2     1     1          1
       2 1     1     1          1
       3 2     3     1          1
       4 4     1     1          1
       5 1     1     2          1
       6 1     3     1          1
       7 4     3     1          1
       8 1     3     2          1
       9 2     1     2          1
      10 4     1     2          1
      # i 14 more rows

