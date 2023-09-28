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
  out <- if(length_out == 1) {
    mean(x, na.rm = TRUE)
  } else {
    range <- range(x, na.rm = TRUE)
    from <- range[1]
    to <- range[2]
    if(integer) {
      length_out <- min(length_out, to - from + 1L)
    }
    seq(from = from, to = to, length.out = length_out)
  }
  if(integer) {
    out <- out %>%
      as.integer()
    return(out)
  }
  unique(out)
}

obs_only1 <- function(x, length_out, first = FALSE) {
  x <- x[!is.na(x)]
  out <- x %>%
    unique() %>%
    sort()

  n <- length(out)
  if(n > length_out) {
    if(first) {
      out <- out[1:length_out]
    } else {
      out <- out[seq1(c(1,n), length_out = length_out, integer = TRUE)]
    }
  }
  out
}
