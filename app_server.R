# Load packages
library(shiny)
library(dplyr)
library(plotly)
library(ggplot2)

source("./scripts/bar_neighborhoods.R")

disability_2016 <-
  read.csv("./data/aging-and-disability-services-client-level-data-2016.csv", 
           stringsAsFactors = FALSE)

server <- function(input, output) {
  output$homeless <- renderPlotly({
    bar_chart(disability_2016)
  })
}