# Load packages
library(shiny)
library(shinyWidgets)

title_page <- tabPanel(
  "About Disability",
  h1("What is Disability?"),
  img("", src =
        paste0("https://www.insidehighered.com/sites/default/",
               "server_files/media/amir%20disability.jpg"),
           width = "700px", height = "300px", style = "margin-left: auto;
           margin-right: auto;"),
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
  tags$br(),
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
  titlePanel("Disability by Age Range in Seattle"),
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

scatter_page <- tabPanel(
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

sum_page <- tabPanel(
  "Summary",
  h1("What We Learned"),
  h2("Takeaway 1"),
  h2("Takeaway 2"),
  h2("Takeaway 3")
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