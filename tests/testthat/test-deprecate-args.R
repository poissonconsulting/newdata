test_that("new_seq() `length_out` is deprecated but still works", {
  withr::local_options(lifecycle_verbosity = "warning")
  expect_snapshot(out <- new_seq(c(1, 4), length_out = 3))
  expect_identical(out, new_seq(c(1, 4), .length_out = 3))
})

test_that("new_seq() `obs_only` is deprecated but still works", {
  withr::local_options(lifecycle_verbosity = "warning")
  expect_snapshot(out <- new_seq(c(1L, 1L, 4L), obs_only = TRUE))
  expect_identical(out, new_seq(c(1L, 1L, 4L), .obs_only = TRUE))
})

test_that("new_seq() deprecated arguments warn for dispatched classes (Date)", {
  withr::local_options(lifecycle_verbosity = "warning")
  expect_snapshot(
    out <- new_seq(as.Date(c("2000-01-01", "2000-01-04")), length_out = 2)
  )
  expect_identical(
    out,
    new_seq(as.Date(c("2000-01-01", "2000-01-04")), .length_out = 2)
  )
})

test_that("new_value() `obs_only` is deprecated but still works", {
  withr::local_options(lifecycle_verbosity = "warning")
  expect_snapshot(out <- new_value(c(1, 4), obs_only = TRUE))
  expect_identical(out, new_value(c(1, 4), .obs_only = TRUE))
})

test_that("xnew_seq() forwards deprecated arguments with a warning", {
  withr::local_options(lifecycle_verbosity = "warning")
  data <- tibble::tibble(a = c(1L, 3L, 4L))
  expect_snapshot(out <- xnew_data(data, xnew_seq(a, length_out = 2)))
  expect_identical(out, xnew_data(data, xnew_seq(a, .length_out = 2)))
})
