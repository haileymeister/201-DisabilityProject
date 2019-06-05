# Load packages
library(shiny)
library(shinyWidgets)




# Page 1 - Title (Sophie)
title_page <- tabPanel(
  "About Disability",
  h1("What is Disability?"),
  img("", src = paste0("https://www.insidehighered.com/sites/default/",
                       "server_files/media/amir%20disability.jpg"),
      width = "700px", height = "300px"),
  br(),

  p("Disability can be categoriezed by many different factors. It can be
    physical or mental and can present itself in multiple forms. As disability
    becomes a greater topic of conversation, the ", em("scale"), " of
    disability needs to be recognized to figure out how to better serve that
    community as a whole."),
  
  h2("Data Source"),
  p("The data used in this website is provided from the ",
    a("SEA Aging and Disability Services",
      href = "https://www.kaggle.com/city-of-seattle
      /sea-aging-and-disability-services-client-level",
      style = "color: #EBECEC; text-decoration: underline;"
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

# Page 2 - Neighborhoods (Hailey)
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
    across", strong("12 Seattle neighborhoods and areas."), "The chart below can
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
  tags$br(),
  p("Overall however from the data one can see that Seattle has problems with
    certain aspects of acessibility. Acessibility is defined by the Merriam
    Webster dictionary as,", strong("easily used or acessed by people with
    disabilities: adapted for use by people with disabilities"),
    ". Acessibility attempts to make", em("everything available to everyone"),
    ". It seeks to cut out barriers that people with disabilities might face
    because of their different abilities. Understanding acessability is
    important when designing anything because everyone deserves the right
    to acess everything. There are many aspects of society today that hinder
    those with disabilities from participating in certain aspects of daily
    life but if universal design principles had been utilized than everyone
    would have equal access to everything."
  )
)

# Page 3 - Age (Emily)
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
  pal_input <- selectInput(
    "pal_input",
    label = "Colors",
    choices = list("Paired", "Set1",
                   "Set2", "Pastel1", 
                   "Pastel2", "Spectral"),
    selected = "Paired"
    ),
  tilt_input <- sliderInput(
    "tilt_input",
    label = "Tilt of X-Axis Label", min = 25, max = 90, value = 30
  )
)

page_age <- tabPanel(
  "Age Range",
  h1("Age Range"),
  p("We can see from the interactive stacked bar charts which",
    em("age ranges"), "suffer the most from disadvantaging
    statuses between the years", strong("2010-2016"), ". We
    determine disadvantages as whether or not the
    clients have a,", em("disability"), ", whether or not the they",
    em("live alone"), ", and whether or not they suffer",
    em("high nutrition risk"), ". We can see the people between the ages",
    strong("70-84"), "seem to deal with the most disadvantages amongst
    all 7 years. Hovering over the interactive charts shows the
    exact number of people in each category under
    each age range. We can use this information to decide which
    age groups need the most help with increasing accessibility."),
  tags$br(),
  sidebarLayout(
    age_sidebar,
    age_main_content
  )
)

# Page 4 - Years (Katie)
scatter_main <- mainPanel(
  plotlyOutput("scatter")
)

scatter_sidebar <- sidebarPanel(
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

scatter_tab <- tabPanel(
  "Years",
  h1("Title"),
  p("Paragraph"),
  "Through time",
  scatter_main,
  scatter_sidebar
)

# Page 5 - Summary (Sophie)
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
    scatter_tab,
    sum_page
  )
)