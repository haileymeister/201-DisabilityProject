# Load the `dplyr` package
library("dplyr") 
library("tidyverse")
library("ggplot2")
library("plotly")

stacked_bar_chart <- function(data) {
  data_age <- data %>%
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
  
  age_plot <-
    ggplot(data_age, mapping = aes(x = AgeRange, y = NumPeople, fill = LivingStatus)) + 
    geom_bar(stat = "identity") +
    labs(title = "Number of People with Disadvantages Based on Age",
         x = "Age Range",
         y = "Number of People",
         fill = "Disadvantage Status"
    ) + theme(axis.text.x = element_text(angle = 30))
  
  plot <- ggplotly(age_plot)
  return(plot)
}