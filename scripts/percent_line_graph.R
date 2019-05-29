# Load Data
data_2010 <- read.csv(file =
    "data/aging-and-disability-services-client-level-data-2010.csv",
    stringsAsFactors = FALSE)
data_2011 <- read.csv(file =
    "data/aging-and-disability-services-client-level-data-2011.csv",
    stringsAsFactors = FALSE)
data_2012 <- read.csv(file =
    "data/aging-and-disability-services-client-level-data-2012.csv",
    stringsAsFactors = FALSE)
data_2013 <- read.csv(file = 
    "data/aging-and-disability-services-client-level-data-2013.csv",
    stringsAsFactors = FALSE)
data_2014 <- read.csv(file = 
    "data/aging-and-disability-services-client-level-data-2014.csv",
    stringsAsFactors = FALSE)
data_2015 <- read.csv(file = 
    "data/aging-and-disability-services-client-level-data-2015.csv",
    stringsAsFactors = FALSE)
data_2016 <- read.csv(file = 
    "data/aging-and-disability-services-client-level-data-2016.csv",
    stringsAsFactors = FALSE)

# Loading Packages
library("dplyr")
library("ggplot2")
library("lintr")

# Combining Raw Data Together
data_all_years <- rbind(data_2010, data_2011, data_2012, data_2013, data_2014, 
                        data_2015, data_2016)

# Organizing data for Line Graph
disability_data <- overall_data %>%
  filter(DisabilityStatus == "Y") %>%
  group_by(ServiceYear) %>%
  summarize(num_disabled = n())

# Data Sorted by Year
data_sorted_by_year <- data_all_years %>%
  group_by(ServiceYear) %>%
  summarize(num_all = n())

# Joining Data Together for Line Graph
data <- left_join(disability_data, data_sorted_by_year,
                                     "ServiceYear")

# Function for making the Line Graph
line_graph_display <- function(data) {
  percent_line_graph_data <- data %>%
    filter(ServiceYear != "NA") %>%
    mutate(percent_disabled = (num_disabled / num_all) * 100 )
  line_graph <- ggplot(percent_line_graph_data,
                       aes(x = ServiceYear, y = percent_disabled)) +
    geom_point(alpha = 0.5, size = 5) + geom_line() +
    labs(
      title = "Percentage of Seattle Population with a Disability by Year",
      x = "Year",
      y = "Percent of People with a Disability"
    )
  return(line_graph)
}
line_graph_display(data)
