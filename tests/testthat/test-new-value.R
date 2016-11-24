context("new-value")

test_that("new_value", {

  dlogical <-  as.logical(0:9)
  dinteger <-  1:10
  dnumeric <-  1:10 + 0.1
  dcharacter <-  as.character(1:10)
  dfactor <- factor(1:10)
  ddate <- as.Date("2000-01-01") + 1:10
  dposix <- ISOdate(2000, 1, 1, 12, tz = "PST8PDT") + 1:10

  expect_identical(new_value(dlogical), FALSE)
  expect_identical(new_value(c(TRUE, FALSE)), FALSE)
  expect_identical(new_value(dinteger), 6L)
  expect_identical(new_value(dnumeric), 5.6)
  expect_identical(new_value(dcharacter), "1")
  expect_identical(new_value(rev(dcharacter)), "1")
  expect_identical(new_value(dfactor), dfactor[1])
  expect_identical(new_value(rev(dfactor)), dfactor[1])
  expect_identical(new_value(ddate), as.Date("2000-01-06"))
  expect_identical(new_value(dposix), ISOdate(2000, 1, 1, 12, 0, 6, tz = "PST8PDT"))
})

test_that("new_value with missing", {

  dlogical <-  c(as.logical(0:9), NA)
  dinteger <-  c(1:10, NA)
  dnumeric <-  c(1:10 + 0.1, NA)
  dcharacter <-  c(as.character(1:10), NA)
  dfactor <- factor(c(1:10, NA))
  ddate <- c(as.Date("2000-01-01") + 1:10, NA)
  dposix <- ISOdate(2000, 1, 1, 12, tz = "PST8PDT") + c(1:10, NA)

  expect_identical(new_value(dlogical), FALSE)
  expect_identical(new_value(c(TRUE, FALSE)), FALSE)
  expect_identical(new_value(dinteger), 6L)
  expect_identical(new_value(dnumeric), 5.6)
  expect_identical(new_value(dcharacter), "1")
  expect_identical(new_value(rev(dcharacter)), "1")
  expect_identical(new_value(dfactor), dfactor[1])
  expect_identical(new_value(rev(dfactor)), dfactor[1])
  expect_identical(new_value(ddate), as.Date("2000-01-06"))
  expect_identical(new_value(dposix), ISOdate(2000, 1, 1, 12, 0, 6, tz = "PST8PDT"))
})

test_that("new_value all missing", {

  dlogical <-  as.logical(NA)
  dinteger <-  as.integer(NA)
  dnumeric <-  as.numeric(NA)
  dcharacter <-  as.character(NA)
  dfactor <- factor(NA)
  ddate <- as.Date(NA)
  dposix <- as.POSIXct(NA, tz = "PST8PDT")

  expect_identical(new_value(dlogical), FALSE)
  expect_identical(new_value(dinteger), dinteger)
  expect_equal(new_value(dnumeric), dnumeric)
  expect_identical(new_value(dcharacter), dcharacter)
  expect_identical(new_value(dfactor), dfactor)
  expect_equal(new_value(ddate), ddate)
  expect_equal(new_value(dposix), dposix)
})

