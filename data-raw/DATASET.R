## code to prepare `DATASET` dataset goes here

old_data <- tibble::tibble(
  lgl = c(TRUE, FALSE, NA),
  int = c(1L, 4L, 6L),
  dbl = c(1, 4.5, 8.2),
  chr = c("most", "most", "a rarity"),
  fct = factor(chr, levels = c("not obs", "a rarity", "most")),
  ord = ordered(chr, levels = c("not obs", "a rarity", "most")),
  dte = as.Date(int),
  dtt = as.POSIXct(int, tz = "PST8PDT"),
  hms = hms::as_hms(int)
)

usethis::use_data(old_data, overwrite = TRUE)
