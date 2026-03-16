# Module UI.
summaryUI <- function(id) {
  ns <- NS(id)
  verbatimTextOutput(ns("summary"))
}

# Module Server
summaryServer <- function(id, data, var) {
  moduleServer(id, function(input, output, session) {
    output$summary <- renderPrint({
      req(data(), var())
      variable <- var()
      if (is.numeric(data()[[variable]])) {
        summary(data()[[variable]])
      } else {
        cat("La variable sélectionnée n'est pas numérique.")
      }
    })
  })
}
