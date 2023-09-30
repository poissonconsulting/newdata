#' Generate New Reference Value for `xnew_data()`
#'
#' Generate a new reference value for a vector.
#'
#' `xnew_value()` is a wrapper function on [new_value()]
#' for use in [xnew_data()] to avoid
#' having to repeating the column name.
#' @inheritParams new_value
#' @param ... Additional arguments passed to [new_value()].
#' @seealso [new_value()] and [xnew_data()].
#' @export
#' @examples
#' data <- tibble::tibble(
#'   a = c(1L, 3L, 4L),
#'   b = c(4, 4.5, 6),
#'   d = c("a", "b", "c"))
#'
#' xnew_data(data, a, b = new_value(b), xnew_value(d))
xnew_value <- function(x, ...) {
  expr <- ensym(x)
  out <- new_value(x, ...)
  tibble::tibble(!!expr := out)
}
