
library(shiny)

shinyUI(fluidPage(
  titlePanel("AIR"),
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
      p("Check your data to ensure it looks right"),
      br(),
      br(),
      br(),
      br(),
      tags$hr(),
      h3("Step 3"),
      radioButtons('format', 'Download Report', c('PDF', 'HTML', 'Word'),
                   inline = TRUE),
      downloadButton('downloadReport')
    ),
    
    mainPanel(
      
      h3("Step 1"),
      h3("Step 1"),
      h3("Step 1"),
      #First 10 rows
      tableOutput('contents')
    )
  )
))