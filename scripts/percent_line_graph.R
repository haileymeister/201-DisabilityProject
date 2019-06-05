# sourced data
source("scripts/combined_data.R")

# Loading Packages
library("dplyr")
library("ggplot2")
library("lintr")

# Organizing data for Line Graph
disability_data <- cleaned %>%
  filter(DisabilityStatus == "Y") %>%
  group_by(ServiceYear) %>%
  summarize(num_disabled = n())

# Data Sorted by Year
data_sorted_by_year <- cleaned %>%
  group_by(ServiceYear) %>%
  summarize(num_all = n())

# Joining Data Together for Line Graph
data_joined_service_year <- left_join(disability_data, data_sorted_by_year,
                                     "ServiceYear")

# Function for making the Line Graph
line_graph_display <- function(data) {
  percent_line_graph_data <- data %>%
    filter(ServiceYear != "NA") %>%
    mutate(percent_disabled = (num_disabled / num_all) * 100 )
  line_graph <- ggplot(percent_line_graph_data,
                       aes(x = ServiceYear, y = percent_disabled)) +
    geom_point(alpha = 0.5, size = 5) + geom_line() +
    labs(
      title = "Percentage of Seattle Population with a Disability by Year",
      x = "Year",
      y = "Percent of People with a Disability"
    )
  return(line_graph)
}
line_graph_display(data)
