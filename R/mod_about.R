#' about UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_about_ui <- function(id){
  ns <- NS(id)
  tagList(
  h1("About This App")
  )
}

#' about Server Functions
#'
#' @noRd
mod_about_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

  })
}

## To be copied in the UI
# mod_about_ui("about_1")

## To be copied in the server
# mod_about_server("about_1")

#' @description Demo for mod_about
#' @noRd
#'
demo_about <- function() {

  # Handle any unfinished business when the app closes.  Often useful for closing database connections.
  onStop(function(){message("gracefully exiting...")})

  ui <- fluidPage(
    #tags$title("this is a new app"),
    mod_about_ui("about_1")
  )
  server <- function(input, output, session) {
    mod_about_server("about_1")
  }
  shinyApp(ui, server)


}
