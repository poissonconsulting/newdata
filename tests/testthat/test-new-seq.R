test_that("new_seq logical", {
  # zero length
  expect_identical(new_seq(logical()), c(FALSE, TRUE))
  # missing value
  expect_identical(new_seq(NA), c(FALSE, TRUE))
  expect_identical(new_seq(NA, obs_only = TRUE), NA)
  # single value
  expect_identical(new_seq(TRUE), c(FALSE, TRUE))
  expect_identical(new_seq(FALSE), c(FALSE, TRUE))
  expect_identical(new_seq(FALSE), c(FALSE, TRUE))
  expect_identical(new_seq(TRUE, obs_only = TRUE), TRUE)
  expect_identical(new_seq(FALSE, obs_only = TRUE), FALSE)
  # multiple value
  expect_identical(new_seq(c(FALSE, TRUE)), c(FALSE, TRUE))
  expect_identical(new_seq(c(TRUE, FALSE)), c(FALSE, TRUE))
  expect_identical(new_seq(c(TRUE, TRUE)), c(FALSE, TRUE))
  expect_identical(new_seq(c(FALSE, FALSE)), c(FALSE, TRUE))
  expect_identical(new_seq(c(FALSE, FALSE, TRUE)), c(FALSE, TRUE))
  expect_identical(new_seq(c(TRUE, TRUE, FALSE)), c(FALSE, TRUE))
  expect_identical(new_seq(c(FALSE, TRUE), obs_only = TRUE), c(FALSE, TRUE))
  expect_identical(new_seq(c(TRUE, FALSE), obs_only = TRUE), c(FALSE, TRUE))
  expect_identical(new_seq(c(TRUE, TRUE), obs_only = TRUE), TRUE)
  expect_identical(new_seq(c(FALSE, FALSE), obs_only = TRUE), FALSE)
  expect_identical(new_seq(c(FALSE, FALSE, TRUE), obs_only = TRUE), c(FALSE, TRUE))
  expect_identical(new_seq(c(TRUE, TRUE, FALSE), obs_only = TRUE), c(FALSE, TRUE))
  # multiple value with missing
  expect_identical(new_seq(c(FALSE, TRUE, NA)), c(FALSE, TRUE))
  expect_identical(new_seq(c(TRUE, FALSE, NA)), c(FALSE, TRUE))
  expect_identical(new_seq(c(TRUE, TRUE, NA)), c(FALSE, TRUE))
  expect_identical(new_seq(c(FALSE, FALSE, NA)), c(FALSE, TRUE))
  expect_identical(new_seq(c(FALSE, FALSE, TRUE, NA)), c(FALSE, TRUE))
  expect_identical(new_seq(c(TRUE, TRUE, FALSE, NA)), c(FALSE, TRUE))
  expect_identical(new_seq(c(FALSE, TRUE, NA), obs_only = TRUE), c(FALSE, TRUE))
  expect_identical(new_seq(c(TRUE, FALSE, NA), obs_only = TRUE), c(FALSE, TRUE))
  expect_identical(new_seq(c(TRUE, TRUE, NA), obs_only = TRUE), TRUE)
  expect_identical(new_seq(c(FALSE, FALSE, NA), obs_only = TRUE), FALSE)
  expect_identical(new_seq(c(FALSE, FALSE, TRUE, NA), obs_only = TRUE), c(FALSE, TRUE))
  expect_identical(new_seq(c(TRUE, TRUE, FALSE, NA), obs_only = TRUE), c(FALSE, TRUE))
  # length_out not count
  expect_error(new_seq(TRUE, length_out = -1), "`length_out` must be a count")
  expect_error(new_seq(TRUE, length_out = 0.5), "`length_out` must be a count")
  expect_error(new_seq(TRUE, length_out = -1, obs_only = TRUE), "`length_out` must be a count")
  expect_error(new_seq(TRUE, length_out = 0.5, obs_only = TRUE), "`length_out` must be a count")
  # length_out is 0
  expect_identical(new_seq(logical(), length_out = 0), logical())
  expect_identical(new_seq(NA, length_out = 0), logical())
  expect_identical(new_seq(TRUE, length_out = 0), logical())
  expect_identical(new_seq(logical(), length_out = 0, obs_only = TRUE), logical())
  expect_identical(new_seq(NA, length_out = 0, obs_only = TRUE), logical())
  expect_identical(new_seq(TRUE, length_out = 0, obs_only = TRUE), logical())
  # length_out = 1
  expect_identical(new_seq(c(FALSE, TRUE), length_out = 1), FALSE)
  expect_identical(new_seq(c(TRUE, FALSE), length_out = 1), FALSE)
  expect_identical(new_seq(c(TRUE, TRUE), length_out = 1), FALSE)
  expect_identical(new_seq(c(FALSE, FALSE), length_out = 1), FALSE)
  expect_identical(new_seq(c(FALSE, FALSE, TRUE), length_out = 1), FALSE)
  expect_identical(new_seq(c(TRUE, TRUE, FALSE), length_out = 1), FALSE)
  expect_identical(new_seq(c(FALSE, TRUE), length_out = 1, obs_only = TRUE), FALSE)
  expect_identical(new_seq(c(TRUE, FALSE), length_out = 1, obs_only = TRUE), FALSE)
  expect_identical(new_seq(c(TRUE, TRUE), length_out = 1, obs_only = TRUE), TRUE)
  expect_identical(new_seq(c(FALSE, FALSE), length_out = 1, obs_only = TRUE), FALSE)
  expect_identical(new_seq(c(FALSE, FALSE, TRUE), length_out = 1, obs_only = TRUE), FALSE)
  expect_identical(new_seq(c(TRUE, TRUE, FALSE), length_out = 1, obs_only = TRUE), FALSE)
  # length_out = 2
  expect_identical(new_seq(c(FALSE, TRUE), length_out = 2), c(FALSE, TRUE))
  expect_identical(new_seq(c(TRUE, FALSE), length_out = 2), c(FALSE, TRUE))
  expect_identical(new_seq(c(TRUE, TRUE), length_out = 2), c(FALSE, TRUE))
  expect_identical(new_seq(c(FALSE, FALSE), length_out = 2), c(FALSE, TRUE))
  expect_identical(new_seq(c(FALSE, FALSE, TRUE), length_out = 2), c(FALSE, TRUE))
  expect_identical(new_seq(c(TRUE, TRUE, FALSE), length_out = 2), c(FALSE, TRUE))
  expect_identical(new_seq(c(FALSE, TRUE), length_out = 2, obs_only = TRUE), c(FALSE, TRUE))
  expect_identical(new_seq(c(TRUE, FALSE), length_out = 2, obs_only = TRUE), c(FALSE, TRUE))
  expect_identical(new_seq(c(TRUE, TRUE), length_out = 2, obs_only = TRUE), TRUE)
  expect_identical(new_seq(c(FALSE, FALSE), length_out = 2, obs_only = TRUE), FALSE)
  expect_identical(new_seq(c(FALSE, FALSE, TRUE), length_out = 2, obs_only = TRUE), c(FALSE, TRUE))
  expect_identical(new_seq(c(TRUE, TRUE, FALSE), length_out = 2, obs_only = TRUE), c(FALSE, TRUE))
  # length_out = 3
  expect_identical(new_seq(c(FALSE, TRUE), length_out = 3), c(FALSE, TRUE))
  expect_identical(new_seq(c(TRUE, FALSE), length_out = 3), c(FALSE, TRUE))
  expect_identical(new_seq(c(TRUE, TRUE), length_out = 3), c(FALSE, TRUE))
  expect_identical(new_seq(c(FALSE, FALSE), length_out = 3), c(FALSE, TRUE))
  expect_identical(new_seq(c(FALSE, FALSE, TRUE), length_out = 3), c(FALSE, TRUE))
  expect_identical(new_seq(c(TRUE, TRUE, FALSE), length_out = 3), c(FALSE, TRUE))
  expect_identical(new_seq(c(FALSE, TRUE), length_out = 3, obs_only = TRUE), c(FALSE, TRUE))
  expect_identical(new_seq(c(TRUE, FALSE), length_out = 3, obs_only = TRUE), c(FALSE, TRUE))
  expect_identical(new_seq(c(TRUE, TRUE), length_out = 3, obs_only = TRUE), TRUE)
  expect_identical(new_seq(c(FALSE, FALSE), length_out = 3, obs_only = TRUE), FALSE)
  expect_identical(new_seq(c(FALSE, FALSE, TRUE), length_out = 3, obs_only = TRUE), c(FALSE, TRUE))
  expect_identical(new_seq(c(TRUE, TRUE, FALSE), length_out = 3, obs_only = TRUE), c(FALSE, TRUE))
  # length_out = Inf
  expect_identical(new_seq(c(FALSE, FALSE, TRUE), length_out = Inf), c(FALSE, TRUE))
  expect_identical(new_seq(c(TRUE, TRUE, FALSE), length_out = Inf), c(FALSE, TRUE))
  expect_identical(new_seq(c(FALSE, FALSE, TRUE), length_out = Inf, obs_only = TRUE), c(FALSE, TRUE))
  expect_identical(new_seq(c(TRUE, TRUE, FALSE), length_out = Inf, obs_only = TRUE), c(FALSE, TRUE))
  # matrices and arrays
  expect_identical(new_seq(matrix(TRUE)), c(FALSE, TRUE))
  expect_identical(new_seq(array(TRUE)), c(FALSE, TRUE))
})

