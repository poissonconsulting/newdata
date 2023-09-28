#' Generate New Sequence
#'
#' Generate a new sequence of values for a vector, matrix or array.
#' A sequence of values is used to predict the effect of a variable.
#'
#' By default the sequence of values for objects of class numeric
#' is 30 evenly space values across the range of the data.
#' Missing values are always removed unless it's the only value
#' or the object is zero length.
#' The length of the sequence can be varied using the `length_out` argument
#' which gives the reference value when 1 and can even be 0.
#' For integer objects the sequence is the unique integers.
#' For character objects it's the actual values sorted by
#' how common they are followed by their actual value.
#' For factors it's the factor levels in order
#' with the trailing levels dropped first.
#' For ordered factors the intermediate levels are dropped first.
#' For Date vectors it's the unique dates;
#' same for hms vectors.
#' For POSIXct vectors the time zone is preserved.
#' For logical objects the longest possible sequence is `c(TRUE, FALSE)`.
#'
#' @param x The object to generate the sequence from.
#' @param length_out The maximum length of the sequence.
#' @param obs_only A flag specifying whether to only use observed values.
#' @returns A vector of the same class as the object.
#' @seealso [new_value()] and [new_data()].
#' @examples
#' # by default the sequence of values for objects of class numeric
#' # is 30 evenly space values across the range of the data
#' new_seq(c(1, 4))
#' # missing values are always removed
#' new_seq(c(1, 4, NA))
#' # unless it's the only value
#' new_seq(NA_real_)
#' # or the object is zero length
#' new_seq(numeric())
#' # the length of the sequence can be varied using the length_out argument
#' new_seq(c(1, 4), length_out = 3)
#' new_seq(c(1, 4), length_out = 2)
#' # which gives the reference value when 1
#' new_seq(c(1, 4), length_out = 1)
#' # and can even be 0
#' new_seq(c(1, 4), length_out = 0)
#' # for integer objects the sequence is the unique integers
#' new_seq(c(1L, 4L))
#' new_seq(c(1L, 100L))
#' # for character objects it's the actual values sorted by
#' # how common they are followed by their actual value
#' new_seq(c("a", "c", "c", "b", "b"))
#' new_seq(c("a", "c", "c", "b", "b"), length_out = 2)
#' # for factors its the factor levels in order
#' new_seq(factor(c("a", "b", "c", "c"), levels = c("b", "a", "g")))
#' # with the trailing levels dropped first
#' new_seq(factor(c("a", "b", "c", "c"), levels = c("b", "a", "g")),
#'   length_out = 2
#' )
#' # for ordered factors the intermediate levels are dropped first
#' new_seq(ordered(c("a", "b", "c", "c"), levels = c("b", "a", "g")),
#'   length_out = 2
#' )
#' # for Date vectors it's the unique dates
#' new_seq(as.Date(c("2000-01-01", "2000-01-04")))
#' # same for hms vectors
#' new_seq(hms::as_hms(c("00:00:01", "00:00:04")))
#' # for POSIXct vectors the time zone is preserved
#' new_seq(as.POSIXct(c("2000-01-01 00:00:01", "2000-01-01 00:00:04"),
#'   tz = "PST8PDT"
#' ))
#' # for logical objects the longest possible sequence is `c(TRUE, FALSE)`
#' new_seq(c(TRUE, TRUE, FALSE), length_out = 3)
#' @export
new_seq <- function(x, length_out = 30, obs_only = FALSE) {
  UseMethod("new_seq")
}

#' @describeIn new_seq Generate new sequence of values for logical objects
#' @export
new_seq.default <- function(x, length_out = 30, obs_only = FALSE) {
  chk_count(length_out)
  if (length_out == 1L) {
    out <- x %>% mean(na.rm = TRUE)
    if (is.nan(out)) {
      is.na(out) <- TRUE
    }
    return(out)
  }
  err("not yet implemented")
}

#' @describeIn new_seq Generate new sequence of values for logical objects
#' @export
new_seq.logical <- function(x, length_out = 2, obs_only = FALSE) {
  chk_count(length_out)
  chk_flag(obs_only)
  if (length_out == 0L) {
    return(logical())
  }
  if(obs_only) {
    if(all(is.na(x))) {
      return(NA)
    }
    return(obs_only1(x, length_out, first = TRUE))
  }
  if (length_out == 1L) {
    return(FALSE)
  }
  return(c(FALSE, TRUE))
}

#' @describeIn new_seq Generate new sequence of values for integer objects
#' @export
new_seq.integer <- function(x, length_out = 30, obs_only = FALSE) {
  chk_count(length_out)
  if (length_out == 0L) {
    return(integer())
  }
  if (all(is.na(x))) {
    return(NA_integer_)
  }
  seq1(x, length_out, integer = TRUE)
}

#' @describeIn new_seq Generate new sequence of values for double objects
#' @export
new_seq.double <- function(x, length_out = 30, obs_only = FALSE) {
  chk_count(length_out)
  # chk_finite(length_out) # FIXME implement in chk
  if (length_out == 0L) {
    return(double())
  }
  if (all(is.na(x))) {
    return(NA_real_)
  }
  seq1(x, length_out)
}

#' @describeIn new_seq Generate new sequence of values for character objects
#' @export
new_seq.character <- function(x, length_out = Inf, obs_only = FALSE) {
  chk_count(length_out)
  if (length_out == 0L) {
    return(character())
  }
  if (all(is.na(x))) {
    return(NA_character_)
  }
  table <- x %>% table()
  out <- names(table[order(table * -1, names(table))])
  if (length(out) > length_out) {
    out <- out[1:length_out]
  }
  out
}

#' @describeIn new_seq Generate new sequence of values for factors
#' @export
new_seq.factor <- function(x, length_out = Inf, obs_only = FALSE) {
  chk_count(length_out)
  levels <- levels(x)
  if (length_out == 0L) {
    return(factor(levels = levels))
  }
  if (!length(levels)) {
    return(factor(NA_character_, levels = levels))
  }
  out <- factor(levels(x), levels = levels(x))
  if (length(out) > length_out) {
    out <- out[1:length_out]
  }
  out
}

#' @describeIn new_seq Generate new sequence of values for ordered factors
#' @export
new_seq.ordered <- function(x, length_out = Inf, obs_only = FALSE) {
  chk_count(length_out)
  levels <- levels(x)
  if (length_out == 0L) {
    return(ordered(levels = levels))
  }
  if (!length(levels)) {
    return(ordered(NA_character_, levels = levels))
  }
  out <- ordered(levels(x), levels = levels(x))
  n <- length(out)
  if (length(out) > length_out) {
    out <- out[seq(1, n, length.out = length_out)]
  }
  out
}

#' @describeIn new_seq Generate new sequence of values for Date vectors
#' @export
new_seq.Date <- function(x, length_out = 30, obs_only = FALSE) {
  x %>%
    as.integer() %>%
    new_seq(length_out = length_out) %>%
    as.Date()
}

#' @describeIn new_seq Generate new sequence of values for POSIXct vectors
#' @export
new_seq.POSIXct <- function(x, length_out = 30, obs_only = FALSE) {
  tz <- attr(x, "tzone", exact = TRUE)
  x %>%
    as.integer() %>%
    new_seq(length_out = length_out) %>%
    as.POSIXct(tz = tz)
}

#' @describeIn new_seq Generate new sequence of values for hms vectors
#' @export
new_seq.hms <- function(x, length_out = 30, obs_only = FALSE) {
  x %>%
    as.integer() %>%
    new_seq(length_out = length_out) %>%
    as_hms()
}
