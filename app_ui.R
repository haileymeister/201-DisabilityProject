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
                   "Veteran" = "Veteran",
                   "Driving" = "Driving", 
                   "Household With Children" = "HouseholdWithChildren",
                   "Limited English" = "LimitedEnglish"),
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

age_main_content <- mainPanel(
  plotlyOutput("ages")
)

age_sidebar <- sidebarPanel(
  year_input <- selectInput(
    "year_input",
    label = "Year",
    choices = list("2010", "2011", "2012",
                   "2013", "2014", "2015", "2016"),
    selected = "2016"
  ),
  tilt_input <- sliderInput(
    "tilt_input",
    label = "Tilt of X-Axis", min = 25, max = 90, value = 30
  )
)

page_age <- tabPanel(
  "Age Range",
  titlePanel("Disability by Age Range in Seattle"),
  p("The chart displays data about disability in Seattle, sorted by age range,
    across 7 years."),
  sidebarLayout(
    age_sidebar,
    age_main_content
  )
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
  page_age,
  page_three,
  sum_page
)