test_that("new_seq integer", {
  # zero length
  expect_identical(new_seq(integer(0)), NA_integer_)
  # missing value
  expect_identical(new_seq(NA_integer_), NA_integer_)
  # single value
  expect_identical(new_seq(1L), 1L)
  expect_identical(new_seq(0L), 0L)
  # multiple value
  expect_identical(new_seq(c(0L, 1L)), c(0L, 1L))
  expect_identical(new_seq(c(1L, 0L)), c(0L, 1L))
  expect_identical(new_seq(c(1L, 1L)), 1L)
  expect_identical(new_seq(c(0L, 0L)), 0L)
  expect_identical(new_seq(c(0L, 0L, 1L)), c(0L, 1L))
  expect_identical(new_seq(c(1L, 1L, 0L)), c(0L, 1L))
  expect_identical(new_seq(c(10L, 1L)), 1:10)
  expect_identical(
    new_seq(c(100L, 1L)),
    c(
      1L, 4L, 8L, 11L, 15L, 18L, 21L, 25L, 28L, 32L,
      35L, 39L, 42L,
      45L, 49L, 52L, 56L, 59L, 62L, 66L, 69L, 73L,
      76L, 80L, 83L, 86L,
      90L, 93L, 97L, 100L
    )
  )
  # multiple value with missing
  expect_identical(new_seq(c(0L, 1L, NA)), c(0L, 1L))
  expect_identical(new_seq(c(1L, 0L, NA)), c(0L, 1L))
  expect_identical(new_seq(c(1L, 1L, NA)), 1L)
  expect_identical(new_seq(c(0L, 0L, NA)), 0L)
  expect_identical(new_seq(c(0L, 0L, 1L, NA)), c(0L, 1L))
  expect_identical(new_seq(c(1L, 1L, 0L, NA)), c(0L, 1L))
  expect_identical(new_seq(c(10L, 1L, NA)), 1:10)
  expect_identical(
    new_seq(c(100L, 1L, NA)),
    c(
      1L, 4L, 8L, 11L, 15L, 18L, 21L, 25L, 28L, 32L,
      35L, 39L, 42L,
      45L, 49L, 52L, 56L, 59L, 62L, 66L, 69L, 73L,
      76L, 80L, 83L, 86L,
      90L, 93L, 97L, 100L
    )
  )
  # length_out not count
  expect_error(new_seq(1L, length_out = -1), "`length_out` must be a count")
  expect_error(new_seq(1L, length_out = 0.5), "`length_out` must be a count")
  # length_out is 0
  expect_identical(new_seq(integer(), length_out = 0), integer())
  expect_identical(new_seq(NA_integer_, length_out = 0), integer())
  expect_identical(new_seq(1L, length_out = 0), integer())
  # length_out = 1
  expect_identical(new_seq(c(0L, 1L), length_out = 1), 0L)
  expect_identical(new_seq(c(1L, 0L), length_out = 1), 0L)
  expect_identical(new_seq(c(1L, 1L), length_out = 1), 1L)
  expect_identical(new_seq(c(0L, 0L), length_out = 1), 0L)
  expect_identical(new_seq(c(0L, 0L, 1L), length_out = 1), 0L)
  expect_identical(new_seq(c(1L, 1L, 0L), length_out = 1), 1L)
  expect_identical(new_seq(c(10L, 1L), length_out = 1), 6L)
  expect_identical(new_seq(c(100L, 1L), length_out = 1), 50L)
  # length_out = 2
  expect_identical(new_seq(c(0L, 1L), length_out = 2), c(0L, 1L))
  expect_identical(new_seq(c(1L, 0L), length_out = 2), c(0L, 1L))
  expect_identical(new_seq(c(1L, 1L), length_out = 2), 1L)
  expect_identical(new_seq(c(0L, 0L), length_out = 2), 0L)
  expect_identical(new_seq(c(0L, 0L, 1L), length_out = 2), c(0L, 1L))
  expect_identical(new_seq(c(1L, 1L, 0L), length_out = 2), c(0L, 1L))
  expect_identical(new_seq(c(10L, 1L), length_out = 2), c(1L, 10L))
  expect_identical(new_seq(c(100L, 1L), length_out = 2), c(1L, 100L))
  # length_out = 3
  expect_identical(new_seq(c(0L, 1L), length_out = 3), c(0L, 1L))
  expect_identical(new_seq(c(1L, 0L), length_out = 3), c(0L, 1L))
  expect_identical(new_seq(c(1L, 1L), length_out = 3), 1L)
  expect_identical(new_seq(c(0L, 0L), length_out = 3), 0L)
  expect_identical(new_seq(c(0L, 0L, 1L), length_out = 3), c(0L, 1L))
  expect_identical(new_seq(c(1L, 1L, 0L), length_out = 3), c(0L, 1L))
  expect_identical(new_seq(c(10L, 1L), length_out = 3), c(1L, 6L, 10L))
  expect_identical(new_seq(c(100L, 1L), length_out = 3), c(1L, 50L, 100L))
  # length_out = Inf
  expect_identical(new_seq(c(10L, 1L), length_out = Inf), 1:10)
  expect_identical(new_seq(c(100L, 1L), length_out = Inf), 1:100)
  # matrices and arrays
  expect_identical(new_seq(matrix(1L)), 1L)
  expect_identical(new_seq(array(1L)), 1L)
})

test_that("new_seq numeric", {
  # zero length
  expect_identical(new_seq(numeric(0)), NA_real_)
  # missing value
  expect_identical(new_seq(NA_real_), NA_real_)
  # single value
  expect_identical(new_seq(1), 1)
  expect_identical(new_seq(0), 0)
  expect_identical(new_seq(1.1), 1.1)
  expect_identical(new_seq(-1), -1)
  # multiple value
  x0to1 <- seq(0, 1, length.out = 30)
  expect_identical(new_seq(c(0, 1)), x0to1)
  expect_identical(new_seq(c(1, 0)), x0to1)
  expect_identical(new_seq(c(1, 1)), 1)
  expect_identical(new_seq(c(0, 0)), 0)
  expect_identical(new_seq(c(0, 0, 1)), x0to1)
  expect_identical(new_seq(c(1, 1, 0)), x0to1)
  expect_equal(new_seq(c(10, 0)), x0to1 * 10)
  expect_equal(new_seq(c(100, 0)), x0to1 * 100)
  # multiple value with missing
  x0to1 <- seq(0, 1, length.out = 30)
  expect_identical(new_seq(c(0, 1, NA)), x0to1)
  expect_identical(new_seq(c(1, 0, NA)), x0to1)
  expect_identical(new_seq(c(1, 1, NA)), 1)
  expect_identical(new_seq(c(0, 0, NA)), 0)
  expect_identical(new_seq(c(0, 0, 1, NA)), x0to1)
  expect_identical(new_seq(c(1, 1, 0, NA)), x0to1)
  expect_equal(new_seq(c(10, 0, NA)), x0to1 * 10)
  expect_equal(new_seq(c(100, 0, NA)), x0to1 * 100)
  # length_out not count
  expect_error(new_seq(1, length_out = -1), "`length_out` must be a count")
  expect_error(new_seq(1, length_out = 0.5), "`length_out` must be a count")
  # length_out is 0
  expect_identical(new_seq(double(), length_out = 0), double())
  expect_identical(new_seq(numeric(), length_out = 0), double())
  expect_identical(new_seq(NA_real_, length_out = 0), double())
  expect_identical(new_seq(1, length_out = 0), double())
  # length_out = 1
  expect_identical(new_seq(c(0, 1), length_out = 1), 0.5)
  expect_identical(new_seq(c(1, 0), length_out = 1), 0.5)
  expect_identical(new_seq(c(1, 1), length_out = 1), 1)
  expect_identical(new_seq(c(0, 0), length_out = 1), 0)
  expect_equal(new_seq(c(0, 0, 1), length_out = 1), 1 / 3)
  expect_identical(new_seq(c(1, 1, 0), length_out = 1), 2 / 3)
  expect_identical(new_seq(c(10, 1), length_out = 1), 5.5)
  expect_identical(new_seq(c(100, 1), length_out = 1), 50.5)
  # length_out = 2
  expect_identical(new_seq(c(0, 1), length_out = 2), c(0, 1))
  expect_identical(new_seq(c(1, 0), length_out = 2), c(0, 1))
  expect_identical(new_seq(c(1, 1), length_out = 2), 1)
  expect_identical(new_seq(c(0, 0), length_out = 2), 0)
  expect_identical(new_seq(c(0, 0, 1), length_out = 2), c(0, 1))
  expect_identical(new_seq(c(1, 1, 0), length_out = 2), c(0, 1))
  expect_identical(new_seq(c(10, 1), length_out = 2), c(1, 10))
  expect_identical(new_seq(c(100, 1), length_out = 2), c(1, 100))
  # length_out = 3
  expect_identical(new_seq(c(0, 1), length_out = 3), c(0, 0.5, 1))
  expect_identical(new_seq(c(1, 0), length_out = 3), c(0, 0.5, 1))
  expect_identical(new_seq(c(1, 1), length_out = 3), 1)
  expect_identical(new_seq(c(0, 0), length_out = 3), 0)
  expect_identical(new_seq(c(0, 0, 1), length_out = 3), c(0, 0.5, 1))
  expect_identical(new_seq(c(1, 1, 0), length_out = 3), c(0, 0.5, 1))
  expect_identical(new_seq(c(10, 1), length_out = 3), c(1, 5.5, 10))
  expect_identical(new_seq(c(100, 1), length_out = 3), c(1, 50.5, 100))
  # length_out = Inf
  expect_error(
    new_seq(c(0, 1), length_out = Inf),
    "'length.out' must be a non-negative number"
  ) # improve error message
  # matrices and arrays
  expect_identical(new_seq(matrix(1)), 1)
  expect_identical(new_seq(array(1)), 1)
})

