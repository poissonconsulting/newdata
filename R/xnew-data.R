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
#' Naming an argument generates a new column of that name
#' rather than varying an existing column.
#' A bare vector or a one column data frame becomes the new column,
#' so `Annual = annual` keeps `annual` at its reference value and adds
#' `Annual` varying across its range.
#' A data frame with more than one column, such as the result of
#' [tidyr::nesting()], is packed into a data frame column of that name.
#' An argument that evaluates to `NULL` is dropped.
#'
#' @param .data The data frame to generate the new data from.
#' @param .length_out NULL or a count specifying the maximum length
#' of all sequences.
#' @param ... A list of variables to generate sequences for.
#' @return A tibble of the new data.
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
#' xnew_data(data, xnew_seq(annual, .length_out = 3))
#'
#' # And only allow observed values.
#' xnew_data(data, xnew_seq(annual, .length_out = 3, .obs_only = TRUE))
#'
#' # With multiple variables all combinations are produced
#' xnew_data(data, period, xnew_seq(annual, .length_out = 3, .obs_only = TRUE))
#'
#' # Naming a variable generates a new column of that name
#' xnew_data(data, Annual = annual)
#'
#' # The new variable can be generated using an external vector, too
#' new_annual <- unique(data$annual)
#' xnew_data(data, Annual = new_annual)
#'
#' # To only preserve observed combinations use
#' xnew_data(data, xobs_only(period, annual))
#'
#' # And to cast the values use
#' xnew_data(data, xcast(annual = "3"))
xnew_data <- function(.data, ..., .length_out = NULL) {
  stopifnot(is.null(xnew_data_env$data))
  local_bindings(data = .data, .env = xnew_data_env)

  exprs <- enexpr(...)

  # the argument name is applied to the value itself by xnew_column() so the
  # outer name is dropped to stop tidyr::expand() packing it into a df column
  translated <- unname(imap(quos, quo_translate_xnew_data, .length_out))

  expand2(.data, !!!translated, .default = new_value, .order = TRUE)
}

quo_translate_xnew_data <- function(quo, name, length_out) {
  expr <- quo_get_expr(quo)
  if (is_symbol(expr)) {
    expr <- expr(xnew_seq(!!expr, .length_out = !!length_out))
  }
  quo <- new_quosure(expr, quo_get_env(quo))
  if (!nzchar(name)) {
    return(quo)
  }
  # the user's quosure is nested inside one evaluated in the package namespace
  # so that the internal xnew_column() is in scope
  new_quosure(expr(xnew_column(!!quo, !!name)), ns_env("newdata"))
}

# A named argument must reach tidyr::expand() as a one column data frame.
# expand() sorts and deduplicates either way, but expands a bare factor vector
# to all of its levels, which discards .length_out and .obs_only.
xnew_column <- function(x, name) {
  if (is.null(x)) {
    return(NULL)
  }
  if (is.data.frame(x) && ncol(x) == 1L) {
    return(set_names(x, name))
  }
  tibble::tibble(!!name := x)
}

# Environment to store the .data argument
xnew_data_env <- rlang::new_environment()
