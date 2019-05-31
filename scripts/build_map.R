# Build Map
library("units")
library("dplyr")
library("sf")
library("raster")
library("ggplot2")
library("leaflet")
library("rgdal")

boundary <- 
  readOGR("data/City_Clerk_Neighborhoods/City_Clerk_Neighborhoods.shp")

disability_2016 <-
  read.csv("./data/aging-and-disability-services-client-level-data-2016.csv", 
           stringsAsFactors = FALSE)
dataframe <- disability_2016
#scale_fill_gradient(trans = "log10")
#build_map <- function(input, dataframe) {
  total <- select(dataframe, GeographicLocation, Homeless) %>%
    group_by(GeographicLocation) %>%
    summarize(total_people = n())
  
  homeless <- select(dataframe, GeographicLocation, Homeless) %>%
    filter(Homeless == "Y") %>%
    group_by(GeographicLocation) %>%
    summarize(homeless = n())
  
  joined <- left_join(total, homeless) %>%
    filter(GeographicLocation != "", GeographicLocation != "N")
  
  labels <- paste(joined$GeographicLocation, "<br>",
                  "Homeless:", joined$homeless
  )
  
  neighborhood <- leaflet() %>%
    addProviderTiles("CartoDB.Positron") %>%
    setView(lng = -122.3321, lat = 47.6062, zoom = 10) %>%
    addPolygons(data = boundary,
                fillColor = colorBin("YlOrRd", domain = joined$homeless, bins = c(0, 10, 20, 50, 100, 200, 500, 1000, Inf)),
                color = "black",
                weight = 1,
                highlight = highlightOptions(weight = 5),
                labels = labels
                )
  neighborhood
#}
