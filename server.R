### --- SERVER --- ###

# =======================================================================================#
#' AUTOMATED INSIGHTS REPORT - AIR - SHINY APP
#' 
#' Author: Dean Marchiori
#' Date: March 2017
#' Desc: Shiny Package for "Automated Insights Report" 
#' Aims to produce a Shiny UI to upload, interact and download a data as a report.
# =======================================================================================#

# Load package dependencies
library(shiny)
library(MVN)
library(car)
library(corrgram)
library(pander)
library(rmarkdown)

shinyServer(function(input, output) {
  
  #Store filename for display only
  getfilename <- reactive({input$file})
  
  # CSV input handler - saves as a reactive obj called dat() 
  dat <- reactive({
    inFile <- input$file
    if (is.null(inFile))
      return(NULL)
    read.csv(inFile$datapath, header=input$header)
  })
  
  # Interactive Data Preview for main panel
  output$contents <- renderDataTable({
    dat()
  })
  
  # Download Report Handler
  output$downloadReport <- downloadHandler(
    filename = function() {
      paste0("AIR_Report", 
              '.pdf')
    },
    
    content = function(file) {
      src <- normalizePath('airreport.Rmd')
      # temporarily switch to the temp dir
      owd <- setwd(tempdir())
      on.exit(setwd(owd))
      file.copy(src, 'airreport.Rmd', overwrite = TRUE)
      out <- render('airreport.Rmd', pdf_document()) 
      file.rename(out, file)
    }
  )
  
})
