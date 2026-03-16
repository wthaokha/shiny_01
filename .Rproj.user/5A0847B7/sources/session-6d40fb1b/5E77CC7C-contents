# Module UI.
downloadUI <- function(id) {
  ns <- NS(id)
  downloadButton(ns("download"), "Télécharger CSV")
}

# Module Server
downloadServer <- function(id, data) {
  moduleServer(id, function(input, output, session) {
    output$download <- downloadHandler(
      filename = function() {
        paste0("donnees_filtrees_", Sys.Date(), ".csv")
      },
      content = function(file) {
        req(data())
        write.csv(data(), file, row.names = FALSE)
      }
    )
  })
}
