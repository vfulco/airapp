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
        radioButtons('format', 
                     'Download Report', 
                     c('PDF', 'HTML', 'Word'),
                     inline = TRUE
        ),
        downloadButton('downloadReport')
        
      ),
      
      mainPanel(
        
        #Placeholder image - replace with meaningful logo at some stage
        img(src="rimage.jpg", height = 107, width = 107),
        
        # Header and text block
        h2("Automatic Insights Report - AIR"),
        br(),
        ("Start getting insights by uploading any CSV (comma separated) file to be analysed. Make sure the data are in a table starting in the top left hand corner with column labels only."),
        br(),
        br(),
        ("Click on the Download button in sidebar to download your completed Automated Insights Report."),
        br(),
        br(),
        
        # Interactive data device
        dataTableOutput('contents')
        
      )
    )
  )
)