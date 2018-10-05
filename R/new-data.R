#' New Data
#'
#' Generates a new data frame that can be passed to a predict function.
#' The main idea is that most variables are held constant at a reference level
#' while the variables of interest vary across their range.
#' \code{new_data} can be thought of as a sophisticated version of \code{\link{expand.grid}}.
#'
#' The returned variables are of the same class as the original variables while
#' the rows in the data frame are unique. Consequently continuous variables such as integers
#' which have discrete values will not attain the specified \code{length_out} value if
#' there are too few possible values between the minimum and maximum.
#'
#' If a factor is named in seq then all levels of the factor are represented i.e.
#' \code{length_out} is ignored. The only exception to this is if the factor is named in \code{obs_only}
#' in which case only observed factor levels are permitted in sequences.
#'
#' It is worth noting that \code{ref} can be used to specify sequences for particular values as well
#' as single references. It is useful for extrapolating outside the range of the data or changes the levels of a factor.
#' If an element of ref is a character vector and the corresponding column is a data frame, then the ref element is assigned the same
#' factor levels as the column in the data. This is useful for choosing a factor level without having to set the correct levels.
#'
#' @param data The data frame to generate the new data from.
#' @param seq A character vector of the variables to represent as a sequence in the new data.
#' @param ref A named list of reference values for variables that are not in seq.
#' @param obs_only A list of character vectors indicating the sets of variables to only allow observed combinations for. If TRUE then obs_only is set to be seq.
#' @param length_out A count indicating the length of numeric and possibly integer sequences.
#' @return A tibble of the new data.
#' @examples
#' library(ggplot2)
#' library(newdata)
#'
#' mtcars <- datasets::mtcars
#'
#' model <- lm(mpg ~ wt + hp + poly(disp,2), data = mtcars)
#' summary(model)
#'
#' # generate a data frame across range of wt with other predictor
#' # variables held constant
#' wt <- new_data(mtcars, c("wt"))
#' head(wt)
#
#' wt <- cbind(wt, predict(model, newdata = wt, interval = "confidence"))
#
#' ggplot(data = wt, aes(x = wt, y = fit)) +
#'   geom_point(data = mtcars, aes(y = mpg)) +
#'   geom_line() +
#'   geom_line(aes(y = lwr), linetype = "dotted") +
#'   geom_line(aes(y = upr), linetype = "dotted") +
#'   ylab("mpg")
#'
#' # generate a data frame across range of wt with other predictor
#' # variables held constant
#' disp <- new_data(mtcars, c("disp"))
#' head(disp)
#'
#' disp <- cbind(disp, predict(model, newdata = disp, interval = "confidence"))
#
#' ggplot(data = disp, aes(x = disp, y = fit)) +
#'   geom_point(data = mtcars, aes(y = mpg)) +
#'   geom_line() +
#'   geom_line(aes(y = lwr), linetype = "dotted") +
#'   geom_line(aes(y = upr), linetype = "dotted") +
#'   ylab("mpg")
#' @export
new_data <- function(data, seq = character(0), ref = list(),
                     obs_only = list(character(0)), length_out = 30L) {

  length_out %<>% as.integer()

  check_data(data)
  check_vector(seq, "")
  if (!is.list(ref)) error("ref must be a list")
  if (identical(obs_only, TRUE)) obs_only <- list(seq)
  if (!is.list(obs_only)) error("obs_only must be a list")
  if (!all(vapply(obs_only, is.character, TRUE))) error("obs_only must be a list of character vectors")

  check_scalar(length_out, c(2L, 1000L))

  obs_only %<>% unique()

  if (!all(tibble::has_name(data, seq)))
    error("data missing names in seq")

  if (!all(tibble::has_name(data, names(ref))))
    error("data missing names in ref")

  if (!all(tibble::has_name(data, unique(unlist(obs_only)))))
    error("data missing names in obs_only")

  if (length(ref)) {
    if (!is.named(ref)) error("ref must be a named list")

    ref <- ref[!names(ref) %in% seq]

    if (length(ref)) {
      if (any(unique(unlist(obs_only)) %in% names(ref))) error("variables must not be in obs_only and ref")

      ref %<>% check_classes(data[names(ref)], x_name = "ref", y_name = "data")
    }
  }

  new_seqs <- lapply(data[names(data) %in% seq], new_seq, length_out)
  new_ref <- lapply(data[!names(data) %in% seq & !names(data) %in% names(ref)], new_value)

  new_data <- expand.grid(c(new_seqs, new_ref, ref),
                          KEEP.OUT.ATTRS = FALSE, stringsAsFactors = FALSE)

  for (obo in obs_only) new_data %<>% obs_only(data, obo)

  new_data <- new_data[names(data)] %>% tibble::as_data_frame()
  new_data
}
