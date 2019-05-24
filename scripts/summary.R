# Load packages
library(dplyr)
library(lintr)

# Create a function to gather summary information from a dataset
summary_info <- function(dataset) {
  summary <- list()
  summary$length <- length(dataset)
  summary$height <- nrow(dataset)
  summary$race <- dataset %>%
    group_by(RaceCode) %>%
    summarise(total_per_race = n()) %>%
    pull(RaceCode)
  summary$locations <- dataset %>%
    group_by(GeographicLocation) %>%
    summarise(total_per_location = n()) %>%
    pull(GeographicLocation)
  summary$disability <- dataset %>%
    group_by(DisabilityStatus) %>%
    summarise(total_disability = n()) %>%
    filter(total_disability == max(total_disability)) %>%
    pull(DisabilityStatus)
  return(summary)
}
