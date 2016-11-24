context("utils")

test_that("classes", {
  expect_identical(classes(Orange), list(Tree = c("ordered", "factor"), age = "numeric",
                                         circumference = "numeric"))
})

test_that("is.named", {
  expect_true(is.named(Orange))
  expect_false(is.named(list(1)))
})
