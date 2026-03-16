# Module UI.
filterUI <- function(id) {
  ns <- NS(id)
  sliderInput(ns("mpg_range"), "Filtrer mpg :", min = 0, max = 50, value = c(10, 35))
}

# Module Server
filterServer <- function(id, data) {
  moduleServer(id, function(input, output, session) {
    observe({
      req(data())
      updateSliderInput(session, "mpg_range", 
                        min = floor(min(data()$mpg)), 
                        max = ceiling(max(data()$mpg)), 
                        value = range(data()$mpg))
    })
    
    filteredData <- reactive({
      req(data())
      d <- data()
      d[d$mpg >= input$mpg_range[1] & d$mpg <= input$mpg_range[2], ]
    })
    
    return(filteredData)
  })
}