test_that("new_seq character", {
  # zero length
  expect_identical(new_seq(character(0)), NA_character_)
  # missing value
  expect_identical(new_seq(NA_character_), NA_character_)
  # single value
  expect_identical(new_seq("1"), "1")
  expect_identical(new_seq("0"), "0")
  # multiple value
  expect_identical(new_seq(c("0", "1")), c("0", "1"))
  expect_identical(new_seq(c("1", "0")), c("0", "1"))
  expect_identical(new_seq(c("1", "1")), "1")
  expect_identical(new_seq(c("0", "0")), "0")
  expect_identical(new_seq(c("0", "0", "1")), c("0", "1"))
  expect_identical(new_seq(c("1", "1", "0")), c("1", "0"))
  expect_identical(new_seq(c("10", "1")), c("1", "10"))
  expect_identical(new_seq(c("100", "1")), c("1", "100"))
  expect_identical(
    new_seq(as.character(1:100)),
    c(
      "1", "10", "100", "11", "12", "13", "14", "15", "16", "17",
      "18", "19", "2", "20", "21", "22", "23", "24", "25", "26", "27",
      "28", "29", "3", "30", "31", "32", "33", "34", "35", "36", "37",
      "38", "39", "4", "40", "41", "42", "43", "44", "45", "46", "47",
      "48", "49", "5", "50", "51", "52", "53", "54", "55", "56", "57",
      "58", "59", "6", "60", "61", "62", "63", "64", "65", "66", "67",
      "68", "69", "7", "70", "71", "72", "73", "74", "75", "76", "77",
      "78", "79", "8", "80", "81", "82", "83", "84", "85", "86", "87",
      "88", "89", "9", "90", "91", "92", "93", "94", "95", "96", "97",
      "98", "99"
    )
  )
  expect_identical(
    new_seq(as.character(c("c", "c", "a", "b", "b"))),
    c("b", "c", "a")
  )
  # multiple value with missing
  expect_identical(new_seq(c("0", "1", NA)), c("0", "1"))
  expect_identical(new_seq(c("1", "0", NA)), c("0", "1"))
  expect_identical(new_seq(c("1", "1", NA)), "1")
  expect_identical(new_seq(c("0", "0", NA)), "0")
  expect_identical(new_seq(c("0", "0", "1", NA)), c("0", "1"))
  expect_identical(new_seq(c("1", "1", "0", NA)), c("1", "0"))
  expect_identical(new_seq(c("10", "1", NA)), c("1", "10"))
  expect_identical(new_seq(c("100", "1", NA)), c("1", "100"))
  # length_out not count
  expect_error(new_seq("1", length_out = -1), "`length_out` must be a count")
  expect_error(new_seq("1", length_out = 0.5), "`length_out` must be a count")
  # length_out is 0
  expect_identical(new_seq(character(), length_out = 0), character())
  expect_identical(new_seq(NA_character_, length_out = 0), character())
  expect_identical(new_seq("1", length_out = 0), character())
  # length_out = 1
  expect_identical(new_seq(c("0", "1"), length_out = 1), "0")
  expect_identical(new_seq(c("1", "0"), length_out = 1), "0")
  expect_identical(new_seq(c("1", "1"), length_out = 1), "1")
  expect_identical(new_seq(c("0", "0"), length_out = 1), "0")
  expect_identical(new_seq(c("0", "0", "1"), length_out = 1), "0")
  expect_identical(new_seq(c("1", "1", "0"), length_out = 1), "1")
  expect_identical(new_seq(c("1", "0", "1"), length_out = 1), "1")
  expect_identical(new_seq(c("10", "1"), length_out = 1), "1")
  expect_identical(new_seq(c("100", "1"), length_out = 1), "1")
  # length_out = 2
  expect_identical(new_seq(c("0", "1"), length_out = 2), c("0", "1"))
  expect_identical(new_seq(c("1", "0"), length_out = 2), c("0", "1"))
  expect_identical(new_seq(c("1", "1"), length_out = 2), "1")
  expect_identical(new_seq(c("0", "0"), length_out = 2), "0")
  expect_identical(new_seq(c("0", "0", "1"), length_out = 2), c("0", "1"))
  expect_identical(new_seq(c("1", "1", "0"), length_out = 2), c("1", "0"))
  expect_identical(new_seq(c("10", "1"), length_out = 2), c("1", "10"))
  expect_identical(new_seq(c("100", "1"), length_out = 2), c("1", "100"))
  expect_identical(new_seq(c("10", "1", "2"), length_out = 2), c("1", "10"))
  expect_identical(new_seq(c("100", "1", "2"), length_out = 2), c("1", "100"))
  # length_out = 3
  expect_identical(new_seq(c("0", "1"), length_out = 3), c("0", "1"))
  expect_identical(new_seq(c("1", "0"), length_out = 3), c("0", "1"))
  expect_identical(new_seq(c("1", "1"), length_out = 3), "1")
  expect_identical(new_seq(c("0", "0"), length_out = 3), "0")
  expect_identical(new_seq(c("0", "0", "1"), length_out = 3), c("0", "1"))
  expect_identical(new_seq(c("1", "1", "0"), length_out = 3), c("1", "0"))
  expect_identical(new_seq(c("10", "1"), length_out = 3), c("1", "10"))
  expect_identical(new_seq(c("100", "1"), length_out = 3), c("1", "100"))
  expect_identical(new_seq(c("100", "1", "2"), length_out = 3), c("1", "100", "2"))
  expect_identical(new_seq(c("100", "1", "2", "3"), length_out = 3), c("1", "100", "2"))
  expect_identical(new_seq(c("100", "1", "99", "3"), length_out = 3), c("1", "100", "3"))
  # length_out = Inf
  expect_identical(
    new_seq(as.character(1:100), length_out = Inf),
    sort(as.character(1:100))
  )
  # matrices and arrays
  expect_identical(new_seq(matrix("a")), "a")
  expect_identical(new_seq(array("a")), "a")
})

