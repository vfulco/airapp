
library(shiny)
library(MVN)
library(car)
library(corrgram)
library(pander)

shinyServer(function(input, output) {
  
  #Store filename
  getfilename <- reactive({ input$file1})
  
  # data input
  dat <- reactive({
    
    inFile <- input$file1
    
    if (is.null(inFile))
      return(NULL)
    
    read.csv(inFile$datapath, header=input$header)
    
  })
  
  # Show first 10 rows
  output$contents <- renderTable({
    
    head(dat())
    
    })
  
  #Download Report
  output$downloadReport <- downloadHandler(
    filename = function() {
      paste('my-report', sep = '.', switch(
        input$format, PDF = 'pdf', HTML = 'html', Word = 'docx'
      ))
    },
    
    content = function(file) {
      src <- normalizePath('report1.Rmd')
      
     
      file.copy(src, 'report1.Rmd')
      
      library(rmarkdown)
      out <- render('report1.Rmd', switch(
        input$format,
        PDF = pdf_document(), HTML = html_document(), Word = word_document()
      ))
      file.rename(out, file)
    }
  )

})
