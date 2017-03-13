### --- UI --- ###

# =======================================================================================#
#' AUTOMATED INSIGHTS REPORT - AIR - SHINY APP
#' 
#' Author: Dean Marchiori
#' Date: Auguest 2016
#' Desc: Shiny Package for "Automated Insights Report" project
#' Aims to produce a Shiny UI to upload, interact and download a data as a report.
# =======================================================================================#

# Load package dependencies
library(shiny)

# Start of Shiny Server function
shinyUI(
  fluidPage(
    titlePanel(""), # No title decided yet
    sidebarLayout(
      sidebarPanel(
        # CSV Upload Device
        h3("Step 1"),
        fileInput('file', 
                  'Upload CSV File',
                  accept = c('text/csv', 
                             'text/comma-separated-values,text/plain', 
                             '.csv')
        ),
        checkboxInput('header', 'File has headers?', TRUE),
        tags$hr(),
        
        # Text only to prompt use of data table in mainpanel
        h3("Step 2"),
        ("Interact with your data"),
        br(),
        tags$hr(),
        
        # Download Device
        h3("Step 3"),
        downloadButton('downloadReport')
        
      ),
      
      mainPanel(
        # Header and text block
        h2("Automatic Insights Report"),
        br(),
        ("This interface runs an automated report for exploratory data analysis. By default it will provide data profiling, summary statistics, data visualisation and outlier deteciton."),
        br(),
        ("1. Start by uploading any CSV (comma separated) file to be analysed."), 
        br(),
        ("2. Make sure the data are in Tidy format"),  
        br(),
        ("3. Click on the Download button in sidebar to download the Automated Insights Report."),
        br(),
        br(),
        
        # Interactive data device
        dataTableOutput('contents')
        
      )
    )
  )
)