test_that("new_seq factor", {
  # zero length
  expect_identical(new_seq(factor()), factor(NA))
  # missing value
  expect_identical(new_seq(factor(NA)), factor(NA))
  expect_identical(new_seq(factor(NA, levels = "1")), factor("1", levels = "1"))
  # single value
  expect_identical(new_seq(factor("1")), factor("1"))
  expect_identical(new_seq(factor("0")), factor("0"))
  expect_identical(
    new_seq(factor("1", levels = c("1", "0"))),
    factor(c("1", "0"), levels = c("1", "0"))
  )
  # multiple value
  expect_identical(
    new_seq(factor(c("0", "1"), levels = c("0", "1"))),
    factor(c("0", "1"), levels = c("0", "1"))
  )
  expect_identical(
    new_seq(factor(c("1", "0"), levels = c("1", "0"))),
    factor(c("1", "0"), levels = c("1", "0"))
  )
  expect_identical(
    new_seq(factor(c("0", "1"), levels = c("1", "0"))),
    factor(c("1", "0"), levels = c("1", "0"))
  )
  expect_identical(
    new_seq(factor(c("1", "0"), levels = c("1", "0"))),
    factor(c("1", "0"), levels = c("1", "0"))
  )
  expect_identical(
    new_seq(factor(c("1", "1"), levels = "1")),
    factor("1", levels = "1")
  )
  expect_identical(
    new_seq(factor(c("0", "0", "1"), levels = c("0", "1"))),
    factor(c("0", "1"), levels = c("0", "1"))
  )
  expect_identical(
    new_seq(factor(c("0", "0", "1"), levels = c("1", "0"))),
    factor(c("1", "0"), levels = c("1", "0"))
  )
  expect_identical(new_seq(factor(as.character(1:100))), sort(factor(as.character(1:100))))
  # multiple value with missing
  expect_identical(
    new_seq(factor(c("0", "1", NA), levels = c("0", "1"))),
    factor(c("0", "1"), levels = c("0", "1"))
  )
  expect_identical(
    new_seq(factor(c("1", "0", NA), levels = c("1", "0"))),
    factor(c("1", "0"), levels = c("1", "0"))
  )
  expect_identical(
    new_seq(factor(c("0", "1", NA), levels = c("1", "0"))),
    factor(c("1", "0"), levels = c("1", "0"))
  )
  expect_identical(
    new_seq(factor(c("1", "0", NA), levels = c("1", "0"))),
    factor(c("1", "0"), levels = c("1", "0"))
  )
  expect_identical(
    new_seq(factor(c("1", "1", NA), levels = "1")),
    factor("1", levels = "1")
  )
  expect_identical(
    new_seq(factor(c("0", "0", "1", NA), levels = c("0", "1"))),
    factor(c("0", "1"), levels = c("0", "1"))
  )
  expect_identical(
    new_seq(factor(c("0", "0", "1", NA), levels = c("1", "0"))),
    factor(c("1", "0"), levels = c("1", "0"))
  )
  expect_identical(new_seq(factor(as.character(1:100, NA))), sort(factor(as.character(1:100, NA))))
  # length_out not count
  expect_error(new_seq(factor("1"), length_out = -1), "`length_out` must be a count")
  expect_error(new_seq(factor("1"), length_out = 0.5), "`length_out` must be a count")
  # length_out is 0
  expect_identical(new_seq(factor(), length_out = 0), factor())
  expect_identical(new_seq(factor(levels = "1"), length_out = 0), factor(levels = "1"))
  expect_identical(new_seq(factor(NA_character_), length_out = 0), factor())
  expect_identical(new_seq(factor(NA_character_, levels = "1"), length_out = 0), factor(levels = "1"))
  expect_identical(new_seq(factor("1"), length_out = 0), factor(levels = "1"))
  # length_out = 1
  expect_identical(
    new_seq(factor(c("0", "1"), levels = c("0", "1")), length_out = 1),
    factor("0", levels = c("0", "1"))
  )
  expect_identical(
    new_seq(factor(c("1", "0"), levels = c("0", "1")), length_out = 1),
    factor("0", levels = c("0", "1"))
  )
  expect_identical(
    new_seq(factor(c("0", "1"), levels = c("1", "0")), length_out = 1),
    factor("1", levels = c("1", "0"))
  )
  expect_identical(
    new_seq(factor(c("1", "0"), levels = c("1", "0")), length_out = 1),
    factor("1", levels = c("1", "0"))
  )
  expect_identical(
    new_seq(factor(c("0", "0", "1"), levels = c("0", "1")), length_out = 1),
    factor("0", levels = c("0", "1"))
  )
  expect_identical(
    new_seq(factor(c("1", "1", "0"), levels = c("0", "1")), length_out = 1),
    factor("0", levels = c("0", "1"))
  )
  expect_identical(
    new_seq(factor("0", levels = c("0", "1", "2")), length_out = 1),
    factor("0", levels = c("0", "1", "2"))
  )
  expect_identical(
    new_seq(factor(c("2", "1", "0"), levels = c("0", "1", "2")), length_out = 1),
    factor("0", levels = c("0", "1", "2"))
  )
  # length_out = 2
  expect_identical(
    new_seq(factor(c("0", "1"), levels = c("0", "1")), length_out = 2),
    factor(c("0", "1"), levels = c("0", "1"))
  )
  expect_identical(
    new_seq(factor(c("1", "0"), levels = c("0", "1")), length_out = 2),
    factor(c("0", "1"), levels = c("0", "1"))
  )
  expect_identical(
    new_seq(factor(c("0", "1"), levels = c("1", "0")), length_out = 2),
    factor(c("1", "0"), levels = c("1", "0"))
  )
  expect_identical(
    new_seq(factor(c("1", "0"), levels = c("1", "0")), length_out = 2),
    factor(c("1", "0"), levels = c("1", "0"))
  )
  expect_identical(
    new_seq(factor(c("0", "0", "1"), levels = c("0", "1")), length_out = 2),
    factor(c("0", "1"), levels = c("0", "1"))
  )
  expect_identical(
    new_seq(factor(c("1", "1", "0"), levels = c("0", "1")), length_out = 2),
    factor(c("0", "1"), levels = c("0", "1"))
  )
  expect_identical(
    new_seq(factor("0", levels = c("0", "1", "2")), length_out = 2),
    factor(c("0", "1"), levels = c("0", "1", "2"))
  )
  expect_identical(
    new_seq(factor(c("2", "1", "0"), levels = c("0", "1", "2")), length_out = 2),
    factor(c("0", "1"), levels = c("0", "1", "2"))
  )
  expect_identical(
    new_seq(factor(c("10", "1", "2"), levels = c("1", "10", "2")), length_out = 2),
    factor(c("1", "10"), levels = c("1", "10", "2"))
  )
  expect_identical(
    new_seq(factor(c("100", "1", "2"), levels = c("1", "10", "2")), length_out = 2),
    factor(c("1", "10"), levels = c("1", "10", "2"))
  )
  # length_out = 3
  expect_identical(
    new_seq(factor(c("0", "1"), levels = c("0", "1")), length_out = 3),
    factor(c("0", "1"), levels = c("0", "1"))
  )
  expect_identical(
    new_seq(factor(c("1", "0"), levels = c("0", "1")), length_out = 3),
    factor(c("0", "1"), levels = c("0", "1"))
  )
  expect_identical(
    new_seq(factor(c("0", "1"), levels = c("1", "0")), length_out = 3),
    factor(c("1", "0"), levels = c("1", "0"))
  )
  expect_identical(
    new_seq(factor(c("1", "0"), levels = c("1", "0")), length_out = 3),
    factor(c("1", "0"), levels = c("1", "0"))
  )
  expect_identical(
    new_seq(factor(c("0", "0", "1"), levels = c("0", "1")), length_out = 3),
    factor(c("0", "1"), levels = c("0", "1"))
  )
  expect_identical(
    new_seq(factor(c("1", "1", "0"), levels = c("0", "1")), length_out = 3),
    factor(c("0", "1"), levels = c("0", "1"))
  )
  expect_identical(
    new_seq(factor("0", levels = c("0", "1", "2")), length_out = 3),
    factor(c("0", "1", "2"), levels = c("0", "1", "2"))
  )
  expect_identical(
    new_seq(factor(c("2", "1", "0"), levels = c("0", "1", "2")), length_out = 3),
    factor(c("0", "1", "2"), levels = c("0", "1", "2"))
  )
  expect_identical(
    new_seq(factor(c("10", "1", "2"), levels = c("1", "10", "2")), length_out = 3),
    factor(c("1", "10", "2"), levels = c("1", "10", "2"))
  )
  expect_identical(
    new_seq(factor(c("100", "1", "2"), levels = c("1", "2", "100")), length_out = 3),
    factor(c("1", "2", "100"), levels = c("1", "2", "100"))
  )
  # length_out = Inf
  expect_identical(
    new_seq(factor(c("100", "1", "2"), levels = c("1", "2", "100")), length_out = Inf),
    factor(c("1", "2", "100"), levels = c("1", "2", "100"))
  )
})

