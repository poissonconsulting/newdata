#' New Data
#'
#' Generates a new data frame that can be passed to a predict function.
#'
#' @param data The data frame to generate the new data from.
#' @param seq A character vector of the variables to represent using a sequence in the new data.
#' @param ref A named list of reference values for variables that are not in seq.
#' @param obs_only A flag indicating whether to only allow observed combinations of factor levels in the new data.
#' @param length_out A count indicating the length of numeric and maximum length of integer sequences.
#' @return A tibble of the new data.
#' @export
new_data <- function(data, seq = character(0), ref = list(),
                     obs_only = FALSE, length_out = 30L) {

  length_out %<>% as.integer()

  check_data1(data); check_vector(seq, "", min_length = 0);
  if (!is.list(ref)) stop("ref must be a list")
  check_flag(obs_only); check_scalar(length_out, 2L, 1000L)

  if (!all(tibble::has_name(data, seq)))
    stop("data missing names in seq", call. = FALSE)

  if (!all(tibble::has_name(data, names(ref))))
    stop("data missing names in ref", call. = FALSE)

  if (length(ref)) {
    if (!is.named(ref)) stop("ref must be a named list", call. = FALSE)
    if (!identical(classes(ref), classes(data[names(data) %in% names(ref)])))
      stop("classes of variables in ref must match those in data", call. = FALSE)
  }

  new_seqs <- lapply(data[names(data) %in% seq], new_seq, length_out)
  new_ref <- lapply(data[!names(data) %in% seq & !names(data) %in% names(ref)], new_value)

  ref <- ref[!names(ref) %in% seq]

  new_data <- expand.grid(c(new_seqs, new_ref, ref),
                          KEEP.OUT.ATTRS = FALSE, stringsAsFactors = FALSE)

  if (obs_only) new_data %<>% obs_only(data)

  new_data <- new_data[names(data)] %>% tibble::as_data_frame()
  new_data
}
