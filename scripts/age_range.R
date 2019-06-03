# Load the `dplyr` package
library("dplyr")
library("tidyverse")
library("ggplot2")
library("plotly")

stacked_bar_chart <- function(data_age, year, tilt) {
  data_age <- na.omit(get(paste0("data_", year))) %>%
    select(AgeRange, LiveAlone, DisabilityStatus, NutritionalRisk) %>%
    filter(str_detect(AgeRange, "to")) %>%
    group_by(AgeRange) %>%
    filter(str_detect(LiveAlone, "Y|y"),
           str_detect(DisabilityStatus, "Y|y"),
           str_detect(NutritionalRisk, "Y|y")) %>%
    summarize(LiveAlone = n(), DisabilityStatus = n(),
              NutritionalRisk = n()) %>%
    gather(key = LivingStatus, value = NumPeople, -AgeRange)
  
  age_plot <-
    ggplot(data_age, mapping = aes(x = AgeRange,
                                   y = NumPeople, 
                                   fill = LivingStatus)) +
    geom_bar(stat = "identity") +
    labs(title = paste0("Number of People with Disadvantages 
                        Based on Age in ", year),
         x = "Age Range",
         y = "Number of People",
         fill = "Disadvantage Status"
    ) + theme(axis.text.x = element_text(angle = tilt)) +
    scale_fill_discrete(breaks = c("40 to 44", "45 to 49"))

  plot <- ggplotly(age_plot)
  return(plot)
}