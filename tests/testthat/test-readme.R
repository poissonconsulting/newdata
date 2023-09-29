test_that("readme examples", {
  testthat::expect_snapshot({
    xnew_data(obs_data)
    xnew_data(obs_data, int)
    xnew_data(obs_data, xnew_seq(int, length_out = 3))
    xnew_data(obs_data, xnew_seq(int, length_out = 3, obs_only = TRUE))
    xnew_data(obs_data, int, fct)
    xnew_data(obs_data, xobs_only(int, fct))
    xnew_data(obs_data, new = c(TRUE, FALSE))
  })
})
