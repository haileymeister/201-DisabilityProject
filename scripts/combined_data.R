# Edited Dataframe

library(dplyr)
library(stringr)

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
all_data <- rbind(data_2010, data_2011, data_2012, data_2013, data_2014,
                  data_2015, data_2016)

cleaned <- na.omit(all_data) %>%
  select(-ActivityID, -ClientID, -AgencyID, -ContractID, -Unincorporated,
         -RelationshipToRecipientCode, -DivisionID, -SiteID, -ServiceTypeID,
         -UnitsProvidedType, -ServiceAreaID, -UnitsProvided,
         -ServiceMonth, -EthnicityCode)
