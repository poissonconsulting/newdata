#' Generate New Data
#'
#' Generates a new data frame (in the form of a tibble) with each variable
#' held constant or varying as a unique ordered sequence.
#' All possible unique combinations are included and the columns
#' are in the same order as those in `data`.
#'
#' All arguments except seq have been deprecated for the `x` versions.
#' The `new_data(data, c("a", "b"))` is a wrapper function for
#' `xnew_data(data, a, b)` to allow a string of column names to be passed.
#'
#' @param data The data frame to generate the new data from.
#' @param seq A character vector of the variables in `data` to generate
#' sequences for.
#' @param ref A named list of reference values for variables that are not in seq. `r lifecycle::badge("deprecated")`
#' @param obs_only A list of character vectors indicating the sets of variables
#' to only allow observed combinations for.
#' If TRUE then obs_only is set to be seq. `r lifecycle::badge("deprecated")`
#' @param length_out A count indicating the maximum length of sequences for all
#' types of variables except logical, character, factor and ordered factors. `r lifecycle::badge("deprecated")`
#' @return A tibble of the new data.
#' @seealso [new_value()] and [new_seq()].
#' @examples
#'
#' # vary count while holding other values constant
#' new_data(old_data, "int")
#' # vary continual
#' new_data(old_data, "dbl")
#' new_data(old_data, c("int", "dbl"))
#' @export
new_data <- function(
    data,
    seq = character(0),
    ref = list(),
    obs_only = list(character(0)),
    length_out = 30) {

  if (!missing(ref)) {
    lifecycle::deprecate_soft(
      "0.0.0.9020", "new_data(ref)",
      details = "Use `xnew_data(data, col_name = 'new_value')`"
    )
  }

  if (!missing(obs_only)) {
    lifecycle::deprecate_soft(
      "0.0.0.9020", "new_data(obs_only)",
      details = "Use `xnew_data(data, xobs_only(col_name))`"
    )
  }

  if (!missing(length_out)) {
    lifecycle::deprecate_soft(
      "0.0.0.9020", "new_data(length_out)",
      details = "Use `xnew_data(data, xnew_seq(col_name, length_out = 30))`"
    )
  }

  chk_data(data)
  chk_count(length_out)
  chk_character(seq)
  chk_list(ref)
  chk_range(length_out, c(2L, 1000L))
  if (isTRUE(obs_only)) obs_only <- list(seq)
  chk_list(obs_only)
  if (!all(map_lgl(obs_only, is.character))) {
    err("`obs_only` must be a list of character vectors")
  }

  if(missing(ref) && missing(obs_only) && missing(length_out)) {
    # TODO: use xnew_data
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

    if(any(names(ref) %in% seq)) {
      wrn("`ref` should not contain variables in `seq`")
    }

    ref <- ref[!names(ref) %in% seq]

    if (any(unique(unlist(obs_only)) %in% names(ref))) {
      err("variables must not be in `obs_only` and `ref`")
    }
    ref <- ref %>%
      check_classes(data[names(ref)], x_name = "ref", y_name = "data")
  }

  ops <- options(
    new_data.length_out_lgl = 2L,
    new_data.length_out_int = length_out,
    new_data.length_out_dbl = length_out,
    new_data.length_out_chr = Inf,
    new_data.obs_only = FALSE
  )
  on.exit(options(ops))

  new_seqs <- lapply(data[names(data) %in% seq], new_seq)
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
