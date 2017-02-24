context("new-data")

test_that("newdata", {
  library(tibble)

  chickwts <- datasets::chickwts

  feed <- sort(unique(chickwts$feed))
  weight <- chickwts$weight

  expect_equal(new_data(chickwts),
               data_frame(weight = mean(chickwts$weight), feed = feed[1]))

  expect_equal(new_data(datasets::chickwts, "feed"),
               data_frame(weight = mean(weight), feed = feed))

  expect_equal(new_data(datasets::chickwts, "weight"),
               data_frame(weight = seq(min(weight), max(weight), length.out = 30), feed = feed[1]))

  expect_equal(nrow(new_data(datasets::chickwts, c("weight", "feed"))), 30 * nlevels(feed))
})

test_that("new_data generates data frame with correct number of rows", {
  data <- data.frame(
    dlogical = as.logical(0:9),
    dinteger = 1:10,
    dnumeric = 1:10 + 0.1,
    dfactor = factor(1:10),
    ddate = as.Date("2000-01-01") + 1:10
  )
  expect_is(new_data(data), "data.frame")
  expect_that(nrow(new_data(data)), equals(1))
  expect_equal(nrow(new_data(data, "dlogical")), 2)
 expect_equal(nrow(new_data(data, "dnumeric")), 30)
  expect_that(nrow(new_data(data, c("dnumeric","dinteger"))), equals(300))
  expect_that(nrow(new_data(data, c("dfactor","dinteger"), length_out = 5)), equals(50))
})

test_that("new_data ref works", {
  expect_identical(new_data(Orange),
                   data_frame(Tree = factor(levels(Orange$Tree)[1], levels(Orange$Tree)),
                              age = mean(Orange$age),
                              circumference = mean(Orange$circumference)))

  expect_identical(new_data(Orange, ref = list(age = 1)),
                   data_frame(Tree = factor(levels(Orange$Tree)[1], levels(Orange$Tree)),
                              age = 1,
                              circumference = mean(Orange$circumference)))

  expect_identical(new_data(Orange, ref = list(age = c(1,2))),
                   data_frame(Tree = factor(levels(Orange$Tree)[1], levels(Orange$Tree)),
                              age = c(1,2),
                              circumference = mean(Orange$circumference)))
})

test_that("new_data ref errors", {
  expect_error(new_data(Orange, ref = list(1,2)), "ref must be a named list")
  expect_error(new_data(Orange, ref = list(age = TRUE)), "classes of variables in ref must match those in data")
  expect_error(new_data(Orange, seq = "age", ref = list(age = 118)), "variables must not be in seq and ref")
  expect_error(new_data(Orange, obs_only = list("age"), ref = list(age = 118)), "variables must not be in obs_only and ref")
})

test_that("new_data ref works", {
  new_data <- new_data(ToothGrowth, ref = list(dose = 4))
  expect_identical(new_data$dose, 4)

  new_data <- new_data(ToothGrowth, ref = list(dose = c(3,4)))
  expect_identical(new_data$dose, c(3,4))

  new_data <- new_data(ToothGrowth, ref = list(dose = c(3,4), len = c(10.1, 12, 13)))
  expect_identical(colnames(new_data), c("len", "supp", "dose"))
  expect_identical(new_data$dose, rep(c(3,4), 3))
  expect_identical(new_data$len, rep(c(10.1,12,13), each = 2))

  new_data <- new_data(ToothGrowth, ref = list(supp = factor("VC")))

  new_data <- new_data(ToothGrowth, ref = list(supp = factor("TP")))
  expect_identical(new_data(ToothGrowth, ref = list(supp = factor("TP")))$supp, factor("TP"))
  expect_identical(new_data(ToothGrowth, ref = list(supp = "TP"))$supp, factor(NA, levels = c("OJ", "VC")))
  expect_identical(new_data(ToothGrowth, ref = list(supp = factor("VC")))$supp, factor("VC"))
  expect_identical(new_data(ToothGrowth, ref = list(supp = "VC"))$supp, factor("VC", levels = c("OJ", "VC")))
})
