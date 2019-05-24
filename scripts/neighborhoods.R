# Neighborhoods

library("ggplot2")
library("plotly")
library("dplyr")
library("stringr")

bar_chart <- function(dataframe){
  filtered <- filter(dataframe, str_detect(GeographicLocation,
                                           "Seattle")) %>%
    mutate(GeographicLocation = str_replace(GeographicLocation,
                                            "Seattle Neighborhoods: ", ""))
  disabled <- filtered %>%
    select(GeographicLocation, DisabilityStatus) %>%
    filter(DisabilityStatus == "Y",
           GeographicLocation != "N",
           GeographicLocation != ""
           ) %>%
    group_by(GeographicLocation) %>%
    summarize(num_disabled = n())
  homeless <- filtered %>%
    select(GeographicLocation, DisabilityStatus, Homeless) %>%
    filter(DisabilityStatus == "Y",
           GeographicLocation != "N",
           GeographicLocation != "",
           Homeless == "Y"
           ) %>%
    group_by(GeographicLocation) %>%
    summarize(num_homeless = n())
  joined <- left_join(disabled, homeless)
  bar <- ggplot(joined, aes(x = GeographicLocation,
                            y = num_disabled, fill = num_homeless,
                            text = paste("Geographic Location:",
                                         joined$GeographicLocation, "<br>",
                                         "Number Disabled:",
                                         joined$num_disabled, "<br>",
                                         "Number Homeless:",
                                         joined$num_homeless))
  ) +
    geom_bar(stat = "identity") +
    labs(title = "Number of People with Disabilities per Neighborhood",
         x = "Neighborhood",
         y = "Number of People",
         fill = "Number Homeless"
    ) +
    coord_flip()
  bar_interactive <- ggplotly(bar, tooltip = "text")
  return(bar_interactive)
}
