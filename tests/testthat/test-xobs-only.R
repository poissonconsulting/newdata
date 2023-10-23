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
    xnew_data(data, b = 1:4, d = c(TRUE, FALSE))
    xnew_data(data, xobs_only(b = 1:4), xobs_only(d = c(TRUE, FALSE)))
    xnew_data(data, xobs_only(b = 1:4), d = c(TRUE, FALSE))
    xnew_data(data, xobs_only(b = 1:4, d = c(TRUE, FALSE)))
    xnew_data(data, xobs_only(b = 2:3))
    xnew_data(data, xobs_only(b = new_value(b)))
    xnew_data(data, xobs_only(b = new_seq(b)))
    xnew_data(data, xobs_only(a = new_seq(a)))
    xnew_data(data, xobs_only(a = new_seq(a, obs_only = TRUE), b = 1:4))
    expect_error(xnew_data(data, xobs_only(b = new_seq(a, obs_only = TRUE), b = 1:4)), "Names must be unique.")
    xnew_data(data, xobs_only(b = new_seq(a, obs_only = TRUE)))
  })
})
