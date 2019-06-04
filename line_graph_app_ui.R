# Load packages
library(shiny)
library(plotly)

page_two <- tabPanel(
  "Demographics of Seattle through 2010 to 2016",
  disability_by_year,
  demo_sidebar
)

#Main panel
disability_by_year <- mainPanel(
  plotlyOutput("demo_linegraph")
)

#Sidebar panel Widget
demo_sidebar <- sidebarPanel(
  variable_input <- selectInput(
    "variable_input",
    label = "Demographic Variable of Interest",
    choices = list("Disability Status" = "DisabilityStatus",
                   "Veteran Status" = "Veteran",
                   "Homeless" = "Homeless",
                   "Driving Impairment" = "Driving",
                   "Limited English"= "LimitedEnglish",
                   "Households with Children" = "HouseholdWithChildren"),
    selected = list("Disability Status" = "DisabilityStatus")
  )
)

ui <- navbarPage(
  "Disability in Seattle, WA",
  page_two
)
