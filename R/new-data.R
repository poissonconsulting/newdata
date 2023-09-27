#' Generate New Data
#'
#' Generates a new data frame (in the form of a tibble) with each variable
#' held constant or varying as a unique ordered sequence.
#' All possible unique combinations are included and the columns
#' are in the same order as those in `data` with new columns added from
#' `ref`.
#'
#' It is worth noting that `ref` can be used to specify reference values
#' as well as sequences.
#' The `ref` argument is useful for introducing new variables,
#' overriding the default reference values, extrapolating outside
#' the range of the data and/or changing the levels of a factor
#' or time zone of a POSIXct vector.
#' If an element of `ref` is a character vector and the corresponding
#' column is a data frame, then the ref element is assigned the same
#' factor levels as the column in the data. This is useful for choosing
#' a factor level without having to set the correct levels.
#'
#' @param data The data frame to generate the new data from.
#' @param seq A character vector of the variables in `data` to generate
#' sequences for or a named integer vector of the maximum length for each
#' sequence where each name is the respective variable.
#' @param ref A named list of vectors to add to the new data frame.
#' The variables must not be in
#' `seq` but they do not need to be in `data`.
#' @param obs_only A character vector specifying the
#' character, factor, and ordered (factor) variables in `seq` that
#' should only be represented by their unique combinations or a list
#' of character vectors specifying the groupings of character, factor
#' and ordered (factor) variables in `seq` that should each only
#' be represented by their unique combinations.
#' If `TRUE` it is set to be all character, factor,
#' and ordered (factor) variables specified in `seq`.
#' @param length_out A count indicating the maximum length of sequences for all
#' types of variables except character, factor and ordered factors.
#' If the maximum length for each variable is specified in `seq`
#' then `length_out` is ignored.
#' @return A tibble of the new data.
#' @seealso [new_value()] and [new_seq()].
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
new_data <- function(
    data,
    seq = character(0),
    ref = list(),
    obs_only = list(character(0)),
    length_out = 30) {
  chk_data(data)
  chk_count(length_out)
  chk_character(seq)
  chk_list(ref)
  chk_range(length_out, c(2L, 1000L))
  if (isTRUE(obs_only)) obs_only <- list(seq)
  chk_list(obs_only)
  if (!all(vapply(obs_only, is.character, TRUE))) {
    err("`obs_only` must be a list of character vectors")
  }
  length_out <- length_out %>% as.integer()
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

    if (any(unique(unlist(obs_only)) %in% names(ref))) {
      err("variables must not be in `obs_only` and `ref`")
    }
    ref <- ref %>%
      check_classes(data[names(ref)], x_name = "ref", y_name = "data")
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
