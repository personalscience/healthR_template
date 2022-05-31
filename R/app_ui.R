#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic

    navbarPage(id = "navbarpage",
               title = tagList(
                 tags$title("Personal Science"),
                 a(
                   alt = "Personal Science",
                   href = "#",
                   img(src = "www/PSILogo300.png",
                       filetype = "image/png",
                       width = "75%"))
               ),
               collapsible = TRUE,
               inverse = TRUE,

               theme = bslib::bs_theme(bootswatch = "cerulean"),


               tabPanel("Read Data",
                        fluidPage(
                          #Application title
                          mod_load_data_ui("load_data_1")
                        ))

    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "healthR_template"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
