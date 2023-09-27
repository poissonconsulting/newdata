check_classes <- function(x, y, x_name, y_name) {
  classes_x <- classes(x)
  classes_y <- classes(y)

  if (identical(classes_x, classes_y)) {
    return(x)
  }

  character <- classes_x == "character" & classes_x != classes_y

  if (!identical(classes_x[!character], classes_y[!character])) {
    err(
      "classes of variables in `", x_name, "` must match those in `",
      y_name, "`"
    )
  }

  if (!all(map_lgl(y[character], is_factor))) {
    err("classes of variables in ", x_name, " must match those in ", y_name)
  }

  x[character] <- map2(x[character], y[character], as_factor)
  x
}
