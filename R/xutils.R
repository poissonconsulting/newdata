expand_defaults <- function(data, quos, default) {
  default <- as_function(default)
  ptype <- tidyr::expand(dplyr::slice(data, 0), !!!quos)

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
