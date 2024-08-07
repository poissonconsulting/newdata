% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/xnew-value.R
\name{xnew_value}
\alias{xnew_value}
\title{Generate New Reference Value for \code{xnew_data()}}
\usage{
xnew_value(x, ...)
}
\arguments{
\item{x}{The object to generate the reference value from.}

\item{...}{Additional arguments passed to \code{\link[=new_value]{new_value()}}.}
}
\description{
Generate a new reference value for a vector.
}
\details{
\code{xnew_value()} is a wrapper function on \code{\link[=new_value]{new_value()}}
for use in \code{\link[=xnew_data]{xnew_data()}} to avoid
having to repeating the column name.
}
\examples{
data <- tibble::tibble(
  a = c(1L, 3L, 4L),
  b = c(4, 4.5, 6),
  d = c("a", "b", "c")
)

xnew_data(data, a, b = new_value(b), xnew_value(d))
}
\seealso{
\code{\link[=new_value]{new_value()}} and \code{\link[=xnew_data]{xnew_data()}}.
}
