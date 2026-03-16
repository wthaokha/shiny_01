library(shiny)

# Charger les modules
source("modules/select_var_module.R")
source("modules/plot_hist_module.R")
source("modules/filter_module.R")
source("modules/upload_module.R")  # Nouveau module
source("modules/datatable_module.R")
source("modules/summary_module.R")
source("modules/download_module.R")

ui <- fluidPage(
  titlePanel("Shiny Modules avec Import CSV"),
  
  sidebarLayout(
    sidebarPanel(
      uploadUI("upload"),       # Téléversement CSV
      filterUI("filt"),         # Filtrer mpg
      selectVarUI("selector")   # Sélection variable
    ),
    mainPanel(
      plotHistUI("histogram"),  # Histogramme
      tags$hr(),
      h4("Tableau interactif :"),
      datatableUI("tableau"), 
      tags$hr(),
      h4("Résumé statistique :"),
      summaryUI("resume"), 
      downloadUI("telechargement")
      
    )
  )
)

server <- function(input, output, session) {
  # Soit les données importées, soit mtcars par défaut
  userData <- uploadServer("upload")
  
  dataset <- reactive({
    data <- userData()
    if (is.null(data)) mtcars else data
  })
  
  filtered <- filterServer("filt", dataset)
  selectedVar <- selectVarServer("selector", filtered)
  plotHistServer("histogram", filtered, selectedVar)

  datatableServer("tableau", filtered)
  
  summaryServer("resume", filtered, selectedVar)
  downloadServer("telechargement", filtered)
}



shinyApp(ui, server)

