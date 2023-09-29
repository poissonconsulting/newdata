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
    auto_expand(data)
    auto_expand(data, a)
    auto_expand(data, a = new_value(a))
    auto_expand(data, new_valuex(a))
    auto_expand(data, a = dplyr::last(a))
    auto_expand(data, b)
    auto_expand(data, c)
    auto_expand(data, new_seqx(c))
    auto_expand(data, new_seqx(a))
    auto_expand(data, new_seqx(a, length_out = 12))
    auto_expand(data, new_seqx(a, length_out = 12, obs_only = TRUE))
    auto_expand(data, new_seqx(a, length_out = 12), b)
    auto_expand(data, b, new_seqx(a, length_out = 12))
    auto_expand(data, tidyr::nesting(c, d))
    auto_expand(data, tidyr::nesting(c, d), .filter = c %in% c("a", "b", "c"))
    auto_expand(
      data,
      b = 8:10,
      z = "zed",
      tidyr::nesting(c, d),
      .filter = c %in% c("a", "b", "c")
    )
  })
  expect_error(auto_expand(
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
    auto_expand(data)
    auto_expand(data, tidyr::nesting(period, year))
    auto_expand(data, tidyr::nesting(period, year, annual))
    auto_expand(data, tidyr::nesting(period, year, new_valuex(annual)))
  })
})
