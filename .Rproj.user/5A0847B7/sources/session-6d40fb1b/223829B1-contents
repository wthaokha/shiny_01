# Module UI.
selectVarUI <- function(id) {
  ns <- NS(id)
  selectInput(ns("variable"), "Choisir une variable numérique :", choices = NULL)
}

# Module Server
selectVarServer <- function(id, data) {
  moduleServer(id, function(input, output, session) {
    observe({
      req(data())
      # Garder uniquement les colonnes numériques
      num_vars <- names(data())[sapply(data(), is.numeric)]
      updateSelectInput(session, "variable", choices = num_vars)
    })
    
    return(reactive({ input$variable }))
  })
}
