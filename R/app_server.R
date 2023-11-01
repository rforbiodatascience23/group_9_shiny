#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic
  mod_plotModule1_server("plotModule1_1")
  mod_DNA_to_pep_server("DNA_to_pep_1")
}
