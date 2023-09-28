new_tseq <- function(x, ...) {
  expr <- ensym(x)
  out <- new_seq(x, ...)
  tibble::tibble(!!expr := out)
}

expand_defaults <- function(data, quos, default) {
  default <- as_function(default)
  ptype <- tidyr::expand(data[0, ], !!!quos)

  default_names <- setdiff(names(data), names(ptype))
  default_values <- map(data[default_names], default)

  quo(tidyr::nesting(tibble::tibble_row(!!!default_values)))
}

expand2 <- function(.data, ..., .default = NULL, .order = FALSE) {
  quos <- enquos(...)
  stopifnot(rlang::is_bool(.order))

  if (!is.null(.default)) {
    quos <- c(quos, expand_defaults(.data, quos, .default))
  }

  out <- tidyr::expand(data, !!!quos)

  if (.order) {
    out <- dplyr::select(out, !!!names(.data), !!!setdiff(names(out), names(.data)))
  }

  out
}

expand3 <- function(.data, ..., .filter = NULL) {
  filter_quo <- enquo(.filter)

  out <- expand2(.data, ...)

  if (!quo_is_null(filter_quo)) {
    out <- dplyr::filter(out, !!filter_quo)
  }

  out
}

auto_expand <- function(.data, ..., .filter = NULL) {
  expand3(.data, ..., .filter = {{ .filter }}, .default = new_value, .order = TRUE)
}
