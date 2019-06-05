# Load packages
library(shiny)
library(shinyWidgets)

title_page <- tabPanel(
  "About Disability",
  h1("What is Disability?"),
  img("", src = "https://www.insidehighered.com/sites/default/server_files/media/amir%20disability.jpg",
           width = "400px", height ="200px"),
  p("Disability can be categoriezed by many different factors. It can be
    physical or mental and can present itself in multiple forms. As disability
    becomes a greater topic of conversation, the ", em("scale"), " of 
    disability needs to be recognized to figure out how to better serve that
    community as a whole."),
  h2("Data Source"),
  p(
    "The data used in this website is provided from the ",
    a("SEA Aging and Disability Services",
      href = "https://www.kaggle.com/city-of-seattle/sea-aging-and-disability-services-client-level",
      style = "color: #EBECEC; text-decoration: underline; margin-left: auto; 
      margin-right auto;"
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
  p("Created by: Katie Brower, Sophie Hurst, Emily Kong, and Hailey Meister")
)

neighborhood_main_content <- mainPanel(
  plotlyOutput("neighborhood")
)

neighborhood_sidebar <- sidebarPanel(
  fill_input <- selectInput(
    "fill_input",
    label = "Fill by",
    choices = list("Live Alone" = "LiveAlone",
                   "Homeless" = "Homeless",
                   "Veteran" = "Veteran",
                   "Driving" = "Driving", 
                   "Household With Children" = "HouseholdWithChildren",
                   "Limited English" = "LimitedEnglish"),
    selected = list("Live Alone" = "LiveAlone")
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
  h1("Disability Traits by Seattle Neighborhood"),
  p("The information below seeks to display different aspects of disability
    across", strong("12 Seattle neighborhoods and areas."),"The chart below can 
    be filled by information on how many people with Disabilities live alone, 
    are homeless, are Veterans, can drive, live in a house with children, and 
    speak limited English. The chart is able to clearly depict which Seattle 
    neighborhood has the highest population of people with Disabilities based 
    on the chosen year."
  ),
  
  sidebarLayout(
    neighborhood_sidebar,
    neighborhood_main_content
  ), 
  p("Overall however from the data one can see that Seattle has problems with 
    certain aspects of acessibility. Acessibility is defined by the Merriam 
    Webster dictionary as,", strong("easily used or acessed by people with disabilities: 
    adapted for use by people with disabilities"), ". Acessibility attempts to 
    make", em("everything available to everyone"), ". It seeks to cut out 
    barriers that people with disabilities might face because of their different
    abilities. Understanding acessability is important when designing anything 
    because everyone deserves the right to acess everything. There are many 
    aspects of society today that hinder those with disabilities from 
    participating in certain aspects of daily life but if universal design
    principles had been utilized than everyone would have equal access to
    everything."
  )
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
  h2("Seattle Neighborhoods"),
  p("Each neighborhood has different needs per accessibility. The main thing
    that needs to be learned from this aspect of our data is that Downtown
    Seattle is one of the most highly concentrated areas for the disabled
    homeless community. Between 2010 and 2016 the disabled homeless
    population grew from 755 individuals to 1,102. This means that Downtown
    Seattle needs the most attention when it comes to public accessibility
    as much of the disabled population is using public spaces all the time."),
  h2("Disability by Age"),
  p("Based on the data collected here, the age group of 70-74 years has the
    highest concentration of people with disabilities. Below is a table
    summarizing the disability status of this age group:"),
  tableOutput("age_table"),
  p("This shows the City of Seattle that they should think about tailoring
    accessibility toward the needs of that population and thier financial
    ability."),
  h2("Changes Over Time"),
  p("The overall change of disability demographics in Seattle, WA between
    2010-2016 is an increase in overall numbers. Below is a summary of 
    the differences between 2010-2016:"),
  tableOutput("time_table"),
  p("This shows the increasing need for accessibility overall in Seattle
    as the number of people in need grows.")
)

ui <- fluidPage(
  setBackgroundColor(color = "#656A72"),
  
  tags$head(
    tags$style(
      HTML(
        "p {
          color: #EBECEC;
        }
        h1 {
          color: #EBECEC;
        }
        h2 {
          color: #EBECEC;
        }"
      )
    )
  ),
  
  navbarPage( 
    inverse = TRUE,
    "Disability Through Time",
    title_page, 
    by_neighborhood,
    page_age,
    page_three,
    sum_page
  )
)
