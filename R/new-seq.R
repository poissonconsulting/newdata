#' Generate New Sequence
#'
#' Generate a new sequence for a vector, matrix or array.
#'
#' @param x The object to generate the sequence from.
#' @param length_out The maximum length of the sequence.
#' @returns A vector of the same class as the object.
#' @seealso [new_value()] and [new_data()].
#' @examples
#' new_seq(c(1,4,NA)) # returns vector of 30 equidistant real values in range
#' new_seq(c(1,4,NA),  length_out = 10) # returns 10 equidistant real values
#' new_seq(c(1L,4L,NA)) # returns up to 30 unique integer values
#' new_seq(c(1L,4L,NA), length_out = 3) # up to three unique integer values
#' new_seq(c(1L,4L,NA), length_out = 2) # minimum and maximum integer values
#' new_seq(c(1L,4L,NA), length_out = 1) # minimum integer value
#' new_seq(c("g", "a", "b", "b", NA)) # all character values
#' # all factor levels preserving factor levels
#' new_seq(factor(c("g", "a", "b", "b", NA), levels = c("b", "a", "g")))
#' # rounded mean for dates and times
#' new_seq(as.Date(c("2000-01-01", "2000-01-04", NA)))
#' new_seq(hms::as_hms(c("00:00:01", "00:00:04", NA)))
#' new_seq(as.POSIXct(c("2000-01-01 00:00:01", "2000-01-01 00:00:04", NA)))
#' # FALSE and TRUE for logical vectors
#' new_seq(c(TRUE,FALSE, NA))
#' @export
new_seq <- function(x, length_out = 30) {
  UseMethod("new_seq")
}

#' @export
new_seq.default <- function(x, length_out = 30) {
  chk_count(length_out)
  if(length_out == 0L) {
    return(x[-1])
  }
  if (all(is.na(x))) {
    return(x[1])
  }
  seq(
    from = min(x, na.rm = TRUE),
    to = max(x, na.rm = TRUE),
    length.out = length_out
  ) %>%
    unique()
}

#' @export
new_seq.logical <- function(x, length_out = 2) {
  chk_count(length_out)
  if(length_out == 0L) {
    return(logical())
  }
  if (all(is.na(x))) {
    return(NA)
  }
  out <- x %>%
    unique() %>%
    sort()
  if (length_out == 1) {
    return(out[1])
  }
  out
}

#' @export
new_seq.integer <- function(x, length_out = 30) {
  chk_count(length_out)
  if(length_out == 0L) {
    return(integer())
  }
  if (all(is.na(x))) {
    return(NA_integer_)
  }
  seq(
    from = min(x, na.rm = TRUE),
    to = max(x, na.rm = TRUE),
    length.out = length_out
  ) %>%
    round() %>%
    as.integer() %>%
    unique()
}

#' @export
new_seq.numeric <- function(x, length_out = 30) {
  chk_count(length_out)
  if(length_out == 0L) {
    return(double())
  }
  if (all(is.na(x))) {
    return(NA_real_)
  }
  seq(
    from = min(x, na.rm = TRUE),
    to = max(x, na.rm = TRUE),
    length.out = length_out
  ) %>%
    unique()
}

#' @export
new_seq.character <- function(x, length_out = 10) {
  chk_count(length_out)
  if(length_out == 0L) {
    return(character())
  }
  if (all(is.na(x))) {
    return(NA_character_)
  }
  out <- x %>%
    sort() %>%
    unique()
  if(is.infinite(length_out)) {
    return(out)
  }
  n <- length(out)
  if(n > length_out) {
    out <- out[1:length_out]
  }
  out
}

#' @export
new_seq.factor <- function(x, length_out = Inf) {
  chk_count(length_out)
  levels <- levels(x)
  if(length_out == 0L) {
    return(factor(levels = levels))
  }
  if (all(is.na(x))) {
    return(factor(NA_character_, levels = levels))
  }
  out <- factor(levels(x), levels = levels(x))
  if(is.infinite(length_out)) {
    return(out)
  }
  n <- length(out)
  if(n > length_out) {
    out <- out[1:length_out]
  }
  out
}

#' @export
new_seq.ordered <- function(x, length_out = Inf) {
  chk_count(length_out)
  levels <- levels(x)
  if(length_out == 0L) {
    return(ordered(levels = levels))
  }
  if (all(is.na(x))) {
    return(ordered(NA_character_, levels = levels))
  }
  out <- ordered(levels(x), levels = levels(x))
  if(is.infinite(length_out)) {
    return(out)
  }
  n <- length(out)
  if(n > length_out) {
    out <- out[seq(1, n, length.out = length_out)]
  }
  out
}

#' @export
new_seq.Date <- function(x, length_out = 30) {
  chk_count(length_out)
  if(length_out == 0L) {
    return(as.Date(integer()))
  }
  if (all(is.na(x))) {
    return(as.Date(NA_integer_))
  }
  out <- seq(
    from = min(x, na.rm = TRUE),
    to = max(x, na.rm = TRUE),
    length.out = length_out
  ) %>%
    as.integer() %>%
    unique() %>%
    as.Date()
  n <- length(out)
  if(n > length_out) {
    out <- out[seq(1, n, length.out = length_out)]
  }
  out

}

#' @export
new_seq.POSIXct <- function(x, length_out = 30) {
  chk_count(length_out)
  if (all(is.na(x))) {
    return(x[1])
  }
  seq(
    from = min(x, na.rm = TRUE),
    to = max(x, na.rm = TRUE),
    length.out = length_out
  ) %>%
    dttr2::dtt_floor() %>%
    unique()
}

#' @export
new_seq.hms <- function(x, length_out = 30) {
  chk_count(length_out)
  if (all(is.na(x))) {
    return(x[1])
  }
  seq(
    from = min(x, na.rm = TRUE),
    to = max(x, na.rm = TRUE),
    length.out = length_out
  ) %>%
    as_hms() %>%
    dttr2::dtt_floor() %>%
    unique() %>%
    as_hms()
}
