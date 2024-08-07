test_that("newdata", {
  withr::local_options(lifecycle_verbosity = "quiet")
  chickwts <- datasets::chickwts

  feed <- sort(unique(chickwts$feed))
  weight <- chickwts$weight

  testthat::expect_snapshot({
    chickwts
    new_data(chickwts)
    new_data(datasets::chickwts, "feed")
    new_data(datasets::chickwts, "weight")
    new_data(datasets::chickwts, c("weight", "feed"))
  })
})

test_that("new_data generates data frame with correct number of rows", {
  withr::local_options(lifecycle_verbosity = "quiet")

  data <- data.frame(
    dlogical = as.logical(0:9),
    dinteger = 1:10,
    dnumeric = 1:10 + 0.1,
    dfactor = factor(1:10),
    ddate = as.Date("2000-01-01") + 1:10,
    dhms = as_hms(as_hms("10:00:00") + 1:10)
  )
  testthat::expect_snapshot({
    data
    new_data(data)
    new_data(data, "dlogical")
    new_data(data, "dnumeric")
    new_data(data, c("dnumeric", "dinteger"))
    new_data(data, c("dfactor", "dinteger"), length_out = 5)
    new_data(data, c("dhms"), length_out = 5)
  })
})

test_that("new_data ref works", {
  withr::local_options(lifecycle_verbosity = "quiet")

  testthat::expect_snapshot({
    new_data(Orange)
    new_data(Orange, ref = list(age = 1))
    new_data(Orange, ref = list(age = c(1, 2)))
  })
})

test_that("new_data ref errors", {
  withr::local_options(lifecycle_verbosity = "quiet")

  expect_error(
    new_data(Orange, ref = list(1, 2)),
    "`ref` must be a named list."
  )
  expect_error(
    new_data(Orange, ref = list(age = TRUE)),
    "Classes of variables in `ref` must match those in `data`."
  )
  expect_error(
    new_data(Orange, obs_only = list("age"), ref = list(age = 118)),
    "Variables must not be in `obs_only` and `ref`."
  )
})

test_that("new_data ref works", {
  withr::local_options(lifecycle_verbosity = "quiet")

  testthat::expect_snapshot({
    new_data(ToothGrowth, ref = list(dose = 4))
    new_data(ToothGrowth, ref = list(dose = c(3, 4)))
    new_data(ToothGrowth, ref = list(dose = c(3, 4), len = c(10.1, 12, 13)))
    new_data(ToothGrowth, ref = list(supp = factor("VC")))
    new_data(ToothGrowth, ref = list(supp = factor("TP")))
    new_data(ToothGrowth, ref = list(supp = factor(c("VC", "OJ"))))
  })
})

test_that("new_data ref overridden by seq", {
  withr::local_options(lifecycle_verbosity = "quiet")

  testthat::expect_snapshot(new_data(Orange, seq = "age", ref = list(age = 118)))
})

test_that("new_data factor with 100 levels", {
  withr::local_options(lifecycle_verbosity = "quiet")

  data <- tibble::tibble(fct = factor(1:100, levels = 1:100))
  testthat::expect_snapshot(new_seq(data$fct))

  testthat::expect_snapshot(new_data(data, "fct"))
})

test_that("new_data factor with 100 levels obs_only works", {
  withr::local_options(lifecycle_verbosity = "quiet")

  data <- tibble::tibble(fct = factor(1:30, levels = 1:100))

  testthat::expect_snapshot(new_data(data, "fct", obs_only = TRUE))
})

test_that("new_data factor with 100 levels obs_only works if name", {
  withr::local_options(lifecycle_verbosity = "quiet")

  data <- tibble::tibble(fct = factor(1:30, levels = 1:100))

  testthat::expect_snapshot(new_data(data, "fct", obs_only = list("fct")))
})
