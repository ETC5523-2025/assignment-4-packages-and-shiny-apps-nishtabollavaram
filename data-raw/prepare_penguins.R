# data-raw/prepare_penguins.R
# This script cleans and prepares the penguins dataset for inclusion in the package.

# Loaded required packages
library(readr)
library(dplyr)
library(usethis)

penguins <- read_csv("data-raw/penguins.csv", show_col_types = FALSE) |>
  rename_with(tolower) |>
  mutate(
    species = as.factor(species),
    island  = as.factor(island),
    sex     = as.factor(sex),
    year    = suppressWarnings(as.integer(year))
  ) |>

  filter(!is.na(sex), sex != "Unknown") |>
  droplevels()

usethis::use_data(penguins, overwrite = TRUE)


  # Kept only relevant columns
  select(any_of(c("species", "island", "sex", "year",
                  "flipper_length_mm", "body_mass_g",
                  "bill_length_mm", "bill_depth_mm"))) %>%
  # Converted data types
  mutate(
    species = as.factor(species),
    island  = as.factor(island),
    sex     = forcats::fct_explicit_na(as.factor(sex), "Unknown"),
    year    = suppressWarnings(as.integer(year))
  )



# Saved as a package data
usethis::use_data(penguins, overwrite = TRUE)

