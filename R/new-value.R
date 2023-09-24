#' New Value
#'
#' Generate a new reference value for a vector.
#'
#' @param x The vector to generate the new value for.
#' @seealso [new_seq()] and [new_data()].
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
  x %>%
    mean(na.rm = TRUE) %>%
    round() %>%
    dttr2::dtt_date()
}

#' @export
new_value.POSIXct <- function(x) {
  tz <- dttr2::dtt_tz(x)
  x %>%
    mean(na.rm = TRUE) %>%
    round() %>%
    as.POSIXct(tz = tz) %>%
    dttr2::dtt_date_time(tz = tz)
}

#' @export
new_value.hms <- function(x) {
  x %>%
    mean(na.rm = TRUE) %>%
    round() %>%
    as_hms() %>%
    dttr2::dtt_time()
}
