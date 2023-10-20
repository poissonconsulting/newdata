#' Cast New Values for `xnew_data()`
#'
#' Casts a sequence of values to the same class as the original
#' vector.
#'
#' `xnew_seq()` is a wrapper function on `vctrs::vec_cast()`
#' for use in [xnew_data()] to avoid
#' having to repeating the column name.
#' @param ... TBD
#' @param .data TBD
#' @seealso [xnew_data()]
#' @export
#' @examples
#' # TBD
xcast <- function(..., .data = xnew_data_env$data) {
  values <- tibble::tibble(...)

  stopifnot(all(names(values) %in% names(.data)))

  vctrs::vec_cast(values, .data[names(values)])
}
