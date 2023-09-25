test_that("classes", {
  expect_equal(classes(Orange), c("ordered", "numeric", "numeric"),
    ignore_attr = TRUE
  )
})
