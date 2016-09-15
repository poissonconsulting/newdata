obs_only <- function(new_data, data) {
  data <- data[vapply(data, factor_with_length_greater_than_1, TRUE)]
  if (ncol(data))
    new_data %<>% dplyr::inner_join(data, by = names(data))
  new_data
}
