#' Launch the Shiny App
#'
#' Opens the interactive **Penguin Explorer** included in this package.
#'
#' @details
#' The Shiny app allows users to explore species-level differences in body
#' measurements, filter observations by sex or island, and visualize patterns
#' interactively. It demonstrates how to turn static analysis into an
#' interactive, data-driven exploration.
#'
#' @return Invisibly returns the result of \code{shiny::runApp()}.
#' @export
run_app <- function() {
  pkg <- "penguinExplorer"
  app_dir <- system.file("app", package = pkg)
  if (app_dir == "" || !dir.exists(app_dir)) {
    stop("Could not find app directory. Ensure inst/app/app.R exists and reinstall the package.")
  }
  shiny::runApp(app_dir, display.mode = "normal")
}
