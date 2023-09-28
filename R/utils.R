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
