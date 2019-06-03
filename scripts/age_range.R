# Load the `dplyr` package
library("dplyr")
library("tidyverse")
library("ggplot2")
library("plotly")

stacked_bar_chart <- function(data_age, tilt) {
  age_plot <-
    ggplot(data_age, mapping = aes(x = AgeRange,
                                   y = NumPeople, 
                                   fill = LivingStatus)) +
    geom_bar(stat = "identity") +
    labs(title = "Number of People with Disadvantages Based on Age",
         x = "Age Range",
         y = "Number of People",
         fill = "Disadvantage Status"
    ) + theme(axis.text.x = element_text(angle = tilt))

  plot <- ggplotly(age_plot)
  return(plot)
}
