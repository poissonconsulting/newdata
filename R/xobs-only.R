#' Generate Observed Combinations Only
#'
#' @param ... One or more variables to generate combinations for.
#' @param .length_out A count to override the default length of sequences.
#' @inheritParams xcast
#' @seealso [xnew_data()]
#' @export
#' @examples
#' data <- tibble::tibble(
#'   period = factor(c("before", "before", "after", "after"),
#'     levels = c("before", "after")
#'   ),
#'   annual = factor(c(1, 3, 5, 8), levels = c(1, 3, 5, 8))
#' )
#' xnew_data(data, period, annual)
#' xnew_data(data, xobs_only(period, annual))
#' xnew_data(data, xobs_only(period, xnew_seq(annual, length_out = 3)))
xobs_only <- function(..., .length_out = NULL, .data = xnew_data_env$data) {
  quos <- enquos(...)

  translated <- map(quos, quo_translate_xobs_only, .length_out)

  out <- semi_crossing(!!!translated)
  xcast(out, .data = .data)
}

quo_translate_xobs_only <- function(quo, length_out) {
  new_quosure(
    expr_translate_xobs_only(quo_get_expr(quo), length_out),
    quo_get_env(quo)
  )
}

expr_translate_xobs_only <- function(expr, length_out) {
  if (is_symbol(expr)) {
    expr(xnew_seq(!!expr, length_out = !!length_out, obs_only = TRUE))
  } else {
    expr
  }
}

semi_crossing <- function(..., .data = xnew_data_env$data) {
  if (is.null(.data)) {
    err("`semi_crossing()` can only be called from `xnew_data()`")
  }

  out <- tidyr::crossing(...)
  dplyr::semi_join(out, .data, by = intersect(names(out), names(.data)))
}
