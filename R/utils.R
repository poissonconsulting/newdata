classes <- function(x) lapply(x, class)
is.named <- function(x) !is.null(names(x))

#' Error
#'
#' Throws an error without the call as part of the error message.
#'
#' @inheritParams base::stop
#' @seealso base::stop
error <- function(...) {
  stop(..., call. = FALSE)
}
