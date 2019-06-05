#load in packages
library(plotly)
library(dplyr)
library(tidyverse)
library(stringr)
library(ggplot2)

source("./scripts/filter_dynamic_column.R")

# Function for making the Line Graph
demo_linegraph <- function(cleaned, variable_input) {

  disability_data <- filter1_by(na.omit(cleaned), variable_input, "Y") %>%
    group_by(ServiceYear) %>%
    summarize(num_variable = n())
  
  data_sorted_by_year <- na.omit(cleaned) %>%
    group_by(ServiceYear) %>%
    summarize(num_all = n())
  
  data_joined_service_year <- 
    left_join(disability_data, data_sorted_by_year, "ServiceYear")
  
  percent_line_graph_data <- data_joined_service_year %>%
    mutate(percent_variable = (num_variable / num_all))
  
  label_choice = list("DisabilityStatus" = "Disability Status",
                "Veteran" = "Veteran Status",
                "Homeless" = "Homeless",
                "Driving" = "Driving Impairment",
                "Limited English"= "Limited English",
                "HouseholdsWithChildren" = "Household With Children")
  
  formatted <- label_choice[[variable_input]]
  
  demo_linegraph_display <- 
    ggplot(percent_line_graph_data,
           aes(x = ServiceYear, y = percent_variable,
              text = paste("Year:", ServiceYear, "<br>",
                           paste0("Percent Disabled also ",
                                  formatted, ": ",
                                  round(
                                    (percent_variable * 100),
                                    digits = 2), "%")
                           )
              )
           ) +
    scale_y_continuous(labels = percent) +
    scale_x_discrete(limits = 2010:2016) +
    geom_point(aes(size = percent_variable)) +
    scale_size_continuous(range = c(2, 6)) +
    labs(
      title = paste0("Percentage of Seattle Population with ", formatted),
      x = "Year", 
      y = paste0("Percent Disabled and ", formatted)
      )
  
  scatter <- ggplotly(demo_linegraph_display, tooltip = "text")
  
  return(scatter)
}
