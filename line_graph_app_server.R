# Load packages
library(shiny)
library(plotly)
library(ggplot2)

# Sourced Data
source("./scripts/demo_linegraph.R")
source("./scripts/combined_data.R")

# Figure Function
server <- function(input, output) {
  output$demo_linegraph <- renderPlot({
    return(demo_linegraph(cleaned, input$variable_input))
  })
}
