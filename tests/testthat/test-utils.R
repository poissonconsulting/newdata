context("utils")

test_that("classes", {
  expect_identical(classes(Orange), list(Tree = c("ordered", "factor"), age = "numeric",
                                         circumference = "numeric"))
})

test_that("is.named", {
  expect_true(is.named(Orange))
  expect_false(is.named(list(1)))
})

test_that("factor_with_length_greater_than_1", {
  expect_false(factor_with_length_greater_than_1(1))
  expect_false(factor_with_length_greater_than_1(1:2))
  expect_false(factor_with_length_greater_than_1(factor(1)))
  expect_true(factor_with_length_greater_than_1(factor(1:2)))
  expect_true(factor_with_length_greater_than_1(factor(c(1,1))))
})
