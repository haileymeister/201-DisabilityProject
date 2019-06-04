# Neighborhoods Final

library(ggplot2)
library(plotly)
library(dplyr)
library(stringr)
library(scales)

source("./scripts/filter_dynamic_column.R")

bar_chart <- function(dataframe, fill_choice, year_input){
  
  filtered <- na.omit(dataframe) %>%
    select(GeographicLocation, DisabilityStatus, ServiceYear, fill_choice) %>%
    filter(str_detect(GeographicLocation, "Seattle")) %>%
    mutate(GeographicLocation = str_replace(GeographicLocation,
                                            "Seattle Neighborhoods: ", "")) %>%
    mutate_all(str_replace_all, "y", "Y") %>%
    filter(DisabilityStatus == "Y",
           GeographicLocation != "N",
           GeographicLocation != "")
  
  disabled <- filtered %>%
    select(GeographicLocation, DisabilityStatus, ServiceYear) %>%
    mutate_if(is.numeric, toString) %>%
    filter(ServiceYear == year_input) %>%
    group_by(GeographicLocation) %>%
    summarize(num_disabled = n())
  
  selected <- filter1_by(na.omit(filtered), fill_choice, "Y") %>%
    select(GeographicLocation, fill_choice, ServiceYear) %>%
    mutate_if(is.numeric, toString) %>%
    filter(ServiceYear == year_input, fill_choice != "") %>%
    group_by(GeographicLocation) %>%
    summarize(num_selected = n())
  
  joined <- left_join(disabled, selected)
  
  labels = list("LiveAlone" = "Live Alone",
                "Homeless" = "Homeless",
                "Veteran" = "Veteran",
                "Driving" = "Driving", 
                "HouseholdWithChildren" = "Household With Children",
                "LimitedEnglish" = "Limited English")
  
  formatted_label <- labels[[fill_choice]]
  
  bar <- ggplot(joined, aes(x = GeographicLocation,
                            y = num_disabled, fill = num_selected,
                            text = paste("Geographic Location:",
                                         joined$GeographicLocation, "<br>",
                                         "Number Disabled:",
                                         joined$num_disabled, "<br>",
                                         paste0("Number ", 
                                                formatted_label, ":"),
                                         joined$num_selected
                                         )
                            )
  ) +
    geom_bar(stat = "identity") +
    labs(title = paste0("Population with Disabilities per Neighborhood in ",
                        year_input),
         x = "Neighborhood",
         y = "Number of People",
         fill = formatted_label
    ) +
    coord_flip() + 
    scale_y_continuous(labels = comma)
  bar_interactive <- ggplotly(bar, tooltip = "text")
  return(bar_interactive)
}

