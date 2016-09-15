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

test_that("generates data frame with correct number of rows", {
  data <- data.frame(
    dlogical = as.logical(0:9),
    dinteger = 1:10,
    dnumeric = 1:10 + 0.1,
    dfactor = factor(1:10),
    ddate = as.Date("2000-01-01") + 1:10
  )
  expect_is(new_data(data), "data.frame")
  expect_that(nrow(new_data(data)), equals(1))
  expect_equal(nrow(new_data(data, "dnumeric")), 30)
  expect_that(nrow(new_data(data, c("dnumeric","dinteger"))), equals(300))
  expect_that(nrow(new_data(data, c("dfactor","dinteger"), length_out = 5)), equals(50))
})
