#' Generate New Data by Expansion
#'
#' Generates a new data frame (in the form of a tibble)
#'
#' By default, all specified variables vary across their range
#' while all other variables are held constant at their reference value.
#' Types, classes, factor levels and time zones are always preserved.
#' The user can specify the length of each sequence, require that only
#' observed values and combinations are used and add new variables.
#'
#' @param .data The data frame to generate the new data from.
#' @param .length_out NULL or a count specifying the maximum length
#' of all sequences.
#' @param ... A list of variables to generate sequences for.
#' @seealso [xnew_value()], [xnew_seq()], [xcast()] and [xobs_only()]
#' @export
#' @examples
#' data <- tibble::tibble(
#'   period = factor(c("before", "before", "after", "after"),
#'     levels = c("before", "after")
#'   ),
#'   count = c(0L, 1L, 5L, 4L),
#'   annual = factor(c(2, 3, 5, 8), levels = c(1, 2, 3, 5, 8))
#' )
#'
#' # By default all other variables are held constant at their reference value.
#' xnew_data(data)
#'
#' # Specifying a variable causes it to vary across its range.
#' xnew_data(data, annual)
#'
#' # The user can specify the length of a sequence.
#' xnew_data(data, xnew_seq(annual, length_out = 3))
#'
#' # And only allow observed values.
#' xnew_data(data, xnew_seq(annual, length_out = 3, obs_only = TRUE))
#'
#' # With multiple variables all combinations are produced
#' xnew_data(data, period, xnew_seq(annual, length_out = 3, obs_only = TRUE))
#'
#' # To only preserve observed combinations use
#' xnew_data(data, xobs_only(period, annual))
#'
#' # And to cast the values use
#' xnew_data(data, xcast(annual = "3"))
xnew_data <- function(.data, ..., .length_out = NULL) {
  stopifnot(is.null(xnew_data_env$data))
  local_bindings(data = .data, .env = xnew_data_env)

  quos <- enquos(...)

  translated <- map(quos, quo_translate_xnew_data, .length_out)

  expand2(.data, !!!translated, .default = new_value, .order = TRUE)
}

quo_translate_xnew_data <- function(quo, length_out) {
  new_quosure(
    expr_translate_xnew_data(quo_get_expr(quo), length_out),
    quo_get_env(quo)
  )
}

expr_translate_xnew_data <- function(expr, length_out) {
  if (is_symbol(expr)) {
    expr(xnew_seq(!!expr, length_out = !!length_out))
  } else {
    expr
  }
}

# Environment to store the .data argument
xnew_data_env <- rlang::new_environment()
