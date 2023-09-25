#' New Data
#'
#' Generates a new data frame that can be passed to a predict function.
#' The main idea is that most variables are held constant at a reference level
#' while the variables of interest vary across their range.
#' `new_data` can be thought of as a sophisticated version of [expand.grid()].
#'
#' The returned variables are of the same class as the original variables while
#' the rows in the data frame are unique.
#' Consequently continuous variables such as integers
#' which have discrete values will not attain the specified `length_out` value
#' if there are too few possible values between the minimum and maximum.
#'
#' If a factor is named in seq then all levels of the factor are represented
#' i.e. `length_out` is ignored. The only exception to this is
#' if the factor is named in `obs_only`
#' in which case only observed factor levels are permitted in sequences.
#'
#' It is worth noting that `ref` can be used to specify sequences
#' for particular values as well
#' as single references. It is useful for extrapolating outside
#' the range of the data or changes the levels of a factor.
#' If an element of ref is a character vector and the corresponding
#' column is a data frame, then the ref element is assigned the same
#' factor levels as the column in the data. This is useful for choosing
#' a factor level without having to set the correct levels.
#'
#' @param data The data frame to generate the new data from.
#' @param seq A character vector of the variables to represent as a sequence
#' in the new data.
#' @param ref A named list of reference values for variables
#' that are not in seq.
#' @param obs_only A list of character vectors indicating
#' the sets of variables to only allow observed combinations for.
#' If TRUE then obs_only is set to be seq.
#' @param length_out A count indicating the length of numeric
#' and possibly integer sequences.
#' @return A tibble of the new data.
#' @seealso [new_seq()] and [new_value()].
#' @examples
#' # an example data set
#' data <- tibble::tibble(
#'   vecint = c(1L, 3L),
#'   vecreal = c(1, 3),
#'   vecchar = c("b", "a"),
#'   vecdate = as.Date("2001-01-01", "2001-01-01"))
#'
#' # vary count while holding other values constant
#' new_data(data, "vecint")
#' # vary continual
#' new_data(data, "vecreal")
#' new_data(data, c("vecchar", "vecint"))
#' @export
new_data <- function(data, seq = character(0), ref = list(),
                     obs_only = list(character(0)), length_out = 30L) {
  length_out <- length_out %>% as.integer()

  chk_data(data)
  chk_character(seq)
  chk_list(ref)
  chk_whole_number(length_out)
  chk_range(length_out, c(2L, 1000L))
  if (isTRUE(obs_only)) obs_only <- list(seq)
  chk_list(obs_only)
  if (!all(vapply(obs_only, is.character, TRUE))) {
    err("`obs_only` must be a list of character vectors")
  }
  obs_only <- obs_only %>% unique()

  if (!all(has_name(data, seq))) {
    err("`data` missing names in `seq`")
  }

  if (!all(has_name(data, names(ref)))) {
    err("`data` missing names in `ref`")
  }

  if (!all(has_name(data, unique(unlist(obs_only))))) {
    err("`data` missing names in `obs_only`")
  }

  if (length(ref)) {
    if (!is_named(ref)) err("`ref` must be a named list")

    ref <- ref[!names(ref) %in% seq]

    if (length(ref)) {
      if (any(unique(unlist(obs_only)) %in% names(ref))) {
        err("variables must not be in `obs_only` and `ref`")
      }
      ref <- ref %>%
        check_classes(data[names(ref)], x_name = "ref", y_name = "data")
    }
  }

  new_seqs <- lapply(data[names(data) %in% seq], new_seq, length_out)
  new_ref <- lapply(
    data[!names(data) %in% seq & !names(data) %in% names(ref)],
    new_value
  )

  new_data <- expand.grid(c(new_seqs, new_ref, ref),
    KEEP.OUT.ATTRS = FALSE, stringsAsFactors = FALSE
  )

  for (obo in obs_only) {
    new_data <- new_data %>% obs_only(data, obo)
  }
  new_data <- new_data[names(data)] %>% as_tibble()
  new_data
}
