<!-- NEWS.md is maintained by https://fledge.cynkra.com, contributors should not edit this file -->

# newdata 0.1.0.9001

## Chore

- Format with air (#95).

## Uncategorized

- Standardize new_seq()/new_value() args to dotted names (#43) (#96).


# newdata 0.1.0.9000

- Switching to development version.


# newdata 0.1.0

- Initial CRAN release.

- `xnew_data()` generates a new data frame (in the form of a tibble) for predictive purposes.
By default all specified variables vary across their range while all other variables are held constant at their reference value.
Types, classes, factor levels and time zones are always preserved.

- `xnew_seq()`, `xnew_value()`, `xobs_only()` and `xcast()` are used within `xnew_data()` to set the length of individual sequences, override reference values, restrict combinations to those observed and cast new values to the class of an existing column.

- `new_seq()` and `new_value()` generate the sequence and the reference value for an individual vector.

- `new_data()` provides a string based interface to the same functionality and is superseded by `xnew_data()`.
