#' @export
new_value <- function(x)
  UseMethod("new_value")

#' @export
new_value.default <- function(x) {
  mean(x, na.rm = TRUE)
}

#' @export
new_value.logical <- function(x) {
  x %<>% mean(na.rm = TRUE) %>% round() %>% as.logical()
  x
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
  sort(x)[1]
}

#' @export
new_value.factor <- function(x) {
  factor(levels(x)[1], levels = levels(x))
}

#' @export
new_value.Date <- function(x) {
  x %<>% mean(na.rm = TRUE) %>% round() %>% as.Date()
  x
}

#' @export
new_value.POSIXct <- function(x) {
  tz <- lubridate::tz(x)
  x %<>% mean(na.rm = TRUE) %>% round() %>% as.POSIXct(tz = tz)
  x
}


