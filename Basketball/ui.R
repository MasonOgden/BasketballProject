#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)
library(plotly)

# Define UI for application that draws a histogram
shinyUI(fluidPage(theme = shinytheme("sandstone"),
  
  # Application title
  titlePanel("3-Pointers"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       selectInput(inputId = "who_to_display",
                   label = "Display:",
                   choices = c("Top 30 in 3PM", "Top in 3PM of each team", "Top 30 in 3P%", "Top in 3P% of each team"),
                   selected = "Top 30 in 3PM"),
       br(),
       p("2018-2019 Season")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotlyOutput("my_plot")
    )
  )
))
