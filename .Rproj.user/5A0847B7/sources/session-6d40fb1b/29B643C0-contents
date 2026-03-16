# Module UI.
plotHistUI <- function(id) {
  ns <- NS(id)
  plotOutput(ns("hist"))
}

# Module Server
plotHistServer <- function(id, data, var) {
  moduleServer(id, function(input, output, session) {
    output$hist <- renderPlot({
      req(var(), data())
      hist(data()[[var()]], main = paste("Histogramme de", var()), col = "skyblue")
    })
  })
}