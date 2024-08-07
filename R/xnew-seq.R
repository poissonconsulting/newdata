#' Generate New Sequence for `xnew_data()`
#'
#' Generate a new sequence of values for a vector.
#'
#' `xnew_seq()` is a wrapper function on `new_seq()`
#' for use in [xnew_data()] to avoid
#' having to repeating the column name.
#' @inheritParams new_seq
#' @param ... Additional arguments passed to [new_seq()].
#' @seealso [new_seq()] and [xnew_data()].
#' @export
#' @examples
#'
#' data <- tibble::tibble(
#'   a = c(1L, 3L, 4L),
#'   b = c(4, 4.5, 6),
#'   d = c("a", "b", "c")
#' )
#'
#' xnew_data(data, a, b = new_seq(b, length_out = 3), xnew_seq(d, length_out = 2))
xnew_seq <- function(x, ...) {
  expr <- ensym(x)
  out <- new_seq(x, ...)
  tibble::tibble(!!expr := out)
}
