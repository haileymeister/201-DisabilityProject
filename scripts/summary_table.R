# Load packages
library(dplyr)
library(lintr)

# Create a function to make a table of summary information for a dataset
summary_table <- function(dataset) {
  table <- dataset %>%
    group_by(AgeRange) %>%
    summarise(
      total_Num_of_People = n(),
      most_Prevalent_Income_Bracket = max(IncomeCode),
      most_Prevalent_Race = max(RaceCode),
      num_of_Disability_Types = n_distinct(DisabilityStatus)
    ) %>%
    arrange(AgeRange)
  return(table)
}