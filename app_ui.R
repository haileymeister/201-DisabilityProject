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
  ),
  p("Test")
)

age_main_content <- mainPanel(
  plotlyOutput("ages")
)

age_sidebar <- sidebarPanel(
  year_input <- selectInput(
    "year",
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
  "Summary",
  h1("What We Learned"),
  h2("Takeaway 1"),
  h2("Takeaway 2"),
  h2("Takeaway 3")
)

ui <- navbarPage(
  "Disability Through Time",
  title_page, 
  by_neighborhood,
  page_age,
  page_three,
  sum_page
)
