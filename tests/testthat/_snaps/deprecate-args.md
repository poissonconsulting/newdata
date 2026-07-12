# new_seq() `length_out` is deprecated but still works

    Code
      out <- new_seq(c(1, 4), length_out = 3)
    Condition
      Warning:
      The `length_out` argument of `new_seq()` is deprecated as of newdata 0.1.0.
      i Please use the `.length_out` argument instead.

# new_seq() `obs_only` is deprecated but still works

    Code
      out <- new_seq(c(1L, 1L, 4L), obs_only = TRUE)
    Condition
      Warning:
      The `obs_only` argument of `new_seq()` is deprecated as of newdata 0.1.0.
      i Please use the `.obs_only` argument instead.

# new_seq() deprecated arguments warn for dispatched classes (Date)

    Code
      out <- new_seq(as.Date(c("2000-01-01", "2000-01-04")), length_out = 2)
    Condition
      Warning:
      The `length_out` argument of `new_seq()` is deprecated as of newdata 0.1.0.
      i Please use the `.length_out` argument instead.

# new_value() `obs_only` is deprecated but still works

    Code
      out <- new_value(c(1, 4), obs_only = TRUE)
    Condition
      Warning:
      The `obs_only` argument of `new_value()` is deprecated as of newdata 0.1.0.
      i Please use the `.obs_only` argument instead.

# xnew_seq() forwards deprecated arguments with a warning

    Code
      out <- xnew_data(data, xnew_seq(a, length_out = 2))
    Condition
      Warning:
      The `length_out` argument of `new_seq()` is deprecated as of newdata 0.1.0.
      i Please use the `.length_out` argument instead.
      Warning:
      The `length_out` argument of `new_seq()` is deprecated as of newdata 0.1.0.
      i Please use the `.length_out` argument instead.

