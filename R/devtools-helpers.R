# Copyright 2015-2023 Province of British Columbia
# Copyright 2021 Environment and Climate Change Canada
# Copyright 2023-2024 Australian Government Department of Climate Change,
# Energy, the Environment and Water
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#       https://www.apache.org/licenses/LICENSE-2.0
release_questions <- function() {
  c(
    "Have you run `data-raw/DATASET.R`?",
    "Have you confirmed all images in .Rmd files have alternative text defined using the `fig.alt` argument?",
  )
}
