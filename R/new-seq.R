#' New Sequence
#'
#' Generate a new sequence for a vector
#'
#' @param x The vector to generate the sequence for.
#' @param length_out The length of the sequence.
#' @seealso \code{\link{new_data}}.
#' @export
new_seq <- function(x, length_out = 30)
  UseMethod("new_seq")

#' @export
new_seq.default <- function(x, length_out = 30) {
  if (all(is.na(x))) return(x[1])
  seq(from = min(x, na.rm = TRUE), to = max(x, na.rm = TRUE), length.out = length_out)
}

new_seq.logical <- function(x, length_out = 2) {
  if (all(is.na(x))) return(x[1])
  x %<>% unique() %>% sort()
  if (length_out == 1) return(x[1])
  x
}

#' @export
new_seq.integer <- function(x, length_out = 30) {
  if (all(is.na(x))) return(x[1])
  x <- seq(from = min(x, na.rm = TRUE), to = max(x, na.rm = TRUE), length.out = length_out)
  x %<>% round() %>% as.integer() %>% unique()
  x
}

#' @export
new_seq.character <- function(x, length_out = NULL) {
  stop("new_seq is undefined for character vectors", call. = FALSE)
}

#' @export
new_seq.factor <- function(x, length_out = NULL) {
  factor(levels(x), levels = levels(x))
}
