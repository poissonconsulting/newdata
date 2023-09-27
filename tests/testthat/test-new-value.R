test_that("new_value default", {
  # zero length
  expect_identical(new_value(complex()), NA_complex_)
  # missing value
  expect_identical(new_value(NA_complex_), NA_complex_)
  # single value
  expect_identical(new_value(complex(real = 1)), complex(real = 1))
  expect_identical(new_value(complex(real = 1.1)), complex(real = 1.1))
  # multiple values
  expect_identical(new_value(complex(real = c(1, 2))), complex(real = 1.5))
  # multiple values with missing
  expect_identical(new_value(complex(real = c(1, 2, NA))), complex(real = 1.5))
  # matrices and arrays
  expect_identical(new_value(matrix(complex(real = 1))), complex(real = 1))
  expect_identical(new_value(array(complex(real = 1))), complex(real = 1))
})

test_that("new_value logical", {
  # zero length
  expect_identical(new_value(logical()), FALSE)
  # missing value
  expect_identical(new_value(NA), FALSE)
  # single value
  expect_identical(new_value(FALSE), FALSE)
  expect_identical(new_value(TRUE), FALSE)
  # multiple values
  expect_identical(new_value(c(TRUE, FALSE)), FALSE)
  expect_identical(new_value(c(FALSE, TRUE)), FALSE)
  expect_identical(new_value(c(TRUE, TRUE)), FALSE)
  expect_identical(new_value(c(TRUE, TRUE, FALSE)), FALSE)
  # multiple values with missing
  expect_identical(new_value(c(TRUE, FALSE, NA)), FALSE)
  expect_identical(new_value(c(FALSE, TRUE, NA)), FALSE)
  expect_identical(new_value(c(TRUE, TRUE, NA)), FALSE)
  expect_identical(new_value(c(TRUE, TRUE, FALSE, NA)), FALSE)
  # matrices and arrays
  expect_identical(new_value(matrix(TRUE)), FALSE)
  expect_identical(new_value(array(TRUE)), FALSE)
})

test_that("new_value integer", {
  # zero length
  expect_identical(new_value(integer()), NA_integer_)
  # missing value
  expect_identical(new_value(NA_integer_), NA_integer_)
  # single value
  expect_identical(new_value(1L), 1L)
  expect_identical(new_value(10L), 10L)
  expect_identical(new_value(-1L), -1L)
  expect_identical(new_value(0L), 0L)
  # multiple values
  expect_identical(new_value(0:1), 0L)
  expect_identical(new_value(1:2), 2L)
  expect_identical(new_value(c(1L, 3L)), 2L)
  # multiple values with missing
  expect_identical(new_value(c(0:1, NA)), 0L)
  expect_identical(new_value(c(1:2, NA)), 2L)
  expect_identical(new_value(c(1L, 3L, NA)), 2L)
  # matrices and arrays
  expect_identical(new_value(matrix(1L)), 1L)
  expect_identical(new_value(array(1L)), 1L)
})

test_that("new_value real", {
  # zero length
  expect_identical(new_value(double()), NA_real_)
  # missing value
  expect_identical(new_value(NA_real_), NA_real_)
  # single value
  expect_identical(new_value(1), 1)
  expect_identical(new_value(1.1), 1.1)
  expect_identical(new_value(10), 10)
  expect_identical(new_value(-1), -1)
  expect_identical(new_value(0), 0)
  # multiple values
  expect_identical(new_value(c(0, 1)), 0.5)
  expect_identical(new_value(c(1, 2)), 1.5)
  expect_identical(new_value(c(1, 3)), 2)
  # multiple values with missing
  expect_identical(new_value(c(0, 1, NA)), 0.5)
  expect_identical(new_value(c(1, 2, NA)), 1.5)
  expect_identical(new_value(c(1, 3, NA)), 2)
  # matrices and arrays
  expect_identical(new_value(matrix(1)), 1)
  expect_identical(new_value(array(1)), 1)
})

# FIXME should make independent of locale!!
test_that("new_value character", {
  # zero length
  expect_identical(new_value(character()), NA_character_)
  # missing value
  expect_identical(new_value(NA_character_), NA_character_)
  # single value
  expect_identical(new_value("b"), "b")
  # multiple values
  expect_identical(new_value(c("a", "b")), "a")
  expect_identical(new_value(c("b", "a")), "a")
  expect_identical(new_value(c("b", "b", "a")), "b")
  # multiple values with missing
  expect_identical(new_value(c("a", "b", NA)), "a")
  expect_identical(new_value(c("b", "a", NA)), "a")
  expect_identical(new_value(c("b", "b", "a", NA)), "b")
  # matrices and arrays
  expect_identical(new_value(matrix("a")), "a")
  expect_identical(new_value(array("a")), "a")
})

