# Load Data
data_2010 <- read.csv(file = "C:/Users/katie/info201/project-disability/data/aging-and-disability-services-client-level-data-2010.csv", stringsAsFactors = FALSE)
data_2011 <- read.csv(file = "C:/Users/katie/info201/project-disability/data/data for linegraph/aging-and-disability-services-client-level-data-2011.csv", stringsAsFactors = FALSE)
data_2012 <- read.csv(file = "C:/Users/katie/info201/project-disability/data/data for linegraph/aging-and-disability-services-client-level-data-2012.csv", stringsAsFactors = FALSE)
data_2013 <- read.csv(file = "C:/Users/katie/info201/project-disability/data/data for linegraph/aging-and-disability-services-client-level-data-2013.csv", stringsAsFactors = FALSE)
data_2014 <- read.csv(file = "C:/Users/katie/info201/project-disability/data/data for linegraph/aging-and-disability-services-client-level-data-2014.csv", stringsAsFactors = FALSE)
data_2015 <- read.csv(file = "C:/Users/katie/info201/project-disability/data/data for linegraph/aging-and-disability-services-client-level-data-2015.csv", stringsAsFactors = FALSE)
data_2016 <- read.csv(file = "C:/Users/katie/info201/project-disability/data/aging-and-disability-services-client-level-data-2016.csv", stringsAsFactors = FALSE)

# Loading Packages
library("dplyr")
library("ggplot2")

# Combining Raw Data Together
data_all_years <- rbind(data_2010, data_2011, data_2012, data_2013, data_2014, 
                        data_2015, data_2016)

# Organizing data for Line Graph
disability_data <- overall_data %>%
  filter(DisabilityStatus == "Y") %>%
  group_by(ServiceYear) %>%
  summarize(num_disabled = n())

# Data Sorted by Year
data_sorted_by_year <- overall_data %>%
  group_by(ServiceYear) %>%
  summarize(num_all = n())

# Joining Data Together for Line Graph
overall_line_graph_data <- left_join(disability_data, data_sorted_by_year, 
                                     "ServiceYear")

# Line Graph Data
percent_line_graph_data <- overall_line_graph_data %>%
  filter(ServiceYear != "NA") %>%
  mutate(percent_disabled = (num_disabled / num_all) * 100 )

#Function for making the Line Graph
line_graph_display <- function (chart_3) {
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
line_graph_display()

#Line Graph Description
line_graph_details <- paste0("To determine if there has been a change in the
                             percentage of people with a disability in the
                             Seattle Area, we made a line chart depicting this
                             information between the years of 2010 to 2016. 
                             From this chart, we can determine that there has 
                             been a small change in this percentage from 57.6%
                             in 2010 to 59..83% in 2016. The overall trend is 
                             that the percent of the population with a 
                             disability increased during these years and has
                             been higher than 50%. In 2011, the lowest 
                             percentage was reported while 2016 had the highest
                             percentage reported. This chart does not account
                             for type or number of disabilities but rather if
                             an individual from this dataset had any
                             disability.")