test_that("new_seq ordered", {
  # zero length
  expect_identical(new_seq(ordered()), ordered(NA))
  # missing value
  expect_identical(new_seq(ordered(NA)), ordered(NA))
  expect_identical(new_seq(ordered(NA, levels = "1")), ordered("1", levels = "1"))
  # single value
  expect_identical(new_seq(ordered("1")), ordered("1"))
  expect_identical(new_seq(ordered("0")), ordered("0"))
  expect_identical(
    new_seq(ordered("1", levels = c("1", "0"))),
    ordered(c("1", "0"), levels = c("1", "0"))
  )
  # multiple value
  expect_identical(
    new_seq(ordered(c("0", "1"), levels = c("0", "1"))),
    ordered(c("0", "1"), levels = c("0", "1"))
  )
  expect_identical(
    new_seq(ordered(c("1", "0"), levels = c("1", "0"))),
    ordered(c("1", "0"), levels = c("1", "0"))
  )
  expect_identical(
    new_seq(ordered(c("0", "1"), levels = c("1", "0"))),
    ordered(c("1", "0"), levels = c("1", "0"))
  )
  expect_identical(
    new_seq(ordered(c("1", "0"), levels = c("1", "0"))),
    ordered(c("1", "0"), levels = c("1", "0"))
  )
  expect_identical(
    new_seq(ordered(c("1", "1"), levels = "1")),
    ordered("1", levels = "1")
  )
  expect_identical(
    new_seq(ordered(c("0", "0", "1"), levels = c("0", "1"))),
    ordered(c("0", "1"), levels = c("0", "1"))
  )
  expect_identical(
    new_seq(ordered(c("0", "0", "1"), levels = c("1", "0"))),
    ordered(c("1", "0"), levels = c("1", "0"))
  )
  expect_identical(new_seq(ordered(as.character(1:100))), sort(ordered(as.character(1:100))))
  # multiple value with missing
  expect_identical(
    new_seq(ordered(c("0", "1", NA), levels = c("0", "1"))),
    ordered(c("0", "1"), levels = c("0", "1"))
  )
  expect_identical(
    new_seq(ordered(c("1", "0", NA), levels = c("1", "0"))),
    ordered(c("1", "0"), levels = c("1", "0"))
  )
  expect_identical(
    new_seq(ordered(c("0", "1", NA), levels = c("1", "0"))),
    ordered(c("1", "0"), levels = c("1", "0"))
  )
  expect_identical(
    new_seq(ordered(c("1", "0", NA), levels = c("1", "0"))),
    ordered(c("1", "0"), levels = c("1", "0"))
  )
  expect_identical(
    new_seq(ordered(c("1", "1", NA), levels = "1")),
    ordered("1", levels = "1")
  )
  expect_identical(
    new_seq(ordered(c("0", "0", "1", NA), levels = c("0", "1"))),
    ordered(c("0", "1"), levels = c("0", "1"))
  )
  expect_identical(
    new_seq(ordered(c("0", "0", "1", NA), levels = c("1", "0"))),
    ordered(c("1", "0"), levels = c("1", "0"))
  )
  expect_identical(new_seq(ordered(as.character(1:100, NA))), sort(ordered(as.character(1:100, NA))))
  # length_out not count
  expect_error(new_seq(ordered("1"), length_out = -1), "`length_out` must be a count")
  expect_error(new_seq(ordered("1"), length_out = 0.5), "`length_out` must be a count")
  # length_out is 0
  expect_identical(new_seq(ordered(), length_out = 0), ordered())
  expect_identical(new_seq(ordered(levels = "1"), length_out = 0), ordered(levels = "1"))
  expect_identical(new_seq(ordered(NA_character_), length_out = 0), ordered())
  expect_identical(new_seq(ordered(NA_character_, levels = "1"), length_out = 0), ordered(levels = "1"))
  expect_identical(new_seq(ordered("1"), length_out = 0), ordered(levels = "1"))
  # length_out = 1
  expect_identical(
    new_seq(ordered(c("0", "1"), levels = c("0", "1")), length_out = 1),
    ordered("0", levels = c("0", "1"))
  )
  expect_identical(
    new_seq(ordered(c("1", "0"), levels = c("0", "1")), length_out = 1),
    ordered("0", levels = c("0", "1"))
  )
  expect_identical(
    new_seq(ordered(c("0", "1"), levels = c("1", "0")), length_out = 1),
    ordered("1", levels = c("1", "0"))
  )
  expect_identical(
    new_seq(ordered(c("1", "0"), levels = c("1", "0")), length_out = 1),
    ordered("1", levels = c("1", "0"))
  )
  expect_identical(
    new_seq(ordered(c("0", "0", "1"), levels = c("0", "1")), length_out = 1),
    ordered("0", levels = c("0", "1"))
  )
  expect_identical(
    new_seq(ordered(c("1", "1", "0"), levels = c("0", "1")), length_out = 1),
    ordered("0", levels = c("0", "1"))
  )
  expect_identical(
    new_seq(ordered("0", levels = c("0", "1", "2")), length_out = 1),
    ordered("0", levels = c("0", "1", "2"))
  )
  expect_identical(
    new_seq(ordered(c("2", "1", "0"), levels = c("0", "1", "2")), length_out = 1),
    ordered("0", levels = c("0", "1", "2"))
  )
  # length_out = 2
  expect_identical(
    new_seq(ordered(c("0", "1"), levels = c("0", "1")), length_out = 2),
    ordered(c("0", "1"), levels = c("0", "1"))
  )
  expect_identical(
    new_seq(ordered(c("1", "0"), levels = c("0", "1")), length_out = 2),
    ordered(c("0", "1"), levels = c("0", "1"))
  )
  expect_identical(
    new_seq(ordered(c("0", "1"), levels = c("1", "0")), length_out = 2),
    ordered(c("1", "0"), levels = c("1", "0"))
  )
  expect_identical(
    new_seq(ordered(c("1", "0"), levels = c("1", "0")), length_out = 2),
    ordered(c("1", "0"), levels = c("1", "0"))
  )
  expect_identical(
    new_seq(ordered(c("0", "0", "1"), levels = c("0", "1")), length_out = 2),
    ordered(c("0", "1"), levels = c("0", "1"))
  )
  expect_identical(
    new_seq(ordered(c("1", "1", "0"), levels = c("0", "1")), length_out = 2),
    ordered(c("0", "1"), levels = c("0", "1"))
  )
  expect_identical(
    new_seq(ordered("0", levels = c("0", "1", "2")), length_out = 2),
    ordered(c("0", "2"), levels = c("0", "1", "2"))
  )
  expect_identical(
    new_seq(ordered(c("2", "1", "0"), levels = c("0", "1", "2")), length_out = 2),
    ordered(c("0", "2"), levels = c("0", "1", "2"))
  )
  expect_identical(
    new_seq(ordered(c("10", "1", "2"), levels = c("1", "10", "2")), length_out = 2),
    ordered(c("1", "2"), levels = c("1", "10", "2"))
  )
  expect_identical(
    new_seq(ordered(c("100", "1", "2"), levels = c("1", "10", "2")), length_out = 2),
    ordered(c("1", "2"), levels = c("1", "10", "2"))
  )
  # length_out = 3
  expect_identical(
    new_seq(ordered(c("0", "1"), levels = c("0", "1")), length_out = 3),
    ordered(c("0", "1"), levels = c("0", "1"))
  )
  expect_identical(
    new_seq(ordered(c("1", "0"), levels = c("0", "1")), length_out = 3),
    ordered(c("0", "1"), levels = c("0", "1"))
  )
  expect_identical(
    new_seq(ordered(c("0", "1"), levels = c("1", "0")), length_out = 3),
    ordered(c("1", "0"), levels = c("1", "0"))
  )
  expect_identical(
    new_seq(ordered(c("1", "0"), levels = c("1", "0")), length_out = 3),
    ordered(c("1", "0"), levels = c("1", "0"))
  )
  expect_identical(
    new_seq(ordered(c("0", "0", "1"), levels = c("0", "1")), length_out = 3),
    ordered(c("0", "1"), levels = c("0", "1"))
  )
  expect_identical(
    new_seq(ordered(c("1", "1", "0"), levels = c("0", "1")), length_out = 3),
    ordered(c("0", "1"), levels = c("0", "1"))
  )
  expect_identical(
    new_seq(ordered("0", levels = c("0", "1", "2")), length_out = 3),
    ordered(c("0", "1", "2"), levels = c("0", "1", "2"))
  )
  expect_identical(
    new_seq(ordered(c("2", "1", "0"), levels = c("0", "1", "2")), length_out = 3),
    ordered(c("0", "1", "2"), levels = c("0", "1", "2"))
  )
  expect_identical(
    new_seq(ordered(c("10", "1", "2"), levels = c("1", "10", "2")), length_out = 3),
    ordered(c("1", "10", "2"), levels = c("1", "10", "2"))
  )
  expect_identical(
    new_seq(ordered(c("100", "1", "2"), levels = c("1", "2", "100")), length_out = 3),
    ordered(c("1", "2", "100"), levels = c("1", "2", "100"))
  )
  # length_out = Inf
  expect_identical(
    new_seq(ordered(c("100", "1", "2"), levels = c("1", "2", "100")), length_out = Inf),
    ordered(c("1", "2", "100"), levels = c("1", "2", "100"))
  )
})

