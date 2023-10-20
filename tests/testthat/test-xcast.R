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
    xnew_data(data, xcast(a = 1L))
    xnew_data(data, xcast(a = 1:2))
    xnew_data(data, xcast(a = c(2, 1))) # FIXME: should this be unsorted?
    xnew_data(data, xcast(a = c(1, 1)))
    xnew_data(data, xcast(a = c(1, 1, NA)))
    xnew_data(data, xcast(a = c(1, 1, NA, NA)))
    xnew_data(data, xcast(a = NA))
    xnew_data(data, xcast(a = numeric())) # FIXME: should this be an error?
    xnew_data(data, xcast(a = 1, b = 6))
    expect_error(xnew_data(data, xcast(a = 1, b = 6.5)))
    xnew_data(data, xcast(a = 1, b = 6, c = "e"))
    expect_error(xnew_data(data, xcast(c = "f")))
    xnew_data(data, xcast(c = c("b", "a"))) # FIXME: should this be unsorted?
    xnew_data(data, xcast(a = 1, b = 6, c = factor("a", levels = "a")))
    xnew_data(data, xcast(a = 1, b = 6, c = factor("a", levels = "a")))$c
    xnew_data(data, xobs_only(xcast(b = 2:3)))
    xnew_data(data, xobs_only(xcast(b = new_value(b))))
    xnew_data(data, xobs_only(xcast(b = new_seq(b))))
    xnew_data(data, xcast(a = new_seq(a)))
    xnew_data(data, xobs_only(xcast(a = new_seq(a))))
    xnew_data(data, xobs_only(xcast(b = 2L))) # FIXME: should this be an error
    xnew_data(data, xobs_only(xcast(b = 1:3)), xobs_only(c = c("a", "b")))
    xnew_data(data, xobs_only(xcast(b = 1:4), c = c("a", "b", "c")))
  })
})
