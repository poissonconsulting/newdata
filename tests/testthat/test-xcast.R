test_that("xcast old_data", {
  testthat::expect_snapshot({
    old_data
    xnew_data(
      old_data,
      xcast(
        lgl = 1,
        int = 7,
        dbl = 10L,
        chr = factor("x"),
        fct = "a rarity",
        hms = 1
      )
    )
    xnew_data(old_data, xcast(lgl = 0, hms = "01:01:11"))
  })
  expect_error(xnew_data(old_data, xcast(dte = 1)), "Can't convert")
  expect_error(xnew_data(old_data, xcast(dte = 1L)), "Can't convert")
  expect_error(xnew_data(old_data, xcast(dte = "2024-01-01")), "Can't convert")
  expect_error(xnew_data(old_data, xcast(dtt = 1)), "Can't convert")
  expect_error(xnew_data(old_data, xcast(dtt = 1L)), "Can't convert")
  expect_error(
    xnew_data(old_data, xcast(dtt = "2024-01-01 10:30:42")),
    "Can't convert"
  )
})

test_that("xcast Date and POSIXct values", {
  date <- as.Date("2024-01-01")
  datetime <- as.POSIXct("2024-01-01 10:30:42", tz = "UTC")
  new_data <- xnew_data(old_data, xcast(dte = date, dtt = datetime))
  expect_identical(new_data$dte, date)
  expect_equal(new_data$dtt, datetime, ignore_attr = TRUE)
  expect_identical(attr(new_data$dtt, "tzone"), "PST8PDT")
})
