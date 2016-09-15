classes <- function(x) lapply(x, class)
is.named <- function(x) !is.null(names(x))
factor_with_length_greater_than_1 <- function(x) is.factor(x) && length(x) > 1
