#' Generate New Reference Value
#'
#' Generate a new reference value for a vector, matrix or array.
#' A reference value is used to control for a variable
#' during predictions.
#'
#' The reference value for objects (vectors, matrices or arrays)
#' of class numeric is the mean.
#' Missing values are always removed
#' unless it's the only value
#' or the object is zero length.
#' For integer objects it's the rounded mean.
#' For character vectors it's the most common value
#' and the minimum of the most common values if a tie.
#' For factors its the first level and the factor levels are preserved.
#' For ordered factors its also the first level.
#' For dates it's the rounded mean.
#' It's also the rounded mean for times.
#' For POSIXct vectors it's the rounded mean and the time zone is preserved.
#' For logical objects it's always FALSE as this is the natural reference value.
#' And finally by default its simply the mean.
#'
#' @param x The object to generate the reference value from.
#' @returns A scalar of the same class as the object.
#' @seealso [new_seq()] and [new_data()].
#' @examples
#' # the reference value for objects of class numeric is the mean
#' new_value(c(1,4))
#' # missing values are always removed
#' new_value(c(1,4, NA))
#' # unless it's the only value
#' new_value(NA_real_)
#' # or the object is zero length
#' new_value(numeric())
#' # for integer objects it's the rounded mean
#' new_value(c(1L,4L))
#' # for character objects it's the most common value
#' new_value(c("a", "b", "c", "c"))
#' # and the minimum of the most common values if a tie
#' new_value(c("a", "b", "c", "c", "b"))
#' # for factors its the first level and the factor levels are preserved
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
new_value <- function(x) {
  UseMethod("new_value")
}

#' @describeIn new_value Generate new reference value for default objects
#' @export
new_value.default <- function(x) {
  out <- x %>% mean(na.rm = TRUE)
  if (is.nan(out)) {
    is.na(out) <- TRUE
    return(out)
  }
  out
}

#' @describeIn new_value Generate new reference value for logical objects
#' @export
new_value.logical <- function(x) {
  FALSE
}

#' @describeIn new_value Generate new reference value for double objects
#' @export
new_value.double <- function(x) {
  out <- x %>% mean(na.rm = TRUE)
  if (is.nan(out)) {
    return(NA_real_)
  }
  out
}

#' @describeIn new_value Generate new reference value for integer objects
#' @export
new_value.integer <- function(x) {
  x %>%
    mean(na.rm = TRUE) %>%
    round() %>%
    as.integer()
}

#' @describeIn new_value Generate new reference value for character objects
#' @export
new_value.character <- function(x) {
  if (all(is.na(x)) || !length(x)) {
    return(NA_character_)
  }
  table <- table(x)
  out <- table[which(table == max(table))]
  min(names(out))
}

#' @describeIn new_value Generate new reference value for factors
#' @export
new_value.factor <- function(x) {
  levels <- levels(x)
  factor(levels[1], levels = levels)
}

#' @describeIn new_value Generate new reference value for ordered factors
#' @export
new_value.ordered <- function(x) {
  levels <- levels(x)
  ordered(levels[1], levels = levels)
}

#' @describeIn new_value Generate new reference value for Date vectors
#' @export
new_value.Date <- function(x) {
  out <- x %>% mean(na.rm = TRUE)
  if (is.nan(out)) {
    return(as.Date(NA_integer_))
  }
  out %>%
    round() %>%
    as.integer() %>%
    as.Date()
}

#' @describeIn new_value Generate new reference value for POSIXct vectors
#' @export
new_value.POSIXct <- function(x) {
  tz <- attr(x, "tzone", exact = TRUE)
  out <- x %>% mean(na.rm = TRUE)
  if (is.nan(out)) {
    return(as.POSIXct(NA_integer_, tz = tz))
  }
  out %>%
    round() %>%
    as.POSIXct(tz = tz) %>%
    as.integer() %>%
    as.POSIXct(tz = tz)
}

#' @describeIn new_value Generate new reference value for hms vectors
#' @export
new_value.hms <- function(x) {
  x %>%
    mean(na.rm = TRUE) %>%
    round() %>%
    as.integer() %>%
    as_hms()
}
