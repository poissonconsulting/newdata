context("obs-only")

test_that("obs_only", {
  newdata <- expand.grid(Tree = unique(Orange$Tree), age = c(1,2,3,4,5), circumference = c(6,7,8,9,10))
  data <- Orange[c(1,35),]
  expect_identical(nrow(obs_only(newdata, data)), 50L)
  expect_identical(obs_only(newdata, slice(data, 1)), newdata)
})
