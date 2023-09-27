test_that("new_seq default", {
  # zero length
  expect_identical(new_seq(complex()), NA_complex_)
  # missing value
  expect_identical(new_seq(NA_complex_), NA_complex_)
  # single value
  # multiple value
  # multiple value with missing
  # length_out not count
  # length_out is 0
  expect_identical(new_seq(complex(real = 1), length_out = 0), complex())
  # length_out = 1
  # length_out = 2
  # length_out = 3
})

test_that("new_seq logical", {
  # zero length
  expect_identical(new_seq(logical()), NA)
  # missing value
  expect_identical(new_seq(NA), NA)
  # single value
  expect_identical(new_seq(TRUE), TRUE)
  expect_identical(new_seq(FALSE), FALSE)
  # multiple value
  expect_identical(new_seq(c(FALSE, TRUE)), c(FALSE, TRUE))
  expect_identical(new_seq(c(TRUE, FALSE)), c(FALSE, TRUE))
  expect_identical(new_seq(c(TRUE, TRUE)), TRUE)
  expect_identical(new_seq(c(FALSE, FALSE)), FALSE)
  expect_identical(new_seq(c(FALSE, FALSE, TRUE)), c(FALSE, TRUE))
  expect_identical(new_seq(c(TRUE, TRUE, FALSE)), c(FALSE, TRUE))
  # multiple value with missing
  expect_identical(new_seq(c(FALSE, TRUE, NA)), c(FALSE, TRUE))
  expect_identical(new_seq(c(TRUE, FALSE, NA)), c(FALSE, TRUE))
  expect_identical(new_seq(c(TRUE, TRUE, NA)), TRUE)
  expect_identical(new_seq(c(FALSE, FALSE, NA)), FALSE)
  expect_identical(new_seq(c(FALSE, FALSE, TRUE, NA)), c(FALSE, TRUE))
  expect_identical(new_seq(c(TRUE, TRUE, FALSE, NA)), c(FALSE, TRUE))
  # length_out not count
  expect_error(new_seq(TRUE, length_out = -1), "`length_out` must be a count")
  expect_error(new_seq(TRUE, length_out = 0.5), "`length_out` must be a count")
  # length_out is 0
  expect_identical(new_seq(logical(), length_out = 0), logical())
  expect_identical(new_seq(NA, length_out = 0), logical())
  expect_identical(new_seq(TRUE, length_out = 0), logical())
  # length_out = 1
  expect_identical(new_seq(c(FALSE, TRUE), length_out = 1), FALSE)
  expect_identical(new_seq(c(TRUE, FALSE), length_out = 1), FALSE)
  expect_identical(new_seq(c(TRUE, TRUE), length_out = 1), TRUE)
  expect_identical(new_seq(c(FALSE, FALSE), length_out = 1), FALSE)
  expect_identical(new_seq(c(FALSE, FALSE, TRUE), length_out = 1), FALSE)
  expect_identical(new_seq(c(TRUE, TRUE, FALSE), length_out = 1), FALSE)
  # length_out = 2
  expect_identical(new_seq(c(FALSE, TRUE), length_out = 2), c(FALSE, TRUE))
  expect_identical(new_seq(c(TRUE, FALSE), length_out = 2), c(FALSE, TRUE))
  expect_identical(new_seq(c(TRUE, TRUE), length_out = 2), TRUE)
  expect_identical(new_seq(c(FALSE, FALSE), length_out = 2), FALSE)
  expect_identical(new_seq(c(FALSE, FALSE, TRUE), length_out = 2), c(FALSE, TRUE))
  expect_identical(new_seq(c(TRUE, TRUE, FALSE), length_out = 2), c(FALSE, TRUE))
  # length_out = 3
  expect_identical(new_seq(c(FALSE, TRUE), length_out = 3), c(FALSE, TRUE))
  expect_identical(new_seq(c(TRUE, FALSE), length_out = 3), c(FALSE, TRUE))
  expect_identical(new_seq(c(TRUE, TRUE), length_out = 3), TRUE)
  expect_identical(new_seq(c(FALSE, FALSE), length_out = 3), FALSE)
  expect_identical(new_seq(c(FALSE, FALSE, TRUE), length_out = 3), c(FALSE, TRUE))
  expect_identical(new_seq(c(TRUE, TRUE, FALSE), length_out = 3), c(FALSE, TRUE))
  # matrices and arrays
  expect_identical(new_seq(matrix(TRUE)), TRUE)
  expect_identical(new_seq(array(TRUE)), TRUE)
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
  expect_identical(new_seq(c(100L, 1L)),
                   c(1L, 4L, 8L, 11L, 15L, 18L, 21L, 25L, 28L, 32L,
                     35L, 39L, 42L,
                     45L, 49L, 52L, 56L, 59L, 62L, 66L, 69L, 73L,
                     76L, 80L, 83L, 86L,
                     90L, 93L, 97L, 100L))
  # multiple value with missing
  expect_identical(new_seq(c(0L, 1L, NA)), c(0L, 1L))
  expect_identical(new_seq(c(1L, 0L, NA)), c(0L, 1L))
  expect_identical(new_seq(c(1L, 1L, NA)), 1L)
  expect_identical(new_seq(c(0L, 0L, NA)), 0L)
  expect_identical(new_seq(c(0L, 0L, 1L, NA)), c(0L, 1L))
  expect_identical(new_seq(c(1L, 1L, 0L, NA)), c(0L, 1L))
  expect_identical(new_seq(c(10L, 1L, NA)), 1:10)
  expect_identical(new_seq(c(100L, 1L, NA)),
                   c(1L, 4L, 8L, 11L, 15L, 18L, 21L, 25L, 28L, 32L,
                     35L, 39L, 42L,
                     45L, 49L, 52L, 56L, 59L, 62L, 66L, 69L, 73L,
                     76L, 80L, 83L, 86L,
                     90L, 93L, 97L, 100L))
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
  expect_identical(new_seq(c(1L, 1L, 0L), length_out = 1), 0L)
  expect_identical(new_seq(c(10L, 1L), length_out = 1), 1L)
  expect_identical(new_seq(c(100L, 1L), length_out = 1), 1L)
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
  x0to1 <- seq(0,1,length.out = 30)
  expect_identical(new_seq(c(0, 1)), x0to1)
  expect_identical(new_seq(c(1, 0)), x0to1)
  expect_identical(new_seq(c(1, 1)), 1)
  expect_identical(new_seq(c(0, 0)), 0)
  expect_identical(new_seq(c(0, 0, 1)), x0to1)
  expect_identical(new_seq(c(1, 1, 0)), x0to1)
  expect_equal(new_seq(c(10, 0)), x0to1 * 10)
  expect_equal(new_seq(c(100, 0)), x0to1 * 100)
  # multiple value with missing
  x0to1 <- seq(0,1,length.out = 30)
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
  expect_identical(new_seq(c(0, 1), length_out = 1), 0)
  expect_identical(new_seq(c(1, 0), length_out = 1), 0)
  expect_identical(new_seq(c(1, 1), length_out = 1), 1)
  expect_identical(new_seq(c(0, 0), length_out = 1), 0)
  expect_identical(new_seq(c(0, 0, 1), length_out = 1), 0)
  expect_identical(new_seq(c(1, 1, 0), length_out = 1), 0)
  expect_identical(new_seq(c(10, 1), length_out = 1), 1)
  expect_identical(new_seq(c(100, 1), length_out = 1), 1)
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
  expect_identical(new_seq(c("10", "1")), c("1","10"))
  expect_identical(new_seq(c("100", "1")), c("1", "100"))
  expect_identical(new_seq(as.character(1:100)),
                   c("1", "10", "100", "11", "12", "13", "14", "15", "16", "17"))
  expect_identical(new_seq(as.character(c("c", "c", "a", "b", "b"))),
                   c("b", "c", "a"))
  # multiple value with missing
  expect_identical(new_seq(c("0", "1", NA)), c("0", "1"))
  expect_identical(new_seq(c("1", "0", NA)), c("0", "1"))
  expect_identical(new_seq(c("1", "1", NA)), "1")
  expect_identical(new_seq(c("0", "0", NA)), "0")
  expect_identical(new_seq(c("0", "0", "1", NA)), c("0", "1"))
  expect_identical(new_seq(c("1", "1", "0", NA)), c("1", "0"))
  expect_identical(new_seq(c("10", "1", NA)), c("1","10"))
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
  expect_identical(new_seq(as.character(1:100), length_out = Inf),
                   sort(as.character(1:100)))
  # matrices and arrays
  expect_identical(new_seq(matrix("a")), "a")
  expect_identical(new_seq(array("a")), "a")
})

