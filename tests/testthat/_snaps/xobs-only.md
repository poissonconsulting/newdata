# xobs_only errors informatively for named and unknown arguments (#111)

    Code
      xnew_data(data, xobs_only(z = b))
    Condition
      Error:
      ! `xobs_only()` arguments must not be named ('z') as observed combinations must refer to columns of `.data`.
    Code
      xnew_data(data, xobs_only(a, z = new_seq(b, .length_out = 2)))
    Condition
      Error:
      ! `xobs_only()` arguments must not be named ('z') as observed combinations must refer to columns of `.data`.
    Code
      xnew_data(data, xobs_only(b = b))
    Condition
      Error:
      ! `xobs_only()` arguments must not be named ('b') as observed combinations must refer to columns of `.data`.
    Code
      xnew_data(data, xobs_only(new_seq(b, .length_out = 2)))
    Condition
      Error:
      ! `xobs_only()` arguments must refer to columns of `.data` (unrecognised: 'new_seq(b, .length_out = 2)').

