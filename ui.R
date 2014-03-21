library(shiny)


shinyUI(pageWithSidebar(
  
  headerPanel("2012 Recommendations for Surveillance and Screening Intervals after Colonoscopy"),
  
  sidebarPanel(
    selectInput("polyp", "Polyps:", list("0", "1+ small (<10mm) polyps in rectum or sigmoid")),
    selectInput("sta", "Tubular Adenomas, small(<10mm):", list("0", "1-2", "3-10", "10+" )),
    checkboxInput("lta", "1 or more Tubular Adenomas, large(> or = 10mm)", FALSE),
    checkboxInput("va", "1 or more Villous Adenomas", FALSE),
    checkboxInput("ahgd","Adenoma with HGD", FALSE),
    selectInput("sl", "Serrated Polyps:", list("0", "Sessile Serrated Polyp(s), small (<10mm), no dysplasia", "Sessile Serrated Polyp(s), large(> or = 10mm)", "Sessile Serrated Polyp(s) with dysplasia")),
    checkboxInput("sa", "Traditional Serrated Adenoma", FALSE),
    checkboxInput("sps", "Serrated Polyposis Syndrome", FALSE) ),
  
  mainPanel(
    verbatimTextOutput("recommendation")
    )  
  

  ) )
  
  
  
  