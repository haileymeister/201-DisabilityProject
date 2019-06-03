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
    ggplot(data_age, mapping = aes(
      x = factor(AgeRange, levels = c("40 to 44", "45 to 49",
                                      "50 to 54", "55 to 59",
                                      "60 to 64", "65 to 69",
                                      "70 to 74", "75 to 79", "80 to 84",
                                      "85 to 89", "90 to 94", "95 to 99",
                                      "100 to 104", "105 to 109",
                                      "110 to 114")),
                                   y = NumPeople,
                                   fill = LivingStatus),
      text = paste0("Disability Status: ",
                   LivingStatus, "<br>",
                   "Number of People: ",
                   NumPeople
      )) +
    geom_bar(stat = "identity") +
    labs(title = paste0("Number of People with Disadvantages
                        Based on Age in ", year),
         x = "Age Range",
         y = "Number of People",
         fill = "Disadvantage Status"
    ) + theme(axis.text.x = element_text(angle = 30))

  plot <- ggplotly(age_plot, tooltip = "text")
  return(plot)
}