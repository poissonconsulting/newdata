context("new-seq")

test_that("new_seq", {

  dlogical <-  as.logical(0:9)
  dinteger <-  1:10
  dnumeric <-  1:10 + 0.1
  dcharacter <-  as.character(1:10)
  dfactor <- factor(1:10)
  ddate <- as.Date("2000-01-01") + 1:10
  dposix <- Sys.time() + 1:10

  expect_identical(new_seq(dlogical, 30), c(FALSE, TRUE))
  expect_identical(new_seq(dinteger, 10), 1:10)
  expect_identical(new_seq(dnumeric, 5), c(1.10,  3.35,  5.60,  7.85, 10.10))
  expect_error(new_seq(dcharacter, 1), "new_seq is undefined for character vectors")
  expect_identical(new_seq(dfactor, 1), dfactor)
  expect_identical(new_seq(rev(dfactor), 100), dfactor)
  expect_identical(new_seq(ddate, 10), ddate)
  expect_identical(new_seq(dposix, 10), dposix)
})

test_that("new_seq with missing", {

  dlogical <-  c(as.logical(0:9), NA)
  dinteger <-  c(1:10, NA)
  dnumeric <-  c(1:10 + 0.1, NA)
  dcharacter <-  c(as.character(1:10), NA)
  dfactor <- factor(c(1:10, NA))
  ddate <- c(as.Date("2000-01-01") + 1:10, NA)
  dposix <- ISOdate(2000, 1, 1, 12, tz = "PST8PDT") + c(1:10, NA)

  expect_identical(new_seq(dlogical, 30), c(FALSE, TRUE))
  expect_identical(new_seq(dinteger, 10), 1:10)
  expect_identical(new_seq(dnumeric, 5), c(1.10,  3.35,  5.60,  7.85, 10.10))
  expect_error(new_seq(dcharacter, 1), "new_seq is undefined for character vectors")
  expect_identical(new_seq(dfactor, 1), dfactor[!is.na(dfactor)])
  expect_identical(new_seq(rev(dfactor), 100), dfactor[!is.na(dfactor)])
  expect_identical(new_seq(ddate, 10), ddate[!is.na(ddate)])
  expect_identical(new_seq(dposix, 10), dposix[!is.na(dposix)])
})

test_that("new_seq all missing", {
  dlogical <-  as.logical(NA)
  dinteger <-  as.integer(NA)
  dnumeric <-  as.numeric(NA)
  dcharacter <-  as.character(NA)
  dfactor <- factor(NA, levels = "1")
  ddate <- as.Date(NA)
  dposix <- as.POSIXct(NA, tz = "PST8PDT")

  expect_identical(new_seq(dlogical, 10), dlogical)
  expect_identical(new_seq(dinteger), dinteger)
  expect_equal(new_seq(dnumeric), dnumeric)
  expect_error(new_seq(dcharacter), "new_seq is undefined for character vectors")
  expect_identical(new_seq(dfactor), factor("1", levels = "1"))
  expect_equal(new_seq(ddate), ddate)
  expect_equal(new_seq(dposix), dposix)
})
