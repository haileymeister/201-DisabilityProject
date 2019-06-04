#load in packages
library("plotly")
library("dplyr")
library("tidyverse")


# Function for making the Line Graph
demo_linegraph <- function(cleaned, variable_input) {
  print(variable_input)
  disability_data <- cleaned %>%
    filter(!!as.name(variable_input) == "Y") %>%
    group_by(ServiceYear) %>%
    summarize(num_variable = n())
  print(disability_data)
  data_sorted_by_year <- cleaned %>%
    group_by(ServiceYear) %>%
    summarize(num_all = n())
  data_joined_service_year <- left_join(disability_data, data_sorted_by_year,
                                      "ServiceYear")
  percent_line_graph_data <- data_joined_service_year %>%
    filter(ServiceYear != "NA") %>%
    mutate(percent_variable = (num_variable / num_all) * 100 )
demo_linegraph_display <- ggplot(percent_line_graph_data,
                       aes_string(x = "ServiceYear",
                                  y = "percent_variable")) +
    geom_point(alpha = 0.5, size = 5) +
  geom_line(stat = "identity") +
    labs(
      title = paste0("Percentage of Seattle Population with ", variable_input,
      x = "Year", 
      y = paste0("Percent of People with ", variable_input)
    ))
  return(demo_linegraph_display)
}
