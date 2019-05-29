# Load packages
library(shiny)

title_page <- tabPanel(
  "title"
)

page_one <- tabPanel(
  "page one"
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
  page_one,
  page_two,
  page_three,
  sum_page
)
