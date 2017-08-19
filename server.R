#Load shiny package and other packages needed to create the data table
library(shiny)
library(censusapi)
library(data.table)
library(DT)

shinyServer(function(input, output) {
#Designate a data table as the output type
  output$tbl <- DT::renderDataTable(DT::datatable({
    cbpt <- cbpt[cbpt$NAICS2012 == input$ncode,]
    cbpt <- na.omit(cbpt)
  },rownames=FALSE))
})
