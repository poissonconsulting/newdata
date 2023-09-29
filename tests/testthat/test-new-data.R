test_that("newdata", {
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
  testthat::expect_snapshot({
    new_data(Orange)
    new_data(Orange, ref = list(age = 1))
    new_data(Orange, ref = list(age = c(1, 2)))
  })
})

test_that("new_data ref errors", {
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
  new_data <- new_data(ToothGrowth, ref = list(dose = 4))
  expect_identical(new_data$dose, 4)

  new_data <- new_data(ToothGrowth, ref = list(dose = c(3, 4)))
  expect_identical(new_data$dose, c(3, 4))

  new_data <- new_data(ToothGrowth, ref = list(
    dose = c(3, 4),
    len = c(10.1, 12, 13)
  ))
  expect_identical(colnames(new_data), c("len", "supp", "dose"))
  expect_identical(new_data$dose, rep(c(3, 4), 3))
  expect_identical(new_data$len, rep(c(10.1, 12, 13), each = 2))

  new_data <- new_data(ToothGrowth, ref = list(supp = factor("VC")))

  new_data <- new_data(ToothGrowth, ref = list(supp = factor("TP")))
  expect_identical(new_data(ToothGrowth,
                            ref = list(supp = factor("TP"))
  )$supp, factor("TP"))
  expect_identical(
    new_data(ToothGrowth, ref = list(supp = "TP"))$supp,
    factor(NA, levels = c("OJ", "VC"))
  )
  expect_identical(
    new_data(ToothGrowth, ref = list(supp = factor("VC")))$supp,
    factor("VC")
  )
  expect_identical(
    new_data(ToothGrowth, ref = list(supp = "VC"))$supp,
    factor("VC", levels = c("OJ", "VC"))
  )
})

test_that("new_data ref overridden by seq", {
  expect_identical(
    new_data(Orange, seq = "age", ref = list(age = 118)),
    tibble::tibble(
      Tree = ordered(levels(Orange$Tree)[3], levels(Orange$Tree)),
      age = seq(min(Orange$age), max(Orange$age), length.out = 30),
      circumference = mean(Orange$circumference)
    )
  )
})
