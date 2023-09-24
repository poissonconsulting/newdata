test_that("classes", {
  expect_equal(classes(Orange), c("ordered", "numeric", "numeric"),
    check.attributes = FALSE
  )
})