test_that("new_seq Date", {
  # zero length
  expect_identical(new_seq(as.Date(character(0))), as.Date(NA_integer_))
  expect_identical(new_seq(as.Date(integer(0))), as.Date(NA_integer_))
  expect_identical(new_seq(as.Date(double(0))), as.Date(NA_integer_))
  # missing value
  expect_identical(new_seq(as.Date(NA_character_)), as.Date(NA_integer_))
  expect_identical(new_seq(as.Date(NA_integer_)), as.Date(NA_integer_))
  expect_identical(new_seq(as.Date(NA_real_)), as.Date(NA_integer_))
  # single value
  expect_identical(new_seq(as.Date(1L)), as.Date(1L))
  expect_identical(new_seq(as.Date(1)), as.Date(1L))
  expect_identical(new_seq(as.Date(0L)), as.Date(0L))
  # multiple value
  expect_identical(new_seq(as.Date(c(0L, 1L))), as.Date(c(0L, 1L)))
  expect_identical(new_seq(as.Date(c(1L, 0L))), as.Date(c(0L, 1L)))
  expect_identical(new_seq(as.Date(c(1L, 1L))), as.Date(1L))
  expect_identical(new_seq(as.Date(c(0L, 0L))), as.Date(0L))
  expect_identical(new_seq(as.Date(c(0L, 0L, 1L))), as.Date(c(0L, 1L)))
  expect_identical(new_seq(as.Date(c(1L, 1L, 0L))), as.Date(c(0L, 1L)))
  expect_identical(new_seq(as.Date(c(10L, 1L))), as.Date(1:10))
  expect_identical(
    new_seq(as.Date(c(100L, 1L))),
    as.Date(c(1L, 4L, 8L, 11L, 15L, 18L, 21L, 25L, 28L, 32L, 35L, 39L, 42L,
              45L, 49L, 52L, 56L, 59L, 62L, 66L, 69L, 73L, 76L, 80L, 83L, 86L,
              90L, 93L, 97L, 100L))
  )
  # multiple value with missing
  expect_identical(new_seq(as.Date(c(0L, 1L, NA))), as.Date(c(0L, 1L)))
  expect_identical(new_seq(as.Date(c(1L, 0L, NA))), as.Date(c(0L, 1L)))
  expect_identical(new_seq(as.Date(c(1L, 1L, NA))), as.Date(1L))
  expect_identical(new_seq(as.Date(c(0L, 0L, NA))), as.Date(0L))
  expect_identical(new_seq(as.Date(c(0L, 0L, 1L, NA))), as.Date(c(0L, 1L)))
  expect_identical(new_seq(as.Date(c(1L, 1L, 0L, NA))), as.Date(c(0L, 1L)))
  expect_identical(new_seq(as.Date(c(10L, 1L, NA))), as.Date(1:10))
  expect_identical(
    new_seq(as.Date(c(100L, 1L, NA))),
    as.Date(c(1L, 4L, 8L, 11L, 15L, 18L, 21L, 25L, 28L, 32L, 35L, 39L, 42L,
              45L, 49L, 52L, 56L, 59L, 62L, 66L, 69L, 73L, 76L, 80L, 83L, 86L,
              90L, 93L, 97L, 100L))
  )
  # length_out not count
  expect_error(new_seq(as.Date(1L), length_out = -1), "`length_out` must be a count")
  expect_error(new_seq(as.Date(1L), length_out = 0.5), "`length_out` must be a count")
  # length_out is 0
  expect_identical(
    new_seq(as.Date(integer()), length_out = 0),
    as.Date(integer())
  )
  expect_identical(
    new_seq(as.Date(NA_integer_), length_out = 0),
    as.Date(integer())
  )
  expect_identical(
    new_seq(as.Date(1L), length_out = 0),
    as.Date(integer())
  )
  # length_out = 1
  expect_identical(new_seq(as.Date(c(0L, 1L)), length_out = 1), as.Date(0L))
  expect_identical(new_seq(as.Date(c(1L, 0L)), length_out = 1), as.Date(0L))
  expect_identical(new_seq(as.Date(c(1L, 1L)), length_out = 1), as.Date(1L))
  expect_identical(new_seq(as.Date(c(0L, 0L)), length_out = 1), as.Date(0L))
  expect_identical(new_seq(as.Date(c(0L, 0L, 1L)), length_out = 1), as.Date(0L))
  expect_identical(new_seq(as.Date(c(1L, 1L, 0L)), length_out = 1), as.Date(1L))
  expect_identical(new_seq(as.Date(c(10L, 1L)), length_out = 1), as.Date(6L))
  expect_identical(new_seq(as.Date(c(100L, 1L)), length_out = 1), as.Date(50L))
  # length_out = 2
  expect_identical(new_seq(as.Date(c(0L, 1L)), length_out = 2), as.Date(c(0L, 1L)))
  expect_identical(new_seq(as.Date(c(1L, 0L)), length_out = 2), as.Date(c(0L, 1L)))
  expect_identical(new_seq(as.Date(c(1L, 1L)), length_out = 2), as.Date(1L))
  expect_identical(new_seq(as.Date(c(0L, 0L)), length_out = 2), as.Date(0L))
  expect_identical(new_seq(as.Date(c(0L, 0L, 1L)), length_out = 2), as.Date(c(0L, 1L)))
  expect_identical(new_seq(as.Date(c(1L, 1L, 0L)), length_out = 2), as.Date(c(0L, 1L)))
  expect_identical(new_seq(as.Date(c(10L, 1L)), length_out = 2), as.Date(c(1L, 10L)))
  expect_identical(new_seq(as.Date(c(100L, 1L)), length_out = 2), as.Date(c(1L, 100L)))
  # length_out = 3
  expect_identical(new_seq(as.Date(c(0L, 1L)), length_out = 3), as.Date(c(0L, 1L)))
  expect_identical(new_seq(as.Date(c(1L, 0L)), length_out = 3), as.Date(c(0L, 1L)))
  expect_identical(new_seq(as.Date(c(1L, 1L)), length_out = 3), as.Date(1L))
  expect_identical(new_seq(as.Date(c(0L, 0L)), length_out = 3), as.Date(0L))
  expect_identical(new_seq(as.Date(c(0L, 0L, 1L)), length_out = 3), as.Date(c(0L, 1L)))
  expect_identical(new_seq(as.Date(c(1L, 1L, 0L)), length_out = 3), as.Date(c(0L, 1L)))
  expect_identical(new_seq(as.Date(c(10L, 1L)), length_out = 3), as.Date(c(1L, 6L, 10L)))
  expect_identical(new_seq(as.Date(c(100L, 1L)), length_out = 3), as.Date(c(1L, 50L, 100L)))
  # length_out = Inf
  expect_identical(new_seq(as.Date(c(10L, 1L)), length_out = Inf), as.Date(1:10))
  expect_identical(
    new_seq(as.Date(c(100L, 1L)), length_out = Inf),
    as.Date(c(1:100))
  )
})

