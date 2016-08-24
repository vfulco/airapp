
library(shiny)

shinyUI(fluidPage(
  titlePanel(""),
 
  sidebarLayout(
    sidebarPanel(
      h3("Step 1"),
      fileInput('file1', 'Upload CSV File',
                accept=c('text/csv', 
                         'text/comma-separated-values,text/plain', 
                         '.csv')),
      checkboxInput('header', 'File has headers?', TRUE),
      
      tags$hr(),
      h3("Step 2"),
      ("Interact with your data"),
      br(),
      tags$hr(),
      h3("Step 3"),
      radioButtons('format', 'Download Report', c('PDF', 'HTML', 'Word'),
                   inline = TRUE),
      downloadButton('downloadReport')
    ),
    
    mainPanel(
      img(src="rimage.jpg", height = 107, width = 107),
      h2("Automatic Insights Report - AIR"),
      br(),
      ("Start getting insights by uploading any CSV (comma separated) file to be analysed. Make sure the data are in a table starting in the top left hand corner with column labels only."),
      br(),
      br(),
      ("Click on the Download button in sidebar to download your completed Automated Insights Report."),
      br(),
      br(),
      dataTableOutput('contents')
    )
  )
))