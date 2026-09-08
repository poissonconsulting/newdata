test_that("xobs_only preserves observed combinations", {
  data <- tibble::tibble(
    a = c(1.5, 2.5, 3.5),
    b = factor(c("a", "a", "b"), levels = c("a", "b", "c"))
  )

  new_data <- xnew_data(data, xobs_only(a, b))
  expect_identical(new_data$a, data$a)
  expect_identical(new_data$b, data$b)

  new_data <- xnew_data(data, xobs_only(a, xnew_seq(b, .length_out = 1)))
  expect_identical(new_data$a, c(1.5, 2.5))
  expect_identical(new_data$b, factor(c("a", "a"), levels = c("a", "b", "c")))
})

test_that("xobs_only errors informatively for named and unknown arguments (#111)", {
  data <- tibble::tibble(
    a = 1:5 + 0.5,
    b = factor(letters[1:5])
  )

  expect_snapshot(error = TRUE, {
    xnew_data(data, xobs_only(z = b))
    xnew_data(data, xobs_only(a, z = new_seq(b, .length_out = 2)))
    xnew_data(data, xobs_only(b = b))
    xnew_data(data, xobs_only(new_seq(b, .length_out = 2)))
  })

  # naming the whole xobs_only() call still creates a new column
  new_data <- xnew_data(data, z = xobs_only(b))
  expect_named(new_data, c("a", "b", "z"))
})
