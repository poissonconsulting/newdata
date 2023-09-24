obs_only <- function(new_data, data, obo) {
  data <- data[names(data) %in% obo]
  if (ncol(data)) {
    new_data <- new_data %>% merge(unique(data), by = obo)
  }
  new_data
}
