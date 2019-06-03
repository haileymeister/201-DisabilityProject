# Load packages
library(shiny)

source("./scripts/age_range.R")

server <- function(input, output) {
  output$neighborhood <- renderPlotly({
    return(bar_chart(cleaned, input$fill_input, input$year_input))
  })
  
  output$
}