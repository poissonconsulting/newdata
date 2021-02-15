test_that("obs_only", {
  newdata <- expand.grid(Tree = unique(Orange$Tree), age = c(1,2,3,4,5), circumference = c(6,7,8,9,10))
  data <- Orange[c(1,35),]
  expect_identical(nrow(obs_only(newdata, data, "Tree")), 50L)
  expect_identical(nrow(obs_only(newdata, data[1,], "Tree")), 25L)
})

test_that("new_data obs_only", {
  data <- expand.grid(Fac1 = c("1", "2", "4"), Fac2 = c("1", "3"), Fac3 = factor(1:2, levels = 1:3), Random = 1:2)
  data <- data[as.character(data$Fac1) != as.character(data$Fac2),]
  expect_identical(nrow(new_data(data)), 1L)
  expect_identical(nrow(new_data(data, c("Fac1"))), 3L)
  expect_identical(nrow(new_data(data, c("Fac2"))), 2L)
  expect_identical(nrow(new_data(data, c("Fac3"))), 3L)
  expect_identical(nrow(new_data(data, c("Fac3"), obs_only = list("Fac3"))), 2L)
  expect_identical(nrow(new_data(data, c("Fac1","Fac2"))), 6L)
  expect_identical(nrow(new_data(data, c("Fac1","Fac2"), obs_only = TRUE)), 5L)
  expect_identical(nrow(new_data(data, c("Fac1","Fac2","Fac3"))), 18L)
  expect_identical(nrow(new_data(data, c("Fac1","Fac2","Fac3"), obs_only = TRUE)), 10L)
  expect_identical(nrow(new_data(data, c("Random"), obs_only = TRUE)), 2L)
  expect_identical(nrow(new_data(data, c("Fac3", "Random"))), 6L)
  expect_identical(nrow(new_data(data, c("Fac3", "Random"), obs_only = TRUE)), 4L)
  expect_identical(new_data(data, c("Fac1","Fac2","Fac3"), obs_only = TRUE),
                   new_data(data, c("Fac1","Fac2","Fac3"), obs_only = list(c("Fac1","Fac2","Fac3"))))
  expect_equal(nrow(new_data(data, c("Fac1","Fac2","Fac3","Random"), obs_only = TRUE)), 20L)
  expect_identical(nrow(new_data(data, c("Fac1","Fac2","Fac3","Random"), obs_only = list("Fac1", "Fac2", "Fac3", "Random"))), 24L)
})
