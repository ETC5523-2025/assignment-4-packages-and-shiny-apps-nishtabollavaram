#' Penguin Measurements Dataset
#'
#' A cleaned dataset of body measurements for penguins observed in the **Palmer Archipelago**, Antarctica.
#' It accompanies the *penguinExplorer* package and is used in the interactive Shiny app.
#'
#' @details
#' This dataset records morphological traits for three penguin species:
#' Adelie, Chinstrap, and Gentoo. Each row represents one penguin observation.
#'
#' **Variables**
#' \itemize{
#'   \item \strong{species} — Species of penguin (Adelie, Chinstrap, Gentoo)
#'   \item \strong{island} — Island where the penguin was observed
#'   \item \strong{sex} — Male, Female, or Unknown
#'   \item \strong{year} — Year of observation
#'   \item \strong{body_mass_g} — Body mass (grams)
#' }
#'
#' @format A tibble with one row per penguin and eight columns.
#'
#' @source Adapted from the \pkg{palmerpenguins} dataset.
#'
#' @keywords datasets
"penguins"
