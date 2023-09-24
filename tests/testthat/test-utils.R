test_that("classes", {
  expect_equal(classes(Orange), c("ordered", "numeric", "numeric"),
    check.attributes = FALSE
  )
})

test_that("is_named", {
  expect_true(is_named(Orange))
  expect_false(is_named(list(1)))
})
