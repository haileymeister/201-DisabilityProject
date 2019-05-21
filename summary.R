# Load the `dplyr` package
library("dplyr") 

# Load data
data <- read.csv("data/aging-and-disability-services-client-level-data-2010.csv", stringsAsFactors = FALSE)

Views(data)