test_that("new_seq factor", {
  # zero length
  expect_identical(new_seq(factor()), factor(NA))
  # missing value
  expect_identical(new_seq(factor(NA)), factor(NA))
  # single value
  expect_identical(new_seq(factor("1")), factor("1"))
  expect_identical(new_seq(factor("0")), factor("0"))
  expect_identical(new_seq(factor("1", levels = c("1", "0"))),
                   factor(c("1", "0"), levels = c("1", "0")))
  # multiple value
  expect_identical(new_seq(factor(c("0", "1"), levels = c("0", "1"))),
                   factor(c("0", "1"), levels = c("0", "1")))
  expect_identical(new_seq(factor(c("1", "0"), levels = c("1", "0"))),
                   factor(c("1", "0"), levels = c("1", "0")))
  expect_identical(new_seq(factor(c("0", "1"), levels = c("1", "0"))),
                   factor(c("1", "0"), levels = c("1", "0")))
  expect_identical(new_seq(factor(c("1", "0"), levels = c("1", "0"))),
                   factor(c("1", "0"), levels = c("1", "0")))
  expect_identical(new_seq(factor(c("1", "1"), levels = "1")),
                   factor("1", levels = "1"))
  expect_identical(new_seq(factor(c("0", "0", "1"), levels = c("0", "1"))),
                   factor(c("0", "1"), levels = c("0", "1")))
  expect_identical(new_seq(factor(c("0", "0", "1"), levels = c("1", "0"))),
                   factor(c("1", "0"), levels = c("1", "0")))
  expect_identical(new_seq(factor(as.character(1:100))), sort(factor(as.character(1:100))))
  # multiple value with missing
  expect_identical(new_seq(factor(c("0", "1", NA), levels = c("0", "1"))),
                   factor(c("0", "1"), levels = c("0", "1")))
  expect_identical(new_seq(factor(c("1", "0", NA), levels = c("1", "0"))),
                   factor(c("1", "0"), levels = c("1", "0")))
  expect_identical(new_seq(factor(c("0", "1", NA), levels = c("1", "0"))),
                   factor(c("1", "0"), levels = c("1", "0")))
  expect_identical(new_seq(factor(c("1", "0", NA), levels = c("1", "0"))),
                   factor(c("1", "0"), levels = c("1", "0")))
  expect_identical(new_seq(factor(c("1", "1", NA), levels = "1")),
                   factor("1", levels = "1"))
  expect_identical(new_seq(factor(c("0", "0", "1", NA), levels = c("0", "1"))),
                   factor(c("0", "1"), levels = c("0", "1")))
  expect_identical(new_seq(factor(c("0", "0", "1", NA), levels = c("1", "0"))),
                   factor(c("1", "0"), levels = c("1", "0")))
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
  expect_identical(new_seq(factor(c("0", "1"), levels = c("0", "1")), length_out = 1),
                   factor("0", levels = c("0", "1")))
  expect_identical(new_seq(factor(c("1", "0"), levels = c("0", "1")), length_out = 1),
                   factor("0", levels = c("0", "1")))
  expect_identical(new_seq(factor(c("0", "1"), levels = c("1", "0")), length_out = 1),
                   factor("1", levels = c("1", "0")))
  expect_identical(new_seq(factor(c("1", "0"), levels = c("1", "0")), length_out = 1),
                   factor("1", levels = c("1", "0")))
  expect_identical(new_seq(factor(c("0", "0", "1"), levels = c("0", "1")), length_out = 1),
                   factor("0", levels = c("0", "1")))
  expect_identical(new_seq(factor(c("1", "1", "0"), levels = c("0", "1")), length_out = 1),
                   factor("0", levels = c("0", "1")))
  expect_identical(new_seq(factor("0", levels = c("0", "1", "2")), length_out = 1),
                   factor("0", levels = c("0", "1", "2")))
  expect_identical(new_seq(factor(c("2", "1", "0"), levels = c("0", "1", "2")), length_out = 1),
                   factor("0", levels = c("0", "1", "2")))
  # length_out = 2
  expect_identical(new_seq(factor(c("0", "1"), levels = c("0", "1")), length_out = 2),
                   factor(c("0", "1"), levels = c("0", "1")))
  expect_identical(new_seq(factor(c("1", "0"), levels = c("0", "1")), length_out = 2),
                   factor(c("0", "1"), levels = c("0", "1")))
  expect_identical(new_seq(factor(c("0", "1"), levels = c("1", "0")), length_out = 2),
                   factor(c("1", "0"), levels = c("1", "0")))
  expect_identical(new_seq(factor(c("1", "0"), levels = c("1", "0")), length_out = 2),
                   factor(c("1", "0"), levels = c("1", "0")))
  expect_identical(new_seq(factor(c("0", "0", "1"), levels = c("0", "1")), length_out = 2),
                   factor(c("0", "1"), levels = c("0", "1")))
  expect_identical(new_seq(factor(c("1", "1", "0"), levels = c("0", "1")), length_out = 2),
                   factor(c("0", "1"), levels = c("0", "1")))
  expect_identical(new_seq(factor("0", levels = c("0", "1", "2")), length_out = 2),
                   factor(c("0", "1"), levels = c("0", "1", "2")))
  expect_identical(new_seq(factor(c("2", "1", "0"), levels = c("0", "1", "2")), length_out = 2),
                   factor(c("0", "1"), levels = c("0", "1", "2")))
  expect_identical(new_seq(factor(c("10", "1", "2"), levels = c("1", "10", "2")), length_out = 2),
                   factor(c("1", "10"), levels = c("1", "10", "2")))
  expect_identical(new_seq(factor(c("100", "1", "2"), levels = c("1", "10", "2")), length_out = 2),
                   factor(c("1", "10"), levels = c("1", "10", "2")))
  # length_out = 3
  expect_identical(new_seq(factor(c("0", "1"), levels = c("0", "1")), length_out = 3),
                   factor(c("0", "1"), levels = c("0", "1")))
  expect_identical(new_seq(factor(c("1", "0"), levels = c("0", "1")), length_out = 3),
                   factor(c("0", "1"), levels = c("0", "1")))
  expect_identical(new_seq(factor(c("0", "1"), levels = c("1", "0")), length_out = 3),
                   factor(c("1", "0"), levels = c("1", "0")))
  expect_identical(new_seq(factor(c("1", "0"), levels = c("1", "0")), length_out = 3),
                   factor(c("1", "0"), levels = c("1", "0")))
  expect_identical(new_seq(factor(c("0", "0", "1"), levels = c("0", "1")), length_out = 3),
                   factor(c("0", "1"), levels = c("0", "1")))
  expect_identical(new_seq(factor(c("1", "1", "0"), levels = c("0", "1")), length_out = 3),
                   factor(c("0", "1"), levels = c("0", "1")))
  expect_identical(new_seq(factor("0", levels = c("0", "1", "2")), length_out = 3),
                   factor(c("0", "1", "2"), levels = c("0", "1", "2")))
  expect_identical(new_seq(factor(c("2", "1", "0"), levels = c("0", "1", "2")), length_out = 3),
                   factor(c("0", "1", "2"), levels = c("0", "1", "2")))
  expect_identical(new_seq(factor(c("10", "1", "2"), levels = c("1", "10", "2")), length_out = 3),
                   factor(c("1", "10", "2"), levels = c("1", "10", "2")))
  expect_identical(new_seq(factor(c("100", "1", "2"), levels = c("1", "2", "100")), length_out = 3),
                   factor(c("1", "2", "100"), levels = c("1", "2", "100")))
})

