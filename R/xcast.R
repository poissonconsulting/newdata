#' Cast New Values for `xnew_data()`
#'
#' Casts a sequence of values to the same class as the original
#' vector.
#'
#' `xcast()` is a wrapper function on [vctrs::vec_cast()]
#' for use in [xnew_data()] to avoid
#' having to repeating the column name.
#'
#' The casts that are possible are those defined by vctrs and the
#' packages that provide the classes.
#' For example, numeric and character values can be cast to hms
#' because the hms package provides those casts,
#' but vctrs does not provide casts from numeric or character values
#' to Date or POSIXct as they require an origin, format or time zone.
#' Date and POSIXct values must therefore be created with the
#' required class, for example using [as.Date()] or [as.POSIXct()].
#' POSIXct values are converted to the time zone of the column.
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
#'
#' # numeric and character values can be cast to hms
#' xnew_data(old_data, xcast(hms = "01:01:11"))
#' # but Date and POSIXct values must be created with the required class
#' xnew_data(
#'   old_data,
#'   xcast(
#'     dte = as.Date("2024-01-01"),
#'     dtt = as.POSIXct("2024-01-01 10:30:42", tz = "PST8PDT")
#'   )
#' )
xcast <- function(..., .data = xnew_data_env$data) {
  values <- tibble::tibble(...)

  stopifnot(all(names(values) %in% names(.data)))

  vctrs::vec_cast(values, .data[names(values)])
}
