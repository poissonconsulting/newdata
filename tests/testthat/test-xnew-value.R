test_that("xnew_value", {
  data <- tibble::tibble(
    a = c(1L, 3L, 4L),
    b = c(4,4.5,6),
    d = c("a", "b", "c"))

  testthat::expect_snapshot({
    data
    xnew_data(data, a)
    xnew_data(data, a, b = new_value(b), xnew_value(d))
  })
})
