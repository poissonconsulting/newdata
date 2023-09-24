check_classes <- function(x, y, x_name, y_name) {
  classes_x <- classes(x)
  classes_y <- classes(y)

  if (identical(classes_x, classes_y)) {
    return(x)
  }

  character <- classes_x == "character" & classes_x != classes_y

  if (!identical(classes_x[!character], classes_y[!character])) {
    error("classes of variables in ", x_name, " must match those in ", y_name)
  }

  if (!all(vapply(y[character], is_factor, TRUE))) {
    error("classes of variables in ", x_name, " must match those in ", y_name)
  }

  x[character] <- x[character] %>%
    mapply(FUN = as_factor, y[character], SIMPLIFY = FALSE)
  x
}
