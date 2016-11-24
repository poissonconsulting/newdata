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
#' \code{length_out} is ignored. The only exception to this is if \code{obs_only = TRUE}
#' in which case only observed factor levels are permitted in sequences.
#' If multiple factors occur as sequences only observed combinations of those factors are permitted.
#'
#' It is worth noting that \code{ref} can be used to specify sequences for particular values as well
#' as single references. It is useful for extrapolating outside the range of the data.
#'
#' @param data The data frame to generate the new data from.
#' @param seq A character vector of the variables to represent as a sequence in the new data.
#' @param ref A named list of reference values for variables that are not in seq.
#' @param obs_only A flag indicating whether to only allow observed combinations of factor levels in the new data.
#' @param length_out A count indicating the length sequences.
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

  if (obs_only) new_data %<>% obs_only(data, seq)

  new_data <- new_data[names(data)] %>% tibble::as_data_frame()
  new_data
}
