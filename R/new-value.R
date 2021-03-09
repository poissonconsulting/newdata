#' New Value
#'
#' Generate a new reference value for a vector.
#'
#' @param x The vector to generate the new value for.
#' @seealso \code{\link{new_data}}.
#' @export
new_value <- function(x)
  UseMethod("new_value")

#' @export
new_value.default <- function(x) {
  mean(x, na.rm = TRUE)
}

#' @export
new_value.logical <- function(x) {
  FALSE
}

#' @export
new_value.integer <- function(x) {
  x %<>% mean(na.rm = TRUE) %>% round() %>% as.integer()
  x
}

#' @export
new_value.numeric <- function(x) {
  x %<>% mean(na.rm = TRUE)
  if (all(is.nan(x)))
    return(NA_real_)
  x
}

#' @export
new_value.character <- function(x) {
  sort(x, na.last = TRUE)[1]
}

#' @export
new_value.factor <- function(x) {
  factor(levels(x)[1], levels = levels(x))
}

#' @export
new_value.Date <- function(x) {
  x %<>%
    mean(na.rm = TRUE) %>%
    round() %>%
    as.Date() %>%
    # ensure Date exactly as displayed!
    as.character() %>%
    as.Date()
  x
}

#' @export
new_value.POSIXct <- function(x) {
  tz <- dttr2::dtt_tz(x)
  x %<>%
    mean(na.rm = TRUE) %>%
    round() %>%
    as.POSIXct(tz = tz) %>%
    dttr2::dtt_floor()
  x
}

#' @export
new_value.hms <- function(x) {
  if (!requireNamespace("hms", quietly = TRUE)) {
    stop("Package \"hms\" needed for this function to work. Please install it.",
         call. = FALSE)
  }

  x %<>%
    mean(na.rm = TRUE) %>%
    round() %>%
    hms::as_hms() %>%
    dttr2::dtt_floor()
  x
}
