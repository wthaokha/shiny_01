# Module UI.
uploadUI <- function(id) {
  ns <- NS(id)
  fileInput(ns("file"), "Téléverser un fichier CSV", accept = ".csv")
}

# Module Server
uploadServer <- function(id) {
  moduleServer(id, function(input, output, session) {
    data <- reactive({
      req(input$file)
      tryCatch({
        read.csv(input$file$datapath, stringsAsFactors = FALSE)
      }, error = function(e) {
        showNotification("Erreur lors du chargement du fichier", type = "error")
        NULL
      })
    })
    return(data)
  })
}