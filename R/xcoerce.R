#' Coerce
#'
#' @param ... TBD
#' @param .data TBD
#' @seealso [xnew_data()], [xnew_value()] and [xnew_seq()]
#' @export
#' @examples
#' # TBD
xcoerce <- function(..., .data = xnew_data_env$data) {
  values <- tibble::tibble(...)

  stopifnot(all(names(values) %in% names(.data)))

  vctrs::vec_cast(values, .data[names(values)])
}
