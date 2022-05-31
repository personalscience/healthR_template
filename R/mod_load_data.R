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
        uiOutput(ns("ask_for_csv"))
      )

    )

  )
}

#' @title Make a File Selection Object
#' @param item_id character string NS id for UI
#' @param label character string name on label
#' @return file selection object
file_selection <- function(item_id, label = "Which File?", ...){

  selected <- fileInput(inputId = item_id, label = label, ...)
  return(selected)
}


#' load_data Server Functions
#'
#' @noRd
mod_load_data_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    # Ask Filepath ----
    output$ask_for_csv<- renderUI({

      file_selection(item_id = ns("file_upload"), label = "CSV File", accept = ".csv")

    })

  })
}

## To be copied in the UI
# mod_load_data_ui("load_data_1")

## To be copied in the server
# mod_load_data_server("load_data_1")

#' @description Demo for mod_filter
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
