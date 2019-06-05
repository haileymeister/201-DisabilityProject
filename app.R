# Load packages
library(shiny)

# Source in ui and server files
source("app_ui.R")
source("app_server.R")

# Create a new shinyApp() using the sourced ui and server
shinyApp(ui = ui, server = server)