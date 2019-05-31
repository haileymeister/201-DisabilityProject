# Load packages
library(shiny)

# NOTE TO SELF
# Use previous graph, try to get a neighborhood map working, focus on homelessness and disability
# If map doesnt work than compaire homelessness over time 

title_page <- tabPanel(
  "title"
)

neighborhood_main_content <- mainPanel(
  plotlyOutput("homeless")
)

neighborhood_sidebar <- sidebarPanel(
  year_input <- selectInput(
    "year_input",
    label = "Year",
    choices = 
  )
)


by_neighborhood <- tabPanel(
  "Neighborhoods",
  titlePanel("Disability by Seattle Neighborhood"),
  p("The information below seeks to display information on disability in the
    different Seattle neighborhoods."),
  
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
