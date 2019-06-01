# Neighborhoods Final

library("ggplot2")
library("plotly")
library("dplyr")
library("stringr")


bar_chart <- function(dataframe, input){
  
  filtered <- na.omit(dataframe) %>%
    select(DisabilityStatus, ServiceYear, GeographicLocation, SingleParent,
           LiveAlone, Homeless, Veteran) %>%
    filter(DisabilityStatus == "Y")
  
  disabled <- filtered %>%
    select(GeographicLocation, DisabilityStatus) %>%
    filter(DisabilityStatus == "Y",
           GeographicLocation != "N",
           GeographicLocation != ""
    ) %>%
    group_by(GeographicLocation) %>%
    summarize(num_disabled = n())
  
  selected <- filtered %>%
    select(GeographicLocation, DisabilityStatus, input$fill_input) %>%
    filter(DisabilityStatus == "Y",
           GeographicLocation != "N",
           GeographicLocation != "",
           input$fill_input == "Y"
    ) %>%
    group_by(GeographicLocation) %>%
    summarize(num_selected = n())
  
  joined <- left_join(disabled, selected)
  
  bar <- ggplot(joined, aes(x = GeographicLocation,
                            y = num_disabled, fill = num_selected,
                            text = paste("Geographic Location:",
                                         joined$GeographicLocation, "<br>",
                                         "Number Disabled:",
                                         joined$num_disabled, "<br>",
                                         paste0("Number ", 
                                                input$fill_input, ":"),
                                         joined$num_selected))
  ) +
    geom_bar(stat = "identity") +
    labs(title = "Number of People with Disabilities per Neighborhood",
         x = "Neighborhood",
         y = "Number of People",
         fill = input$fill_input
    ) +
    coord_flip()
  bar_interactive <- ggplotly(bar, tooltip = "text")
  return(bar_interactive)
}

