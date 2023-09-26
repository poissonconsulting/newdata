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
#' new_value(c(1,4,NA)) # returns mean for reference value for real vector
#' new_value(c(1L,4L,NA)) # rounded mean as integer for integer vector
#' new_value(c("g", "a", "b", "b", NA)) # minimum for character vector
#' # first level for factor preserving factor levels
#' new_value(factor(c("g", "a", "b", "b", NA), levels = c("b", "a", "g")))
#' # rounded mean as integer for dates and times (Date, hms, POSIXct)
#' new_value(as.Date(c("2000-01-01", "2000-01-02", NA)))
#' new_value(hms::as_hms(c("00:00:01", "00:00:02", NA)))
#' new_value(as.POSIXct(c("2000-01-01 00:00:01", "2000-01-01 00:00:02"),
#' tz = "UTC"))
#' # false for logical vector as this is the natural reference value
#' new_value(c(TRUE,NA))
#' @export
new_value <- function(x) {
  UseMethod("new_value")
}

#' @export
new_value.default <- function(x) {
  x %>% mean(na.rm = TRUE)
}

#' @export
new_value.logical <- function(x) {
  FALSE
}

#' @export
new_value.integer <- function(x) {
  x %>%
    mean(na.rm = TRUE) %>%
    round() %>%
    as.integer()
}

#' @export
new_value.numeric <- function(x) {
  out <- x %>% mean(na.rm = TRUE)
  if (is.nan(out)) {
    return(NA_real_)
  }
  out
}

#' @export
new_value.character <- function(x) {
  if (all(is.na(x))) {
    return(NA_character_)
  }
  x %>% min(na.rm = TRUE)
}

#' @export
new_value.factor <- function(x) {
  levels <- levels(x)
  factor(levels[1], levels = levels)
}

#' @export
new_value.ordered <- function(x) {
  levels <- levels(x)
  ordered(levels[1], levels = levels)
}

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

#' @export
new_value.hms <- function(x) {
  x %>%
    mean(na.rm = TRUE) %>%
    round() %>%
    as.integer() %>%
    as_hms()
}
