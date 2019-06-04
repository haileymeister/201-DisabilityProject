# Load packages
library(shiny)
library(plotly)
library(ggplot2)

# Sourced Data
source("demo_linegraph.R")

# Figure Function
server <- function(input, output) {
  print(variable_input)
  output$demo_linegraph <- renderPlot({
    return(demo_linegraph(cleaned, input$variable_input))
  })
}
