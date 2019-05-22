# Load packages
library(dplyr)

# Create a function to make a table of summary information for a dataset
summary_table <- function(dataset) {
  table <- dataset %>% 
    group_by(AgeRange) %>% 
    summarise(
      Total_Num_of_People = n(),
      Most_Prevalent_Income_Bracket = max(IncomeCode), 
      Most_Prevalent_Race = max(RaceCode),
      Num_of_Disability_Types = n_distinct(DisabilityStatus)
    ) %>% 
    arrange(AgeRange)
  return (table)
}

