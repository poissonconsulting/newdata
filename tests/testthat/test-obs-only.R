test_that("obs_only", {
  withr::local_options(lifecycle_verbosity = "quiet")

  newdata <- expand.grid(
    Tree = unique(Orange$Tree), age = c(1, 2, 3, 4, 5),
    circumference = c(6, 7, 8, 9, 10)
  )
  data <- Orange[c(1, 35), ]

  testthat::expect_snapshot({
    obs_only(newdata, data, "Tree")
    obs_only(newdata, data[1, ], "Tree")
  })
})

test_that("new_data obs_only", {
  withr::local_options(lifecycle_verbosity = "quiet")

  data <- expand.grid(
    Fac1 = c("1", "2", "4"), Fac2 = c("1", "3"),
    Fac3 = factor(1:2, levels = 1:3), Random = 1:2
  )
  data <- data[as.character(data$Fac1) != as.character(data$Fac2), ]

  testthat::expect_snapshot({
    new_data(data)
    new_data(data, c("Fac1"))
    new_data(data, c("Fac2"))
    new_data(data, c("Fac3"))
    new_data(data, c("Fac3"), obs_only = list("Fac3"))
    new_data(data, c("Fac1", "Fac2"))
    new_data(data, c("Fac1", "Fac2"), obs_only = TRUE)
    new_data(data, c("Fac1", "Fac2", "Fac3"))
    new_data(data, c("Fac1", "Fac2", "Fac3"), obs_only = TRUE)
    new_data(data, c("Random"), obs_only = TRUE)
    new_data(data, c("Fac3", "Random"))
    new_data(data, c("Fac3", "Random"), obs_only = TRUE)
    new_data(data, c("Fac1", "Fac2", "Fac3"), obs_only = TRUE)
    new_data(data, c("Fac1", "Fac2", "Fac3", "Random"), obs_only = TRUE)
    new_data(data, c("Fac1", "Fac2", "Fac3", "Random"), obs_only = list("Fac1", "Fac2", "Fac3", "Random"))
  })
})
