test_that("new_seq logical", {
  # zero length
  expect_identical(new_seq(logical(0)), NA)
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
  expect_identical(new_seq(c("1", "1", "0")), c("0", "1"))
  expect_identical(new_seq(c("10", "1")), c("1","10"))
  expect_identical(new_seq(c("100", "1")), c("1", "100"))
  expect_identical(new_seq(as.character(1:100)), sort(as.character(1:100)))
  # multiple value with missing
  expect_identical(new_seq(c("0", "1", NA)), c("0", "1"))
  expect_identical(new_seq(c("1", "0", NA)), c("0", "1"))
  expect_identical(new_seq(c("1", "1", NA)), "1")
  expect_identical(new_seq(c("0", "0", NA)), "0")
  expect_identical(new_seq(c("0", "0", "1", NA)), c("0", "1"))
  expect_identical(new_seq(c("1", "1", "0", NA)), c("0", "1"))
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
  expect_identical(new_seq(c("1", "1", "0"), length_out = 1), "0")
  expect_identical(new_seq(c("1", "0", "1"), length_out = 1), "0")
  expect_identical(new_seq(c("10", "1"), length_out = 1), "1")
  expect_identical(new_seq(c("100", "1"), length_out = 1), "1")
  # length_out = 2
  expect_identical(new_seq(c("0", "1"), length_out = 2), c("0", "1"))
  expect_identical(new_seq(c("1", "0"), length_out = 2), c("0", "1"))
  expect_identical(new_seq(c("1", "1"), length_out = 2), "1")
  expect_identical(new_seq(c("0", "0"), length_out = 2), "0")
  expect_identical(new_seq(c("0", "0", "1"), length_out = 2), c("0", "1"))
  expect_identical(new_seq(c("1", "1", "0"), length_out = 2), c("0", "1"))
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
  expect_identical(new_seq(c("1", "1", "0"), length_out = 3), c("0", "1"))
  expect_identical(new_seq(c("10", "1"), length_out = 3), c("1", "10"))
  expect_identical(new_seq(c("100", "1"), length_out = 3), c("1", "100"))
  expect_identical(new_seq(c("100", "1", "2"), length_out = 3), c("1", "100", "2"))
  expect_identical(new_seq(c("100", "1", "2", "3"), length_out = 3), c("1", "100", "2"))
  expect_identical(new_seq(c("100", "1", "99", "3"), length_out = 3), c("1", "100", "3"))
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

test_that("new_seq length 1", {
  dlogical <- as.logical(0:9)
  dinteger <- 1:10
  dnumeric <- 1:10 + 0.1
  dcharacter <- as.character(1:10)
  dfactor <- factor(1:10)
  dordered <- ordered(1:10)
  ddate <- as.Date("2000-01-01") + 1:10
  dposix <- ISOdate(2000, 1, 1, 12, tz = "PST8PDT") + 1:10
  dhms <- as_hms(as_hms("10:00:00") + 1:10)

  expect_identical(new_seq(dlogical, 1), FALSE)
  expect_identical(new_seq(dinteger, 1), 1L) # should be intermediat value
  expect_identical(new_seq(dnumeric, 1), 1.1)
  expect_equal(new_seq(ddate, 1), ddate[1])
  expect_identical(new_seq(dposix, 1), dposix[1])
  expect_identical(new_seq(dhms, 1), dhms[1])
})

test_that("new_seq", {
  dlogical <- as.logical(0:9)
  dinteger <- 1:10
  dnumeric <- 1:10 + 0.1
  dcharacter <- as.character(1:10)
  dfactor <- factor(1:10)
  dordered <- ordered(1:10)
  ddate <- as.Date("2000-01-01") + 1:10
  dposix <- ISOdate(2000, 1, 1, 12, tz = "PST8PDT") + 1:10
  dhms <- as_hms(as_hms("10:00:00") + 1:10)

  expect_identical(new_seq(dlogical, 30), c(FALSE, TRUE))
  expect_identical(new_seq(dinteger, 10), 1:10)
  expect_identical(new_seq(dnumeric, 5), c(1.10, 3.35, 5.60, 7.85, 10.10))
  expect_equal(new_seq(ddate, 10), ddate)
  expect_identical(new_seq(dposix, 10), dposix)
  expect_identical(new_seq(dhms, 10), dhms)
})

test_that("new_seq with missing", {
  dlogical <- c(as.logical(0:9), NA)
  dinteger <- c(1:10, NA)
  dnumeric <- c(1:10 + 0.1, NA)
  dcharacter <- c(as.character(1:10), NA)
  dfactor <- factor(c(1:10, NA))
  dordered <- ordered(c(1:10, NA))
  ddate <- c(as.Date("2000-01-01") + 1:10, NA)
  dposix <- ISOdate(2000, 1, 1, 12, tz = "PST8PDT") + c(1:10, NA)
  dhms <- as_hms(as_hms("10:00:00") + c(1:10, NA))

  expect_identical(new_seq(dlogical, 30), c(FALSE, TRUE))
  expect_identical(new_seq(dinteger, 10), 1:10)
  expect_identical(new_seq(dnumeric, 5), c(1.10, 3.35, 5.60, 7.85, 10.10))
  expect_identical(new_seq(rev(dfactor), 100), dfactor[!is.na(dfactor)])
  expect_equal(new_seq(ddate, 11), ddate[!is.na(ddate)])
  expect_equal(new_seq(dposix, 11), dposix[!is.na(dposix)])
  expect_identical(new_seq(dhms, 10), dhms[!is.na(dhms)])
})

test_that("new_seq one value", {
  dlogical <- TRUE
  dinteger <- 1L
  dnumeric <- 1
  dcharacter <- as.character(1)
  dfactor <- factor(1)
  dordered <- ordered(1)
  ddate <- as.Date("2000-01-01")
  dposix <- ISOdate(2000, 1, 1, 12, tz = "PST8PDT")
  dhms <- as_hms("10:00:00")

  expect_identical(new_seq(dlogical, 30), dlogical)
  expect_identical(new_seq(dinteger, 10), dinteger)
  expect_identical(new_seq(dnumeric, 5), dnumeric)
  expect_identical(new_seq(dcharacter, 1), dcharacter)
  expect_identical(new_seq(dfactor, 1), dfactor)
  expect_identical(new_seq(rev(dfactor), 100), dfactor)
  expect_equal(new_seq(ddate, 10), ddate)
  expect_identical(new_seq(dposix, 10), dposix)
  expect_identical(new_seq(dhms, 10), dhms)
})

test_that("new_seq all missing", {
  dlogical <- as.logical(NA)
  dinteger <- as.integer(NA)
  dnumeric <- as.numeric(NA)
  dcharacter <- as.character(NA)
  dfactor <- factor(NA, levels = "1")
  dordered <- ordered(NA, levels = "1")
  ddate <- as.Date(NA)
  dposix <- as.POSIXct(NA, tz = "PST8PDT")
  dhms <- as_hms(NA)

  expect_identical(new_seq(dlogical, 10), dlogical)
  expect_identical(new_seq(dinteger), dinteger)
  expect_equal(new_seq(dnumeric), dnumeric)
  expect_identical(new_seq(dcharacter), dcharacter)
  expect_equal(new_seq(ddate), ddate)
  expect_equal(new_seq(dposix), dposix)
  expect_equal(new_seq(dhms), dhms)
})
