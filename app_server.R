# Load packages
library(shiny)

source("./scripts/age_range.R")

server <- function(input, output) {
  output$neighborhood <- renderPlotly({
    return(bar_chart(cleaned, input$fill_input, input$year_input))
  })
  
  output$ages <- renderPlotly({
    data_age <- na.omit(get(paste0("data_", input$year_input))) %>%
      select(AgeRange, LiveAlone, DisabilityStatus, NutritionalRisk) %>%
      filter(str_detect(AgeRange, "to")) %>%
      filter(AgeRange != "100 to 104") %>%
      filter(AgeRange != "45 to 49") %>%
      group_by(AgeRange) %>%
      filter(str_detect(LiveAlone, "Y|y"),
             str_detect(DisabilityStatus, "Y|y"),
             str_detect(NutritionalRisk, "Y|y")) %>%
      summarize(LiveAlone = n(), DisabilityStatus = n(),
                NutritionalRisk = n()) %>%
      gather(key = LivingStatus, value = NumPeople, -AgeRange)
    
    return(stacked_bar_chart(data_age, input$tilt_input))
  })
}