# Load packages
library(shiny)

source("./scripts/age_range.R")
source("./scripts/combined_data.R")
source("./scripts/bar_neighborhoods.R")
source("./scripts/demo_linegraph.R")
source("./scripts/demo_linegraph.R")
source("./scripts/combined_data.R")

server <- function(input, output) {
  output$neighborhood <- renderPlotly({
    return(bar_chart(cleaned, input$fill_input, input$year_input))
  })

  output$ages <- renderPlotly({
    return(stacked_bar_chart(data_age, input$year,
                             input$tilt_input, input$pal_input))
  })
  
  output$scatter <- renderPlotly({
    return(demo_linegraph(cleaned, input$variable_input))
  })
  

  output$age_table <- renderTable(
    age_sum <- na.omit(cleaned) %>% 
      filter(AgeRange == "70 to 74") %>% 
      group_by(ServiceYear) %>% 
      summarise(TotalCitizens = n(), Disabled = sum(DisabilityStatus == "Y"),
                NotDisabled = sum(DisabilityStatus == "N"))
  )
  
  #output$time_table <- renderTable()

}
