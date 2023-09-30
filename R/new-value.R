#' Generate New Reference Value
#'
#' Generate a new reference value for a vector.
#'
#' By default the reference value for double vectors is the mean,
#' unless obs_only = TRUE, in which case its the median of the unique values.
#' For integer vectors it's the floored mean unless obs_only = TRUE, in which case
#' it's also the median of the unique values.
#' For character vectors it's the minimum of the most common values while
#' for factors it's the first level.
#' Ordered factors, Dates, times (hms), POSIXct and logical vectors are
#' treated like integers.
#' The factor levels and time zone are preserved.
#'
#' @param x The object to generate the reference value from.
#' @inheritParams new_seq
#' @returns A scalar of the same class as the object.
#' @seealso [xnew_value()] and [new_seq()].
#' @examples
#' # the reference value for objects of class numeric is the mean
#' new_value(c(1, 4))
#' # unless obs_only = TRUE, in which case its the median of the unique values
#' new_value(c(1, 4), obs_only = TRUE)
#'
#' # for integer objects it's the floored mean
#' new_value(c(1L, 4L))
#'
#' # for character objects it's the minimum of the most common values
#' new_value(c("a", "b", "c", "c", "b"))
#'
#' # for factors its the first level and the factor levels are preserved
#' new_value(factor(c("a", "b", "c", "c"), levels = c("b", "a", "g")))
#'
#' # other classes are treated like integers
#' new_value(ordered(c("a", "b", "c", "c"), levels = c("b", "a", "g")))
#' new_value(as.Date(c("2000-01-01", "2000-01-04")))
#' new_value(hms::as_hms(c("00:00:01", "00:00:04")))
#' new_value(as.POSIXct(c("2000-01-01 00:00:01", "2000-01-01 00:00:04")),
#'   tzone = "PST8PDT")
#' new_value(c(TRUE, FALSE, TRUE))
#'
#' @export
new_value <- function(x, ..., obs_only = NULL) {
  new_seq(x, length_out = 1L, obs_only = obs_only)
}
