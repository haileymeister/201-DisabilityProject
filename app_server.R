# Load packages
library(shiny)
library(plotly)
library(ggplot2)

source("./scripts/bar_neighborhoods.R")
source("./scripts/combined_data.R")


server <- function(input, output) {
  output$neighborhood <- renderPlotly({
    bar_chart(cleaned, input)
  })
}