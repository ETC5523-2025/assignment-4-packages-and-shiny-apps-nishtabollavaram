#' Launched the Shiny app
#'
#' Opened the interactive Penguin Explorer included in this package.
#' @return Invisibly returns the result of shiny::runApp().
#' @export
run_app <- function() {
  pkg <- "penguinExplorer"
  app_dir <- system.file("app", package = pkg)
  if (app_dir == "" || !dir.exists(app_dir)) {
    stop("Could not find app directory. Ensure inst/app/app.R exists and reinstall the package.")
  }
  shiny::runApp(app_dir, display.mode = "normal")
}
