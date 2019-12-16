#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(tidyverse)
library(shiny)
library(shinythemes)
library(plotly)

all_data <- read.csv(
  "https://www.dropbox.com/s/ebj4qfc2lru2u4e/game_data.csv?dl=1")

# Define UI for application that draws a histogram
shinyUI(navbarPage("Basketball", theme = shinytheme("flatly"),
  
  # Application title
  tabPanel("3 Pointers",
  
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
  )),
  tabPanel("Win/Loss Ratio",
    sidebarLayout(
      sidebarPanel(
        selectizeInput(inputId="teams", label="Teams to show:",
                       choices = all_data %>%
                         pull(team) %>%
                         unique,
                       selected = "Clippers",
                       multiple=TRUE,
                       options=list(maxItems=4))
      ),
      mainPanel(
        plotlyOutput("wl_plot")
      )
    )
           
           )
))
