#' New Value
#'
#' Generate a new reference value for a vector.
#'
#' The reference value is the value to use for a variable when it is being
#' held constant.
#'
#' @param x The vector to generate the new value for.
#' @returns A scalar of the same class as the vector.
#' @seealso [new_seq()] and [new_data()].
#' @examples
#' # the reference value for real vectors is the mean
#' new_value(c(1,4))
#' # missing values are always removed
#' new_value(c(1,4, NA))
#' # unless its the only value
#' new_value(NA_real_)
#' # or the vector is zero length
#' new_value(numeric())
#' # for integer vectors it's the rounded mean
#' new_value(c(1L,4L))
#' # for character vectors it's the most common value
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
#' # for logical vector it's always FALSE as this is the natural reference value
#' new_value(logical())
#' # and by default its simply the mean
#' new_value(complex(real = c(1, 4)))
#' @export
new_value <- function(x) {
  UseMethod("new_value")
}

#' @describeIn new_value default
#' @export
new_value.default <- function(x) {
  out <- x %>% mean(na.rm = TRUE)
  if (is.nan(out)) {
    is.na(out) <- TRUE
    return(out)
  }
  out
}

#' @describeIn new_value logical
#' @export
new_value.logical <- function(x) {
  FALSE
}

#' @describeIn new_value double
#' @export
new_value.double <- function(x) {
  out <- x %>% mean(na.rm = TRUE)
  if (is.nan(out)) {
    return(NA_real_)
  }
  out
}

#' @describeIn new_value integer
#' @export
new_value.integer <- function(x) {
  x %>%
    mean(na.rm = TRUE) %>%
    round() %>%
    as.integer()
}

#' @describeIn new_value character
#' @export
new_value.character <- function(x) {
  if (all(is.na(x)) || !length(x)) {
    return(NA_character_)
  }
  table <- table(x)
  out <- table[which(table == max(table))]
  min(names(out))
}

#' @describeIn new_value factor
#' @export
new_value.factor <- function(x) {
  levels <- levels(x)
  factor(levels[1], levels = levels)
}

#' @describeIn new_value ordered
#' @export
new_value.ordered <- function(x) {
  levels <- levels(x)
  ordered(levels[1], levels = levels)
}

#' @describeIn new_value Date
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

#' @describeIn new_value POSIXct
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

#' @describeIn new_value hms
#' @export
new_value.hms <- function(x) {
  x %>%
    mean(na.rm = TRUE) %>%
    round() %>%
    as.integer() %>%
    as_hms()
}
