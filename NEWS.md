<!-- NEWS.md is maintained by https://fledge.cynkra.com, contributors should not edit this file -->

# newdata 0.0.0.9021

## Chore

- Auto-update from GitHub Actions (#24).

## Continuous integration

- Use Ubuntu 24.04 and styler PR (#33).

- Correctly detect branch protection (#30).

- Use stable pak (#29).

- Latest changes (#27).

- Use pkgdown branch (#26).

- Install via R CMD INSTALL ., not pak (#25).

- Install local package for pkgdown builds.

- Improve support for protected branches with fledge.

- Improve support for protected branches, without fledge.

- Sync with latest developments.

- Fix edge case of no suggested packages.

- Use workflows from actions-sync.

- Sync rcc workflows.

- Sync codecov workflows.

## Draft

- Xcoerce() (#18).

## Uncategorized

- Merge pull request #23 from poissonconsulting/f-snapshots.

- Merge pull request #21 from poissonconsulting/upkeep-2024-08.

- Soft-deprecate all arguments to `new_data()` except `data` and `seq`.


# newdata 0.0.0.9020

- Same as previous version.


# newdata 0.0.0.9019

## Chore

- Use standalone purrr (#14).

## Uncategorized

- Fix bug in `new_data()` not returning all levels of factor.

- Update authors.

- Adding obs_only = FALSE argument to new_seq.

- Merge pull request #13 from poissonconsulting/f-new-style-fun.

- Set character vectors to be all by default.

- Drop new_seq default.

- Character new value now uses most common min value.

- Ordered behaves like integer.

- Factor and character now takes first to last.

- New seq character now has length out argument.

- New_value.Date() returns integer date.

- Switch to testthat 3.

- Adding examples new_seq() and new_value().

- Added examples `new_value()`.


# newdata 0.0.0.9018

- Add `new_value.ordered()`.
- Replaced error() with chk::err()
- Switch to Rmarkdown for roxygen
- check R >= 3.6
- Removed dependency on magrittr.
- Edited news file.
- Added `new_value().hms`
- Replace deprecated tibble::as_data_frame() with tibble::as_tibble().


# newdata 0.0.0.9017

- Edited news file.


# newdata 0.0.0.9016

- Same as previous version.


# newdata 0.0.0.9015

- Added `new_value().hms`


# newdata 0.0.0.9014

- Replace deprecated tibble::as_data_frame() with tibble::as_tibble().
