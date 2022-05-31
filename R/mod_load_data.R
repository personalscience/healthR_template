#' load_data UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_load_data_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidPage(
      h1("Read your new data here"),
      fluidRow(
        uiOutput(ns("ask_for_csv")),
        hr(),
        wellPanel(dataTableOutput(ns("dataTable")))
      )

    )

  )
}


#' load_data Server Functions
#'
#' @noRd
mod_load_data_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    # Ask for csv ----
    output$ask_for_csv<- renderUI({

      file_selection(item_id = ns("datafile_upload"), label = "CSV File", accept = ".csv")

    })

    # data_df_raw : Read Raw ----

    data_df_raw <- reactive({
      validate(
        need(input$datafile_upload, "Upload a file please")
      )
      new_df <- data_read_csv(input$datafile_upload$datapath)
    }
    )

    # output$glucoseTable ----
    output$dataTable <- renderDataTable({

      data_df_raw()
    },
    options = list(pageLength = 5)
    )

  })
}

## To be copied in the UI
# mod_load_data_ui("load_data_1")

## To be copied in the server
# mod_load_data_server("load_data_1")



#' @title Make a File Selection Object
#' @param item_id character string NS id for UI
#' @param label character string name on label
#' @param ... additional arguments if you want them
#' @return file selection object
file_selection <- function(item_id, label = "Which File?", ...){

  selected <- fileInput(inputId = item_id, label = label, ...)
  return(selected)
}

#' @title Read a csv file
#' @param filename character string
#' @importFrom readr read_csv
#' @return dataframe of whatever CSV file it read.
data_read_csv <- function(filename) {
  readr::read_csv(file = filename)

}


#' @description Demo for mod_load_data
#' @noRd
#'
demo_load_data <- function() {

  # Handle any unfinished business when the app closes.  Often useful for closing database connections.
  onStop(function(){message("gracefully exiting...")})

  ui <- fluidPage(
    #tags$title("this is a new app"),
    mod_load_data_ui("load_data_1")
  )
  server <- function(input, output, session) {
    mod_load_data_server("load_data_1")
  }
  shinyApp(ui, server)


}
