# Load packages
library(shiny)

title_page <- tabPanel(
  "About Disability",
  h1("What is Disability?"),
  img("", src = "https://www.insidehighered.com/sites/default/server_files/media/amir%20disability.jpg"),
  p("Disability can be categoriezed by many different factors. It can be
    physical or mental and can present itself in multiple forms. As disability
    becomes a greater topic of conversation, the ", em("scale"), " of 
    disability needs to be recognized to figure out how to better serve that
    community as a whole."),
  h2("Data Source"),
  p(
    "The data used in this website is provided from the ",
    a("SEA Aging and Disability Services",
      href = "https://www.kaggle.com/city-of-seattle/sea-aging-and-disability-services-client-level"
    ),
    "."
  ), 
  h2("Why Disability?"),
  p("We aim to look at an overview of the Seattle, WA disability community to
    see where ", em("accessibility"), " may need to be improved uopn. We want
    to see how disability has ", strong("changed"), " from 2010-2016 in
    different Seattle neighborhoods, as well as the differences between these 
    neighborhoods. The next question we want to look at is what the difference 
    between age groups is in the disabled community. This will help us
    understand what groups need the most attention when it comes to 
    accessibility around the city. The final aspect of disability we want to
    discover is the overall change of disability status in Seattle."),
  p(""),
  p("Website created by: Katie Brower, Sophie Hurst, Emily Kong, and Hailey
    Meister")
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
  "Summary",
  h1("What We Learned"),
  h2("Takeaway 1"),
  h2("Takeaway 2"),
  h2("Takeaway 3")
)

ui <- navbarPage(
  "Disability Through Time",
  title_page, 
  page_one,
  page_two,
  page_three,
  sum_page
)
