#' Generate New Reference Value
#'
#' Generate a new reference value for a vector, matrix or array.
#' A reference value is used to control for a variable
#' during predictions.
#'
#' The reference value for objects (vectors, matrices or arrays)
#' of class numeric is the mean.
#' Missing values are always removed
#' unless it's the only value
#' or the object is zero length.
#' For integer objects it's the rounded mean.
#' For character vectors it's the most common value
#' and the (locale-dependent) minimum of the most common values if a tie.
#' For factors and ordered factors it's the first level and
#' the factor levels are preserved.
#' For dates and hms vectors it's the rounded mean.
#' For POSIXct vectors it's the rounded mean and the time zone is preserved.
#' For logical objects it's always `FALSE` as this is
#' the natural reference value.
#' And finally by default it's simply the mean.
#'
#' @param x The object to generate the reference value from.
#' @inheritParams new_seq
#' @returns A scalar of the same class as the object.
#' @seealso [new_seq()] and [new_data()].
#' @examples
#' # the reference value for objects of class numeric is the mean
#' new_value(c(1, 4))
#' # missing values are always removed
#' new_value(c(1, 4, NA))
#' # unless it's the only value
#' new_value(NA_real_)
#' # or the object is zero length
#' new_value(numeric())
#' # for integer objects it's the rounded mean
#' new_value(c(1L, 4L))
#' # for character objects it's the most common value
#' new_value(c("a", "b", "c", "c"))
#' # and the minimum of the most common values if a tie
#' new_value(c("a", "b", "c", "c", "b"))
#' # for factors its the first level and the factor levels are preserved
#' new_value(factor(c("a", "b", "c", "c"), levels = c("b", "a", "g")))
#' # for ordered factors its also the first level
#' new_value(ordered(c("a", "b", "c", "c"), levels = c("b", "a", "g")))
#' # for dates it's the rounded mean
#' new_value(as.Date(c("2000-01-01", "2000-01-04")))
#' # it's also the rounded mean for times
#' new_value(hms::as_hms(c("00:00:01", "00:00:04")))
#' # for POSIXct vectors it's the rounded mean and the time zone is preserved
#' new_value(as.POSIXct(c("2000-01-01 00:00:01", "2000-01-01 00:00:04"),
#'   tz = "PST8PDT"
#' ))
#' # for logical objects it's always FALSE
#' new_value(logical())
#' @export
new_value <- function(x, obs_only = FALSE) {
  new_seq(x, length_out = 1L, obs_only = obs_only)
}
