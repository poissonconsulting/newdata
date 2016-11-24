obs_only <- function(new_data, data, seq) {
  data <- data[vapply(data, factor_with_length_greater_than_1, TRUE)]
  data <- data[names(data) %in% seq]
  if (ncol(data))
    new_data %<>% dplyr::inner_join(unique(data), by = names(data))
  new_data
}