test_that("new_seq ordered", {
  # zero length
  expect_identical(new_seq(ordered()), ordered(NA))
  # missing value
  expect_identical(new_seq(ordered(NA)), ordered(NA))
  # single value
  expect_identical(new_seq(ordered("1")), ordered("1"))
  expect_identical(new_seq(ordered("0")), ordered("0"))
  expect_identical(new_seq(ordered("1", levels = c("1", "0"))),
                   ordered(c("1", "0"), levels = c("1", "0")))
  # multiple value
  expect_identical(new_seq(ordered(c("0", "1"), levels = c("0", "1"))),
                   ordered(c("0", "1"), levels = c("0", "1")))
  expect_identical(new_seq(ordered(c("1", "0"), levels = c("1", "0"))),
                   ordered(c("1", "0"), levels = c("1", "0")))
  expect_identical(new_seq(ordered(c("0", "1"), levels = c("1", "0"))),
                   ordered(c("1", "0"), levels = c("1", "0")))
  expect_identical(new_seq(ordered(c("1", "0"), levels = c("1", "0"))),
                   ordered(c("1", "0"), levels = c("1", "0")))
  expect_identical(new_seq(ordered(c("1", "1"), levels = "1")),
                   ordered("1", levels = "1"))
  expect_identical(new_seq(ordered(c("0", "0", "1"), levels = c("0", "1"))),
                   ordered(c("0", "1"), levels = c("0", "1")))
  expect_identical(new_seq(ordered(c("0", "0", "1"), levels = c("1", "0"))),
                   ordered(c("1", "0"), levels = c("1", "0")))
  expect_identical(new_seq(ordered(as.character(1:100))), sort(ordered(as.character(1:100))))
  # multiple value with missing
  expect_identical(new_seq(ordered(c("0", "1", NA), levels = c("0", "1"))),
                   ordered(c("0", "1"), levels = c("0", "1")))
  expect_identical(new_seq(ordered(c("1", "0", NA), levels = c("1", "0"))),
                   ordered(c("1", "0"), levels = c("1", "0")))
  expect_identical(new_seq(ordered(c("0", "1", NA), levels = c("1", "0"))),
                   ordered(c("1", "0"), levels = c("1", "0")))
  expect_identical(new_seq(ordered(c("1", "0", NA), levels = c("1", "0"))),
                   ordered(c("1", "0"), levels = c("1", "0")))
  expect_identical(new_seq(ordered(c("1", "1", NA), levels = "1")),
                   ordered("1", levels = "1"))
  expect_identical(new_seq(ordered(c("0", "0", "1", NA), levels = c("0", "1"))),
                   ordered(c("0", "1"), levels = c("0", "1")))
  expect_identical(new_seq(ordered(c("0", "0", "1", NA), levels = c("1", "0"))),
                   ordered(c("1", "0"), levels = c("1", "0")))
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
  expect_identical(new_seq(ordered(c("0", "1"), levels = c("0", "1")), length_out = 1),
                   ordered("0", levels = c("0", "1")))
  expect_identical(new_seq(ordered(c("1", "0"), levels = c("0", "1")), length_out = 1),
                   ordered("0", levels = c("0", "1")))
  expect_identical(new_seq(ordered(c("0", "1"), levels = c("1", "0")), length_out = 1),
                   ordered("1", levels = c("1", "0")))
  expect_identical(new_seq(ordered(c("1", "0"), levels = c("1", "0")), length_out = 1),
                   ordered("1", levels = c("1", "0")))
  expect_identical(new_seq(ordered(c("0", "0", "1"), levels = c("0", "1")), length_out = 1),
                   ordered("0", levels = c("0", "1")))
  expect_identical(new_seq(ordered(c("1", "1", "0"), levels = c("0", "1")), length_out = 1),
                   ordered("0", levels = c("0", "1")))
  expect_identical(new_seq(ordered("0", levels = c("0", "1", "2")), length_out = 1),
                   ordered("0", levels = c("0", "1", "2")))
  expect_identical(new_seq(ordered(c("2", "1", "0"), levels = c("0", "1", "2")), length_out = 1),
                   ordered("0", levels = c("0", "1", "2")))
  # length_out = 2
  expect_identical(new_seq(ordered(c("0", "1"), levels = c("0", "1")), length_out = 2),
                   ordered(c("0", "1"), levels = c("0", "1")))
  expect_identical(new_seq(ordered(c("1", "0"), levels = c("0", "1")), length_out = 2),
                   ordered(c("0", "1"), levels = c("0", "1")))
  expect_identical(new_seq(ordered(c("0", "1"), levels = c("1", "0")), length_out = 2),
                   ordered(c("1", "0"), levels = c("1", "0")))
  expect_identical(new_seq(ordered(c("1", "0"), levels = c("1", "0")), length_out = 2),
                   ordered(c("1", "0"), levels = c("1", "0")))
  expect_identical(new_seq(ordered(c("0", "0", "1"), levels = c("0", "1")), length_out = 2),
                   ordered(c("0", "1"), levels = c("0", "1")))
  expect_identical(new_seq(ordered(c("1", "1", "0"), levels = c("0", "1")), length_out = 2),
                   ordered(c("0", "1"), levels = c("0", "1")))
  expect_identical(new_seq(ordered("0", levels = c("0", "1", "2")), length_out = 2),
                   ordered(c("0", "2"), levels = c("0", "1", "2")))
  expect_identical(new_seq(ordered(c("2", "1", "0"), levels = c("0", "1", "2")), length_out = 2),
                   ordered(c("0", "2"), levels = c("0", "1", "2")))
  expect_identical(new_seq(ordered(c("10", "1", "2"), levels = c("1", "10", "2")), length_out = 2),
                   ordered(c("1", "2"), levels = c("1", "10", "2")))
  expect_identical(new_seq(ordered(c("100", "1", "2"), levels = c("1", "10", "2")), length_out = 2),
                   ordered(c("1", "2"), levels = c("1", "10", "2")))
  # length_out = 3
  expect_identical(new_seq(ordered(c("0", "1"), levels = c("0", "1")), length_out = 3),
                   ordered(c("0", "1"), levels = c("0", "1")))
  expect_identical(new_seq(ordered(c("1", "0"), levels = c("0", "1")), length_out = 3),
                   ordered(c("0", "1"), levels = c("0", "1")))
  expect_identical(new_seq(ordered(c("0", "1"), levels = c("1", "0")), length_out = 3),
                   ordered(c("1", "0"), levels = c("1", "0")))
  expect_identical(new_seq(ordered(c("1", "0"), levels = c("1", "0")), length_out = 3),
                   ordered(c("1", "0"), levels = c("1", "0")))
  expect_identical(new_seq(ordered(c("0", "0", "1"), levels = c("0", "1")), length_out = 3),
                   ordered(c("0", "1"), levels = c("0", "1")))
  expect_identical(new_seq(ordered(c("1", "1", "0"), levels = c("0", "1")), length_out = 3),
                   ordered(c("0", "1"), levels = c("0", "1")))
  expect_identical(new_seq(ordered("0", levels = c("0", "1", "2")), length_out = 3),
                   ordered(c("0", "1", "2"), levels = c("0", "1", "2")))
  expect_identical(new_seq(ordered(c("2", "1", "0"), levels = c("0", "1", "2")), length_out = 3),
                   ordered(c("0", "1", "2"), levels = c("0", "1", "2")))
  expect_identical(new_seq(ordered(c("10", "1", "2"), levels = c("1", "10", "2")), length_out = 3),
                   ordered(c("1", "10", "2"), levels = c("1", "10", "2")))
  expect_identical(new_seq(ordered(c("100", "1", "2"), levels = c("1", "2", "100")), length_out = 3),
                   ordered(c("1", "2", "100"), levels = c("1", "2", "100")))
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
  expect_identical(new_seq(as.Date(c(100L, 1L))),
                   as.Date(c(1L, 4L, 7L, 11L, 14L, 18L, 21L, 24L, 28L, 31L, 35L, 38L, 41L,
                     45L, 48L, 52L, 55L, 59L, 62L, 65L, 69L, 72L, 76L, 79L, 82L, 86L,
                     89L, 93L, 96L, 100L)))
  # multiple value with missing
  expect_identical(new_seq(as.Date(c(0L, 1L, NA))), as.Date(c(0L, 1L)))
  expect_identical(new_seq(as.Date(c(1L, 0L, NA))), as.Date(c(0L, 1L)))
  expect_identical(new_seq(as.Date(c(1L, 1L, NA))), as.Date(1L))
  expect_identical(new_seq(as.Date(c(0L, 0L, NA))), as.Date(0L))
  expect_identical(new_seq(as.Date(c(0L, 0L, 1L, NA))), as.Date(c(0L, 1L)))
  expect_identical(new_seq(as.Date(c(1L, 1L, 0L, NA))), as.Date(c(0L, 1L)))
  expect_identical(new_seq(as.Date(c(10L, 1L, NA))), as.Date(1:10))
  expect_identical(new_seq(as.Date(c(100L, 1L, NA))),
                   as.Date(c(1L, 4L, 7L, 11L, 14L, 18L, 21L, 24L, 28L, 31L, 35L, 38L, 41L,
                             45L, 48L, 52L, 55L, 59L, 62L, 65L, 69L, 72L, 76L, 79L, 82L, 86L,
                             89L, 93L, 96L, 100L)))
  # # length_out not count
  expect_error(new_seq(as.Date(1L), length_out = -1), "`length_out` must be a count")
  expect_error(new_seq(as.Date(1L), length_out = 0.5), "`length_out` must be a count")
  # # length_out is 0
  expect_identical(new_seq(as.Date(integer()), length_out = 0),
                           as.Date(integer()))
  expect_identical(new_seq(as.Date(NA_integer_), length_out = 0),
                   as.Date(integer()))
  expect_identical(new_seq(as.Date(1L), length_out = 0),
                   as.Date(integer()))
  # # length_out = 1
  expect_identical(new_seq(as.Date(c(0L, 1L)), length_out = 1), as.Date(0L))
  expect_identical(new_seq(as.Date(c(1L, 0L)), length_out = 1), as.Date(0L))
  expect_identical(new_seq(as.Date(c(1L, 1L)), length_out = 1), as.Date(1L))
  expect_identical(new_seq(as.Date(c(0L, 0L)), length_out = 1), as.Date(0L))
  expect_identical(new_seq(as.Date(c(0L, 0L, 1L)), length_out = 1), as.Date(0L))
  expect_identical(new_seq(as.Date(c(1L, 1L, 0L)), length_out = 1), as.Date(0L))
  expect_identical(new_seq(as.Date(c(10L, 1L)), length_out = 1), as.Date(1L))
  expect_identical(new_seq(as.Date(c(100L, 1L)), length_out = 1), as.Date(1L))
  # # length_out = 2
  expect_identical(new_seq(as.Date(c(0L, 1L)), length_out = 2), as.Date(c(0L, 1L)))
  expect_identical(new_seq(as.Date(c(1L, 0L)), length_out = 2), as.Date(c(0L, 1L)))
  expect_identical(new_seq(as.Date(c(1L, 1L)), length_out = 2), as.Date(1L))
  expect_identical(new_seq(as.Date(c(0L, 0L)), length_out = 2), as.Date(0L))
  expect_identical(new_seq(as.Date(c(0L, 0L, 1L)), length_out = 2), as.Date(c(0L, 1L)))
  expect_identical(new_seq(as.Date(c(1L, 1L, 0L)), length_out = 2), as.Date(c(0L, 1L)))
  expect_identical(new_seq(as.Date(c(10L, 1L)), length_out = 2), as.Date(c(1L, 10L)))
  expect_identical(new_seq(as.Date(c(100L, 1L)), length_out = 2), as.Date(c(1L, 100L)))
  # # length_out = 3
  expect_identical(new_seq(as.Date(c(0L, 1L)), length_out = 3), as.Date(c(0L, 1L)))
  expect_identical(new_seq(as.Date(c(1L, 0L)), length_out = 3), as.Date(c(0L, 1L)))
  expect_identical(new_seq(as.Date(c(1L, 1L)), length_out = 3), as.Date(1L))
  expect_identical(new_seq(as.Date(c(0L, 0L)), length_out = 3), as.Date(0L))
  expect_identical(new_seq(as.Date(c(0L, 0L, 1L)), length_out = 3), as.Date(c(0L, 1L)))
  expect_identical(new_seq(as.Date(c(1L, 1L, 0L)), length_out = 3), as.Date(c(0L, 1L)))
  expect_identical(new_seq(as.Date(c(10L, 1L)), length_out = 3), as.Date(c(1L, 5L, 10L)))
  expect_identical(new_seq(as.Date(c(100L, 1L)), length_out = 3), as.Date(c(1L, 50L, 100L)))
})
