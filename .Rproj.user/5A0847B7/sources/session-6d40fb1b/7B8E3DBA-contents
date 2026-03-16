# Module UI.
datatableUI <- function(id) {
  ns <- NS(id)
  DT::dataTableOutput(ns("table"))
}

# Module Server
datatableServer <- function(id, data) {
  moduleServer(id, function(input, output, session) {
    output$table <- DT::renderDataTable({
      req(data())
      DT::datatable(data(), options = list(pageLength = 10))
    })
  })
}
