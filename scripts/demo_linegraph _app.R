# Load packages
library(shiny)

# Source in ui and server files
source("line_graph_app_ui.R")
source("line_graph_app_server.R")

# Create a new shinyApp() using the sourced ui and server
shinyApp(ui = ui, server = server)