# Load packages
library(shiny)

# Source in ui and server files
source("app_ui.R")
source("app_server.R")

# Create a new shinyApp() using the sourced ui and server
shinyApp(ui = ui, server = server)


#rsconnect::setAccountInfo(name='haileymeister', token='EBB992396D871AEADD891E368C0E807B', secret='A6wXijndZaODG/aiUxnT6CvkYUo4cr8z4wjoRWH1')
#deployApp()