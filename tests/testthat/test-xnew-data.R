test_that("simple dataset", {
  data <- tibble::tibble(
    a = 1:5 + 0.5,
    b = 3:7,
    c = factor(letters[1:5]),
    d = c(TRUE, FALSE, FALSE, TRUE, FALSE),
    e = as.Date("2023-09-27") + 0:4,
  )

  testthat::expect_snapshot({
    data
    xnew_data(data)
    xnew_data(data, a)
    xnew_data(data, a = new_value(a))
    xnew_data(data, xnew_value(a))
    xnew_data(data, a = dplyr::last(a))
    xnew_data(data, b)
    xnew_data(data, c)
    xnew_data(data, xnew_seq(c))
    xnew_data(data, xnew_seq(a))
    xnew_data(data, xnew_seq(a, length_out = 12))
    xnew_data(data, xnew_seq(a, length_out = 12, obs_only = TRUE))
    xnew_data(data, xnew_seq(a, length_out = 12), b)
    xnew_data(data, b, xnew_seq(a, length_out = 12))
    xnew_data(data, tidyr::nesting(c, d))
    xnew_data(
      data,
      b = 8:10,
      z = "zed",
      tidyr::nesting(c, d)
    )
  })
  expect_error(xnew_data(data, b, b), "These names are duplicated:")
  expect_error(xnew_data(data, b, xnew_seq(b)), "Names must be unique.")
  expect_error(xnew_data(
    data,
    b = 8:10,
    tidyr::nesting(b, d),
  ))

})

test_that("factors", {
  data <- tibble::tibble(
    period = factor(c(rep("before", 5), rep("after", 5)), levels = c("before", "after")),
    year = 2001:2010,
    annual = factor(year, levels = 2000:2010),
    ordered = ordered(year)
  )
  testthat::expect_snapshot({
    data
    xnew_data(data)
    xnew_data(data, xnew_value(annual))
    xnew_data(data, xnew_value(annual, obs_only = TRUE))
    xnew_data(data, tidyr::nesting(period, year))
    xnew_data(data, tidyr::nesting(period, year, annual))
    # FIXME: possible to nest on new_value?
    xnew_data(data, tidyr::nesting(period, year, xnew_value(annual)))
    xnew_data(data, tidyr::nesting(period, year), xnew_value(annual))
  })
})

test_that("xnew_data called twice works", {
  data <- tibble::tibble(
    a = c(1L, 3L, 4L),
    b = c(4,4.5,6),
    d = c("a", "b", "c"))

  testthat::expect_snapshot({
    data
    xnew_data(xnew_data(data, a))
    xnew_data(xnew_data(data, a, b = new_value(b), xnew_value(d)))
  })
})

