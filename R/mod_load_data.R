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
      h1("This is a new app"),
      fluidRow(
        uiOutput(ns("ask_for_csv")),
        fileInput(ns("ask_filename_notes"), label = "Choose Notes File", accept = ".csv"))
    )

  )
}

#' load_data Server Functions
#'
#' @noRd
mod_load_data_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    # Ask Filepath ----
    output$ask_for_libreview_csv<- renderUI({

      file_selection(item_id = ns("file_upload"), label = "CSV File", accept = ".csv")

    })

  })
}

## To be copied in the UI
# mod_load_data_ui("load_data_1")

## To be copied in the server
# mod_load_data_server("load_data_1")


demo_load_data <- function() {

  ui <- mod_load_data_ui("load_data_1")
  server <- function(input, output, session) {
    mod_load_data_server("load_data_1")
  }
  shinyApp(ui, server)
}
