# Edited Dataframe

library("dplyr")

# Read in all files
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

# Combine all data
combined <- rbind(data_2010, data_2011, data_2012, data_2013, data_2014, 
                  data_2015, data_2016)

all_data <- na.omit(combined) %>%
  mutate(GeographicLocation = str_replace(GeographicLocation,
                                          "Seattle Neighborhoods: ", ""))

# If intteresed this is a good way to replace certain patterns in a column 
# So we could change the RaceCode and stuff like that
all_data <- all_data %>%
  mutate(Homeless = str_replace(Homeless, "N", "No"))
