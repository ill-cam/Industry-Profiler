#Load the shiny package
library(shiny)

# Begin ShinyUI section
shinyUI(fluidPage(
  
  # Application title
  titlePanel("2015 County Business Patterns"),
  
  # Sidebar with a checkbox for user input plus main panel to display the main
  # data table
  sidebarLayout(
    sidebarPanel(
      h5("Select a NAICS industry code to see how many businesses exist in each
         state for that industry as well as how many people are employed"),
      h6("*Note: The table may take a minute to run/update.*"),
      selectInput(
        "ncode",
        "Pick a NAICS Code",
        mylist
      )
    ),
    mainPanel(
      h3("State Business Data for this NAICS Code"), 
      DT::dataTableOutput("tbl")
    )
  )
))