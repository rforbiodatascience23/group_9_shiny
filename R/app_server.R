#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic
  mod_plotModule1_server("plotModule1_1")

  output$abundance <- renderPlot({
    if(input$peptide == ""){
      NULL
    } else{
      input$peptide |>
        group9PackcentralDogma::aa_counts() +
        ggplot2::theme(legend.position = "none")
    }
  })
}
