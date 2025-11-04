
# inst/app/app.R
library(shiny)
library(bslib)
library(ggplot2)
library(dplyr)

# Loaded packaged data
.pkg_data <- tryCatch(
  get("penguins", envir = asNamespace("penguinExplorer")),
  error = function(e) penguins
)

# Ensured there are no NA's
.pkg_data <- .pkg_data |> filter(!is.na(sex), sex != "Unknown") |> droplevels()

# Numeric columns for axes
.num_cols <- names(.pkg_data)[sapply(.pkg_data, is.numeric)]
if (length(.num_cols) < 1) .num_cols <- "body_mass_g"

ui <- navbarPage(
  title = "Penguin Explorer",
  theme = bs_theme(bootswatch = "flatly"),
  collapsible = TRUE,

  tabPanel(
    "Explore",
    fluidPage(
      fluidRow(
        column(
          width = 4,
          div(class = "p-3 border rounded-3 bg-light",
              h5("Use the controls to explore"),
              selectInput("species", "Species",
                          choices  = sort(unique(.pkg_data$species)),
                          selected = sort(unique(.pkg_data$species))[1]),
              selectInput("x", "X-axis", choices = .num_cols, selected = .num_cols[1]),
              selectInput("y", "Y-axis", choices = .num_cols,
                          selected = .num_cols[min(2, length(.num_cols))]),
              downloadButton("dl_csv", "Download filtered CSV")
          )
        ),
        column(
          width = 8,
          h4("What the fields mean"),
          tags$ul(
            tags$li(strong("Species:"), " subset of penguins to view"),
            tags$li(strong("X/Y axis:"), " numeric variables plotted against each other"),
            tags$li(strong("Sex colours:"), " Male/Female")
          ),
          h4("How to interpret"),
          p("Look for clusters by sex and differences across species. ",
            "Swap axes to see relationships change. ",
            "Heavier points at higher Y values indicate larger body mass."),
          plotOutput("scatter", height = 420),
          tags$small(class = "text-muted", uiOutput("caption")),
          tags$hr(),
          h4("Summary (mean of numeric columns by species)"),
          tableOutput("summary")
        )
      )
    )
  ),

  tabPanel(
    "About",
    fluidPage(
      h3("About this app"),
      p("Interactive explorer for the packaged dataset ",
        code("penguinExplorer::penguins"), ".")
    )
  )
)

server <- function(input, output, session) {
  filtered <- reactive({
    .pkg_data |> filter(species == input$species)
  })

  output$scatter <- renderPlot({
    req(input$x, input$y)
    df <- filtered()
    validate(
      need(input$x %in% names(df), "Selected X variable not in data."),
      need(input$y %in% names(df), "Selected Y variable not in data."),
      need(nrow(df) > 0, "No rows after filtering.")
    )
    ggplot(df, aes_string(x = input$x, y = input$y, colour = "sex")) +
      geom_point(size = 2.2, alpha = 0.9) +
      labs(x = input$x, y = input$y, colour = "Sex") +
      theme_minimal(base_size = 13) +
      theme(legend.position = "right")
  })

  output$caption <- renderUI({
    df <- filtered()
    tags$em(paste0("Plot shows ", nrow(df), " rows for species ", input$species, "."))
  })

  output$summary <- renderTable({
    .pkg_data |>
      group_by(species) |>
      summarise(across(where(is.numeric), ~ round(mean(.x, na.rm = TRUE), 2)))
  }, striped = TRUE)

  output$dl_csv <- downloadHandler(
    filename = function() paste0("penguins_", tolower(input$species), ".csv"),
    content  = function(file) write.csv(filtered(), file, row.names = FALSE)
  )
}

shinyApp(ui = ui, server = server)