test_that("new_value factor", {
  # zero length
  expect_identical(new_value(factor()), factor(NA))
  # missing value
  expect_identical(new_value(factor(NA)), factor(NA))
  # single value
  expect_identical(new_value(factor("b", levels = "b")),
                   factor("b", levels = "b"))
  expect_identical(new_value(factor("b", levels = c("a", "b"))),
                   factor("a", levels = c("a", "b")))
  expect_identical(new_value(factor("b", levels = c("b", "a"))),
                   factor("b", levels = c("b", "a")))
  expect_identical(new_value(factor("a", levels = c("b", "a"))),
                   factor("b", levels = c("b", "a")))
  # multiple values
  expect_identical(new_value(factor(c("a", "b"))),
                   factor("a", levels = c("a", "b")))
  expect_identical(new_value(factor(c("a", "b"), levels = c("b", "a"))),
                   factor("b", levels = c("b", "a")))
  expect_identical(new_value(factor(c("b", "a"), levels = c("b", "a"))),
                   factor("b", levels = c("b", "a")))
  expect_identical(new_value(factor(c("c", "b", "a"), levels = c("b", "c", "a"))),
                   factor("b", levels = c("b", "c", "a")))
  expect_identical(new_value(factor(c("a", "b", "a"), levels = c("b", "a"))),
                   factor("b", levels = c("b", "a")))
  expect_identical(new_value(factor(c("a", "b", "a"), levels = c("b", "a"))),
                   factor("b", levels = c("b", "a")))
  # multiple values missing
  expect_identical(new_value(factor(c("a", "b", NA))),
                   factor("a", levels = c("a", "b")))
  expect_identical(new_value(factor(c("a", "b", NA), levels = c("b", "a"))),
                   factor("b", levels = c("b", "a")))
  expect_identical(new_value(factor(c("b", "a", NA), levels = c("b", "a"))),
                   factor("b", levels = c("b", "a")))
  expect_identical(new_value(factor(c("c", "b", "a", NA), levels = c("b", "c", "a"))),
                   factor("b", levels = c("b", "c", "a")))
  expect_identical(new_value(factor(c("a", "b", "a", NA), levels = c("b", "a"))),
                   factor("b", levels = c("b", "a")))
  expect_identical(new_value(factor(c("a", "b", "a", NA), levels = c("b", "a"))),
                   factor("b", levels = c("b", "a")))
})

test_that("new_value ordered", {
  # zero length
  expect_identical(new_value(ordered()), ordered(NA))
  # missing value
  expect_identical(new_value(ordered(NA)), ordered(NA))
  "single value"
  expect_identical(new_value(ordered("b", levels = "b")),
                   ordered("b", levels = "b"))
  expect_identical(new_value(ordered("b", levels = c("a", "b"))),
                   ordered("a", levels = c("a", "b")))
  expect_identical(new_value(ordered("b", levels = c("b", "a"))),
                   ordered("b", levels = c("b", "a")))
  expect_identical(new_value(ordered("a", levels = c("b", "a"))),
                   ordered("b", levels = c("b", "a")))
  # multiple values
  expect_identical(new_value(ordered(c("a", "b"))),
                   ordered("a", levels = c("a", "b")))
  expect_identical(new_value(ordered(c("a", "b"), levels = c("b", "a"))),
                   ordered("b", levels = c("b", "a")))
  expect_identical(new_value(ordered(c("b", "a"), levels = c("b", "a"))),
                   ordered("b", levels = c("b", "a")))
  expect_identical(new_value(ordered(c("c", "b", "a"), levels = c("b", "c", "a"))),
                   ordered("b", levels = c("b", "c", "a")))
  expect_identical(new_value(ordered(c("a", "b", "a"), levels = c("b", "a"))),
                   ordered("b", levels = c("b", "a")))
  expect_identical(new_value(ordered(c("a", "b", "a"), levels = c("b", "a"))),
                   ordered("b", levels = c("b", "a")))
  # multiple values missing
  expect_identical(new_value(ordered(c("a", "b", NA))),
                   ordered("a", levels = c("a", "b")))
  expect_identical(new_value(ordered(c("a", "b", NA), levels = c("b", "a"))),
                   ordered("b", levels = c("b", "a")))
  expect_identical(new_value(ordered(c("b", "a", NA), levels = c("b", "a"))),
                   ordered("b", levels = c("b", "a")))
  expect_identical(new_value(ordered(c("c", "b", "a", NA), levels = c("b", "c", "a"))),
                   ordered("b", levels = c("b", "c", "a")))
  expect_identical(new_value(ordered(c("a", "b", "a", NA), levels = c("b", "a"))),
                   ordered("b", levels = c("b", "a")))
  expect_identical(new_value(ordered(c("a", "b", "a", NA), levels = c("b", "a"))),
                   ordered("b", levels = c("b", "a")))
})

