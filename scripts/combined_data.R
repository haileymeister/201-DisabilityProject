# Edited Dataframe

library("dplyr")
library("stringr")

setwd("~/info201/project-disability")

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
         -NutritionalRisk, -ServiceMonth, -EthnicityCode)


# ADLS - Activities of Daily Living
non_adls <- all_data %>%
  select(GeographicLocation, AgeRange, RaceCode, IncomeCode,
         LiveAlone, LimitedEnglish, Language, SingleParent,
         HouseholdWithChildren, Homeless, Veteran)

# ADLS and IADLS - Instrurmental Activities of Daily Living
adls <- all_data %>%
  select(GeographicLocation, DisabilityStatus, Eating, Toileting, Walking,
         GettingPlaces, Transferring, Dressing, Bathing, MedicalManagement, 
         Cooking, Shopping, Chores, Driving, HeavyHousework, Phoning,
         MoneyManagement) 

