# Backports for R <= 4.2
as.Date <- function(x, ...) {
  base::as.Date(x, ..., origin = structure(0, class = "Date"))
}

as.POSIXct <- function(x, ...) {
  base::as.POSIXct(x, ..., origin = structure(0, class = c("POSIXct", "POSIXt")))
}

ordered <- function(x = character(), ...) {
  base::ordered(x, ...)
}

classes <- function(x) map_chr(x, function(x) class(x)[[1]])

is_factor <- function(x) is.factor(x) || is.ordered(x)

as_factor <- function(x, y) {
  if (is.factor(y)) {
    return(factor(x, levels = levels(y)))
  }
  ordered(x, levels = levels(y), ordered = TRUE)
}

seq1 <- function(x, length_out, integer = FALSE) {
  if(length_out == 1) {
    return(mean(x, na.rm = TRUE))
  }
  range <- range(x, na.rm = TRUE)
  from <- range[1]
  to <- range[2]
  if(integer) {
    length_out <- min(length_out, to - from + 1L)
  }
  out <- seq(
    from = from,
    to = to,
    length.out = length_out
  ) %>%
    unique()
}
