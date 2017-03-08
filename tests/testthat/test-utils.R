context("utils")

test_that("classes", {
  expect_equal(classes(Orange), c("ordered", "numeric","numeric"), check.attributes = FALSE)
})

test_that("is.named", {
  expect_true(is.named(Orange))
  expect_false(is.named(list(1)))
})
