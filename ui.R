### --- UI --- ###

# =======================================================================================#
#' AUTOMATED INSIGHTS REPORT - AIR - SHINY APP
#' 
#' Author: Dean Marchiori
#' Date: Auguest 2016
#' Desc: Shiny Package for "Automated Insights Report" project
#' Aims to produce a Shiny UI to upload, interact and download a data as a report.
# =======================================================================================#

library(shiny)

shinyUI(
  fluidPage(
    titlePanel("AIR - Automated Insights Report"), 
    sidebarLayout(
      sidebarPanel(
        # CSV Upload Device
        fileInput('file', 
                  'Upload CSV File',
                  accept = c('text/csv', 
                             'text/comma-separated-values,text/plain', 
                             '.csv')
        ),
        checkboxInput('header', 'File has headers?', TRUE),
        tags$hr(),
        # Download Device
        downloadButton('downloadReport', label = "Download PDF Report")
        
      ),
      
      mainPanel(
        # Header and text block
        h2("About"),
        ("This interface allows the upload of a data set for interactive analysis and the generation of an automated report for exploraory analysis."),
        br(),
        ("Current features include data profiling, summary statistics, scatterplot matrix, correlation matrix, NA detection, Multivariate outlier detection."),
        br(),
        strong("Instructions"),
        br(),
        ("1. Make sure all data are in a Tidy (http://r4ds.had.co.nz/tidy-data.html) format"), 
        br(),
        ("2. Upload data as a single csv file, then review the interactive data table"),  
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