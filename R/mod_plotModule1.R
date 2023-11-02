#' plotModule1 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_plotModule1_ui <- function(id){
  ns <- NS(id)
  tagList(
    shiny::sidebarLayout(
      shiny::sidebarPanel(
        shiny::textAreaInput(
          inputId = ns("peptide"),
          label = "Peptide sequence",
          width = 300,
          height = 100,
          placeholder = "Insert peptide sequence"
        )
      ),
      shiny::mainPanel(
        shiny::plotOutput(
          outputId = ns("abundance")
        )

      )
    )
  )
}

#' plotModule1 Server Functions
#'
#' @noRd
#' @importfrom ggplot2 theme
#' @import group9PackcentralDogma
mod_plotModule1_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    output$abundance <- renderPlot({
      if(input$peptide == ""){
        NULL
      } else{
        input$peptide |>
          group9PackcentralDogma::aa_counts() +
          ggplot2::theme(legend.position = "none")
      }
    })
    observeEvent(input$generate_dna, {
      dna(
        group9PackcentralDogma::dna_generator(input$dna_length)
      )
    })
  })
}

## To be copied in the UI
# mod_plotModule1_ui("plotModule1_1")

## To be copied in the server
# mod_plotModule1_server("plotModule1_1")
