# Load packages
library(shiny)

title_page <- tabPanel(
  "title"
)

neighborhood_main_content <- mainPanel(
  plotlyOutput("neighborhood")
)

neighborhood_sidebar <- sidebarPanel(
  fill_input <- selectInput(
    "fill_input",
    label = "Fill by",
    choices = list("Single Parent" = "SingleParent",
                   "Live Alone" = "LiveAlone",
                   "Homeless" = "Homeless",
                   "Verteran" = "Veteran"),
    selected = list("Single Parent" = "SingleParent")
  ),
  year_input <- radioButtons(
    "year_input",
    label = "Year",
    choices = 2010:2016,
    selected = "2010"
  )
)

by_neighborhood <- tabPanel(
  "Neighborhoods",
  titlePanel("Disability by Seattle Neighborhood"),
  p("The information below seeks to display different aspects of disability
    across 12 Seattle neighborhoods and areas."),
  
  sidebarLayout(
    neighborhood_sidebar,
    neighborhood_main_content
  )
)

page_two <- tabPanel(
  "page two"
)

page_three <- tabPanel(
  "page three"
)

sum_page <- tabPanel(
  "summary"
)

ui <- navbarPage(
  "Disability in Seattle, WA",
  title_page, 
  by_neighborhood,
  page_two,
  page_three,
  sum_page
)
