# data-raw/prepare_penguins.R
# This script cleans and prepares the penguins dataset for inclusion in the package.

# Load required packages
library(readr)
library(dplyr)
library(usethis)

library(dplyr)
library(readr)

penguins <- read_csv("data-raw/penguins.csv", show_col_types = FALSE) |>
  rename_with(tolower) |>
  mutate(
    species = as.factor(species),
    island  = as.factor(island),
    sex     = as.factor(sex),
    year    = suppressWarnings(as.integer(year))
  ) |>
  # REMOVE missing or "Unknown" sex rows forever
  filter(!is.na(sex), sex != "Unknown") |>
  droplevels()

usethis::use_data(penguins, overwrite = TRUE)


  # Step 3: Keep only relevant columns
  select(any_of(c("species", "island", "sex", "year",
                  "flipper_length_mm", "body_mass_g",
                  "bill_length_mm", "bill_depth_mm"))) %>%
  # Step 4: Convert data types
  mutate(
    species = as.factor(species),
    island  = as.factor(island),
    sex     = forcats::fct_explicit_na(as.factor(sex), "Unknown"),
    year    = suppressWarnings(as.integer(year))
  )



# Step 5: Save as package data (.rda file in /data)
usethis::use_data(penguins, overwrite = TRUE)

# ✅ After sourcing this file, you should see:
# A new file created: data/penguins.rda

