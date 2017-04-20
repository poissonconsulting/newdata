classes <- function(x) vapply(x, function(x) class(x)[1], "1")
is.named <- function(x) !is.null(names(x))

is_factor <- function(x) is.factor(x) || is.ordered(x)

as_factor <- function(x, y) {
  if (is.factor(y)) return(factor(x, levels = levels(y)))
  ordered(x, levels = levels(y), ordered = TRUE)
}

error <- function(...) {
  stop(..., call. = FALSE)
}
