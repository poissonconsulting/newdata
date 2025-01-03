test_that("readme examples", {
  testthat::expect_snapshot({
    xnew_data(old_data)
    xnew_data(old_data, int)
    xnew_data(old_data, xnew_seq(int, length_out = 3))
    xnew_data(old_data, xnew_seq(int, length_out = 3, obs_only = TRUE))
    xnew_data(old_data, int, fct)
    xnew_data(old_data, xobs_only(int, fct))
    xnew_data(old_data, new = c(TRUE, FALSE))
  })
})
