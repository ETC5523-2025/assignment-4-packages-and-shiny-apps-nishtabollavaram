#' Penguin Measurements Dataset
#'
#' A cleaned dataset containing body measurements of penguins observed in the
#' **Palmer Archipelago**, Antarctica. It accompanies the *penguinExplorer*
#' package and is used within the interactive Shiny app for visual exploration.
#'
#' @details
#' The dataset records morphological traits for three penguin species,
#' Adelie, Chinstrap and Gentoo that are collected as part of field studies in the
#' Palmer Archipelago. Each row represents one penguin observation.
#'
#' **Variables**
#' \itemize{
#'   \item \strong{species} — Species of penguin (*Adelie*, *Chinstrap*, *Gentoo*)
#'   \item \strong{island} — Island where the penguin was observed
#'   \item \strong{sex} — Male, Female, or Unknown
#'   \item \strong{year} — Observation year
#'   \item \strong{body_mass_g} — Body mass in grams
#' }
#'
#' @format A tibble with 344 rows and 5 columns, each representing an individual
#' penguin and its recorded attributes.
#'
#' @source Adapted from the \pkg{palmerpenguins} dataset.
#'
#' @keywords datasets
"penguins"
