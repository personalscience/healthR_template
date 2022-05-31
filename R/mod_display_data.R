#' display_data UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_display_data_ui <- function(id){
  ns <- NS(id)
  tagList(
    h1("This is my new plot")

  )
}

#' display_data Server Functions
#'
#' @noRd
mod_display_data_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

  })
}

## To be copied in the UI
# mod_display_data_ui("display_data_1")

## To be copied in the server
# mod_display_data_server("display_data_1")

#' @description Demo for mod_display_data
#' @noRd
#'
demo_display_data <- function() {

  # Handle any unfinished business when the app closes.  Often useful for closing database connections.
  onStop(function(){message("gracefully exiting...")})

  ui <- fluidPage(
    #tags$title("this is a new app"),
    mod_display_data_ui("display_data_1")
  )
  server <- function(input, output, session) {
    mod_display_data_server("display_data_1")
  }
  shinyApp(ui, server)


}

