#' New Sequence
#'
#' Generate a new sequence for a vector
#'
#' @param x The vector to generate the sequence for.
#' @param length_out The length of the sequence.
#' @seealso [new_value()] and [new_data()].
#' @export
new_seq <- function(x, length_out = 30) {
  UseMethod("new_seq")
}

#' @export
new_seq.default <- function(x, length_out = 30) {
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
  if (all(is.na(x))) {
    return(x[1])
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
  if (all(is.na(x))) {
    return(x[1])
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
new_seq.character <- function(x, length_out = NULL) {
  if (all(is.na(x))) {
    return(x[1])
  }
  sort(unique(x))
}

#' @export
new_seq.factor <- function(x, length_out = NULL) {
  factor(levels(x), levels = levels(x))
}

#' @export
new_seq.ordered <- function(x, length_out = NULL) {
  ordered(levels(x), levels = levels(x))
}

#' @export
new_seq.Date <- function(x, length_out = 30) {
  if (all(is.na(x))) {
    return(x[1])
  }
  seq(
    from = min(x, na.rm = TRUE),
    to = max(x, na.rm = TRUE),
    length.out = length_out
  ) %>%
    as.character() %>%
    as.Date() %>%
    unique()
}

#' @export
new_seq.POSIXct <- function(x, length_out = 30) {
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
