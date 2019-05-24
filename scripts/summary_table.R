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
    filter(
      AgeRange != "",
      AgeRange != "-22",
      AgeRange != "-3",
      AgeRange != "-423",
      AgeRange != "N"
    )

  age_range_numbers <-
    c(
      1, 19, 20, 21, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18
    )
  age_range_table <-
    data.frame(age_range_numbers, AgeRange = table$AgeRange)

  final_table <- table %>%
    left_join(age_range_table, by = "AgeRange") %>%
    arrange(age_range_numbers) %>%
    select(-age_range_numbers)

  return(final_table)
}