test_that("new_seq POSIXct", {
  # zero length
  expect_identical(new_seq(as.POSIXct(character(0))), as.POSIXct(NA_integer_))
  expect_identical(new_seq(as.POSIXct(integer(0))), as.POSIXct(NA_integer_))
  expect_identical(new_seq(as.POSIXct(double(0))), as.POSIXct(NA_integer_))
  expect_identical(new_seq(as.POSIXct(character(0), tz = "PST8PDT")), as.POSIXct(NA_integer_, tz = "PST8PDT"))
  expect_identical(new_seq(as.POSIXct(integer(0), tz = "PST8PDT")), as.POSIXct(NA_integer_, tz = "PST8PDT"))
  expect_identical(new_seq(as.POSIXct(double(0), tz = "PST8PDT")), as.POSIXct(NA_integer_, tz = "PST8PDT"))
  # missing value
  expect_identical(new_seq(as.POSIXct(NA_character_)), as.POSIXct(NA_integer_))
  expect_identical(new_seq(as.POSIXct(NA_integer_)), as.POSIXct(NA_integer_))
  expect_identical(new_seq(as.POSIXct(NA_real_)), as.POSIXct(NA_integer_))
  expect_identical(new_seq(as.POSIXct(NA_character_, tz = "PST8PDT")), as.POSIXct(NA_integer_, tz = "PST8PDT"))
  expect_identical(new_seq(as.POSIXct(NA_integer_, tz = "PST8PDT")), as.POSIXct(NA_integer_, tz = "PST8PDT"))
  expect_identical(new_seq(as.POSIXct(NA_real_, tz = "PST8PDT")), as.POSIXct(NA_integer_, tz = "PST8PDT"))
  # single value
  expect_identical(new_seq(as.POSIXct(1L, tz = "PST8PDT")), as.POSIXct(1L, tz = "PST8PDT"))
  expect_identical(new_seq(as.POSIXct(1, tz = "PST8PDT")), as.POSIXct(1L, tz = "PST8PDT"))
  expect_identical(new_seq(as.POSIXct(0L, tz = "PST8PDT")), as.POSIXct(0L, tz = "PST8PDT"))
  expect_identical(new_seq(as.POSIXct(1L, tz = "PST8PDT")), as.POSIXct(1L, tz = "PST8PDT"))
  expect_identical(new_seq(as.POSIXct(1, tz = "PST8PDT")), as.POSIXct(1L, tz = "PST8PDT"))
  expect_identical(new_seq(as.POSIXct(0L, tz = "PST8PDT")), as.POSIXct(0L, tz = "PST8PDT"))
  # multiple value
  expect_identical(new_seq(as.POSIXct(c(0L, 1L))), as.POSIXct(c(0L, 1L)))
  expect_identical(new_seq(as.POSIXct(c(1L, 0L))), as.POSIXct(c(0L, 1L)))
  expect_identical(new_seq(as.POSIXct(c(1L, 1L))), as.POSIXct(1L))
  expect_identical(new_seq(as.POSIXct(c(0L, 0L))), as.POSIXct(0L))
  expect_identical(new_seq(as.POSIXct(c(0L, 0L, 1L))), as.POSIXct(c(0L, 1L)))
  expect_identical(new_seq(as.POSIXct(c(1L, 1L, 0L))), as.POSIXct(c(0L, 1L)))
  expect_identical(new_seq(as.POSIXct(c(10L, 1L))), as.POSIXct(1:10))
  expect_identical(
    new_seq(as.POSIXct(c(100L, 1L))),
    as.POSIXct(c(1L, 4L, 8L, 11L, 15L, 18L, 21L, 25L, 28L, 32L, 35L, 39L, 42L,
                 45L, 49L, 52L, 56L, 59L, 62L, 66L, 69L, 73L, 76L, 80L, 83L, 86L,
                 90L, 93L, 97L, 100L))
  )
  # multiple value with missing
  expect_identical(new_seq(as.POSIXct(c(0L, 1L, NA))), as.POSIXct(c(0L, 1L)))
  expect_identical(new_seq(as.POSIXct(c(1L, 0L, NA))), as.POSIXct(c(0L, 1L)))
  expect_identical(new_seq(as.POSIXct(c(1L, 1L, NA))), as.POSIXct(1L))
  expect_identical(new_seq(as.POSIXct(c(0L, 0L, NA))), as.POSIXct(0L))
  expect_identical(new_seq(as.POSIXct(c(0L, 0L, 1L, NA))), as.POSIXct(c(0L, 1L)))
  expect_identical(new_seq(as.POSIXct(c(1L, 1L, 0L, NA))), as.POSIXct(c(0L, 1L)))
  expect_identical(new_seq(as.POSIXct(c(10L, 1L, NA))), as.POSIXct(1:10))
  expect_identical(
    new_seq(as.POSIXct(c(100L, 1L, NA))),
    as.POSIXct(c(1L, 4L, 8L, 11L, 15L, 18L, 21L, 25L, 28L, 32L, 35L, 39L, 42L,
                 45L, 49L, 52L, 56L, 59L, 62L, 66L, 69L, 73L, 76L, 80L, 83L, 86L,
                 90L, 93L, 97L, 100L))
  )
  # # length_out not count
  expect_error(new_seq(as.POSIXct(1L), length_out = -1), "`length_out` must be a count")
  expect_error(new_seq(as.POSIXct(1L), length_out = 0.5), "`length_out` must be a count")
  # length_out is 0
  expect_identical(
    new_seq(as.POSIXct(integer()), length_out = 0),
    as.POSIXct(integer())
  )
  expect_identical(
    new_seq(as.POSIXct(NA_integer_), length_out = 0),
    as.POSIXct(integer())
  )
  expect_identical(
    new_seq(as.POSIXct(1L), length_out = 0),
    as.POSIXct(integer())
  )
  expect_identical(
    new_seq(as.POSIXct(integer(), tz = "PST8PDT"), length_out = 0),
    as.POSIXct(integer(), tz = "PST8PDT")
  )
  expect_identical(
    new_seq(as.POSIXct(NA_integer_, tz = "PST8PDT"), length_out = 0),
    as.POSIXct(integer(), tz = "PST8PDT")
  )
  expect_identical(
    new_seq(as.POSIXct(1L, tz = "PST8PDT"), length_out = 0),
    as.POSIXct(integer(), tz = "PST8PDT")
  )
  # length_out = 1
  expect_identical(new_seq(as.POSIXct(c(0L, 1L)), length_out = 1), as.POSIXct(0L))
  expect_identical(new_seq(as.POSIXct(c(1L, 0L)), length_out = 1), as.POSIXct(0L))
  expect_identical(new_seq(as.POSIXct(c(1L, 1L)), length_out = 1), as.POSIXct(1L))
  expect_identical(new_seq(as.POSIXct(c(0L, 0L)), length_out = 1), as.POSIXct(0L))
  expect_identical(new_seq(as.POSIXct(c(0L, 0L, 1L)), length_out = 1), as.POSIXct(0L))
  expect_identical(new_seq(as.POSIXct(c(1L, 1L, 0L)), length_out = 1), as.POSIXct(1L))
  expect_identical(new_seq(as.POSIXct(c(10L, 1L)), length_out = 1), as.POSIXct(6L))
  expect_identical(new_seq(as.POSIXct(c(100L, 1L)), length_out = 1), as.POSIXct(50L))
  expect_identical(new_seq(as.POSIXct(c(100L, 1L), tz = "PST8PDT"), length_out = 1), as.POSIXct(50L, tz = "PST8PDT"))
  # length_out = 2
  expect_identical(new_seq(as.POSIXct(c(0L, 1L)), length_out = 2), as.POSIXct(c(0L, 1L)))
  expect_identical(new_seq(as.POSIXct(c(1L, 0L)), length_out = 2), as.POSIXct(c(0L, 1L)))
  expect_identical(new_seq(as.POSIXct(c(1L, 1L)), length_out = 2), as.POSIXct(1L))
  expect_identical(new_seq(as.POSIXct(c(0L, 0L)), length_out = 2), as.POSIXct(0L))
  expect_identical(new_seq(as.POSIXct(c(0L, 0L, 1L)), length_out = 2), as.POSIXct(c(0L, 1L)))
  expect_identical(new_seq(as.POSIXct(c(1L, 1L, 0L)), length_out = 2), as.POSIXct(c(0L, 1L)))
  expect_identical(new_seq(as.POSIXct(c(10L, 1L)), length_out = 2), as.POSIXct(c(1L, 10L)))
  expect_identical(new_seq(as.POSIXct(c(100L, 1L)), length_out = 2), as.POSIXct(c(1L, 100L)))
  expect_identical(new_seq(as.POSIXct(c(100L, 1L), tz = "PST8PDT"), length_out = 2), as.POSIXct(c(1L, 100L), tz = "PST8PDT"))
  # length_out = 3
  expect_identical(new_seq(as.POSIXct(c(0L, 1L)), length_out = 3), as.POSIXct(c(0L, 1L)))
  expect_identical(new_seq(as.POSIXct(c(1L, 0L)), length_out = 3), as.POSIXct(c(0L, 1L)))
  expect_identical(new_seq(as.POSIXct(c(1L, 1L)), length_out = 3), as.POSIXct(1L))
  expect_identical(new_seq(as.POSIXct(c(0L, 0L)), length_out = 3), as.POSIXct(0L))
  expect_identical(new_seq(as.POSIXct(c(0L, 0L, 1L)), length_out = 3), as.POSIXct(c(0L, 1L)))
  expect_identical(new_seq(as.POSIXct(c(1L, 1L, 0L)), length_out = 3), as.POSIXct(c(0L, 1L)))
  expect_identical(new_seq(as.POSIXct(c(10L, 1L)), length_out = 3), as.POSIXct(c(1L, 6L, 10L)))
  expect_identical(new_seq(as.POSIXct(c(100L, 1L)), length_out = 3), as.POSIXct(c(1L, 50L, 100L)))
  expect_identical(new_seq(as.POSIXct(c(100L, 1L), tz = "PST8PDT"), length_out = 3), as.POSIXct(c(1L, 50L, 100L), tz = "PST8PDT"))
  # length_out = Inf
  expect_identical(new_seq(as.POSIXct(c(10L, 1L)), length_out = Inf), as.POSIXct(1:10))
  expect_identical(
    new_seq(as.POSIXct(c(100L, 1L)), length_out = Inf),
    as.POSIXct(c(1:100))
  )
  expect_identical(
    new_seq(as.POSIXct(c(100L, 1L), tz = "PST8PDT"), length_out = Inf),
    as.POSIXct(c(1:100), tz = "PST8PDT")
  )
})

