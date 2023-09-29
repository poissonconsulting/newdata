#' Generate New Data by Expansion
#'
#' Generates a new data frame (in the form of a tibble) with each variable
#' held constant or varying as a unique ordered sequence.
#'
#' @param .data The data frame to generate the new data from.
#' @param ... A list of variables to generate sequences for.
#' @seealso [xnew_value()], [xnew_seq()], [xobs_only()] and [new_data()]
#' @export
#' @examples
#' data <- tibble::tibble(
#'   period = factor(c("before", "before", "after", "after"),
#'     levels = c("before", "after")),
#'   count = c(0L, 1L, 5L, 4L),
#'   annual = factor(c(1, 3, 5, 8), levels = c(1, 3, 5, 8)))
#' xnew_data(data, xobs_only(period, xnew_seq(annual, length_out = 3)))
#' xnew_data(data, xnew_seq(count, length_out = 3),
#'   xobs_only(period, xnew_seq(annual, length_out = 3)))
#' xnew_data(data, xnew_seq(count, length_out = 3, obs_only = TRUE),
#'   xobs_only(period, xnew_seq(annual, length_out = 3)))
xnew_data <- function(.data, ...) {
  stopifnot(is.null(xnew_data_env$data))
  local_bindings(data = .data, .env = xnew_data_env)

  expand2(.data, ..., .default = new_value, .order = TRUE)
}

# Environment to store the .data argument
xnew_data_env <- rlang::new_environment()
