obs_only <- function(new_data, data, obo) {
  data <- data[names(data) %in% obo]
  if (ncol(data))
    new_data %<>% dplyr::inner_join(unique(data), by = obo)
  new_data
}
