library(shiny)
library(datasets)


shinyServer(function(input, output){
  
  polypInput <- reactive({
    switch(input$polyp,
      "0" = 10, "1+ small (<10mm) polyps in rectum or sigmoid" = 10)
  })
  staInput <- reactive({
    switch(input$sta,
     "0" = 10, "1-2" = 6, "3-10" = 3, "10+" = 2)
  })
 # ltaInput <- reactive({
#    switch(input$lta,
#      TRUE = 3, FALSE = 10)
#  })
 # vaInput <- reactive({
#    switch(input$va,
 #     TRUE = 3, FALSE = 10)  
#  })
  #ahgdInput <- reactive({
  #  switch(input$ahgd,
  #    TRUE = 3, FALSE = 10)
 # })
  slInput <- reactive({
    switch(input$sl,
      "0" = 10, "Sessile Serrated Polyp(s), small (<10mm), no dysplasia" = 5, 
      "Sessile Serrated Polyp(s), large(> or = 10mm)" = 3, "Sessile Serrated Polyp(s) with dysplasia" = 3)
  })
 # saInput <- reactive({
#    switch(input$sa,
 #     TRUE = 3, FALSE = 10)
 # })
#  spsInput <- reactive({
#    switch(input$sps,
  #    TRUE = 1, FALSE = 10)
 # })
  
  output$recommendation <- renderPrint({
    polyp <- polypInput()
    sta <- staInput()
   # lta <- ltaInput()
  #  va <- vaInput()
   # ahgd <- ahgdInput()
    sl <- slInput()
  #  sa <- saInput()
  #  sps <- spsInput()
    lta1 <- 10
    va1 <- 10
    ahgd1 <- 10
    sa1 <- 10
    sps1 <- 10
    if(input$lta == TRUE){lta1 <- 3}
    if(input$va == TRUE){va1 <- 3}
    if(input$ahgd == TRUE){ahgd1 <- 3}
    if(input$sa == TRUE){sa1 <- 3}
    if(input$sps == TRUE){sps1 <- 1}
  
    all = c(polyp, sta, lta1, va1, ahgd1, sl, sa1, sps1)  
  
    if(polyp == min(all)){
      rec = polyp
    }
    if(sta == min(all)){
      rec = sta
    }
    if(lta1 == min(all)){
      rec = lta1
    }
    if(va1 == min(all)){
      rec = va1
    }
    if(ahgd1 == min(all)){
      rec = ahgd1
    }
    if(sl == min(all)){
      rec = sl
    }
    if(sa1 == min(all)){
      rec = sa1
    }
    if(sps1 == min(all)){
      rec = sps1
    }
    
    if(rec == 6){
      print("Recommended interval for next screening: 5 - 10 years")
    }
    else{
      if(rec == 2){
        print("Recommended interval for next screening: less than 3 years")
      }
      else{
        print(paste("Recommended interval for next screening:", rec, "years", sep = " "
          ))
        }
    }
  
  
  
})
})