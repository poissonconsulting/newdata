#' Coerce
#'
#' @param ... One or more variables to generate combinations for.
#' @param .data TBD
#' @seealso [xnew_data()], [xnew_value()] and [xnew_seq()]
#' @export
#' @examples
#' # TBD
xcoerce <- function(..., .data = xnew_data_env$data) {
  values <- tibble(...)
  stopifnot(all(names2(values) != ""))

  stopifnot(all(names(values) %in% names(.data)))

  vec_cast(values, .data[names(values)])
}