test_that("new_value Date", {
  # zero length
  expect_identical(new_value(as.Date(character())), as.Date(NA_integer_))
  expect_identical(new_value(as.Date(integer())), as.Date(NA_integer_))
  expect_identical(new_value(as.Date(double())), as.Date(NA_integer_))
  # missing value
  expect_identical(new_value(as.Date(NA_character_)), as.Date(NA_integer_))
  expect_identical(new_value(as.Date(NA_real_)), as.Date(NA_integer_))
  expect_identical(new_value(as.Date(NA_integer_)), as.Date(NA_integer_))
  # single value
  expect_identical(new_value(as.Date(1L)), as.Date(1L))
  expect_identical(new_value(as.Date(1)), as.Date(1L))
  expect_identical(new_value(as.Date(1.1)), as.Date(1L))
  expect_identical(new_value(as.Date(1.6)), as.Date(2L))
  expect_identical(new_value(as.Date(10)), as.Date(10L                                                                                               ))
  # multiple values
  expect_identical(new_value(as.Date(c(0, 1))), as.Date(0L))
  expect_identical(new_value(as.Date(c(1, 2))), as.Date(2L))
  expect_identical(new_value(as.Date(c(1, 3))), as.Date(2L))
  # multiple values with missing
  expect_identical(new_value(as.Date(c(0, 1, NA))), as.Date(0L))
  expect_identical(new_value(as.Date(c(1, 2, NA))), as.Date(2L))
  expect_identical(new_value(as.Date(c(1, 3, NA))), as.Date(2L))
})

test_that("new_value POSIXct", {
  # zero length
  expect_identical(new_value(as.POSIXct(character())), as.POSIXct(NA_integer_))
  expect_identical(new_value(as.POSIXct(character(), tz = "UTC")), as.POSIXct(NA_integer_, tz = "UTC"))
  expect_identical(new_value(as.POSIXct(character(), tz = "PST8PDT")), as.POSIXct(NA_integer_, tz = "PST8PDT"))
  # missing value
  expect_identical(new_value(as.POSIXct(NA_character_)), as.POSIXct(NA_integer_))
  expect_identical(new_value(as.POSIXct(NA_character_, tz = "UTC")), as.POSIXct(NA_integer_, tz = "UTC"))
  expect_identical(new_value(as.POSIXct(NA_character_, tz = "PST8PDT")), as.POSIXct(NA_integer_, tz = "PST8PDT"))
  # single value
  expect_identical(new_value(as.POSIXct(1L)), as.POSIXct(1L))
  expect_identical(new_value(as.POSIXct(1L, tz = "UTC")), as.POSIXct(1L, tz = "UTC"))
  expect_identical(new_value(as.POSIXct(1L, tz = "PST8PDT")), as.POSIXct(1L, tz = "PST8PDT"))
  expect_identical(new_value(as.POSIXct(1)), as.POSIXct(1L))
  expect_identical(new_value(as.POSIXct(1.1)), as.POSIXct(1L))
  expect_identical(new_value(as.POSIXct(1.6)), as.POSIXct(2L))
  expect_identical(new_value(as.POSIXct(10)), as.POSIXct(10L))
  # multiple values
  expect_identical(new_value(as.POSIXct(c(0, 1))), as.POSIXct(1L))
  expect_identical(new_value(as.POSIXct(c(1, 2))), as.POSIXct(2L))
  expect_identical(new_value(as.POSIXct(c(1, 3))), as.POSIXct(2L))
  expect_identical(new_value(as.POSIXct(c(1, 4))), as.POSIXct(3L))
  expect_identical(new_value(as.POSIXct(c(1, 4), tz = "PST8PDT")), as.POSIXct(3L, tz = "PST8PDT"))
  # multiple values with missing
  expect_identical(new_value(as.POSIXct(c(0, 1, NA))), as.POSIXct(1L))
  expect_identical(new_value(as.POSIXct(c(1, 2, NA))), as.POSIXct(2L))
  expect_identical(new_value(as.POSIXct(c(1, 3, NA))), as.POSIXct(2L))
  expect_identical(new_value(as.POSIXct(c(1, 4, NA), tz = "PST8PDT")), as.POSIXct(3L, tz = "PST8PDT"))
})

test_that("new_value hms", {
  # zero length
  expect_identical(new_value(as_hms(character())), as_hms(NA_character_))
  # missing value
  expect_identical(new_value(as_hms(NA_character_)), as_hms(NA_character_))
  # single value
  expect_identical(new_value(as_hms(1L)), as_hms(1L))
  expect_identical(new_value(as_hms(1)), as_hms(1))
  expect_identical(new_value(as_hms(1.1)), as_hms(1))
  expect_identical(new_value(as_hms(1.6)), as_hms(2))
  expect_identical(new_value(as_hms(10)), as_hms(10))
  # multiple values
  expect_identical(new_value(as_hms(c(0, 1))), as_hms(0))
  expect_identical(new_value(as_hms(c(1, 2))), as_hms(2))
  expect_identical(new_value(as_hms(c(1, 3))), as_hms(2))
  expect_identical(new_value(as_hms(c("23:59:59", "00:00:02"))), as_hms("12:00:00"))
  # multiple values with missing
  expect_identical(new_value(as_hms(c(0, 1, NA))), as_hms(0))
  expect_identical(new_value(as_hms(c(1, 2, NA))), as_hms(2))
  expect_identical(new_value(as_hms(c(1, 3, NA))), as_hms(2))
})
