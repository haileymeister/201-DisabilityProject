# Load packages
library(shiny)

source("./scripts/age_range.R")
source("./scripts/combined_data.R")
source("./scripts/bar_neighborhoods.R")

server <- function(input, output) {
  output$neighborhood <- renderPlotly({
    return(bar_chart(cleaned, input$fill_input, input$year_input))
  })
  
  output$ages <- renderPlotly({
    return(stacked_bar_chart(data_age, input$year, input$tilt_input))
  })
}


  #filter(AgeRange != "40 to 44") %>%
  #filter(AgeRange != "100 to 104") %>%
  #filter(AgeRange != "105 to 109") %>%
  #filter(AgeRange != "110 to 114") %>%