#' Cast New Values for `xnew_data()`
#'
#' Casts a sequence of values to the same class as the original
#' vector.
#'
#' `xcast()` is a wrapper function on [vctrs::vec_cast()]
#' for use in [xnew_data()] to avoid
#' having to repeating the column name.
#' @param ... Named vectors of values to cast to the class of the
#'   identically named columns in `.data`.
#' @param .data Normally defined by [xnew_data()], users must pass a
#'   data frame or tibble if using this function directly.
#' @return A tibble of the cast values.
#' @seealso [vctrs::vec_cast()] and [xnew_data()]
#' @export
#' @examples
#' data <- tibble::tibble(
#'   period = factor(c("before", "before", "after", "after"),
#'     levels = c("before", "after")
#'   ),
#'   annual = factor(c(1, 3, 5, 8), levels = c(1, 3, 5, 8))
#' )
#'
#' xnew_data(data, xcast(period = "before"))
#' xnew_data(data, xcast(period = "before", annual = c("1", "3")))
xcast <- function(..., .data = xnew_data_env$data) {
  values <- tibble::tibble(...)

  stopifnot(all(names(values) %in% names(.data)))

  vctrs::vec_cast(values, .data[names(values)])
}