test_that("new_seq hms", {
  # zero length
  expect_identical(new_seq(as_hms(character(0))), as_hms(NA_integer_))
  expect_identical(new_seq(as_hms(integer(0))), as_hms(NA_integer_))
  expect_identical(new_seq(as_hms(double(0))), as_hms(NA_integer_))
  # missing value
  expect_identical(new_seq(as_hms(NA_character_)), as_hms(NA_integer_))
  expect_identical(new_seq(as_hms(NA_integer_)), as_hms(NA_integer_))
  expect_identical(new_seq(as_hms(NA_real_)), as_hms(NA_integer_))
  # single value
  expect_identical(new_seq(as_hms(1L)), as_hms(1L))
  expect_identical(new_seq(as_hms(1)), as_hms(1L))
  expect_identical(new_seq(as_hms(0L)), as_hms(0L))
  # multiple value
  expect_identical(new_seq(as_hms(c(0L, 1L))), as_hms(c(0L, 1L)))
  expect_identical(new_seq(as_hms(c(1L, 0L))), as_hms(c(0L, 1L)))
  expect_identical(new_seq(as_hms(c(1L, 1L))), as_hms(1L))
  expect_identical(new_seq(as_hms(c(0L, 0L))), as_hms(0L))
  expect_identical(new_seq(as_hms(c(0L, 0L, 1L))), as_hms(c(0L, 1L)))
  expect_identical(new_seq(as_hms(c(1L, 1L, 0L))), as_hms(c(0L, 1L)))
  expect_identical(new_seq(as_hms(c(10L, 1L))), as_hms(1:10))
  expect_identical(
    new_seq(as_hms(c(100L, 1L))),
    as_hms(c(1L, 4L, 8L, 11L, 15L, 18L, 21L, 25L, 28L, 32L, 35L, 39L, 42L,
             45L, 49L, 52L, 56L, 59L, 62L, 66L, 69L, 73L, 76L, 80L, 83L, 86L,
             90L, 93L, 97L, 100L))
  )
  # multiple value with missing
  expect_identical(new_seq(as_hms(c(0L, 1L, NA))), as_hms(c(0L, 1L)))
  expect_identical(new_seq(as_hms(c(1L, 0L, NA))), as_hms(c(0L, 1L)))
  expect_identical(new_seq(as_hms(c(1L, 1L, NA))), as_hms(1L))
  expect_identical(new_seq(as_hms(c(0L, 0L, NA))), as_hms(0L))
  expect_identical(new_seq(as_hms(c(0L, 0L, 1L, NA))), as_hms(c(0L, 1L)))
  expect_identical(new_seq(as_hms(c(1L, 1L, 0L, NA))), as_hms(c(0L, 1L)))
  expect_identical(new_seq(as_hms(c(10L, 1L, NA))), as_hms(1:10))
  expect_identical(
    new_seq(as_hms(c(100L, 1L, NA))),
    as_hms(c(1L, 4L, 8L, 11L, 15L, 18L, 21L, 25L, 28L, 32L, 35L, 39L, 42L,
             45L, 49L, 52L, 56L, 59L, 62L, 66L, 69L, 73L, 76L, 80L, 83L, 86L,
             90L, 93L, 97L, 100L))
  )
  # length_out not count
  expect_error(new_seq(as_hms(1L), length_out = -1), "`length_out` must be a count")
  expect_error(new_seq(as_hms(1L), length_out = 0.5), "`length_out` must be a count")
  # length_out is 0
  expect_identical(
    new_seq(as_hms(integer()), length_out = 0),
    as_hms(integer())
  )
  expect_identical(
    new_seq(as_hms(NA_integer_), length_out = 0),
    as_hms(integer())
  )
  expect_identical(
    new_seq(as_hms(1L), length_out = 0),
    as_hms(integer())
  )
  # length_out = 1
  expect_identical(new_seq(as_hms(c(0L, 1L)), length_out = 1), as_hms(0L))
  expect_identical(new_seq(as_hms(c(1L, 0L)), length_out = 1), as_hms(0L))
  expect_identical(new_seq(as_hms(c(1L, 1L)), length_out = 1), as_hms(1L))
  expect_identical(new_seq(as_hms(c(0L, 0L)), length_out = 1), as_hms(0L))
  expect_identical(new_seq(as_hms(c(0L, 0L, 1L)), length_out = 1), as_hms(0L))
  expect_identical(new_seq(as_hms(c(1L, 1L, 0L)), length_out = 1), as_hms(1L))
  expect_identical(new_seq(as_hms(c(10L, 1L)), length_out = 1), as_hms(6L))
  expect_identical(new_seq(as_hms(c(100L, 1L)), length_out = 1), as_hms(50L))
  # length_out = 2
  expect_identical(new_seq(as_hms(c(0L, 1L)), length_out = 2), as_hms(c(0L, 1L)))
  expect_identical(new_seq(as_hms(c(1L, 0L)), length_out = 2), as_hms(c(0L, 1L)))
  expect_identical(new_seq(as_hms(c(1L, 1L)), length_out = 2), as_hms(1L))
  expect_identical(new_seq(as_hms(c(0L, 0L)), length_out = 2), as_hms(0L))
  expect_identical(new_seq(as_hms(c(0L, 0L, 1L)), length_out = 2), as_hms(c(0L, 1L)))
  expect_identical(new_seq(as_hms(c(1L, 1L, 0L)), length_out = 2), as_hms(c(0L, 1L)))
  expect_identical(new_seq(as_hms(c(10L, 1L)), length_out = 2), as_hms(c(1L, 10L)))
  expect_identical(new_seq(as_hms(c(100L, 1L)), length_out = 2), as_hms(c(1L, 100L)))
  # length_out = 3
  expect_identical(new_seq(as_hms(c(0L, 1L)), length_out = 3), as_hms(c(0L, 1L)))
  expect_identical(new_seq(as_hms(c(1L, 0L)), length_out = 3), as_hms(c(0L, 1L)))
  expect_identical(new_seq(as_hms(c(1L, 1L)), length_out = 3), as_hms(1L))
  expect_identical(new_seq(as_hms(c(0L, 0L)), length_out = 3), as_hms(0L))
  expect_identical(new_seq(as_hms(c(0L, 0L, 1L)), length_out = 3), as_hms(c(0L, 1L)))
  expect_identical(new_seq(as_hms(c(1L, 1L, 0L)), length_out = 3), as_hms(c(0L, 1L)))
  expect_identical(new_seq(as_hms(c(10L, 1L)), length_out = 3), as_hms(c(1L, 6L, 10L)))
  expect_identical(new_seq(as_hms(c(100L, 1L)), length_out = 3), as_hms(c(1L, 50L, 100L)))
  # length_out = Inf
  expect_identical(new_seq(as_hms(c(10L, 1L)), length_out = Inf), as_hms(1:10))
  expect_identical(
    new_seq(as_hms(c(100L, 1L)), length_out = Inf),
    as_hms(c(1:100))
  )
})
