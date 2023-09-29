#' Generate Observed Combinations Only
#'
#' @param ... One or more variables to generate combinations for.
#' @param .length_out A count to override the default length of sequences.
#' @seealso [xnew_data()], [xnew_value()] and [xnew_seq()]
#' @export
#' @examples
#' data <- tibble::tibble(
#'   period = factor(c("before", "before", "after", "after"),
#'     levels = c("before", "after")),
#'   annual = factor(c(1, 3, 5, 8), levels = c(1, 3, 5, 8)))
#' xnew_data(data, period, annual)
#' xnew_data(data, xobs_only(period, annual))
#' xnew_data(data, xobs_only(period, xnew_seq(annual, length_out = 3)))
xobs_only <- function(..., .length_out = NULL) {
  quos <- enquos(...)

  translated <- map(quos, quo_translate_xobs_only, .length_out)

  semi_crossing(!!!translated)
}
