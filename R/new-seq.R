#' Generate New Sequence
#'
#' Generate a new sequence of values for a vector, matrix or array.
#' A sequence of value is used to predict the effect of a variable.
#'
#' @param x The object to generate the sequence from.
#' @param length_out The maximum length of the sequence.
#' @returns A vector of the same class as the object.
#' @seealso [new_value()] and [new_data()].
#' @examples
#' # by default the sequence of values for objects of class numeric
#' # is 30 evenly space values across its range
#' new_seq(c(1,4))
#' # missing values are always removed
#' new_seq(c(1,4, NA))
#' # unless it's the only value
#' new_seq(NA_real_)
#' # or the object is zero length
#' new_seq(numeric())
#' # the length of the sequence can be varied using the length_out argument
#' new_seq(c(1,4), length_out = 1)
#' # which can even be 0
#' new_seq(c(1,4), length_out = 0)
#' # for integer objects the sequence is by default up to 30 unique
#' # integers across the range
#' new_seq(c(1L,4L))
#' # for character objects by default its the
#' new_value(c("a", "b", "c", "c"))
#' # and the minimum of the most common values if a tie
#' new_value(c("a", "b", "c", "c", "b"))
#' # for factors its the first level and factor levels are always preserved
#' new_value(factor(c("a", "b", "c", "c"), levels = c("b", "a", "g")))
#' # for ordered factors its also the first level
#' new_value(ordered(c("a", "b", "c", "c"), levels = c("b", "a", "g")))
#' # for dates it's the rounded mean
#' new_value(as.Date(c("2000-01-01", "2000-01-04")))
#' # it's also the rounded mean for times
#' new_value(hms::as_hms(c("00:00:01", "00:00:04")))
#' # for POSIXct vectors it's the rounded mean and the time zone is preserved
#' new_value(as.POSIXct(c("2000-01-01 00:00:01", "2000-01-01 00:00:04"),
#'   tz = "PST8PDT"))
#' # for logical objects it's always FALSE
#' new_value(logical())
#' # and finally by default its simply the mean
#' new_value(complex(real = c(1, 4)))
#' @export
new_seq <- function(x, length_out = 30) {
  UseMethod("new_seq")
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
  range <- range(x, na.rm = TRUE)
  from <- range[1]
  to <- range[2]
  length_out <- min(length_out, to - from + 1L)
  seq(
    from = from,
    to = to,
    length.out = length_out
  ) %>%
    round() %>%
    as.integer() %>%
    unique()
}

#' @export
new_seq.numeric <- function(x, length_out = 30) {
  chk_count(length_out)
  # chk_finite(length_out) # FIXME implement in chk
  if(length_out == 0L) {
    return(double())
  }
  if (all(is.na(x))) {
    return(NA_real_)
  }
  range <- range(x, na.rm = TRUE)
  from <- range[1]
  to <- range[2]
  seq(
    from = from,
    to = to,
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
  table <- x %>% table()
  table <- table * -1
  table <- table[order(table, names(table))]
  out <- names(table)
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
  range <- range(x, na.rm = TRUE) %>%
    as.integer()
  from <- range[1]
  to <- range[2]
  length_out <- min(length_out, to - from + 1L)
  seq(
    from = from,
    to = to,
    length.out = length_out
  ) %>%
    floor() %>%
    as.integer() %>%
    unique() %>%
    as.Date()
}

#' @export
new_seq.POSIXct <- function(x, length_out = 30) {
  chk_count(length_out)
  tz <- attr(x, "tzone", exact = TRUE)
  if(length_out == 0L) {
    return(as.POSIXct(integer(), tz = tz))
  }
  if (all(is.na(x))) {
    return(as.POSIXct(NA_integer_, tz = tz))
  }
  range <- range(x, na.rm = TRUE) %>%
    as.integer()
  from <- range[1]
  to <- range[2]
  length_out <- min(length_out, to - from + 1L)
  seq(
    from = from,
    to = to,
    length.out = length_out
  ) %>%
    floor() %>%
    as.integer() %>%
    unique() %>%
    as.POSIXct(tz = tz)
}

#' @export
new_seq.hms <- function(x, length_out = 30) {
  chk_count(length_out)
  if(length_out == 0L) {
    return(as_hms(integer()))
  }
  if (all(is.na(x))) {
    return(x[1])
  }
  range <- range(x, na.rm = TRUE) %>%
    as.integer()
  from <- range[1]
  to <- range[2]
  length_out <- min(length_out, to - from + 1L)
  seq(
    from = from,
    to = to,
    length.out = length_out
  ) %>%
    floor() %>%
    as.integer() %>%
    unique() %>%
    as_hms()
}
