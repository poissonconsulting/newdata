test_that("xcast old_data", {
  testthat::expect_snapshot({
    old_data
    xnew_data(old_data, xcast(lgl = 1, int = 7, dbl = 10L, chr = factor("x"), fct = "a rarity", hms = 1))
    xnew_data(old_data, xcast(lgl = 0, hms = "01:01:11"))
  })
  expect_error(xnew_data(old_data, xcast(dte = 1)), "Can't convert")
  expect_error(xnew_data(old_data, xcast(dte = 1L)), "Can't convert")
  expect_error(xnew_data(old_data, xcast(dte = "2024-01-01")), "Can't convert")
  expect_error(xnew_data(old_data, xcast(dtt = 1)), "Can't convert")
  expect_error(xnew_data(old_data, xcast(dtt = 1L)), "Can't convert")
  expect_error(xnew_data(old_data, xcast(dtt = "2024-01-01 10:30:42")), "Can't convert")
})
