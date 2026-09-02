# Changelog

## newdata 0.1.0.9001

### Chore

- Format with air
  ([\#95](https://github.com/poissonconsulting/newdata/issues/95)).

### Uncategorized

- Standardize new_seq()/new_value() args to dotted names
  ([\#43](https://github.com/poissonconsulting/newdata/issues/43))
  ([\#96](https://github.com/poissonconsulting/newdata/issues/96)).

## newdata 0.1.0.9000

- Switching to development version.

## newdata 0.1.0

- Initial CRAN release.

- [`xnew_data()`](https://poissonconsulting.github.io/newdata/dev/reference/xnew_data.md)
  generates a new data frame (in the form of a tibble) for predictive
  purposes. By default all specified variables vary across their range
  while all other variables are held constant at their reference value.
  Types, classes, factor levels and time zones are always preserved.

- [`xnew_seq()`](https://poissonconsulting.github.io/newdata/dev/reference/xnew_seq.md),
  [`xnew_value()`](https://poissonconsulting.github.io/newdata/dev/reference/xnew_value.md),
  [`xobs_only()`](https://poissonconsulting.github.io/newdata/dev/reference/xobs_only.md)
  and
  [`xcast()`](https://poissonconsulting.github.io/newdata/dev/reference/xcast.md)
  are used within
  [`xnew_data()`](https://poissonconsulting.github.io/newdata/dev/reference/xnew_data.md)
  to set the length of individual sequences, override reference values,
  restrict combinations to those observed and cast new values to the
  class of an existing column.

- [`new_seq()`](https://poissonconsulting.github.io/newdata/dev/reference/new_seq.md)
  and
  [`new_value()`](https://poissonconsulting.github.io/newdata/dev/reference/new_value.md)
  generate the sequence and the reference value for an individual
  vector.

- [`new_data()`](https://poissonconsulting.github.io/newdata/dev/reference/new_data.md)
  provides a string based interface to the same functionality and is
  superseded by
  [`xnew_data()`](https://poissonconsulting.github.io/newdata/dev/reference/xnew_data.md).
