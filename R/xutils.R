expand_defaults <- function(data, quos, default) {
  default <- as_function(default)
  ptype <- tidyr::expand(data[0, ], !!!quos)

  default_names <- setdiff(names(data), names(ptype))
  default_values <- map(data[default_names], default)

  quo(tibble::tibble_row(!!!default_values))
}

expand2 <- function(.data, ..., .default = NULL, .order = FALSE) {
  quos <- enquos(...)
  stopifnot(rlang::is_bool(.order))

  if (!is.null(.default)) {
    quos <- c(quos, expand_defaults(.data, quos, .default))
  }

  out <- tidyr::expand(.data, !!!quos)

  if (.order) {
    out <- dplyr::select(out, !!!names(.data), !!!setdiff(names(out), names(.data)))
  }

  out
}

semi_crossing <- function(..., .data = xnew_data_env$data) {
  if (is.null(.data)) {
    err("`semi_crossing()` can only be called from `xnew_data()`")
  }

  out <- tidyr::crossing(...)
  dplyr::semi_join(out, .data, by = intersect(names(out), names(.data)))
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
